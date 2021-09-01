CREATE OR REPLACE FUNCTION public.update_updated_ts() 
RETURNS TRIGGER AS $$
BEGIN
    RETURN NEW; 
END;
$$ LANGUAGE 'plpgsql';
