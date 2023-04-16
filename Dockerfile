FROM firstdocker1/or-fm-infa:12.4-1

USER oracle

RUN mkdir /u01/oracle/properties

COPY domain_security.properties /u01/oracle/properties
COPY domain.properties /u01/oracle/properties

COPY container-scripts/createOrStartInfraDomain.sh /u01/oracle/container-scripts

ENV DOMAIN_NAME=myinfraDomain ADMIN_NAME=myadmin ADMIN_HOST=InfraAdminContainer ADMIN_LISTEN_PORT=7001 MANAGEDSERVER_PORT=8001 MANAGED_NAME=infraServer1 ADMINISTRATION_PORT_ENABLED=true ADMINISTRATION_PORT=9002 RCUPREFIX=INFRA01 PRODUCTION_MODE=dev CONNECTION_STRING=myoracledb3.cgqwbwooqm3q.us-west-2.rds.amazonaws.com:1521/ORCL

EXPOSE 7001
EXPOSE 9002

ENTRYPOINT ["/u01/oracle/container-scripts/createOrStartInfraDomain.sh"]
