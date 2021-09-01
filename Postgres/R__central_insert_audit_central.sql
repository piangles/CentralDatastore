DROP PROCEDURE IF EXISTS central.insert_audit_central;

CREATE PROCEDURE central.insert_audit_central
(
	IN p_remote_address VARCHAR(50),
	IN p_remote_host VARCHAR(255),
	IN p_remote_port INT,
	IN p_remote_user VARCHAR(50),
	IN p_requested_service_name VARCHAR(50),
	IN p_requested_value VARCHAR(250)
) 
AS $$
BEGIN

	INSERT INTO central.audit_central
	(
		remote_address,
		remote_host,
		remote_port,
		remote_user,
		requested_service_name,
		requested_value
	)
	VALUES
	(
		p_remote_address,
		p_remote_host,
		p_remote_port,
		p_remote_user,
		p_requested_service_name,
		p_requested_value
	);
	
END
$$ LANGUAGE plpgsql;