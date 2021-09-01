DROP FUNCTION IF EXISTS central.is_host_authorized;

CREATE FUNCTION central.is_host_authorized 
(
	IN p_host_name VARCHAR(255)
) 
RETURNS BOOLEAN
AS $$
DECLARE
  v_authorized BOOLEAN;
BEGIN

	SELECT EXISTS(SELECT 1 FROM central.hosts  WHERE hosts.host_name=p_host_name) INTO v_authorized;

	RETURN v_authorized;
END
$$ LANGUAGE plpgsql;