FROM python:3.9.12

ENV FLASK_APP flaskr

WORKDIR /app

# Install dependencies
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

# Copy project
COPY . /app

# Instantiate database
RUN flask init-db

CMD [ "gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "flaskr:create_app()" ]
