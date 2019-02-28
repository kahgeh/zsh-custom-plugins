#!/usr/bin/env pwsh
$config = Get-Content "$HOME/.aws/config"
$config | 
    Where-Object { $_ -match "\[(\s*profile\s+){0,1}([^\s]+)\]" } |  
    ForEach-Object{ $_ -replace "\[(\s*profile\s+){0,1}([^\s]+)\]",'$2' }