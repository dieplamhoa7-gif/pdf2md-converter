# 🚀 Deploy lên Render với account lamhoabb2@gmail.com

## Bước 1: Tạo tài khoản Render (2 phút)

1. Mở browser ẩn danh/incognito
2. Vào: https://dashboard.render.com/register
3. Chọn "Sign up with Email"
4. Điền:
   - Email: `lamhoabb2@gmail.com`
   - Password: (dùng pass giống lamhoabb1)
5. Click "Get Started"
6. Check email `lamhoabb2@gmail.com` → Click verify link

## Bước 2: Push code lên GitHub

### 2.1. Tạo GitHub repo

1. Vào: https://github.com/new
2. Repo name: `pdf2md-converter`
3. Public
4. **KHÔNG** check "Initialize with README"
5. Create repository

### 2.2. Push code

```powershell
cd C:\Users\HoaD-CVDT\.openclaw\workspace\projects\pdf2md-render

# Add remote (thay YOUR_USERNAME bằng username GitHub của bạn)
git remote add origin https://github.com/YOUR_USERNAME/pdf2md-converter.git

# Push
git branch -M main
git push -u origin main
```

Nếu hỏi login: dùng Personal Access Token thay password

## Bước 3: Deploy trên Render

1. Login Render: https://dashboard.render.com
2. Click **"New +"** (góc trên phải)
3. Chọn **"Web Service"**
4. Click **"Connect account"** → **GitHub**
5. Authorize Render truy cập GitHub
6. Chọn repo `pdf2md-converter`
7. Click **"Connect"**

### Settings:

```
Name: pdf2md-converter
Region: Singapore (hoặc gần nhất)
Branch: main
Runtime: Python 3
Build Command: pip install -r requirements.txt
Start Command: gunicorn app:app
Instance Type: Free
```

8. Click **"Create Web Service"**

## Bước 4: Đợi deploy (2-3 phút)

Render sẽ:
- Build Docker container
- Install dependencies
- Start server

Xong sẽ hiện: **"Live"** màu xanh

## Bước 5: Lấy URL

URL sẽ có dạng: `https://pdf2md-converter.onrender.com`

Copy và test!

---

## 🐛 Troubleshooting

**Build failed:**
- Check Logs tab
- Thường do `requirements.txt` hoặc `Procfile`

**Deploy timeout:**
- Free tier có thể chậm lần đầu
- Đợi thêm 1-2 phút

**Git push lỗi authentication:**
```powershell
# Tạo Personal Access Token tại:
# https://github.com/settings/tokens
# Scope: repo

# Dùng token thay password khi git push
```

---

## ⚡ Auto-sleep

- Free tier sleep sau 15 phút không dùng
- Wake up tự động khi có request (~30 giây)
- Không giới hạn số lần dùng

---

**Made by Tiểu đệ for Hòa Đại ka** ❤️
