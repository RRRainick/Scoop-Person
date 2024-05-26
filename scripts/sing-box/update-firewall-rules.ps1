Remove-NetFirewallRule -Description "Work with Sing-Box." -ErrorAction SilentlyContinue
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
