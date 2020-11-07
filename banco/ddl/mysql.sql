-- DROP TABLE gather.t_gtr_departamento CASCADE;

-- DROP TABLE gather.t_gtr_funcionario CASCADE;

-- DROP TABLE gather.t_gtr_reuniao CASCADE;

-- DROP TABLE gather.t_gtr_tarefa CASCADE;

CREATE TABLE `t_gtr_departamento` (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nm_departamento` varchar(30) NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `dt_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `un_gtr_departamento` (`nm_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t_gtr_funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `id_departamento` int NOT NULL,
  `id_acesso` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nr_cpf_cnpj` varchar(14) NOT NULL,
  `nm_funcionario` varchar(60) NOT NULL,
  `ds_email` varchar(120) NOT NULL,
  `ds_senha` varchar(20) NOT NULL,
  `in_ativo` tinyint NOT NULL DEFAULT '1',
  `st_primeiro_acesso` tinyint NOT NULL DEFAULT '1',
  `dt_criacao` datetime NOT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `dt_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `un_gtr_funcionario_cfp_cnpj` (`nr_cpf_cnpj`),
  KEY `fk_gtr_acesso_funcionario` (`id_acesso`),
  KEY `fk_gtr_depto_funcionario` (`id_departamento`),
  CONSTRAINT `fk_gtr_depto_funcionario` FOREIGN KEY (`id_departamento`) REFERENCES `t_gtr_departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t_gtr_reuniao` (
  `id_reuniao` int NOT NULL AUTO_INCREMENT,
  `id_gestor` int NOT NULL,
  `ds_reuniao` varchar(120) NOT NULL,
  `in_status` char(1) NOT NULL DEFAULT 'P',
  `dt_criacao` datetime NOT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `dt_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reuniao`),
  KEY `fk_gtr_funcionario_reuniao` (`id_gestor`),
  CONSTRAINT `fk_gtr_funcionario_reuniao` FOREIGN KEY (`id_gestor`) REFERENCES `t_gtr_funcionario` (`id_funcionario`),
  CONSTRAINT `t_gtr_reuniao_CHECK` CHECK ((`in_status` in (_utf8mb4'C',_utf8mb4'P')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t_gtr_tarefa` (
  `id_tarefa` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int NOT NULL,
  `id_reuniao` int NOT NULL,
  `ds_tarefa` varchar(120) NOT NULL,
  `ob_tarefa` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `in_status` char(1) NOT NULL DEFAULT 'P',
  `dt_criacao` datetime NOT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `dt_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tarefa`,`id_funcionario`),
  KEY `fk_gtr_funcionario_tarefa` (`id_funcionario`),
  KEY `fk_gtr_reuniao_tarefa` (`id_reuniao`),
  CONSTRAINT `fk_gtr_funcionario_tarefa` FOREIGN KEY (`id_funcionario`) REFERENCES `t_gtr_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_gtr_reuniao_tarefa` FOREIGN KEY (`id_reuniao`) REFERENCES `t_gtr_reuniao` (`id_reuniao`),
  CONSTRAINT `t_gtr_tarefa_CHECK` CHECK ((`in_status` in (_utf8mb4'C',_utf8mb4'P')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;