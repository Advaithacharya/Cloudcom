#Sample Project Structure
#myapp/
#├── app.py
#├── Dockerfile
#├── requirements.txt
#└── deploy.sh

#Dockerfile (vi Dockerfile)
FROM python:3.10-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python3", "app.py"]

#app.py (vi app.py)
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
 return "Hello from CI/CD automated container!"
if __name__ == "__main__":
 app.run(host="0.0.0.0", port=8080)

#requirements.txt (vi requirements.txt)
flask

#deploy.sh (CI/CD automation) (vi deploy.sh)
#!/bin/bash
PORT=8080
echo "Building Docker image..."
docker build -t myapp:latest .
echo "Stopping old containers..."
docker stop myapp || true
docker rm myapp || true
echo "Running new container on port $PORT..."
docker run -d --name myapp -p $PORT:8080 myapp:latest
echo "App deployed!"
echo "Use Killercoda Traffic tab Port $PORT"

#Make it executable:
chmod +x deploy.sh

#Run:
./deploy.sh
