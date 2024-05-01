#FROM python:3.6
FROM  python:3.6

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV SECRET_KEY=secretkey
ENV MYSQL_ENDPOINT=192.168.1.12
ENV MYSQL_PASSWORD=password
ENV MYSQL_USER=sammy
ENV MYSQL_DB=devsecops

ENV DD_SERVICE="gossip-app"
ENV DD_ENV="dev"
ENV DD_VERSION="0.1.0"

LABEL com.datadoghq.tags.service="gossip-app"
LABEL com.datadoghq.tags.env="dev"
LABEL com.datadoghq.tags.version="0.1.0"

RUN mkdir /app
WORKDIR /app
COPY app/requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY app/ /app
EXPOSE 10007
CMD ["ddtrace-run", "python", "routes.py"]
