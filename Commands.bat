REM used to test if a domain controller is advertising as the authoritative NTP server within a domain. Should return TIMESERV flag
nltest /dsgetdc:domain.com /server:dcname

REM verbose status of endpoint defined after 'computer:'. Look for Reliable Time Server for it to be an authoritative NTP server.
w32tm /query /status /verbose /computer:dcname

REM command used to update NTP source setting on endpoint to refer to domain hierarchy
w32tm /config /syncfromflags:DOMHIER /update

REM command used to stop and start Windows Time Server - have to do this after changing NTPserver string in registry
net stop w32time && net start w32time

REM quick command to get the NTP source for a given endpoint. 'Local CMOS Clock' means no NTP server is defined.
w32tm /query /source

REM more verbose information than /source
w32tm /query /status

REM forces a resync even if refresh rate has not been met.
w32tm /resync /force

REM used to manually set NTP server settings of specific endpoint to FQDN servers @ pool.net.org - should't be used in domain.
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"

