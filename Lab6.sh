#Create 2 files ; app.py and Dockerfile
vi app.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
  return "Hello Docker from Killercoda!"
if __name__ == '__main__':
  app.run(host='0.0.0.0', port=8080)

vi Dockerfile
FROM python:3.10-slim
WORKDIR /app
COPY app.py .
RUN pip install flask
EXPOSE 8080
CMD ["python3", "app.py"]

#Build Image
docker build -t flask-webapp .

#Run the Container
docker run -d -p 8080:8080 flask-webapp
