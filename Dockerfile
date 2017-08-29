FROM docker.elastic.co/logstash/logstash:5.5.2

COPY ./ /app/


RUN cat /app/ls-plugins | xargs logstash-plugin install

USER root

RUN yum -y install epel-release && \
    yum -y install python-pip && \
    yum clean all

RUN pip install hvac

EXPOSE 5001:5001

RUN chown -R logstash /app

USER logstash

ENTRYPOINT "/app/entrypoint.sh"
CMD ""
