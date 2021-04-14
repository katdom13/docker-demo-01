FROM python:3

# Set env var to allow viewing of terminal in realtime
ENV PYTHONBUFFERED=1

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]