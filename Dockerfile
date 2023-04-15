FROM firstdocker1/fmw-dev-infrastructure:12.2.1.4-1

USER oracle

RUN mkdir /u01/oracle/properties

COPY domain_security.properties /u01/oracle/properties
COPY domain.properties /u01/oracle/properties

ENV DOMAIN_NAME=myinfraDomain ADMIN_NAME=myadmin ADMIN_HOST=InfraAdminContainer ADMIN_LISTEN_PORT=7001 MANAGEDSERVER_PORT=8001 MANAGED_NAME=infraServer1 ADMINISTRATION_PORT_ENABLED=true ADMINISTRATION_PORT=9002 RCUPREFIX=INFRA01 PRODUCTION_MODE=dev CONNECTION_STRING=myoracledb.cgqwbwooqm3q.us-west-2.rds.amazonaws.com:1521/ORCL

EXPOSE 7001
EXPOSE 9002

ENTRYPOINT ["/u01/oracle/container-scripts/createOrStartInfraDomain.sh"]
