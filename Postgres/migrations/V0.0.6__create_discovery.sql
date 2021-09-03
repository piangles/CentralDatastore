DROP TABLE IF EXISTS central.discovery;
CREATE TABLE central.discovery
(
	id SERIAL NOT NULL PRIMARY KEY,
	inserted_ts TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_ts TIMESTAMP NOT NULL,
	
	environment VARCHAR(3) NOT NULL,
	service_name VARCHAR(50) NOT NULL,
	name VARCHAR(250) NOT NULL,
	value VARCHAR(1000) NOT NULL
);
CREATE TRIGGER updated_ts_trigger BEFORE INSERT OR UPDATE ON central.discovery FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_ts();
