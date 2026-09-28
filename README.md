# PDF to Markdown Converter - Free Deploy

Chuyển đổi PDF sang Markdown hoàn toàn miễn phí, không cần credit card.

## ✨ Tính năng

- 🚀 Chuyển đổi PDF sang Markdown
- 📁 Drag & drop upload
- 📋 Copy kết quả
- 💾 Tải về file .md
- 🎨 Giao diện đẹp, responsive
- ✅ **100% miễn phí**

## 🚀 Deploy lên Render (Free)

### Bước 1: Tạo GitHub repo

```bash
cd projects/pdf2md-render
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/pdf2md-converter.git
git push -u origin main
```

### Bước 2: Deploy trên Render

1. Vào https://render.com (đăng ký miễn phí với GitHub)
2. Click **"New +"** → **"Web Service"**
3. Chọn repo `pdf2md-converter`
4. Cấu hình:
   - **Name:** `pdf2md-converter`
   - **Environment:** `Python 3`
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
   - **Plan:** Free

5. Click **"Create Web Service"**

Sau 2-3 phút, web sẽ live tại: `https://pdf2md-converter.onrender.com`

## 💻 Chạy local (test)

```bash
cd projects/pdf2md-render
pip install -r requirements.txt
python app.py
```

Mở browser: http://localhost:5000

## 📦 Stack

- **Backend:** Flask + MarkItDown
- **Frontend:** Vanilla HTML/CSS/JS
- **Deploy:** Render (Free tier)

## ⚡ Free tier limits

- **Render Free:**
  - 750 hours/tháng
  - Auto-sleep sau 15 phút không dùng
  - Wake-up time: ~30 giây
  - Bandwidth: đủ dùng

## 🎯 Alternative deploys

### Railway (Free $5 credit/tháng)
```bash
# Install Railway CLI
npm install -g @railway/cli
railway login
railway init
railway up
```

### Vercel (Serverless - Free)
Cần convert sang serverless function (có thể làm nếu cần)

## 📝 Notes

- File size limit: 10MB (có thể tăng trong code)
- Render free tier auto-sleep → first request mất ~30s
- Không cần credit card, hoàn toàn miễn phí

## 🐛 Troubleshooting

**Lỗi: Module not found**
```bash
pip install -r requirements.txt
```

**Lỗi: Port already in use**
```bash
# Đổi port trong app.py hoặc kill process cũ
```

**Web chậm trên Render Free**
- Bình thường, vì auto-sleep
- Request đầu tiên wake-up ~30s
- Các request sau nhanh

## 📮 Share với sếp

Sau khi deploy, gửi link cho sếp:
```
🌐 PDF to Markdown Converter
https://pdf2md-converter.onrender.com

✅ Hoàn toàn miễn phí
✅ Không cần đăng ký
✅ Kéo thả PDF → Nhận Markdown ngay
```

---

**Made with ❤️ by Tiểu đệ for Hòa Đại ka**
