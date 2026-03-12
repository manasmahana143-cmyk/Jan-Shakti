from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

# Function to save data to SQL
def save_to_db(name, phone, work):
    # Connect to our worker database
    conn = sqlite3.connect('jan_shakti.db')
    cursor = conn.cursor()
    
    # SQL Command to insert the worker's details
    cursor.execute('''
        INSERT INTO Workers (full_name, phone_number, work_type) 
        VALUES (?, ?, ?)
    ''', (name, phone, work))
    
    conn.commit()
    conn.close()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register', methods=['POST'])
def register():
    # Grabbing data from the HTML form fields
    worker_name = request.form.get('name')
    worker_phone = request.form.get('phone')
    worker_job = request.form.get('work_type')
    
    # Saving it to our SQL table
    save_to_db(worker_name, worker_phone, worker_job)
    
    return "Dhanyawad! Your details are saved. We will call you soon."

if __name__ == '__main__':
    app.run(debug=True)