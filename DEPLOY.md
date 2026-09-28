# 🚀 PDF to Markdown Converter - HƯỚNG DẪN NHANH

## ✅ Đã chuẩn bị sẵn!

Folder: `projects/pdf2md-render/`

## 📦 Deploy miễn phí lên Render (3 phút)

### Bước 1: Tạo GitHub repo
1. Vào: https://github.com/new
2. Tên repo: `pdf2md-converter`
3. Public
4. Create repository

### Bước 2: Push code
```bash
cd C:\Users\HoaD-CVDT\.openclaw\workspace\projects\pdf2md-render
git remote add origin https://github.com/TÊN_CỦA_BẠN/pdf2md-converter.git
git branch -M main
git push -u origin main
```

### Bước 3: Deploy trên Render
1. Vào: https://render.com
2. Đăng ký bằng GitHub (free, không cần credit card)
3. Click **"New +"** → **"Web Service"**
4. Chọn repo `pdf2md-converter`
5. Settings:
   - Name: `pdf2md` (hoặc gì cũng được)
   - Environment: **Python 3**
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `gunicorn app:app`
   - **Plan: FREE**
6. Click **"Create Web Service"**

**Xong!** Sau 2-3 phút web sẽ live tại: `https://pdf2md.onrender.com`

## 💻 Test local trước (optional)

```bash
cd projects/pdf2md-render
pip install -r requirements.txt
python app.py
```

Mở: http://localhost:5000

## 🎯 Gửi cho sếp

```
🌐 PDF to Markdown Converter
Link: https://TÊN-BẠN-ĐẶT.onrender.com

✅ Miễn phí 100%
✅ Kéo thả PDF → Markdown ngay
✅ Copy hoặc tải về .md file
```

## ⚡ Lưu ý

- **Free tier auto-sleep** sau 15 phút không dùng
- Lần đầu truy cập sau khi sleep: ~30 giây wake up
- Các lần sau: nhanh ngay
- **Không giới hạn số lần dùng**

## 🐛 Nếu gặp lỗi

**Render deploy fail:**
- Check Build Logs
- Đảm bảo có file `requirements.txt` và `Procfile`

**Local test lỗi:**
```bash
pip install -r requirements.txt
python app.py
```

---

Made with ❤️ by Tiểu đệ
