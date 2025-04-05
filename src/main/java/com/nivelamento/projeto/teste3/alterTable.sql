ALTER TABLE demonstrativos_contabeis 
ADD COLUMN vl_saldo_final_num DOUBLE PRECISION,
ADD COLUMN vl_saldo_anterior_num DOUBLE PRECISION;


UPDATE demonstrativos_contabeis
SET 
    vl_saldo_final_num = REPLACE(REPLACE(vl_saldo_final, '.', ''), ',', '.')::DOUBLE PRECISION,
    vl_saldo_anterior_num = REPLACE(REPLACE(vl_saldo_anterior, '.', ''), ',', '.')::DOUBLE PRECISION;


ALTER TABLE demonstrativos_contabeis 
DROP COLUMN vl_saldo_final,
DROP COLUMN vl_saldo_anterior;


ALTER TABLE demonstrativos_contabeis 
RENAME COLUMN vl_saldo_final_num TO vl_saldo_final,
RENAME COLUMN vl_saldo_anterior_num TO vl_saldo_anterior;