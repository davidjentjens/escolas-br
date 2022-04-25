
CREATE TABLE public.dim_data (
                sk_ano INTEGER NOT NULL,
                nk_ano CHAR(4) NOT NULL,
                etl_dtInicio DATE NOT NULL,
                etl_dtFim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_data PRIMARY KEY (sk_ano)
);


CREATE SEQUENCE public.dim_local_sk_municipio_seq;

CREATE TABLE public.dim_local (
                sk_municipio INTEGER NOT NULL DEFAULT nextval('public.dim_local_sk_municipio_seq'),
                nk_municipio CHAR(7) NOT NULL,
                estado VARCHAR(50) NOT NULL,
                nome_municipio VARCHAR(80) NOT NULL,
                regiao VARCHAR(15) NOT NULL,
                etl_dtInicio DATE NOT NULL,
                etl_dtFim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_municipio PRIMARY KEY (sk_municipio)
);


ALTER SEQUENCE public.dim_local_sk_municipio_seq OWNED BY public.dim_local.sk_municipio;

CREATE SEQUENCE public.dim_adm_sk_adm_seq;

CREATE TABLE public.dim_adm (
                sk_adm INTEGER NOT NULL DEFAULT nextval('public.dim_adm_sk_adm_seq'),
                nk_adm CHAR(6) NOT NULL,
                local VARCHAR(10) NOT NULL,
                dep_administrativa VARCHAR(10) NOT NULL,
                etl_dtFim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dtInicio DATE NOT NULL,
                CONSTRAINT sk_adm PRIMARY KEY (sk_adm)
);


ALTER SEQUENCE public.dim_adm_sk_adm_seq OWNED BY public.dim_adm.sk_adm;

CREATE TABLE public.ft_matricula (
                sk_adm INTEGER NOT NULL,
                sk_ano INTEGER NOT NULL,
                sk_municipio INTEGER NOT NULL,
                qtd_matriculas INTEGER NOT NULL,
                populacao INTEGER NOT NULL
);


ALTER TABLE public.ft_matricula ADD CONSTRAINT dim_data_ft_matricula_fk
FOREIGN KEY (sk_ano)
REFERENCES public.dim_data (sk_ano)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_matricula ADD CONSTRAINT dim_regiao_ft_matricula_fk
FOREIGN KEY (sk_municipio)
REFERENCES public.dim_local (sk_municipio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_matricula ADD CONSTRAINT dim_educacao_ft_matricula_fk
FOREIGN KEY (sk_adm)
REFERENCES public.dim_adm (sk_adm)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;