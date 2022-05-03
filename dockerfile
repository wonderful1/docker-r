################# BASE IMAG ######################
FROM r-base:3.6.3

################## INSTALLATION ######################
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
RUN apt-get update && apt-get install -y libxml2-dev &&  apt install -y libcurl4-openssl-dev

ENV R_HOME=/usr/lib/R
RUN /usr/bin/R -e "install.packages('BiocManager')" && R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/locfit/locfit_1.5-9.2.tar.gz',repos = NULL)" && /usr/bin/R  -e "BiocManager::install('DESeq2')" && /usr/bin/R  -e "install.packages('ggplot2')" && /usr/bin/R -e "BiocManager::install('edgeR')" && /usr/bin/R -e "install.packages('statmod')"

WORKDIR /data/

CMD ["R"]

