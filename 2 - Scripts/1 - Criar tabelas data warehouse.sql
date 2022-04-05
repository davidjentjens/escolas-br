
CREATE TABLE dim_data (
				sk_ano INTEGER PRIMARY KEY,
                nk_ano CHAR(4) NOT NULL,
                etl_dtInicio DATE NOT NULL,
                etl_dtFim DATE NOT NULL,
                etl_versao INTEGER NOT NULL
);

CREATE TABLE dim_local (
				sk_municipio INTEGER PRIMARY KEY,
                nk_municipio CHAR(7) NOT NULL,
                estado VARCHAR(50) NOT NULL,
                nome_municipio VARCHAR(80) NOT NULL,
                regiao VARCHAR(15) NOT NULL,
                etl_dtInicio DATE NOT NULL,
                etl_dtFim DATE NOT NULL,
                etl_versao INTEGER NOT NULL
);

CREATE TABLE dim_adm (
				sk_adm INTEGER PRIMARY KEY,
                nk_adm CHAR(6) NOT NULL,
                local VARCHAR(10) NOT NULL,
                dep_administrativa VARCHAR(10) NOT NULL,
                etl_dtInicio DATE NOT NULL,
				etl_dtFim DATE NOT NULL,                
				etl_versao INTEGER NOT NULL
);

CREATE TABLE ft_matricula (
                sk_adm INTEGER NOT NULL,
                sk_ano INTEGER NOT NULL,
                sk_municipio INTEGER NOT NULL,
                qtd_matriculas INTEGER NOT NULL,
                populacao INTEGER NOT NULL,
				FOREIGN KEY (sk_ano) REFERENCES dim_data (sk_ano),
				FOREIGN KEY (sk_municipio)REFERENCES dim_local (sk_municipio),
				FOREIGN KEY (sk_adm) REFERENCES dim_adm (sk_adm)
);

INSERT INTO dim_data VALUES (0,'N/A','1900-01-01','2199-12-31',0);
INSERT INTO dim_local VALUES (0,'N/A','N/A','N/A','N/A','1900-01-01','2199-12-31',0);
INSERT INTO dim_adm VALUES (0,'N/A','N/A','N/A','1900-01-01','2199-12-31',0);