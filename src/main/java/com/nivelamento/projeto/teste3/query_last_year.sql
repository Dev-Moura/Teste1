SELECT 
    d.cd_operadora AS reg_ans,
    o.razao_social,
    SUM(d.vl_saldo_final::DOUBLE PRECISION) AS despesa_total_2024
FROM demonstrativos_contabeis d
JOIN operadoras_ativas o 
    ON d.cd_operadora::INTEGER = o.registro_ans
WHERE 
    d.ds_conta_contabil ILIKE 'EVENTOS%' 
    AND d.ds_conta_contabil ILIKE '%HOSPITALAR  '
    AND d.data BETWEEN DATE '2024-01-01' AND DATE '2024-12-31'
    AND d.vl_saldo_final::DOUBLE PRECISION < 0
GROUP BY d.cd_operadora, o.razao_social
ORDER BY despesa_total_2024
LIMIT 10;