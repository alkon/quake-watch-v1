FROM python:3.13.2-alpine AS base
WORKDIR /app

RUN apk update && apk add --no-cache python3 py3-pip

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]