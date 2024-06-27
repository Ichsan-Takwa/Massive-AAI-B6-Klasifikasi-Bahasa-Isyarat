FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 python3-opencv libopencv-dev v4l-utils && apt-get clean && rm -rf /var/lib/apt/lists/* -y

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]
