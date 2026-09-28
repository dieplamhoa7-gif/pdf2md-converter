# Quick GitHub Setup Guide

## Hòa Đại ka cần làm 2 việc:

### 1. Cho Tiểu đệ biết USERNAME GitHub
Ví dụ: nếu GitHub profile là `https://github.com/lamhoa123` 
→ Username là: `lamhoa123`

### 2. Tạo Personal Access Token (để push code)

**Bước tạo token:**
1. Vào: https://github.com/settings/tokens
2. Login với `dieplamhoa7@gmail.com`
3. Click "Generate new token" → "Generate new token (classic)"
4. Note: `pdf2md-converter`
5. Expiration: 90 days
6. Scope: **Chỉ cần check `repo`**
7. Generate token
8. **Copy token** (chỉ hiện 1 lần!)

---

## Sau khi có USERNAME và TOKEN:

```powershell
cd C:\Users\HoaD-CVDT\.openclaw\workspace\projects\pdf2md-render

# Tạo repo trên GitHub web UI trước (https://github.com/new)
# Repo name: pdf2md-converter, Public

# Add remote
git remote add origin https://github.com/USERNAME/pdf2md-converter.git

# Push (dùng token thay password)
git push -u origin main
# Username: USERNAME
# Password: TOKEN (paste token vừa copy)
```

---

## Hoặc đơn giản hơn:

**Hòa Đại ka cho Tiểu đệ:**
- GitHub username
- Personal access token

**Tiểu đệ sẽ:**
- Push code lên GitHub
- Deploy lên Render
- Gửi link cho anh

---

**Cần username GitHub và token để tiếp tục!**
