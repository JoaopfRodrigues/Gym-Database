CREATE OR REPLACE PROCEDURE update_entrada
AS
BEGIN
  update socios
  set entrada = 0
  where data_term < SYSDATE
END;
