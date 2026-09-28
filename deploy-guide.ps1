# Quick Deploy Script for Render

Write-Host "🚀 PDF to Markdown - Deploy to Render" -ForegroundColor Cyan
Write-Host ""

$projectPath = "C:\Users\HoaD-CVDT\.openclaw\workspace\projects\pdf2md-render"

# Check if git is initialized
if (-not (Test-Path "$projectPath\.git")) {
    Write-Host "📦 Initializing Git..." -ForegroundColor Yellow
    cd $projectPath
    git init
    git add .
    git commit -m "Initial commit - PDF to Markdown Converter"
    Write-Host "✅ Git initialized" -ForegroundColor Green
} else {
    Write-Host "✅ Git already initialized" -ForegroundColor Green
}

Write-Host ""
Write-Host "📋 Next Steps:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Create GitHub repo:" -ForegroundColor White
Write-Host "   https://github.com/new" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Push code:" -ForegroundColor White
Write-Host "   cd $projectPath"
Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/pdf2md-converter.git"
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Deploy on Render:" -ForegroundColor White
Write-Host "   a. Go to https://render.com" -ForegroundColor Gray
Write-Host "   b. Sign up with GitHub" -ForegroundColor Gray
Write-Host "   c. New+ → Web Service" -ForegroundColor Gray
Write-Host "   d. Select your repo" -ForegroundColor Gray
Write-Host "   e. Use these settings:" -ForegroundColor Gray
Write-Host "      - Environment: Python 3" -ForegroundColor DarkGray
Write-Host "      - Build: pip install -r requirements.txt" -ForegroundColor DarkGray
Write-Host "      - Start: gunicorn app:app" -ForegroundColor DarkGray
Write-Host "      - Plan: Free" -ForegroundColor DarkGray
Write-Host ""
Write-Host "4. Done! Your site will be live at:" -ForegroundColor White
Write-Host "   https://YOUR-APP-NAME.onrender.com" -ForegroundColor Green
Write-Host ""
Write-Host "💡 Free tier: 750 hours/month, auto-sleep after 15 min" -ForegroundColor Yellow
