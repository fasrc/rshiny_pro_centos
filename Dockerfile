FROM fasrc/rshiny_pro_centos:latest

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/local/bin/dumb-init

RUN R -e "install.packages(c('plotly', 'DT','data.table','dplyr','car','scales','devtools'), repos='https://cran.rstudio.com/', INSTALL_opts=c('--no-html', '--no-docs', '--without-keep.source', '--clean'))"
