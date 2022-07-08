FROM python:latest

WORKDIR /yolov5_aiss

COPY requirements.txt . 

RUN pip3 install -r requirements.txt

COPY ./app ./app
RUN apt-get update -y
RUN apt-get install -y ffmpeg libsm6 libxext6  -y
RUN apt install -y libxkbcommon-x11-0

CMD ["python", "./app/detect.py", "--weights","./app/weights/best.pt", "--source", "0"]
#"./app/data/images/zidane.jpg"]