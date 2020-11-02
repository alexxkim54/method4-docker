# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get install -y aria2
RUN apt-get install -y map
RUN apt-get install -y traceroute

# 3) install packages
RUN pip install --no-cache-dir geopandas
RUN pip install --no-cache-dir babypandas

# 4) change back to notebook user
COPY /run_jupyter.sh /

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
