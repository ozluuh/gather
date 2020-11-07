-- T_GTR_DEPARTAMENTO
INSERT INTO T_GTR_DEPARTAMENTO (ID_DEPARTAMENTO,NM_DEPARTAMENTO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_DEPARTAMENTO.NEXTVAL,'Infraestrutura',TO_DATE('2020-10-31 02:20:37.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 09:41:58.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_DEPARTAMENTO (ID_DEPARTAMENTO,NM_DEPARTAMENTO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_DEPARTAMENTO.NEXTVAL,'Financeiro',TO_DATE('2020-10-31 10:20:14.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_DEPARTAMENTO (ID_DEPARTAMENTO,NM_DEPARTAMENTO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_DEPARTAMENTO.NEXTVAL,'Desenvolvimento',TO_DATE('2020-10-31 12:23:17.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_DEPARTAMENTO (ID_DEPARTAMENTO,NM_DEPARTAMENTO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_DEPARTAMENTO.NEXTVAL,'Publicidade ',TO_DATE('2020-11-01 21:21:35.0', 'YYYY-MM-DD'),NULL,NULL);

-- T_GTR_FUNCIONARIO
INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,1,'84335094388','Luís Paulino','email@administrador.com.br','master',1,0,TO_DATE('2020-10-31 02:20:37.0', 'YYYY-MM-DD'),TO_DATE('2020-10-31 02:39:05.0', 'YYYY-MM-DD'),NULL,'ADM');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,1,'52139609441','Cauê Erick Fábio Sales','ddanielpietroruanrezende@rizan.com.br','123',1,0,TO_DATE('2020-10-31 02:20:37.0', 'YYYY-MM-DD'),TO_DATE('2020-10-31 10:19:51.0', 'YYYY-MM-DD'),NULL,'ADM');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,2,'12345678912','Maria Rosa','mariarosa@gmail.com','123',1,0,TO_DATE('2020-10-31 10:20:41.0', 'YYYY-MM-DD'),TO_DATE('2020-11-01 20:19:20.0', 'YYYY-MM-DD'),NULL,'GST');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,3,'16649944084','Geraldo Samuel da Silva','geraldo_samuel_dasilva_@anfip.org.br','master',1,0,TO_DATE('2020-10-31 20:32:29.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 07:25:43.0', 'YYYY-MM-DD'),NULL,'GST');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,2,'12345678999','Mendonça mendes','mendoncamendes@gmail.com','123',1,0,TO_DATE('2020-11-01 20:20:48.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 10:42:41.0', 'YYYY-MM-DD'),NULL,'FNC');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,2,'23865875901','joanna fehrer','joanna@gmail.com','123',1,1,TO_DATE('2020-11-01 21:03:00.0', 'YYYY-MM-DD'),NULL,NULL,'FNC');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,4,'23865748503','Marcos Santos','marcos@gmail.com','123',1,0,TO_DATE('2020-11-01 21:22:30.0', 'YYYY-MM-DD'),TO_DATE('2020-11-01 21:59:09.0', 'YYYY-MM-DD'),NULL,'GST');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,4,'23745985204','Rosana Weber','rosana@gmail.com','123',1,0,TO_DATE('2020-11-01 21:23:04.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:17:42.0', 'YYYY-MM-DD'),NULL,'FNC');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,4,'12365485204','Amanda mendes','amanda@gmail.com','123',1,0,TO_DATE('2020-11-01 21:23:39.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:18:37.0', 'YYYY-MM-DD'),NULL,'FNC');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,3,'45052050704','Isabelle Tereza Farias','iisabelleterezafarias@ecotransambiental.com.br','123',1,1,TO_DATE('2020-11-02 07:36:26.0', 'YYYY-MM-DD'),NULL,NULL,'FNC');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,3,'45052937000149','Thales Isaac Moraes','thalesisaacmoraes-80@rizan.com.br','123',1,1,TO_DATE('2020-11-02 07:38:46.0', 'YYYY-MM-DD'),NULL,NULL,'FNC');

INSERT INTO T_GTR_FUNCIONARIO (ID_FUNCIONARIO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO,ID_ACESSO)
VALUES (SQ_GTR_FUNCIONARIO.NEXTVAL,3,'22329644850','Amanda Isabel Oliveira','aamandaisabeloliveira@damataemporionatural.com.br','master',1,0,TO_DATE('2020-11-02 08:01:10.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 08:20:51.0', 'YYYY-MM-DD'),NULL,'FNC');

