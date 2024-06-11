## LaTeX Environment in Docker

This project sets up a comprehensive LaTeX environment using Docker, enabling the isolated and reproducible compilation of LaTeX documents.

### Prerequisites

Before you begin, ensure that Docker is installed on your system. For instructions on installing Docker, visit [Docker Docs](https://docs.docker.com/get-docker/).

### Project Structure

Here's an example of the directory structure you might use:

```
docker-latex/
│
├── Dockerfile
├── compile.sh
└── main.tex  (Your main LaTeX document)
```

### Dockerfile

The `Dockerfile` includes all the instructions necessary to build the Docker image. Here's an example of a `Dockerfile` that prepares a LaTeX environment:

```dockerfile
# Use an Ubuntu base image
FROM ubuntu:latest

# Set environment variables for the directories
ENV WORKSPACE=/workspace
ENV PROJECT=/workspace/project

# Create the directories
RUN mkdir -p $WORKSPACE
RUN mkdir -p $PROJECT

# Set the working directory
WORKDIR $PROJECT

# Install TeX Live, BibTeX, make, git, vim, nano, and other useful packages
RUN apt-get update && apt-get install -y \
    texlive-full \
    biber \
    make \
    git \
    vim \
    nano

# Copy your compilation script into the container
COPY compile.sh /usr/local/bin/compile.sh
RUN chmod +x /usr/local/bin/compile.sh

# Set the compilation script as the default command
CMD ["compile.sh"]
```

### Compilation Script (`compile.sh`)

The `compile.sh` script automates the process of compiling LaTeX documents. Here's an example script:

```bash
#!/bin/bash

# Execute pdflatex
pdflatex main.tex

# Execute bibtex or biber if necessary
bibtex main

# Execute pdflatex two more times
pdflatex main.tex
pdflatex main.tex
```

### Building the Docker Image

To build the Docker image, run the following command from the project directory:

```bash
docker build -t latex-environment .
```

### Running the Container

To run the Docker container, use the command:

```bash
docker run -it -v $(pwd):/workspace/project latex-environment
```

This mounts the current directory into the container and starts the compilation process.

### Sharing the Image

After building the image, you can upload it to Docker Hub to make it accessible to others:

```bash
docker tag latex-environment your-username/latex-environment:latest
docker push your-username/latex-environment:latest
```

### Conclusion

This Docker environment provides an effective way to compile LaTeX documents in an isolated and reproducible manner, facilitating collaboration and the sharing of complex configurations.

