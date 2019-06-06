FROM debian:latest
MAINTAINER Sergey Vessart <vessart@ascon.ru>

ARG SERVER=http://localhost:5545
ARG DATABASE=pilot-ice_ru

ENV server=$SERVER
ENV database=$DATABASE

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get install apt-utils wget unzip nginx mupdf-tools supervisor -y

RUN mkdir /opt/pilot-web \
&& cd /opt/pilot-web \
&& wget https://github.com/PilotTeam/pilot-web-client-netcorerelease/releases/download/v2.0.5/Release_Linux.zip \
&& unzip Release_Linux.zip \
&& rm Release_Linux.zip \
&& rm appsettings.json \
&& printf "{\nPilotServer:{\n\"Url\":\"$server\",\n\"Database\":\"$database\"}\n}" > appsettings.json \
&& chmod +x Ascon.Pilot.Web

COPY pilot-web.config /etc/nginx/sites-available/pilot-web.config

RUN ln -s /etc/nginx/sites-available/pilot-web.config /etc/nginx/sites-enabled/pilot-web.config \
&& rm /etc/nginx/sites-available/default

COPY supervisor/* /etc/supervisor/conf.d/

CMD /usr/bin/supervisord -nc /etc/supervisor/supervisord.conf & cd /opt/pilot-web && ./Ascon.Pilot.Web -c $server $database

EXPOSE 80 443
