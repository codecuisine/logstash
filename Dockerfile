FROM logstash:2.3.4-1

COPY ./ /app/


RUN cat /app/ls-plugins | xargs /opt/logstash/bin/logstash-plugin install

RUN apt-get update && \
    apt-get install -y \
    gettext-base \
    python-pip

RUN pip install hvac

EXPOSE 5001:5001

CMD /app/bootstrapper.sh
