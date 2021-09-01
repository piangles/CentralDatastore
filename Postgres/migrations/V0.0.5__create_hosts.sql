DROP TABLE IF EXISTS central.hosts;
CREATE TABLE central.hosts
(
	id SERIAL NOT NULL PRIMARY KEY,
	inserted_ts TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_ts TIMESTAMP NOT NULL,

	environment varchar(3) NOT NULL, --Values will be DEV,QAT,UAT,PRD
	type varchar(25) NOT NULL,
	purpose varchar(25) NOT NULL, 
	host_hame varchar(255)  NOT NULL,
	description varchar(1000)  NOT NULL
);
CREATE TRIGGER updated_ts_trigger BEFORE INSERT OR UPDATE ON central.hosts FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_ts();