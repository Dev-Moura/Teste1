
COPY demonstrativos_contabeis(data, cd_conta_contabil, cd_operadora, ds_conta_contabil, vl_saldo_final, vl_saldo_anterior)
FROM 'C:\Users\micha\Desktop\projetodba\1T2024.csv'
WITH (FORMAT csv, DELIMITER ';', HEADER true);

COPY demonstrativos_contabeis(data, cd_conta_contabil, cd_operadora, ds_conta_contabil, vl_saldo_final, vl_saldo_anterior)
FROM 'C:\Users\micha\Desktop\projetodba\2T2024.csv'
WITH (FORMAT csv, DELIMITER ';', HEADER true);

COPY demonstrativos_contabeis(data, cd_conta_contabil, cd_operadora, ds_conta_contabil, vl_saldo_final, vl_saldo_anterior)
FROM 'C:\Users\micha\Desktop\projetodba\3T2024.csv'
WITH (FORMAT csv, DELIMITER ';', HEADER true);

COPY demonstrativos_contabeis(data, cd_conta_contabil, cd_operadora, ds_conta_contabil, vl_saldo_final, vl_saldo_anterior)
FROM 'C:\Users\micha\Desktop\projetodba\4T2024.csv'
WITH (FORMAT csv, DELIMITER ';', HEADER true);

COPY operadoras_ativas
FROM 'C:\Users\micha\Desktop\projetodba\Relatorio_cadop.csv'
WITH (FORMAT csv, DELIMITER ';', HEADER true);