[CmdletBinding()]
param (
    [Parameter(HelpMessage = "URL til kortstokk", Mandatory = $false)]
    [string]
    $UrlKortstokk = 'http://nav-deckofcards.herokuapp.com/shuffle'
)

$ErrorActionPreference = 'Stop'

$webRequest = Invoke-WebRequest -Uri $UrlKortstokk

$kortstokkJson = $webRequest.Content

$kortstokk = ConvertFrom-Json -InputObject $kortstokkJson


function kortstokkTilStreng {
    [OutputType([string])]
    param (
        [object[]]
        $kortstokk
    )
    $streng = ''
    foreach ($kort in $kortstokk) {
        $streng = $streng + "$($kort.suit[0])" + "$($kort.value)" + ","
    }
        return $streng.TrimEnd(",")
}


Write-Output "Kortstokk: $(kortStokkTilStreng -kortstokk $kortstokk)" 