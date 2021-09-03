DROP FUNCTION IF EXISTS central.is_host_authorized;

CREATE FUNCTION central.is_host_authorized 
(
	IN p_hostname VARCHAR(255)
) 
RETURNS BOOLEAN
AS $$
DECLARE
  v_authorized BOOLEAN;
BEGIN

	SELECT EXISTS(SELECT 1 FROM central.hosts  WHERE hostname=p_hostname) INTO v_authorized;

	RETURN v_authorized;
END
$$ LANGUAGE plpgsql;
