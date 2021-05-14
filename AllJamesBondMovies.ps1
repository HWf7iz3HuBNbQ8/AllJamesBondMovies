$jamesbondMovies = @{
    "JamesBond007-JagtDrNo-1962"                    = "https://cs.liiift.io/v1/STV/pd/29/EB/27/2A/FO-269W6EWYNBH11/master.m3u8"
    "JamesBond007-LiebesgrüßeAusMoskau-1963"        = "https://cs.liiift.io/v1/STV/pd/49/C3/04/8/FO-26CNYW3GHBH11/master.m3u8"
    "JamesBond007-Goldfinger-1964"                  = "https://cs.liiift.io/v1/STV/pd/83/69/5B/CB/FO-26F5WN3KNBH11/master.m3u8"
    "JamesBond007-Feuerball-1965"                   = "https://cs.liiift.io/v1/STV/pd/6E/19/65/29/FO-26H1VGNJ9BH11/master.m3u8"
    "JamesBond007-ManLebtNurZweimal-1967"           = "https://cs.liiift.io/v1/STV/pd/86/6B/B7/C5/FO-26KP73VVHBH11/master.m3u8"
    "JamesBond007-ImGeheimdienstIhrerMajestät-1969" = "https://cs.liiift.io/v1/STV/pd/C5/B9/61/9E/FO-26NX5SU99BH11/master.m3u8"
    "JamesBond007-Diamantenfieber-1971"             = "https://cs.liiift.io/v1/STV/pd/D1/4B/EB/7B/FO-26R5A5BHSBH11/master.m3u8"
    "JamesBond007-LebenUndSterbenLassen-1973"       = "https://cs.liiift.io/v1/STV/pd/56/AC/15/B2/FO-26TT2WUCHBH11/master.m3u8"
    "JamesBond007-DerMannMitDemGoldenenColt-1974"   = "https://cs.liiift.io/v1/STV/pd/BC/54/B0/D7/FO-26VNZJJ39BH11/master.m3u8"
    "JamesBond007-DerSpionDerMichLiebte-1977"       = "https://cs.liiift.io/v1/STV/pd/8A/E7/72/8C/FO-26XXVE735BH11/master.m3u8"
    "JamesBond007-Moonraker-StrengGeheim-1979"      = "https://cs.liiift.io/v1/STV/pd/4D/8E/A0/50/FO-2733C2PFDBH11/master.m3u8"
    "JamesBond007-InTödlicherMission-1981"          = "https://cs.liiift.io/v1/STV/pd/1F/72/2E/67/FO-275SMC7HWBH11/master.m3u8"
    "JamesBond007-Octopussy-1983"                   = "https://cs.liiift.io/v1/STV/pd/61/AE/71/9/FO-278NW9RAWBH11/master.m3u8"
    "JamesBond007-SagNiemalsNie-1983"               = "https://cs.liiift.io/v1/STV/pd/AA/A7/4F/94/FO-27AKYPUXNBH11/master.m3u8"
    "JamesBond007-ImAngesichtDesTodes-1985"         = "https://cs.liiift.io/v1/STV/pd/54/FC/CE/F8/FO-27CECSWQ5BH11/master.m3u8"
    "JamesBond007-DerHauchDesTodes-1987"            = "https://cs.liiift.io/v1/STV/pd/62/A1/D6/93/FO-27EDG92MSBH11/master.m3u8"
    "JamesBond007-LizenzTumTöten-1989"              = "https://cs.liiift.io/v1/STV/pd/A9/58/3C/57/FO-27JY1RJ65BH11/master.m3u8"
    "JamesBond007-EinQuantumTrost-2008"             = "https://cs.liiift.io/v1/STV/pd/B5/BB/5B/BC/FO-25RMX3DF5BH11/master.m3u8"
    "JamesBond007-Skyfall-2012"                     = "https://cs.liiift.io/v1/STV/pd/E3/70/99/30/FO-25WG2HXJ5BH11/master.m3u8"
}

$baseDirectory = $global:PSScriptRoot
$ffmpegLocation = $baseDirectory + "\ffmpeg.exe"

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

if (!(Test-Path $ffmpegLocation)) {
    Get-Ffmpeg
}

$jamesbondMovies.GetEnumerator() | ForEach-Object {
    
    $fileName = $baseDirectory + "\" + $_.Key + ".mp4"

    Write-Host $fileName
    
    &$ffmpegLocation -i $_.Value -c copy $fileName
}
