# add_hosts.ps1
$hostsPath = "C:\Windows\System32\drivers\etc\hosts"
Add-Content -Path $hostsPath -Value "192.168.57.102  lucas"
Add-Content -Path $hostsPath -Value "192.168.57.102  web2"
Add-Content -Path $hostsPath -Value "192.168.57.102  lucas.com"
Add-Content -Path $hostsPath -Value "192.168.57.102  www.lucas.com"
