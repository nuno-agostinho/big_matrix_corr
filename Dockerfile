FROM bioconductor/release_base2:latest
MAINTAINER Nuno Agostinho <nunodanielagostinho@gmail.com>

RUN apt-get update && apt-get -y upgrade && apt-get -y autoremove

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile

RUN Rscript -e "install.packages('WGCNA')"
RUN Rscript -e "install.packages('propagate')"
RUN Rscript -e "install.packages('ccaPP')"
RUN Rscript -e "install.packages('fastCor')"
RUN Rscript -e "install.packages('ppcor')"

RUN Rscript -e "install.packages('remotes')"
RUN Rscript -e "remotes::install_github('nuno-agostinho/cTRAP', ref='6dae1ab', build_opts=c('--no-resave-data', '--no-manual'))"
