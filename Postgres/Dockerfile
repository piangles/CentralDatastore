# This is a poor man version of creating database till we integrate with https://flywaydb.org
# flywaydb will help us in deployment of our database / schema changes to various environments.
# Read the documentation in the README.md

# Download postgres from docker repository
FROM library/postgres

# This copies the sql from migrations folder from local machine to the container.
ADD ./migrations/*.sql /sql/

# Here we create init.sql in the container by concatenting all Versioned migration sql files in order/sequence.
RUN cat /sql/V*.sql > /init.sql

# Here we concatenate (use >> for concatenating) Repetable migration sql files to the end of init.sql.
RUN cat /sql/R*.sql >> /init.sql

# This copies all data sql(s) files from local machine to the container.
ADD ./data/*.sql /data/

# Here we concatenate again (use >> for concatenating)the data file(s) at the end of the init.sql
RUN cat /data/*.sql >> /init.sql

# This is where postgres entry point is : Please read https://hub.docker.com/_/postgres
RUN cp /init.sql /docker-entrypoint-initdb.d/

# Environment variables that postgres uses
ENV POSTGRES_USER=central
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=central_ops
