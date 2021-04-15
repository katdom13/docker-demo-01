FROM python:3

# Set env var to allow viewing of terminal in realtime
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

COPY requirements.txt ./

ADD . .

RUN set -ex \
  && pip install --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt


EXPOSE 8000

# CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "core.wsgi:application"]