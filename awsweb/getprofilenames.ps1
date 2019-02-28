#!/usr/bin/env pwsh
$config = Get-Content "$HOME/.aws/config"
$profileSectionHeaderPattern = [Regex]"\[(\s*profile\s+){0,1}(?<name>[^\s]+)\]"
$sourcePattern = [Regex]"\s*[S|s]ource_profile\s*=\s*(?<name>[^\s]+)"
$sectionHeaders = New-Object System.Collections.ArrayList
$sourceProfileNames = New-Object System.Collections.ArrayList
$config | 
    ForEach-Object { 
        $profileSectionHeaderMatch = $profileSectionHeaderPattern.Match($_)
        if ( $profileSectionHeaderMatch.Success ) {
            $sectionHeaders.Add($profileSectionHeaderMatch.Groups['name'].Value)|Out-Null;
        }

        $sourceMatch = $sourcePattern.Match($_)
        if($sourceMatch.Success) {
            $sourceProfileName = $sourceMatch.Groups['name'].Value
            if ( $sourceProfileName -notcontains $sourceProfileNames){
                $sourceProfileNames.Add($sourceProfileName)| Out-Null
            }
        }
    }    

Compare-Object $sectionHeaders $sourceProfileNames |
    Where-Object {$_.SideIndicator -eq '<='} |
    Select-Object -ExpandProperty InputObject