#FROM python:3.6
FROM registry.access.redhat.com/ubi8/python-36

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
COPY app/requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY app/ /app
EXPOSE 10007
CMD ["python", "routes.py"]
