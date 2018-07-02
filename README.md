# Workshops Cambridge - 2018

This repository contains everything for the the workshop in Cambridge 2018.

## Docker

If you want to have the full experience, use the docker container `miykael/workshop_cambridge`. It provides the computational environment to run the notebooks on any system with all necessary dependencies installed.

To download the container, use the command:
`docker pull miykael/workshop_cambridge`

And to run it on your system, use the command:
`docker run -it --rm -p 8888:8888 miykael/workshop_cambridge`

If you want to have access to the notebooks run in the docker container, add the command `-v /path/to/your/folder:/home/neuro/workshop` before `miykael/workshop_cambridge`, where `/path/to/your/folder` should be a free folder on your system, such as `/User/neuro/Desktop/workshop`.

And if you want to have access to the output data created within the docker container, add the command  `-v /path/to/your/output_folder:/output` before `miykael/workshop_cambridge`, where `/path/to/your/output_folder` should be a free folder on your system, such as `/User/neuro/Desktop/output`.


## Conda

If you don't care about some of the software dependencies, or have them already installed on your system, you can use conda to create the necessary python environment to run the notebooks:

1. If you haven't yet, get conda on your system: https://conda.io/miniconda.html
2. Download the [environment.yml]() from the repository
3. Open up a conda terminal (or any other terminal), and create a new conda environment with the following command: `conda env create --name neuro --file /path/to/file/environment.yml`
4. Download the notebooks in this repository, save them in a desired location and run the following command from this folder: `jupyter notebook`

**Note**: This only provides you the notebooks from the workshop that are not already in the `nipype_tutorial`. Those notebooks you can download here: https://github.com/miykael/nipype_tutorial
