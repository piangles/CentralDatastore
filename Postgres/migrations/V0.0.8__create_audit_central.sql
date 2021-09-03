DROP TABLE IF EXISTS central.audit_central;
CREATE TABLE central.audit_central
(
	id SERIAL NOT NULL PRIMARY KEY,
	inserted_ts TIMESTAMP NOT NULL DEFAULT NOW(),

	remote_address VARCHAR(50)  NOT NULL,
	remote_host VARCHAR(255)  NOT NULL,
	remote_port INT NOT NULL,
	remote_user VARCHAR(50)  NULL,
	requested_service_name VARCHAR(50) NULL,
	requested_value VARCHAR(250) NULL
);
