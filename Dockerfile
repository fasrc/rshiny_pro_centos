FROM centos:latest


RUN yum install -y epel-release && yum install -y R &&\
    mkdir -pv /usr/share/doc/R-3.3.2/html

RUN R -e "install.packages('shiny', repos='https://cran.rstudio.com/')"

RUN curl -O https://s3.amazonaws.com/rstudio-shiny-server-pro-build/centos6.3/x86_64/shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm && \
    yum install -y --nogpgcheck shiny-server-commercial-1.5.3.770-rh6-x86_64.rpm

COPY shiny-server.sh /usr/bin/shiny-server.sh

EXPOSE 3838

ENTRYPOINT ["/usr/bin/shiny-server.sh"]
