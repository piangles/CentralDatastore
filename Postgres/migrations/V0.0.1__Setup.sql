--Setup the timestamp for the database to be UTC
set timezone TO 'UTC';

--Add Extentions
--UUID related extenstion
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
--Encryption extension
CREATE EXTENSION IF NOT EXISTS pgcrypto;
