FROM logstash

COPY ./ /app/

RUN cat /app/ls-plugins | xargs /opt/logstash/bin/plugin install

RUN apt-get update && \
    apt-get install -y \
    gettext-base \
    python-pip

RUN pip install hvac

CMD /app/bootstrapper.sh
