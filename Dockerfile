FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install flask

COPY . .

EXPOSE 5000 

CMD ["/opt/venv/bin/python", "-m", "flask", "run", "--host=0.0.0.0"]
