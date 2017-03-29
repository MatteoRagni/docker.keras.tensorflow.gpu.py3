# Tensorflow / Keras
#
# Tensorflow / Keras is an image that runs python3
# tensorflow, and intall the keras library forcing
# it to work with keras as only backend.
#
# Matteo Ragni - info@ragni.me

FROM tensorflow/tensorflow:latest-gpu-py3

LABEL Description "Python 3 Tensorkflow image with GPU support and Keras"
LABEL Vendor "Matteo Ragni"
LABEL maintainer "info@ragni.me"
LABEL Version "1.0"

RUN apt-get update
RUN apt-get install -y hdf5-tools hdf5-helpers python3-hdf5storage
RUN pip install keras
RUN mkdir /nn

EXPOSE 8888
EXPOSE 6006
ENV KERAS_BACKEND tensorflow

WORKDIR /src
CMD bash
