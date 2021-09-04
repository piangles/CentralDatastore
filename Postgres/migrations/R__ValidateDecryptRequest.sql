--DIFFERENT ISSUE
DROP FUNCTION IF EXISTS Central.ValidateDecryptRequest;

CREATE FUNCTION Central.ValidateDecryptRequest 
(
	IN pHostName VARCHAR(255),
	IN pServiceName VARCHAR(255),
	IN pEncryptedCategory VARCHAR(255), --Is it some Discovery Property or Config Property
	IN pEncryptedValueName VARCHAR(255),
	IN pEncryptedValue VARCHAR(255),
	IN pCipherAuthorizationIdName VARCHAR(255),
	IN pCipherAuthorizationId VARCHAR(255),
	OUT RowCount INT
) 
AS $$
	DECLARE 
		vEncryptedRowCount INT;
		vCipherRowCount INT;
		vEnvironment VARCHAR(3);

BEGIN
	SELECT hosts.Environment into vEnvironment FROM Central.Hosts hosts WHERE hosts.HostName=pHostName;

	--call DebugLog(Environment);
	IF pEncryptedCategory = 'Discovery' THEN
		SELECT COUNT(*) INTO vEncryptedRowCount FROM Central.Discovery discovery  WHERE 
		discovery.Environment = vEnvironment and 
		discovery.Service_Name = pServiceName and
		discovery.Name = pEncryptedValueName and
		discovery.Value = pEncryptedValue;

		SELECT COUNT(*) INTO vCipherRowCount FROM Central.Discovery discovery  WHERE 
		discovery.Environment = vEnvironment and 
		discovery.Service_Name = pServiceName and
		discovery.Name = pCipherAuthorizationIdName and
		discovery.Value = pCipherAuthorizationId;
		
		RowCount := vEncryptedRowCount + vCipherRowCount;
    ELSEIF pEncryptedCategory = 'Configuration' THEN
    	SELECT COUNT(*) INTO vEncryptedRowCount FROM Central.Tier1_Configuration tier1Config WHERE 
		tier1Config.Environment = vEnvironment and 
		tier1Config.Service_Name = pServiceName and    	
		tier1Config.Name = pEncryptedValueName and
		tier1Config.Value = pEncryptedValue;
		
		SELECT COUNT(*) INTO vCipherRowCount FROM Central.Tier1_Configuration tier1Config WHERE 
		tier1Config.Environment = vEnvironment and 
		tier1Config.Service_Name = pServiceName and
		tier1Config.Name = pCipherAuthorizationIdName and
		tier1Config.Value = pCipherAuthorizationId;
		
    	RowCount := vEncryptedRowCount + vCipherRowCount;
	END IF;
	
END
$$ LANGUAGE plpgsql;