-- T_GTR_REUNIAO
INSERT INTO T_GTR_REUNIAO (ID_REUNIAO,ID_GESTOR,DS_REUNIAO,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_REUNIAO.NEXTVAL,3,'Reunião Outubro 2020','C',TO_DATE('2020-11-01 21:12:22.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 10:43:56.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_REUNIAO (ID_REUNIAO,ID_GESTOR,DS_REUNIAO,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_REUNIAO.NEXTVAL,3,'Reunião Outubro 2020','P',TO_DATE('2020-11-01 21:12:23.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_REUNIAO (ID_REUNIAO,ID_GESTOR,DS_REUNIAO,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_REUNIAO.NEXTVAL,4,'Correção relatórios','P',TO_DATE('2020-11-02 07:56:48.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_REUNIAO (ID_REUNIAO,ID_GESTOR,DS_REUNIAO,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_REUNIAO.NEXTVAL,4,'Correção Dashboard','P',TO_DATE('2020-11-02 08:08:45.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_REUNIAO (ID_REUNIAO,ID_GESTOR,DS_REUNIAO,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_REUNIAO.NEXTVAL,7,'Brandings ','C',TO_DATE('2020-11-02 11:17:18.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:20:29.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_REUNIAO (ID_REUNIAO,ID_GESTOR,DS_REUNIAO,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_REUNIAO.NEXTVAL,7,'Brandings ','C',TO_DATE('2020-11-02 11:17:59.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:23:16.0', 'YYYY-MM-DD'),NULL);

-- T_GTR_TAREFA
INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,5,1,'Despesas de outubro','Dar baixa nas despesas de outubro','C',TO_DATE('2020-11-01 21:12:22.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 10:42:48.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,6,2,'Revisar despesas ','Revisar despesas de setembro','P',TO_DATE('2020-11-01 21:12:23.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,6,2,'Dar baixa nas despesas de janeiro','A tarefa é para dar baixa nas contas de janeiro','P',TO_DATE('2020-11-01 21:12:23.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,10,3,'Relatório de vendas','Apresenta divergência nos totalizadores de vendas funcionários ao mês.','P',TO_DATE('2020-11-02 07:57:25.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,10,4,'Exibição dos gráficos','Não estão sendo apresentados para o cliente e, quando apresentam, os dados vem em branco. Cliente tem urgência nessa ocorrência.','P',TO_DATE('2020-11-02 08:08:58.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,10,4,'Relatório da Dashboard','Relatório não está apresentando o título e os campos são informados como ''COLUMN NOT VALID''','P',TO_DATE('2020-11-02 08:09:13.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,11,4,'Criação de gráficos - Donut','Cliente solicitou orçamento para a criação de um gráfico Donut sobre a gestão da carteira. Deve conter informações como lançamentos em abertos, liquidados.','P',TO_DATE('2020-11-02 08:09:25.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,12,4,'Criar opção para desabilitar notificação persistente',NULL,'P',TO_DATE('2020-11-02 08:09:32.0', 'YYYY-MM-DD'),NULL,NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,8,5,'Brandings de janeiro','Brandings de janeiro','C',TO_DATE('2020-11-02 11:17:18.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:17:54.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,8,5,'Brandings de fevereiro','Brandings de fevereiro','C',TO_DATE('2020-11-02 11:17:18.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:17:54.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,9,5,'Brandings de março','Brandings de março','C',TO_DATE('2020-11-02 11:17:18.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:18:41.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,8,6,'Brandings de janeiro','Brandings de janeiro','C',TO_DATE('2020-11-02 11:17:59.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:23:08.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,8,6,'Brandings de fevereiro','Brandings de fevereiro','C',TO_DATE('2020-11-02 11:17:59.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:23:08.0', 'YYYY-MM-DD'),NULL);

INSERT INTO T_GTR_TAREFA (ID_TAREFA,ID_FUNCIONARIO,ID_REUNIAO,DS_TAREFA,OB_TAREFA,IN_STATUS,DT_CRIACAO,DT_ATUALIZACAO,DT_EXCLUSAO)
VALUES (SQ_GTR_TAREFA.NEXTVAL,9,6,'Brandings de março','Brandings de março','C',TO_DATE('2020-11-02 11:17:59.0', 'YYYY-MM-DD'),TO_DATE('2020-11-02 11:18:47.0', 'YYYY-MM-DD'),NULL);