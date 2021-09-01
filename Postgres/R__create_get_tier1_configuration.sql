DROP FUNCTION IF EXISTS central.get_tier1_configuration;

CREATE FUNCTION central.get_tier1_configuration 
(
	IN p_host_name VARCHAR(255),
	IN p_pervice_name VARCHAR(255)
) 
RETURNS TABLE (name VARCHAR(250), value VARCHAR(1000))
AS $$
	DECLARE v_environment VARCHAR(3);
BEGIN
    
	SELECT hosts.environment INTO v_environment FROM central.hosts hosts WHERE hosts.host_name=p_host_name;

	--call DebugLog(Environment);
	RETURN QUERY
    SELECT tier1_config.name, tier1_config.value FROM central.tier1_configuration tier1_config 
    WHERE 
    tier1_config.environment = v_environment and tier1_config.service_name = p_service_name;
END
$$ LANGUAGE plpgsql;