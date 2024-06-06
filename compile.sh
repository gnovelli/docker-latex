#!/bin/bash

# Esegue pdflatex
pdflatex main.tex

# Esegue bibtex o biber se necessario
bibtex main

# Esegue pdflatex altre due volte
pdflatex main.tex
pdflatex main.tex
