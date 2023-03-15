# oh-my-posh
oh-my-posh init pwsh --config "$ENV:POSH_THEMES_PATH\\mkachniarz.omp.json" | Invoke-Expression

# menu complete using TAB instead of CTRL+SPACE
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete  

# up&down arrow for history search
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward  
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# dotnet completion
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {  
    param($commandName, $wordToComplete, $cursorPosition)
    dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

$env:AZ_ENABLED = $true
$env:POSH_GIT_ENABLED = $true