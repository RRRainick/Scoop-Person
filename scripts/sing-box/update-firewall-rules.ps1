Get-NetFirewallRule | Where-Object { $_.DisplayName -like "*sing-tun*" -or $_.DisplayName -eq "Sing-Box" } | ForEach-Object {
    Remove-NetFirewallRule -Name $_.Name -ErrorAction SilentlyContinue
}
'TCP', 'UDP' | ForEach-Object {
    New-NetFirewallRule `
        -DisplayName "Sing-Box" `
        -Profile "Private, Public" `
        -Description "Work with Sing-Box." `
        -Direction Inbound `
        -Protocol $_ `
        -Action Allow `
        -Program "$Singbox" `
    | Out-Null
}
