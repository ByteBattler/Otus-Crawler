FROM python:3.6.0-alpine
WORKDIR /ui
COPY requirements.txt /ui
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN install wheel
RUN install virtualenv
RUN python -m venv venv
COPY ./ui/ /ui
EXPOSE  8000
ENV MONGO mongodb
ENV MONGO_PORT 27017
ENV FLASK_APP ui.py
ENTRYPOINT ["gunicorn", "ui:app", "-b", "0.0.0.0"]
