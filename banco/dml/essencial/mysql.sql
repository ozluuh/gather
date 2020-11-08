-- T_GTR_DEPARTAMENTO
INSERT INTO `gather`.`t_gtr_departamento` (nm_departamento, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES ('Infraestrutura',TIMESTAMP'2020-10-31 02:20:37.0',TIMESTAMP'2020-11-02 09:41:58.0',NULL);

-- T_GTR_FUNCIONARIO
INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (1,'84335094388','Admin','email@administrador.com.br','admin',1,0,TIMESTAMP'2020-10-31 02:20:37.0',TIMESTAMP'2020-10-31 02:39:05.0',NULL,'ADM');
