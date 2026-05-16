$url = "https://github.com/lavalink-devs/Lavalink/releases/download/4.0.8/Lavalink.jar"
$output = "Lavalink.jar"

if (Test-Path $output) {
    Write-Host "Lavalink.jar ya existe. Saltando descarga." -ForegroundColor Cyan
} else {
    Write-Host "Descargando Lavalink v4.0.8..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $url -OutFile $output
    Write-Host "Descarga completada." -ForegroundColor Green
}

Write-Host "Para iniciar el servidor, asegúrate de tener Java 17 instalado y ejecuta:" -ForegroundColor White
Write-Host "java -jar Lavalink.jar" -ForegroundColor Cyan
