# BUILD
FROM python:3

COPY src /opt/app/src

WORKDIR /opt/app

RUN pip install Flask && \
  pip install requests && \
  pip install flask_mysqldb

CMD [ "python", "src/app.py" ]
