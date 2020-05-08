## from https://gist.github.com/jbratu/6262684939e15e638892973f5f8eed78

## Backup current settings
    ### Set backup location for registry keys
        $BakProto       = "c:\temp\pre_schannel_protocol_updates-$(get-date -f yyyy-MM-dd_HH-mm-ss).reg"
        $BakCipher      = "c:\temp\pre_schannel_cipher___updates-$(get-date -f yyyy-MM-dd_HH-mm-ss).reg"
        $BakKeyExchange = "c:\temp\pre_schannel_keyExch__updates-$(get-date -f yyyy-MM-dd_HH-mm-ss).reg"
        $BakSCHANNEL    = "c:\temp\pre_schannel_all_key__updates-$(get-date -f yyyy-MM-dd_HH-mm-ss).reg"

    ## If c:\temp doesn't exist, then create it
        if (!(test-path c:\temp)) {mkdir c:\temp}

    ## Backup the SCHANNEL registry keys
        Reg export "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols"             $BakProto
        Reg export "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers"               $BakCipher
        Reg export "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms" $BakKeyExchange
        Reg export "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\"                      $BakSCHANNEL

### Disable Protocols - Reboot required to take effect
    ### SSL 2.0
        ## Server
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'SSL 2.0 server has been DISABLED.'
        ## Client
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'SSL 2.0 client has been DISABLED.'

    ### SSL 3.0
        ## Server
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'SSL 3.0 server has been DISABLED.'
        ## Client
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'SSL 3.0 client has been DISABLED.'

    ### TLS 1.0
        ## Server
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'TLS 1.0 server has been DISABLED.'
        ## Client
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'TLS 1.0 client has been DISABLED.'

    ### TLS 1.1
        ## Server
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'TLS 1.1 server has been DISABLED.'
        ## Client
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'TLS 1.1 client has been DISABLED.'

### Enable Protocols - Reboot required to take effect
    ### TLS 1.2
        ## Server
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'TLS 1.2 server has been ENABLED.'
        ## Client 
            New-Item               'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
            New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
            Write-Host 'TLS 1.2 client has been ENABLED.'
        
### Disable inecure ciphers - Reboot not required to take effect - credit: https://gist.github.com/jbratu/6262684939e15e638892973f5f8eed78
    ## List ciphers
        $insecureCiphers = @(
            'DES 56/56',
            'NULL',
            'RC2 128/128',
            'RC2 40/128',
            'RC2 56/128',
            'RC4 40/128',
            'RC4 56/128',
            'RC4 64/128',
            'RC4 128/128',
            'Triple DES 168')

    ## Loop through insecure ciphers and create the registry keys if they don't exist, and disable them
        Foreach ($insecureCipher in $insecureCiphers) 
            {
                $key = (Get-Item HKLM:\).OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey($insecureCipher)
                $key.SetValue('Enabled', 0, 'DWord')
                $key.close()
                Write-Host "Weak cipher $insecureCipher has been disabled."
            }

### Enable new secure ciphers
    ## List ciphers
        $secureCiphers = @(
            'AES 128/128',
            'AES 256/256')

    ## Loop through secure ciphers, create the kesy if they don't exist and enable them
        Foreach ($secureCipher in $secureCiphers) 
            {
                $key = (Get-Item HKLM:\).OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey($secureCipher)
                New-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$secureCipher" -name 'Enabled' -value '0xffffffff' -PropertyType 'DWord' -Force | Out-Null
                $key.close()
                Write-Host "Strong cipher $secureCipher has been enabled."
            }




### Set key length for Diffie Hellman Exchange to 2048 (default is 1024) - Reboot not required to take effect
    ## Test to make sure the key exists, if not then create it
        if (!(test-path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman'))
            {New-Item   'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman' -Force | Out-Null}

    ## Set the server and client bit lengths to 2048
        New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman' -name 'ServerMinKeyBitLength' -value '2048' -PropertyType 'DWord' -Force | Out-Null
        New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman' -name 'ClientMinKeyBitLength' -value '2048' -PropertyType 'DWord' -Force | Out-Null
