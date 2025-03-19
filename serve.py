import json
import os

from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
app = Flask(__name__)

UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

CORS(app)


def allowed_file(filename):
    """ Kiểm tra xem file có phần mở rộng hợp lệ không """
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
@app.route('/upload_image', methods=['POST'])
def upload_file():
    # Tạo thư mục nếu chưa tồn tại
    os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)

    # Kiểm tra file ảnh
    if 'image' not in request.files:
        return jsonify({"error": "No image file found"}), 400

    image = request.files['image']
    if image.filename == '':
        return jsonify({"error": "No selected file"}), 400

    if not allowed_file(image.filename):
        return jsonify({"error": "Invalid file type"}), 400

    # Lưu ảnh vào thư mục uploads/
    image_path = os.path.join(app.config['UPLOAD_FOLDER'], image.filename)
    image.save(image_path)


    return jsonify({"success": "Image uploaded successfully", "image_path": image_path}), 200


@app.route('/uploads/<path:filename>')
def serve_image(filename):
    return send_from_directory("uploads", filename)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
