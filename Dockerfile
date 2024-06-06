# Usa un'immagine di base di Ubuntu
FROM ubuntu:latest

# Imposta le variabili d'ambiente per le directory
ENV WORKSPACE=/workspace
ENV PROJECT=/workspace/project

# Crea le directory
RUN mkdir -p $WORKSPACE
RUN mkdir -p $PROJECT

# Imposta la directory di lavoro
WORKDIR $PROJECT

# Installa TeX Live, BibTeX (o biber), make, git, nano, e altri pacchetti utili
RUN apt-get update && apt-get install -y \
    texlive-full \
    biber \
    make \
    git \
    vim \
    nano

# Copia il tuo script di compilazione nel container
COPY compile.sh /usr/local/bin/compile.sh
RUN chmod +x /usr/local/bin/compile.sh

# Imposta lo script di compilazione come comando predefinito
CMD ["compile.sh"]
