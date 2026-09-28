# Tạo GitHub repo và push code

Write-Host "🚀 Deploying PDF to Markdown Converter" -ForegroundColor Cyan
Write-Host ""

# Set git config
cd C:\Users\HoaD-CVDT\.openclaw\workspace\projects\pdf2md-render
git config user.email "dieplamhoa7@gmail.com"
git config user.name "Lam Hoa"

Write-Host "✓ Git config set" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Tạo GitHub repo:" -ForegroundColor White
Write-Host "   - Vào: https://github.com/new" -ForegroundColor Gray
Write-Host "   - Repo name: pdf2md-converter" -ForegroundColor Gray
Write-Host "   - Public" -ForegroundColor Gray
Write-Host "   - Create (KHÔNG check Initialize with README)" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Sau khi tạo repo, chạy:" -ForegroundColor White
Write-Host '   git remote add origin https://github.com/USERNAME/pdf2md-converter.git' -ForegroundColor Gray
Write-Host '   git push -u origin main' -ForegroundColor Gray
Write-Host ""
Write-Host "3. Deploy Render:" -ForegroundColor White
Write-Host "   - Vào: https://dashboard.render.com" -ForegroundColor Gray
Write-Host "   - Login với: lamhoabb2@gmail.com" -ForegroundColor Gray
Write-Host "   - New+ → Web Service → Connect GitHub repo" -ForegroundColor Gray
Write-Host ""
Write-Host "💡 Hoặc Hòa Đại ka cho Tiểu đệ username GitHub để push code!" -ForegroundColor Cyan
