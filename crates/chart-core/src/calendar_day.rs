use crate::ProviderError;

/// Authored Gregorian calendar day; never a FileMan date or timezone conversion.
#[derive(Clone, Debug, PartialEq, Eq, PartialOrd, Ord)]
pub struct CalendarDay(String);
impl CalendarDay {
    pub fn parse(value: &str) -> Result<Self, ProviderError> {
        let bytes = value.as_bytes();
        if bytes.len() != 10
            || bytes[4] != b'-'
            || bytes[7] != b'-'
            || bytes
                .iter()
                .enumerate()
                .any(|(i, b)| i != 4 && i != 7 && !b.is_ascii_digit())
        {
            return Err(ProviderError::Malformed("Use YYYY-MM-DD for dates.".into()));
        }
        let year = value[..4].parse::<u32>().unwrap_or(0);
        let month = value[5..7].parse::<u32>().unwrap_or(0);
        let day = value[8..].parse::<u32>().unwrap_or(0);
        let leap =
            year.is_multiple_of(4) && (!year.is_multiple_of(100) || year.is_multiple_of(400));
        let days = match month {
            2 if leap => 29,
            2 => 28,
            4 | 6 | 9 | 11 => 30,
            1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
            _ => 0,
        };
        if year == 0 || day == 0 || day > days {
            return Err(ProviderError::Malformed(
                "Enter a valid calendar date.".into(),
            ));
        }
        Ok(Self(value.into()))
    }
    pub fn as_str(&self) -> &str {
        &self.0
    }
}
