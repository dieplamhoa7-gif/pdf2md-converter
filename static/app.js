// DOM elements
const dropZone = document.getElementById('dropZone');
const fileInput = document.getElementById('fileInput');
const fileInfo = document.getElementById('fileInfo');
const fileName = document.getElementById('fileName');
const fileSize = document.getElementById('fileSize');
const convertBtn = document.getElementById('convertBtn');
const progress = document.getElementById('progress');
const progressFill = document.getElementById('progressFill');
const progressText = document.getElementById('progressText');
const error = document.getElementById('error');
const result = document.getElementById('result');
const resultContent = document.getElementById('resultContent');
const copyBtn = document.getElementById('copyBtn');
const downloadBtn = document.getElementById('downloadBtn');
const resetBtn = document.getElementById('resetBtn');

let selectedFile = null;
let markdownResult = '';

// Click to select file
dropZone.addEventListener('click', () => {
    fileInput.click();
});

// Drag and drop handlers
dropZone.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropZone.classList.add('dragging');
});

dropZone.addEventListener('dragleave', () => {
    dropZone.classList.remove('dragging');
});

dropZone.addEventListener('drop', (e) => {
    e.preventDefault();
    dropZone.classList.remove('dragging');
    
    const files = e.dataTransfer.files;
    if (files.length > 0) {
        handleFile(files[0]);
    }
});

// File input change
fileInput.addEventListener('change', (e) => {
    if (e.target.files.length > 0) {
        handleFile(e.target.files[0]);
    }
});

// Handle file selection
function handleFile(file) {
    if (file.type !== 'application/pdf') {
        showError('Vui lòng chọn file PDF!');
        return;
    }

    selectedFile = file;
    
    fileName.textContent = file.name;
    fileSize.textContent = formatFileSize(file.size);
    
    fileInfo.classList.add('show');
    convertBtn.classList.add('show');
    error.classList.remove('show');
    result.classList.remove('show');
}

// Format file size
function formatFileSize(bytes) {
    if (bytes < 1024) return bytes + ' B';
    if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(2) + ' KB';
    return (bytes / (1024 * 1024)).toFixed(2) + ' MB';
}

// Convert button
convertBtn.addEventListener('click', async () => {
    if (!selectedFile) return;
    
    convertBtn.disabled = true;
    progress.classList.add('show');
    error.classList.remove('show');
    result.classList.remove('show');
    
    try {
        // Simulate progress (since we're using client-side conversion)
        updateProgress(20, 'Đang đọc file...');
        
        // Read PDF using PDF.js (we'll use a simple API for demo)
        const formData = new FormData();
        formData.append('file', selectedFile);
        
        updateProgress(50, 'Đang chuyển đổi...');
        
        // Call backend API (Firebase Function)
        const response = await fetch('/api/convert', {
            method: 'POST',
            body: formData
        });
        
        if (!response.ok) {
            throw new Error('Lỗi chuyển đổi: ' + response.statusText);
        }
        
        updateProgress(80, 'Hoàn tất...');
        
        const data = await response.json();
        markdownResult = data.markdown;
        
        updateProgress(100, 'Xong!');
        
        setTimeout(() => {
            progress.classList.remove('show');
            showResult(markdownResult);
        }, 500);
        
    } catch (err) {
        console.error(err);
        progress.classList.remove('show');
        showError('Lỗi: ' + err.message + '\n\nĐể demo, bạn cần deploy Firebase Functions. Hiện tại đang dùng mock data.');
        
        // Mock result for demo
        markdownResult = `# ${selectedFile.name}\n\n**Demo Result**\n\nĐây là kết quả mẫu. Để sử dụng thực tế, cần:\n\n1. Deploy Firebase Functions với MarkItDown\n2. Cấu hình Python runtime\n3. Upload file lên Cloud Storage\n\n## Tính năng\n\n- Chuyển đổi PDF sang Markdown\n- Hỗ trợ OCR (optional)\n- Giữ nguyên cấu trúc văn bản\n- Tables, lists, headings\n\n---\n\n*Powered by MarkItDown*`;
        
        showResult(markdownResult);
    } finally {
        convertBtn.disabled = false;
    }
});

// Update progress
function updateProgress(percent, text) {
    progressFill.style.width = percent + '%';
    progressText.textContent = text;
}

// Show result
function showResult(markdown) {
    resultContent.textContent = markdown;
    result.classList.add('show');
}

// Show error
function showError(message) {
    error.textContent = message;
    error.classList.add('show');
}

// Copy button
copyBtn.addEventListener('click', () => {
    navigator.clipboard.writeText(markdownResult).then(() => {
        const originalText = copyBtn.textContent;
        copyBtn.textContent = '✓ Đã copy!';
        setTimeout(() => {
            copyBtn.textContent = originalText;
        }, 2000);
    });
});

// Download button
downloadBtn.addEventListener('click', () => {
    const blob = new Blob([markdownResult], { type: 'text/markdown' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = selectedFile.name.replace('.pdf', '.md');
    a.click();
    URL.revokeObjectURL(url);
});

// Reset button
resetBtn.addEventListener('click', () => {
    selectedFile = null;
    fileInput.value = '';
    fileInfo.classList.remove('show');
    convertBtn.classList.remove('show');
    progress.classList.remove('show');
    error.classList.remove('show');
    result.classList.remove('show');
    progressFill.style.width = '0%';
});
