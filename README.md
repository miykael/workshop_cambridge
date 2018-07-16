# Workshops Cambridge - 2018

[![CircleCi](https://img.shields.io/circleci/project/miykael/workshop_cambridge/master.svg?maxAge=2592000)](https://circleci.com/gh/miykael/workshop_cambridge/tree/master)
[![GitHub issues](https://img.shields.io/github/issues/miykael/workshop_cambridge.svg)](https://github.com/miykael/workshop_cambridge/issues/)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/miykael/workshop_cambridge.svg)](https://github.com/miykael/workshop_cambridge/pull/)
[![GitHub contributors](https://img.shields.io/github/contributors/miykael/workshop_cambridge.svg)](https://GitHub.com/miykael/workshop_cambridge/graphs/contributors/)
[![GitHub Commits](https://github-basic-badges.herokuapp.com/commits/miykael/workshop_cambridge.svg)]()
[![GitHub size](https://github-size-badge.herokuapp.com/miykael/workshop_cambridge.svg)](https://github.com/miykael/workshop_cambridge/archive/master.zip)
[![Docker Hub](https://img.shields.io/docker/pulls/miykael/workshop_cambridge.svg?maxAge=2592000)](https://hub.docker.com/r/miykael/workshop_cambridge/)
[![GitHub HitCount](http://hits.dwyl.io/miykael/workshop_cambridge.svg)](http://hits.dwyl.io/miykael/workshop_cambridge)

This repository contains everything for the the workshop in Cambridge 2018. Their are three ways that you can interact with its content:

## 1. Docker (recommended)

If you want to have the full experience, use the docker container `miykael/workshop_cambridge`. It provides the computational environment to run the notebooks on any system with all necessary dependencies installed. To install [Docker](https://www.docker.com/) on your system, follow one of those links:

 - [Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntu/) or [Debian](https://docs.docker.com/engine/installation/linux/docker-ce/debian/)
 - [Windows 7/8/9/10](https://docs.docker.com/toolbox/toolbox_install_windows/) or [Windows 10Pro](https://docs.docker.com/docker-for-windows/install/)
 - [OS X (from El Capitan 10.11 on)](https://docs.docker.com/docker-for-mac/install/) or [OS X (before El Capitan 10.11)](https://docs.docker.com/toolbox/toolbox_install_mac/).

Once Docker is installed, open up the docker terminal and test if it works with the command:

    docker run hello-world

**Note:** Linux users might need to use ``sudo`` to run ``docker`` commands or follow [post-installation steps](https://docs.docker.com/engine/installation/linux/linux-postinstall/).

Once docker is running on your system you can continue with downloading the docker image for this workshop. For this use the command:

`docker pull miykael/workshop_cambridge`

Once the download finished, proceed with the following steps:

1. Run the following command in a terminal: ```docker run -it --rm -p 8888:8888 miykael/workshop_cambridge```
1. Copy paste the link that looks like ```http://20f109eba8e4:8888/?token=0312c1ef3b61d7a44ff5346d3d150c23249a548850e13868``` into your webbrowser.
1. Replace the hash number ```20f109eba8e4``` after `http://` with `localhost` or your local IP (probably `192.168.99.100`) if you're on windows.
1. Once Jupyter Notebook is open, click on the `program.ipynb` notebook, and you're good to go.

If you want to have access to the notebooks run in the docker container, add the command `-v /path/to/your/folder:/home/neuro/workshop` before `miykael/workshop_cambridge`, where `/path/to/your/folder` should be a free folder on your system, such as `/User/neuro/Desktop/workshop`.

And if you want to have access to the output data created within the docker container, add the command  `-v /path/to/your/output_folder:/output` before `miykael/workshop_cambridge`, where `/path/to/your/output_folder` should be a free folder on your system, such as `/User/neuro/Desktop/output`.


## 2. Conda (if you want to install everything on your system yourself)

If you don't care about some of the software dependencies, or have them already installed on your system, you can use conda to create the necessary python environment to run the notebooks:

1. If you haven't yet, get conda on your system: https://conda.io/miniconda.html
2. Download the `environment.yml` file from [here]](https://github.com/miykael/workshop_cambridge/blob/master/environment.yml)
3. Open up a conda terminal (or any other terminal), and create a new conda environment with the following command: `conda env create --name neuro --file /path/to/file/environment.yml`
4. Download the notebooks in this repository, save them in a desired location and run the following command from the folder that contains the `program.ipynb` notebook: `jupyter notebook`

**Note**: This only provides you the notebooks from the workshop that are not already in the `nipype_tutorial`. Those notebooks you can download here: https://github.com/miykael/nipype_tutorial


## 3. Jupyter NBViewer

All the notebooks (but not the slides) can be looked at via [Jupyter nbviewer](https://nbviewer.jupyter.org/github/miykael/workshop_mumbai/blob/master/program.ipynb). Like this you can see everything but cannot really interact with the scripts or run the code.
