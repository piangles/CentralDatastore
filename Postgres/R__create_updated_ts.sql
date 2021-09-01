CREATE OR REPLACE FUNCTION public.update_updated_ts() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_ts = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';
