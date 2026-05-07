#Create project folder and move into it
mkdir project
cd project

#Create subfolders
mkdir input output resize watermark

#Create resize/app.py file
cd resize
vi app.py
from PIL import Image
import os
input_path = '/data/input/image.jpg'
output_path = '/data/output/resized.jpg'
print("Resizing image...")
image = Image.open(input_path)
image = image.resize((300, 300))
image.save(output_path)
print("Image resized and saved!")

#Create resize/Dockerfile
vi Dockerfile
FROM python:3.11-slim
RUN pip install pillow
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]

#Now set up watermark/app.py
cd watermark
vi app.py
from PIL import Image, ImageDraw, ImageFont
import os
input_path = '/data/output/resized.jpg'
output_path = '/data/output/watermarked.jpg'
print("Adding watermark...")
image = Image.open(input_path)
draw = ImageDraw.Draw(image)
font = ImageFont.load_default()
draw.text((50, 50), "Sample Watermark", fill=(0, 255, 128), font=font)
image.save(output_path)
print("Watermarked image saved!")

#Create watermark/Dockerfile
vi Dockerfile
FROM python:3.11-slim
RUN pip install pillow
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]

#Build Containers
cd /project
# Build resize container
docker build -t resize-image ./resize
# Build watermark container
docker build -t watermark-image ./watermark

#now add image
wget -O input/image.jpg https://picsum.photos/600/400


#Run Containers in Sequence (simulate Step Functions)
# Resize the image
docker run --rm -v $(pwd)/input:/data/input -v
$(pwd)/output:/data/output resize-image
# Watermark the resized image
docker run --rm -v $(pwd)/input:/data/input -v $(pwd)/output:/data/output watermark-image

#Now run the following Command:
python3 -m http.server 8080
