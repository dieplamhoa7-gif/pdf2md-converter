# Run PDF to Markdown Converter locally
$ErrorActionPreference = "Stop"

Write-Host "🚀 Starting PDF to Markdown Converter..." -ForegroundColor Cyan

# Find Python
$pythonCmd = $null
$pythonPaths = @(
    "C:\Users\HoaD-CVDT\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\python.exe",
    "C:\Users\HoaD-CVDT\AppData\Local\Programs\Python\Python311\python.exe",
    "python3",
    "python"
)

foreach ($path in $pythonPaths) {
    if (Get-Command $path -ErrorAction SilentlyContinue) {
        $pythonCmd = $path
        break
    }
}

if (-not $pythonCmd) {
    Write-Host "❌ Python not found!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Using Python: $pythonCmd" -ForegroundColor Green

# Install dependencies
Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow
& $pythonCmd -m pip install --user flask flask-cors markitdown[pdf]

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to install dependencies" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Dependencies installed" -ForegroundColor Green
Write-Host ""

# Run server
Write-Host "🌐 Starting server at http://localhost:5000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray
Write-Host ""

Set-Location "C:\Users\HoaD-CVDT\.openclaw\workspace\projects\pdf2md-render"
& $pythonCmd app.py
