from flask import Flask, request, jsonify
from flask_cors import CORS
import random, smtplib
from datetime import datetime, timedelta

app = Flask(__name__)
CORS(app)

otp_db = {}  # Temporarily stores OTP

@app.route('/send-otp', methods=['POST'])
def send_otp():
    data = request.json
    email = data.get('email')
    otp = str(random.randint(100000, 999999))
    otp_db[email] = {'otp': otp, 'expires': datetime.now() + timedelta(minutes=5)}

    # Replace this part with your email and app password
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('glen.arakal0007@gmail.com', 'fwxd fmgh vvjn plgl')  # Replace this
    message = f'Subject: Your OTP\n\nYour OTP is: {otp}'
    server.sendmail('your-email@gmail.com', email, message)
    server.quit()

    return jsonify({'message': 'OTP sent'}), 200

@app.route('/verify-otp', methods=['POST'])
def verify_otp():
    data = request.json
    email = data.get('email')
    otp = data.get('otp')
    record = otp_db.get(email)

    if record and record['otp'] == otp and datetime.now() < record['expires']:
        return jsonify({'message': 'OTP Verified'}), 200
    return jsonify({'message': 'Invalid or expired OTP'}), 400

if __name__ == '__main__':
    app.run(debug=True)
