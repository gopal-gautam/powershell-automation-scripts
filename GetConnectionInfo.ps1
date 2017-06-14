function ifconfig($ifname="")
{
    $interface = @{"eth0"= "Ethernet 3"; "wlan0"= "Wi-fi 3"}
    if ($interface.contains($ifname))
    {
        Get-NetIPConfiguration -InterfaceAlias $interface.$ifname
    }
    elseif($ifname.Trim() -eq "")
    {
        foreach ($if in $interface.Keys)
        {
            Get-NetIPConfiguration -InterfaceAlias $interface.$if
        }
    }
    else
    {
        Write-Host -ForeGroundColor Red "Can't recognise the interface: $ifname"
    }
}

function iwconfig()
{
    ifconfig wlan0
}