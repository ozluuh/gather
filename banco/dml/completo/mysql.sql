-- T_GTR_DEPARTAMENTO
INSERT INTO `gather`.`t_gtr_departamento` (nm_departamento, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES ('Infraestrutura',TIMESTAMP'2020-10-31 02:20:37.0',TIMESTAMP'2020-11-02 09:41:58.0',NULL);

INSERT INTO t_gtr_departamento (nm_departamento, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES ('Financeiro',TIMESTAMP'2020-10-31 10:20:14.0',NULL,NULL);

INSERT INTO t_gtr_departamento (nm_departamento, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES ('Desenvolvimento',TIMESTAMP'2020-10-31 12:23:17.0',NULL,NULL);

INSERT INTO t_gtr_departamento (nm_departamento, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES ('Publicidade ',TIMESTAMP'2020-11-01 21:21:35.0',NULL,NULL);

-- T_GTR_FUNCIONARIO
INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (1,'84335094388','Admin','email@administrador.com.br','admin',1,0,TIMESTAMP'2020-10-31 02:20:37.0',TIMESTAMP'2020-10-31 02:39:05.0',NULL,'ADM');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (1,'52139609441','Cauê Erick Fábio Sales','ddanielpietroruanrezende@rizan.com.br','123',1,0,TIMESTAMP'2020-10-31 02:20:37.0',TIMESTAMP'2020-10-31 10:19:51.0',NULL,'ADM');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (2,'12345678912','Maria Rosa','mariarosa@gmail.com','123',1,0,TIMESTAMP'2020-10-31 10:20:41.0',TIMESTAMP'2020-11-01 20:19:20.0',NULL,'GST');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (3,'16649944084','Geraldo Samuel da Silva','geraldo_samuel_dasilva_@anfip.org.br','master',1,0,TIMESTAMP'2020-10-31 20:32:29.0',TIMESTAMP'2020-11-02 07:25:43.0',NULL,'GST');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (2,'12345678999','Mendonça mendes','mendoncamendes@gmail.com','123',1,0,TIMESTAMP'2020-11-01 20:20:48.0',TIMESTAMP'2020-11-02 10:42:41.0',NULL,'FNC');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (2,'23865875901','joanna fehrer','joanna@gmail.com','123',1,1,TIMESTAMP'2020-11-01 21:03:00.0',NULL,NULL,'FNC');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (4,'23865748503','Marcos Santos','marcos@gmail.com','123',1,0,TIMESTAMP'2020-11-01 21:22:30.0',TIMESTAMP'2020-11-01 21:59:09.0',NULL,'GST');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (4,'23745985204','Rosana Weber','rosana@gmail.com','123',1,0,TIMESTAMP'2020-11-01 21:23:04.0',TIMESTAMP'2020-11-02 11:17:42.0',NULL,'FNC');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (4,'12365485204','Amanda mendes','amanda@gmail.com','123',1,0,TIMESTAMP'2020-11-01 21:23:39.0',TIMESTAMP'2020-11-02 11:18:37.0',NULL,'FNC');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (3,'45052050704','Isabelle Tereza Farias','iisabelleterezafarias@ecotransambiental.com.br','123',1,1,TIMESTAMP'2020-11-02 07:36:26.0',NULL,NULL,'FNC');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (3,'45052937000149','Thales Isaac Moraes','thalesisaacmoraes-80@rizan.com.br','123',1,1,TIMESTAMP'2020-11-02 07:38:46.0',NULL,NULL,'FNC');

INSERT INTO `gather`.`t_gtr_funcionario` (id_departamento, nr_cpf_cnpj, nm_funcionario, ds_email, ds_senha, in_ativo, st_primeiro_acesso, dt_criacao, dt_atualizacao, dt_exclusao, id_acesso)
VALUES (3,'22329644850','Amanda Isabel Oliveira','aamandaisabeloliveira@damataemporionatural.com.br','master',1,0,TIMESTAMP'2020-11-02 08:01:10.0',TIMESTAMP'2020-11-02 08:20:51.0',NULL,'FNC');

-- T_GTR_REUNIAO
INSERT INTO t_gtr_reuniao (id_gestor, ds_reuniao, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (3,'Reunião Outubro 2020','C',TIMESTAMP'2020-11-01 21:12:22.0',TIMESTAMP'2020-11-02 10:43:56.0',NULL);

INSERT INTO t_gtr_reuniao (id_gestor, ds_reuniao, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (3,'Reunião Outubro 2020','P',TIMESTAMP'2020-11-01 21:12:23.0',NULL,NULL);

INSERT INTO t_gtr_reuniao (id_gestor, ds_reuniao, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (4,'Correção relatórios','P',TIMESTAMP'2020-11-02 07:56:48.0',NULL,NULL);

INSERT INTO t_gtr_reuniao (id_gestor, ds_reuniao, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (4,'Correção Dashboard','P',TIMESTAMP'2020-11-02 08:08:45.0',NULL,NULL);

INSERT INTO t_gtr_reuniao (id_gestor, ds_reuniao, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (7,'Brandings ','C',TIMESTAMP'2020-11-02 11:17:18.0',TIMESTAMP'2020-11-02 11:20:29.0',NULL);

INSERT INTO t_gtr_reuniao (id_gestor, ds_reuniao, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (7,'Brandings ','C',TIMESTAMP'2020-11-02 11:17:59.0',TIMESTAMP'2020-11-02 11:23:16.0',NULL);

-- T_GTR_TAREFA
INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (5,1,'Despesas de outubro','Dar baixa nas despesas de outubro','C',TIMESTAMP'2020-11-01 21:12:22.0',TIMESTAMP'2020-11-02 10:42:48.0',NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (6,2,'Revisar despesas ','Revisar despesas de setembro','P',TIMESTAMP'2020-11-01 21:12:23.0',NULL,NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (6,2,'Dar baixa nas despesas de janeiro','A tarefa é para dar baixa nas contas de janeiro','P',TIMESTAMP'2020-11-01 21:12:23.0',NULL,NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (10,3,'Relatório de vendas','Apresenta divergência nos totalizadores de vendas funcionários ao mês.','P',TIMESTAMP'2020-11-02 07:57:25.0',NULL,NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (10,4,'Exibição dos gráficos','Não estão sendo apresentados para o cliente e, quando apresentam, os dados vem em branco. Cliente tem urgência nessa ocorrência.','P',TIMESTAMP'2020-11-02 08:08:58.0',NULL,NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (10,4,'Relatório da Dashboard','Relatório não está apresentando o título e os campos são informados como ''COLUMN NOT VALID''','P',TIMESTAMP'2020-11-02 08:09:13.0',NULL,NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (11,4,'Criação de gráficos - Donut','Cliente solicitou orçamento para a criação de um gráfico Donut sobre a gestão da carteira. Deve conter informações como lançamentos em abertos, liquidados.','P',TIMESTAMP'2020-11-02 08:09:25.0',NULL,NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (12,4,'Criar opção para desabilitar notificação persistente',NULL,'P',TIMESTAMP'2020-11-02 08:09:32.0',NULL,NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (8,5,'Brandings de janeiro','Brandings de janeiro','C',TIMESTAMP'2020-11-02 11:17:18.0',TIMESTAMP'2020-11-02 11:17:54.0',NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (8,5,'Brandings de fevereiro','Brandings de fevereiro','C',TIMESTAMP'2020-11-02 11:17:18.0',TIMESTAMP'2020-11-02 11:17:54.0',NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (9,5,'Brandings de março','Brandings de março','C',TIMESTAMP'2020-11-02 11:17:18.0',TIMESTAMP'2020-11-02 11:18:41.0',NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (8,6,'Brandings de janeiro','Brandings de janeiro','C',TIMESTAMP'2020-11-02 11:17:59.0',TIMESTAMP'2020-11-02 11:23:08.0',NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (8,6,'Brandings de fevereiro','Brandings de fevereiro','C',TIMESTAMP'2020-11-02 11:17:59.0',TIMESTAMP'2020-11-02 11:23:08.0',NULL);

INSERT INTO t_gtr_tarefa (id_funcionario, id_reuniao, ds_tarefa, ob_tarefa, in_status, dt_criacao, dt_atualizacao, dt_exclusao)
VALUES (9,6,'Brandings de março','Brandings de março','C',TIMESTAMP'2020-11-02 11:17:59.0',TIMESTAMP'2020-11-02 11:18:47.0',NULL);
