FROM centos:latest

RUN yum install -y epel-release && yum install -y R &&\
    mkdir -pv /usr/share/doc/R-3.3.2/html

RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cran.rstudio.com/', INSTALL_opts=c('--no-html', '--no-docs', '--without-keep.source'))"

RUN curl -O https://s3.amazonaws.com/rstudio-shiny-server-pro-build/centos6.3/x86_64/shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm && \
    yum install -y --nogpgcheck shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm && rm -fv shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm && \
    yum clean all && cd /var/lib/rpm && rm -f /var/lib/rpm/__db* && rm -Rf /var/cache/yum/

COPY shiny-server.sh /usr/bin/shiny-server.sh

EXPOSE 3838

ENTRYPOINT ["/usr/bin/shiny-server.sh"]
