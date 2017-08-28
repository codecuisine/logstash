FROM logstash:5.4.3-alpine

COPY ./ /app/


RUN cat /app/ls-plugins | xargs logstash-plugin install

RUN apk add -U \
    gettext \
    py-pip

RUN pip install hvac

EXPOSE 5001:5001

CMD /app/bootstrapper.sh
