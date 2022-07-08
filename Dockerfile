FROM python:latest

WORKDIR /yolov5_aiss

COPY requirements.txt . 

RUN pip install -r requirements.txt

COPY ./app ./app
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt install libxkbcommon-x11-0

CMD ["python", "./app/detect.py", "--weights","./app/weights/best.pt", "--source", "0"]