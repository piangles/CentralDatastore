DROP TABLE IF EXISTS central.discovery;
CREATE TABLE central.discovery
(
	id SERIAL NOT NULL PRIMARY KEY,
	inserted_ts TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_ts TIMESTAMP NOT NULL,
	
	environment varchar(3) NOT NULL,
	service_name varchar(50) NOT NULL,
	name varchar(250) NOT NULL,
	value varchar(1000) NOT NULL
);
CREATE TRIGGER updated_ts_trigger BEFORE INSERT OR UPDATE ON central.discovery FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_ts();