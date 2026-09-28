from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
from markitdown import MarkItDown
import os
import tempfile
from pathlib import Path

app = Flask(__name__, static_folder='static')
CORS(app)

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

@app.route('/health')
def health():
    return jsonify({'status': 'ok'})

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
