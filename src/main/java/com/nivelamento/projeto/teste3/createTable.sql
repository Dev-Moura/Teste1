CREATE TABLE demonstrativos_contabeis (
    data TEXT,
    cd_conta_contabil VARCHAR(255),
    cd_operadora VARCHAR(255),
    ds_conta_contabil VARCHAR(255),
    vl_saldo_final VARCHAR(255),
    vl_saldo_anterior VARCHAR(255)
);

CREATE TABLE operadoras_ativas (
    registro_ans INTEGER PRIMARY KEY,
    cnpj VARCHAR(255),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(255),
    logradouro VARCHAR(255),
    numero VARCHAR(255),
    complemento VARCHAR(255),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    uf VARCHAR(255),
    cep VARCHAR(255),
    ddd VARCHAR(255),
    telefone VARCHAR(255),
    fax VARCHAR(255),
    email VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(255),
    regiao_de_comercializacao VARCHAR(255),
    data_registro_ans DATE
);