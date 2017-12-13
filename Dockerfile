FROM centos:latest

RUN yum update -y && yum install -y epel-release && yum install -y R libcurl-devel openssl-devel wget

RUN mkdir -pv "/usr/share/doc/R-$(rpm -q --qf "%{VERSION}" R)/HTML"

RUN R -e "install.packages(c('assertthat', 'backports', 'base64enc', 'BH', 'bindr', bindrcpp', 'colorspace', 'dichromat', 'digest', 'dplyr', 'DT', 'evaluate', 'ggplot2', 'ggrepel', 'glue', 'gtable', 'highr', 'htmltools', 'htmlwidgets', 'httpuv', 'jsonlite', 'knitr', 'labeling', 'lazyeval', 'magrittr', 'markdown', 'mime', 'munsell', 'pkgconfig', 'plogr', 'plyr', 'R6', 'RColorBrewer', 'Rcpp', 'reshape2', 'rlang', 'rmarkdown', 'rprojroot', 'scales', 'shiny,' 'sourcetools', 'stringi', 'stringr', 'tibble', 'viridisLite', 'xtable', 'yaml'), repos='https://cran.rstudio.com/', INSTALL_opts=c('--no-html', '--no-docs', '--without-keep.source', '--clean'))"

RUN curl -O https://s3.amazonaws.com/rstudio-shiny-server-pro-build/centos6.3/x86_64/shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm && \
    yum install -y --nogpgcheck shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm && rm -fv shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm && \
    yum clean all && rm -f /var/lib/rpm/__db* && rm -rfv /var/cache/yum/*.*

COPY shiny-server.sh /usr/bin/shiny-server.sh

EXPOSE 80 8080 8443 443 3838

ENTRYPOINT ["/usr/bin/shiny-server.sh"]
