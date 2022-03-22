CREATE TABLE inep (
    cod_municipio VARCHAR(8),
    ano VARCHAR(4),
    dependencia_adm VARCHAR(10),
    localizacao VARCHAR(10),
    qtd_matriculas INTEGER
);

CREATE TABLE ibge (
  ano VARCHAR(4),
  cod_municipio VARCHAR(8),
  nome_municipio VARCHAR(100),
  populacao INTEGER
);