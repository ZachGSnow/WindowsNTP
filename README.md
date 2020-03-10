# Authoritative Windows NTP Server


Instructions on how to configure a Windows Server to be the Authoritative Time Server within a Domain.



### Manually configure The Time Source
1. Run Regit and Navigate to the following Registry Subkey
 `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters\Type`
2. Modify the value and set to **NTP**
3. Navigate to the following Registry Subkey
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Config\AnnounceFlags`
4. Set the AnnounceFlags to a value of **5**
5. Navigate to the following Registry Subkey
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer`
6. Modify the DWORD value to **1** to enable the NTPServer
7. Navigate to teh following Registry Subkey
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters`
8. Modify **ntpserver** and enter **pool.ntp.org,0x1**
9. Navigate to the following Registry Subkey
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Config\MaxPosPhaseCorrection`
10. Modify the **MaxPosPhaseCorrection** DWORD to be **3600** AKA 1 hour in seconds.
11. Navigate to the following Registry Subkey
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Config\MaxNegPhaseCorrection`
12. Modify the **MaxNegPhaseCorrection** DWORD to be **3600** AKA 1 hour in seconds.
13. Close the Registry Editor.
#
Restart the Windows Time Service with the following command: ```
net stop w32time && net start w32time```
