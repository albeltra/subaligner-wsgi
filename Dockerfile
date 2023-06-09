FROM python:3.10.10-alpine

RUN python3 -m pip install flask==1.1.4 rq==1.12.0 gunicorn==20.1.0 markupsafe==2.0.1

RUN apk add --no-cache ffmpeg

COPY ./subaligner-standalone/app.py /scripts/

COPY ./subaligner-standalone/utils.py /scripts/

ENTRYPOINT ["gunicorn", "-b", "0.0.0.0", "--timeout", "600",  "--chdir", "/scripts", "app:app"]
