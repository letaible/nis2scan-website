# Deploy von dist/ auf den Strato-Webspace per SFTP.
# Aufruf:  .\deploy.ps1     (Passwort wird interaktiv abgefragt, bleibt lokal)
# NUR ASCII in dieser Datei (PowerShell 5.1 liest .ps1 ohne BOM als ANSI).

param(
    [string]$SftpUser = "su1249398",
    [string]$SftpHost = "5019618796.ssh.w2.strato.hosting",
    [string]$RemoteDir = "nis2scan"   # relativ zur SFTP-Wurzel (/htdocs)
)

$ErrorActionPreference = "Stop"
$dist = Join-Path $PSScriptRoot "dist"
if (-not (Test-Path (Join-Path $dist "index.html"))) {
    Write-Error "dist/ fehlt - bitte erst 'npm run build' ausfuehren."
}

# sftp-Batchdatei erzeugen: Zielverzeichnisse anlegen, dann alle Dateien laden.
# Fuehrendes '-' bei mkdir: Fehler ignorieren, falls das Verzeichnis existiert.
$batch = New-TemporaryFile
$lines = @("-mkdir $RemoteDir")
Get-ChildItem $dist -Recurse -Directory | ForEach-Object {
    $rel = $_.FullName.Substring($dist.Length + 1) -replace '\\', '/'
    $lines += "-mkdir $RemoteDir/$rel"
}
$files = @(Get-ChildItem $dist -Recurse -File)
foreach ($f in $files) {
    $rel = $f.FullName.Substring($dist.Length + 1) -replace '\\', '/'
    $local = $f.FullName -replace '\\', '/'
    $lines += "put `"$local`" `"$RemoteDir/$rel`""
}
Set-Content -Path $batch.FullName -Value $lines -Encoding ascii

Write-Output ("Lade {0} Dateien nach {1}@{2} -> /{3} ..." -f $files.Count, $SftpUser, $SftpHost, $RemoteDir)
Write-Output "Beim ersten Verbinden den Host-Key mit 'yes' bestaetigen, dann das SFTP-Passwort eingeben."

sftp -oBatchMode=no -b $batch.FullName "$SftpUser@$SftpHost"
$code = $LASTEXITCODE
Remove-Item $batch.FullName -Force

if ($code -eq 0) {
    Write-Output "Fertig. Naechster Schritt: Domain in der Strato-Domainverwaltung auf /$RemoteDir zeigen lassen und SSL aktivieren."
} else {
    Write-Error "sftp endete mit Exit-Code $code - Upload pruefen."
}
