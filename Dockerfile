# Tensorflow / Keras
#
# Tensorflow / Keras is an image that runs python3
# tensorflow, and intall the keras library forcing
# it to work with keras as only backend.
#
# Matteo Ragni - info@ragni.me

FROM gcr.io/tensorflow/tensorflow:latest-gpu-py3

LABEL Description "Python 3 Tensorkflow image with GPU support and Keras"
LABEL Vendor "Matteo Ragni"
LABEL maintainer "info@ragni.me"
LABEL Version "1.0"

RUN apt-get update

# Keras dependencies installation:
#  - hdf5 : save and restore trained weights
#  - graphviz, pydot : display the model
RUN apt-get install -y --no-upgrade --no-install-recommends  \
  graphviz \
  libtiff5 \
  hdf5-helpers \
  hdf5-tools \
  python3-hdf5storage \
  python3-pydot \
  python3-tk

RUN pip install keras pandas sklearn ipdb
RUN mkdir /nn
RUN mkdir /log

EXPOSE 8888
EXPOSE 6006
ENV KERAS_BACKEND tensorflow

WORKDIR /src
CMD (tensorboard --logdir=/log --port=6006 --host=0.0.0.0 --purge-orphaned-data >/dev/null 2>/dev/null &) && \
    (jupyter notebook --port=8888 --ip=0.0.0.0 >/tmp/jupyter.stdout 2>/tmp/jupyter.stderr &) && \
    bash
