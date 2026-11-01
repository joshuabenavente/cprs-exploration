/* Unverified decompiler output; inspect assembly and ABI. */

void uVitals_UnloadVitalsDLL(void)

{
  if (uVitals_VitalsDLLHandle != (HMODULE)0x0) {
    Winapi_Windows_FreeLibrary(uVitals_VitalsDLLHandle);
    uVitals_VitalsDLLHandle = (HMODULE)0x0;
  }
  return;
}

