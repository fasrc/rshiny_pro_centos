FROM fasrc/rshiny_pro_centos:latest

RUN R -e "install.packages(c('plotly', 'DT','data.table','dplyr','car','scales','devtools'), repos='https://cran.rstudio.com/', INSTALL_opts=c('--no-html', '--no-docs', '--without-keep.source', '--clean'))"
