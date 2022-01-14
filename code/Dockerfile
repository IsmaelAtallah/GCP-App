FROM python:3.8-slim-buster
WORKDIR /app
COPY requirements.txt .
RUN pip3 install --upgrade pip  
RUN pip3 install -r requirements.txt
COPY . .
RUN export $(cat .env | xargs)te
CMD ["python3", "hello.py"]
