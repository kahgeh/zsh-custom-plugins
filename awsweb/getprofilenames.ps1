#!/usr/bin/env pwsh
$config = Get-Content "$HOME/.aws/config"
$pattern = [Regex]"\[(\s*profile\s+){0,1}(?<name>[^\s]+)\]"
$config | 
    ForEach-Object { 
        $result = $pattern.Match($_)
        if ( $result.Success ) {
            $result.Groups['name'].Value
        }
    }    