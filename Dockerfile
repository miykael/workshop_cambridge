# Creates the docker container for the workshop in Cambridge
# Run the container with the following command:
#   docker run -it --rm -p 8888:8888 miykael/workshop_cambridge

FROM miykael/nipype_tutorial:latest

ARG DEBIAN_FRONTEND=noninteractive

#--------------------------------------------------
# Update conda environment with additional software
#--------------------------------------------------

USER root

# Install additional software
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER neuro

RUN bash -c "source activate neuro \
    && conda install -y -q pip \
                           numpy" \
    && conda clean -tipsy

RUN bash -c "source activate neuro \
    && pip install --no-cache-dir \
                   nitime \
                   nibabel \
                   nilearn" \
    && rm -rf ~/.cache/pip/*

#------------------------------------------------------------
# Update conda environment 'neuro' for visualization examples
#------------------------------------------------------------

USER neuro

RUN bash -c "source activate neuro \
    && conda install -y -q bokeh \
                           holoviews \
                           nilearn \
                           plotly \
                           scikit-image \
                           scipy=0.19" \
    && conda clean -tipsy

#--------------------------------------------
# Update conda environment 'neuro' for PyMVPA
#--------------------------------------------

USER root

# Install software for PyMVPA
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends swig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER neuro
RUN bash -c "source activate neuro \
    && pip install --upgrade pip pymvpa2" \
    && rm -rf ~/.cache/pip/*

#------------------------------------------------
# Copy workshop notebooks into image and clean up
#------------------------------------------------

USER root

# Install workshop notebooks and slides
COPY [".", "/home/neuro/workshop"]

RUN chown -R neuro /home/neuro/workshop

RUN rm -rf /opt/miniconda-latest/pkgs/*

USER neuro

RUN mkdir -p ~/.jupyter && echo c.NotebookApp.ip = \"0.0.0.0\" > ~/.jupyter/jupyter_notebook_config.py

WORKDIR /home/neuro

CMD ["jupyter-notebook"]
