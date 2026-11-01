# M12 native review observations

The supported Computer Use connection succeeded. `Review-CoverSheet.ps1 -Matrix` launched all ten default/minimum samples at 100%, 125%, 150%, 175% and 200% against the existing verified executable, SHA256 `21f1cde24ce21d39218846ba8a183f9263475207aacae5f7c75b0167153434c4`. The matrix process exited successfully after the final window closed. No rebuild occurred.

**Ten samples have native observations; zero have full protocol sign-off. M12 acceptance remains incomplete.** See [the evidence index](index.json) for per-sample records, requested scales, preparation geometry, limitations and file hashes. The 474 timestamped native records are independent of the launcher journey logs. Screenshot dimensions describe bounded native window captures, including decorations; they are not independent client-area measurements. Screenshot payloads were JPEG and are saved with `.jpg` extensions.

At each sample, native forward Tab reached all five tables and their enabled View buttons. Native arrows selected rows; Enter opened matching Problem List, Vitals, medication and appointment details, and Space opened allergy details. Settled UIA identified the matching read-only detail and initial focus; Escape returned to the selected table. Ctrl+O and Escape retained SYNTH-001 and cleared transient selections before that forward traversal. Reverse Tab revealed the upper and middle tables. Upper/middle/lower screenshots retained the fixed header, navigation and status frame. Default 100% has additional View activation, appointment detail, and SYNTH-002 empty-panel evidence.

## Visual finding

All five minimum-size initial captures show the horizontal appointment scrollbar drawn across the selected third row, obscuring its text. The rightmost column is clipped before horizontal scrolling. Default-size captures also show the third row at the bottom of the table viewport partially clipped. Keyboard detail opening continued to identify APPT-03 correctly. These observations do not establish that horizontal scrolling repairs the overlap; that interaction remains unchecked.

## Supplemental input anomaly

After the minimum-200 sample, the native System > Size keyboard attempt changed the bounded captured width from 1962 to 1973 pixels. Subsequent Ctrl+O did not open the selector, including after rehydrating and activating the window. The recorded sequence also sent Ctrl+O while a detail pane was open; that particular ignored shortcut is not itself a failure. The later repeated shortcut from the table remains unresolved. Alt+F4 successfully closed the window. No post-resize navigation/cancellation pass is claimed.

The first default-100 indexed patient-text double-click had no selection effect. A coordinate attempt against the returned 16x16 icon screenshot was rejected; refreshing and targeting the full-window screenshot then successfully double-clicked SYNTH-002. These attempts are not panel-row double-click passes. Immediate post-input UIA can lag the visible detail; settled snapshots were collected separately.

## Outstanding coverage

- Repeat navigation and cancellation after a verified native resize at every sample, investigating the minimum-200 anomaly.
- Exercise row double-clicks and all requested activation methods across panels/samples; View focus alone does not prove activation.
- Exercise horizontal scrolling and long medication detail at every sample, plus read-only scrolling/edit rejection beyond the recorded Ctrl+A selection.
- Repeat SYNTH-002 empty-panel checks at the other nine samples.
- Collect independent actual native client geometry rather than relying on preparation logs or outer-window dimensions.

Historical analysis/validation receipts, automated/synthetic checks, and M10/M12 user-reported listening passes were left unchanged. There is no new speech/audio verification, monitor-DPI transition claim or clinical connectivity.
