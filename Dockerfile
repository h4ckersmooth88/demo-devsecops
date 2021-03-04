#FROM python:3.6
FROM quay.io/bitnami/python:3.8-prod

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
COPY app/requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY app/ /app
EXPOSE 10007
CMD ["python", "routes.py"]
