#Set up your project directory
#your-app/
#├── app.yaml
#├── main.py
#├── requirements.txt

#main.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
  return 'Hello, World!'
if __name__ == '__main__':
  app.run()
#app.run(host='0.0.0.0', port=8080)

#requirements.txt
Flask==2.1.0

#app.yaml
runtime: python39
automatic_scaling:
  min_instances: 0
  max_instances: 5
  target_cpu_utilization: 0.65

#deploy and access your application 
gcloud auth login
gcloud init
gcloud app deploy
gcloud app browse

#terminal command 
python3 main.py
