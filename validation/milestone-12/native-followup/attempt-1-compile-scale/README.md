# First follow-up attempt: invalid scale coverage

This attempt passed formatting, Clippy, the 96 core tests, callbacks and the
83-checkpoint journeys, including the new table-clearance assertion. It does
**not** establish ten-sample scale coverage or native acceptance.

The runner set `SLINT_SCALE_FACTOR=1` before compilation. Slint 1.18.1's compiler
reads this variable as a constant (`i-slint-compiler/lib.rs`), freezing the UI at
100%. The process runtime later resized minimum samples using the requested
factor, but `M12_WINDOW` reported application scale 1 in every sample. Default
125%, 150% and 175% also retained 1180x800 physical dimensions. The original
attempt receipt's `passed: true` represents its then-incomplete checks, not valid
scale coverage. Its runner and hashed logs are preserved here.

Executable SHA256: `da15728f2b28ecb23380be87d16119a2685ae99511b35558cc8465b7c6319449`.
Native record 007 in the parent directory and its `native-minimum-200-*` launcher
log belong to this scale-invalid build. Native records 001-006 belong to the
original M12 executable. Do not combine them with the corrected build's evidence.

The corrected runner unsets the variable during compilation and checks requested
versus reported client dimensions and application scale for every sample. The
follow-up verifier independently enforces those bindings. No historical M12
checkpoint receipt was regenerated.
