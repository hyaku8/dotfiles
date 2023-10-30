clear                                                                                                                              
New-Alias which get-command                                                                                                        
Set-PSReadLineOption -EditMode Emacs                                                                                                                                                                                                            
$COLOR1 = "DarkRed"
$COLOR2 = "DarkCyan"

function prompt {
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    Write-Host("|$(Get-Date -Format HH:mm)| ") -NoNewline -ForegroundColor $COLOR2
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor $COLOR1
    Write-Host "@" -NoNewLine
    Write-Host "$env:COMPUTERNAME" -NoNewline 
    Write-Host " [$(Get-Location)]" -NoNewline -ForegroundColor $COLOR2
    return "$(if ($IsAdmin) { '# ' } else { '$ ' } )"
}
