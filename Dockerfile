FROM ubuntu-upstart:14.04

ADD requires /tmp/

RUN apt-get update && \
    apt-get -y install python-setuptools python-dev libldap2-dev libsasl2-dev git \
    libsasl2-dev libssl-dev python-ldap python-psycopg2 libxml2-dev libxslt1-dev \
    wget libpq-dev postgresql python-cracklib nano
RUN easy_install pip
RUN pip install hgnested
RUN mkdir -p /etc/mercurial/
RUN echo "[extensions]\nhgnested =" > /etc/mercurial/hgrc
RUN mkdir /tmp/gnuhealth

WORKDIR /tmp/gnuhealth/
RUN hg clone https://bitbucket.org/pablopadulles/health -r 978ff76
WORKDIR /tmp/gnuhealth/health/tryton

RUN ./gnuhealth_install.sh

RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN ln -s /opt/gnuhealth/gnuhealth/tryton/server/trytond-3.*/bin/trytond /usr/local/bin/

ADD tryton-server.init /etc/init/tryton-server.conf

EXPOSE 8000
