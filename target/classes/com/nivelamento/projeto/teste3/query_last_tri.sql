SELECT 
    d.cd_operadora,
    o.razao_social,
    SUM(d.vl_saldo_final::DOUBLE PRECISION) AS total_despesas
FROM demonstrativos_contabeis d
JOIN operadoras_ativas o 
    ON d.cd_operadora::INTEGER = o.registro_ans
WHERE 
    d.data = DATE '2024-10-01'
    AND d.ds_conta_contabil = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
GROUP BY d.cd_operadora, o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;