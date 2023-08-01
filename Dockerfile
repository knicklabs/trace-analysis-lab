# syntax=docker/dockerfile:1

FROM python:3.11.4-slim-bullseye

# SHELL ["/bin/bash", "-c"]

LABEL maintainer="Nickolas Kenyeres <nk09ja@brocku.ca>" \
      version="1.0.0"

RUN pip3 install --upgrade pip

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libelf-dev \
    libdw-dev \
    libpcre3-dev \
    libbabeltrace2-dev \
    libglib2.0-dev \
    wget

WORKDIR /tmp

RUN  wget -c https://downloads.sourceforge.net/project/swig/swig/swig-3.0.12/swig-3.0.12.tar.gz
RUN tar -xzf swig-3.0.12.tar.gz && \
    cd swig-3.0.12 && \
    ./configure && \
    make && \
    make install

RUN cd ..

RUN wget -c https://www.efficios.com/files/babeltrace/babeltrace2-2.0.5.tar.bz2
RUN tar -xf babeltrace2-2.0.5.tar.bz2 && \
    cd babeltrace2-2.0.5 && \
    ./configure --enable-python-bindings && \
    make && \
    make install

      
RUN adduser worker
WORKDIR /home/worker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY --chown=worker:worker . .

USER worker
CMD ["python3", "-m", "jupyter", "lab", "--ip=0.0.0.0", "--port=9000", "--NotebookApp.token=''"]
