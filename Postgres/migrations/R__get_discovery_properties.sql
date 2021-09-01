DROP FUNCTION IF EXISTS central.get_discovery_properties;

CREATE FUNCTION central.get_discovery_properties 
(
	IN p_host_name VARCHAR(255),
	IN p_service_name VARCHAR(255)
) 
RETURNS TABLE (name VARCHAR(250), value VARCHAR(1000))
AS $$
	DECLARE v_environment VARCHAR(3);
BEGIN
    
	--Check if the Host is authorized need a separate point or return value.
	SELECT hosts.environment INTO v_environment FROM central.hosts hosts WHERE hosts.host_name=p_host_name;

	--call DebugLog(Environment);
	
	--If Properties are not set handle it.
    RETURN QUERY 
    	SELECT discovery.name, discovery.value 
    	FROM central.discovery discovery 
    	WHERE 
    		discovery.environment = v_environment and discovery.service_name = p_service_name;
END
$$ LANGUAGE plpgsql;
