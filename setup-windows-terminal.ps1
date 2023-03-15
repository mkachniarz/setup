$ProgressPreference='Silent'

function Install-Prerequisites {
    # INSTALL LATEST POWERSHELL
    winget install --id Microsoft.Powershell --source winget

    # INSTALL GIT
    winget install --id Git.Git -e --source winget --scope user

    # INSTALL OH MY POSH (https://ohmyposh.dev/)
    winget install JanDeDobbeleer.OhMyPosh -s winget

    # INSTALL POSH-GIT
    Install-Module posh-git -Scope CurrentUser -Force
}


function Setup-OhMyPosh-Theme {
    oh-my-posh font install cascadiacode
    # MOVE CUSTOM PROFILE TO $ENV:POSH_THEMES_PATH
    Copy-Item -Path "./assets/mkachniarz.omp.json" -Destination $ENV:POSH_THEMES_PATH
}

function Setup-Powershell-Profile {
    if (!(Test-Path -Path $PROFILE)) 
    {
        New-Item -ItemType File -Path $PROFILE -Force
    }

    $profileContent = Get-Content "./assets/profile.ps1" -Raw

    Set-Content -Path $PROFILE -Value $profileContent -Encoding UTF8
}

Install-Prerequisites
# Install-Font
Setup-OhMyPosh-Theme
Setup-Powershell-Profile