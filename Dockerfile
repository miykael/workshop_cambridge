# Creates the docker container for the workshop in Cambridge
# Run the container with the following command:
#   docker run -it --rm -p 8888:8888 miykael/workshop_cambridge

FROM miykael/nipype_tutorial:latest

ARG DEBIAN_FRONTEND=noninteractive

#--------------------------------------
# Update system applications for PyMVPA
#--------------------------------------

USER root

# Install software for PyMVPA
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           swig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#---------------------------------
# Update conda environment 'neuro'
#---------------------------------

USER neuro

RUN conda install -y -q --name neuro \
           dipy \
           bokeh \
           holoviews \
           plotly \
    && sync && conda clean -tipsy && sync \
    && bash -c "source activate neuro \
    &&   pip install  --no-cache-dir \
             nitime \
             nibabel \
             nilearn \
             dipy \
             pymvpa2 \
             tensorflow \
             keras" \
    && rm -rf ~/.cache/pip/* \
    && sync

#------------------------------------------------
# Copy workshop notebooks into image and clean up
#------------------------------------------------

USER root

# Install workshop notebooks and slides
COPY [".", "/home/neuro/workshop"]

RUN chown -R neuro /home/neuro/workshop

RUN rm -rf /opt/conda/pkgs/*

USER neuro

RUN mkdir -p ~/.jupyter && echo c.NotebookApp.ip = \"0.0.0.0\" > ~/.jupyter/jupyter_notebook_config.py

WORKDIR /home/neuro

CMD ["jupyter-notebook"]
