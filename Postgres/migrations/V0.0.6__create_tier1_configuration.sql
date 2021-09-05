DROP TABLE IF EXISTS central.tier1_configuration;
CREATE TABLE central.tier1_configuration
(
	id SERIAL NOT NULL,
	inserted_ts TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_ts TIMESTAMP NOT NULL,
	
	environment VARCHAR(3) NOT NULL,
	service_name VARCHAR(50) NOT NULL,
	name VARCHAR(250) NOT NULL,
	value VARCHAR(1000) NOT NULL,
	
	PRIMARY KEY(environment, service_name, name)
);
CREATE TRIGGER updated_ts_trigger BEFORE INSERT OR UPDATE ON central.tier1_configuration FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_ts();
