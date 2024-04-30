#FROM python:3.6
FROM  python:3.6

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV SECRET_KEY=secretkey
ENV MYSQL_ENDPOINT=192.168.1.12
ENV MYSQL_PASSWORD=password
ENV MYSQL_USER=root
ENV MYSQL_DB=devsecops


RUN mkdir /app
WORKDIR /app
COPY app/requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY app/ /app
EXPOSE 10007
CMD ["python", "routes.py"]
