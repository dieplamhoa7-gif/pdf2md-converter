from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
from markitdown import MarkItDown
import os
import tempfile
from pathlib import Path

app = Flask(__name__, static_folder='static')
CORS(app)

# Reject oversized uploads before processing. Files are only kept in a temporary
# local path during conversion and are deleted in the finally block below.
app.config['MAX_CONTENT_LENGTH'] = 20 * 1024 * 1024  # 20 MB

# Initialize MarkItDown
md_converter = MarkItDown()

@app.route('/')
def index():
    return send_from_directory('static', 'index.html')

@app.route('/app.js')
def app_js():
    return send_from_directory('static', 'app.js')

@app.route('/api/convert', methods=['POST'])
def convert_pdf():
    try:
        # Check if file is present
        if 'file' not in request.files:
            return jsonify({'error': 'No file uploaded'}), 400
        
        file = request.files['file']
        
        if file.filename == '':
            return jsonify({'error': 'No file selected'}), 400
        
        if not file.filename.lower().endswith('.pdf'):
            return jsonify({'error': 'Only PDF files are supported'}), 400
        
        # Save uploaded file to temp
        with tempfile.NamedTemporaryFile(delete=False, suffix='.pdf') as tmp_file:
            file.save(tmp_file.name)
            tmp_path = tmp_file.name
        
        try:
            # Convert PDF to Markdown
            result = md_converter.convert(tmp_path)
            markdown_content = result.text_content
            
            return jsonify({
                'success': True,
                'markdown': markdown_content,
                'fileName': file.filename.replace('.pdf', '.md')
            })
        
        finally:
            # Cleanup temp file
            try:
                os.unlink(tmp_path)
            except:
                pass
    
    except Exception as e:
        return jsonify({
            'error': 'Conversion failed',
            'message': str(e)
        }), 500

@app.errorhandler(413)
def request_entity_too_large(error):
    return jsonify({'error': 'PDF quá lớn. Giới hạn là 20 MB.'}), 413

@app.route('/health')
def health():
    return jsonify({'status': 'ok'})

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
