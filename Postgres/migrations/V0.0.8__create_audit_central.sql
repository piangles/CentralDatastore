DROP TABLE IF EXISTS central.audit_central;
CREATE TABLE central.audit_central
(
	id SERIAL NOT NULL PRIMARY KEY,
	inserted_ts TIMESTAMP NOT NULL DEFAULT NOW(),

	remote_address varchar(50)  NOT NULL,
	remote_host varchar(255)  NOT NULL,
	remote_port INT NOT NULL,
	remote_user varchar(50)  NULL,
	requested_service_name varchar(50) NULL,
	requested_value varchar(250) NULL
);
