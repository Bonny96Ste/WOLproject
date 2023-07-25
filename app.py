from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/trigger_wol')
def trigger_wol():
    os.system('wakeonlan $TARGET_MAC_ADDRESS')
    return "WoL packet sent successfully!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
