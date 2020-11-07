-- DROP TABLE t_gtr_departamento CASCADE CONSTRAINTS;

-- DROP TABLE t_gtr_funcionario CASCADE CONSTRAINTS;

-- DROP TABLE t_gtr_reuniao CASCADE CONSTRAINTS;

-- DROP TABLE t_gtr_tarefa CASCADE CONSTRAINTS;

-- DROP SEQUENCE sq_gtr_departamento;

-- DROP SEQUENCE sq_gtr_funcionario;

-- DROP SEQUENCE sq_gtr_reuniao;

-- DROP SEQUENCE sq_gtr_tarefa;

CREATE TABLE t_gtr_departamento (
    id_departamento  NUMBER(5) NOT NULL,
    nm_departamento  VARCHAR2(30) NOT NULL,
    dt_criacao       DATE NOT NULL,
    dt_atualizacao   DATE,
    dt_exclusao      DATE
);

ALTER TABLE t_gtr_departamento ADD CONSTRAINT pk_gtr_departamento PRIMARY KEY ( id_departamento );

ALTER TABLE t_gtr_departamento ADD CONSTRAINT un_gtr_departamento_nome UNIQUE ( nm_departamento );

CREATE TABLE t_gtr_funcionario (
    id_funcionario      NUMBER(8) NOT NULL,
    id_departamento     NUMBER(5) NOT NULL,
    id_acesso           CHAR(3) NOT NULL,
    nr_cpf_cnpj         VARCHAR2(15) NOT NULL,
    nm_funcionario      VARCHAR2(60) NOT NULL,
    ds_email            VARCHAR2(120) NOT NULL,
    ds_senha            VARCHAR2(20) NOT NULL,
    in_ativo            NUMBER(1) DEFAULT 1 NOT NULL,
    st_primeiro_acesso  NUMBER(1) DEFAULT 1 NOT NULL,
    dt_criacao          DATE NOT NULL,
    dt_atualizacao      DATE,
    dt_exclusao         DATE
);

ALTER TABLE t_gtr_funcionario
    ADD CHECK ( in_ativo IN ( 0, 1 ) );

ALTER TABLE t_gtr_funcionario
    ADD CHECK ( st_primeiro_acesso IN ( 0, 1 ) );

ALTER TABLE t_gtr_funcionario ADD CONSTRAINT pk_gtr_funcionario PRIMARY KEY ( id_funcionario );

ALTER TABLE t_gtr_funcionario ADD CONSTRAINT un_gtr_funcionario_cpf_cnpj UNIQUE ( nr_cpf_cnpj );

CREATE TABLE t_gtr_reuniao (
    id_reuniao      NUMBER(7) NOT NULL,
    id_gestor       NUMBER(8) NOT NULL,
    ds_reuniao      VARCHAR2(120) NOT NULL,
    in_status       CHAR(1) DEFAULT 'P' NOT NULL,
    dt_criacao      DATE NOT NULL,
    dt_atualizacao  DATE,
    dt_exclusao     DATE
);

ALTER TABLE t_gtr_reuniao
    ADD CHECK ( in_status IN ( 'C', 'P' ) );

ALTER TABLE t_gtr_reuniao ADD CONSTRAINT pk_gtr_reuniao PRIMARY KEY ( id_reuniao );

CREATE TABLE t_gtr_tarefa (
    id_tarefa       NUMBER(8) NOT NULL,
    id_funcionario  NUMBER(8) NOT NULL,
    id_reuniao      NUMBER(7) NOT NULL,
    ds_tarefa       VARCHAR2(120) NOT NULL,
    ob_tarefa       VARCHAR2(400),
    in_status       CHAR(1) DEFAULT 'P' NOT NULL,
    dt_criacao      DATE NOT NULL,
    dt_atualizacao  DATE,
    dt_exclusao     DATE
);

ALTER TABLE t_gtr_tarefa
    ADD CHECK ( in_status IN ( 'C', 'P' ) );

ALTER TABLE t_gtr_tarefa ADD CONSTRAINT pk_gtr_tarefa PRIMARY KEY ( id_tarefa,
                                                                    id_funcionario );

ALTER TABLE t_gtr_funcionario
    ADD CONSTRAINT fk_gtr_depto_funcionario FOREIGN KEY ( id_departamento )
        REFERENCES t_gtr_departamento ( id_departamento );

ALTER TABLE t_gtr_reuniao
    ADD CONSTRAINT fk_gtr_funcionario_reuniao FOREIGN KEY ( id_gestor )
        REFERENCES t_gtr_funcionario ( id_funcionario );

ALTER TABLE t_gtr_tarefa
    ADD CONSTRAINT fk_gtr_funcionario_tarefa FOREIGN KEY ( id_funcionario )
        REFERENCES t_gtr_funcionario ( id_funcionario );

ALTER TABLE t_gtr_tarefa
    ADD CONSTRAINT fk_gtr_reuniao_tarefa FOREIGN KEY ( id_reuniao )
        REFERENCES t_gtr_reuniao ( id_reuniao );

CREATE SEQUENCE sq_gtr_departamento START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE sq_gtr_funcionario START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE sq_gtr_reuniao START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE sq_gtr_tarefa START WITH 1 NOCACHE ORDER;