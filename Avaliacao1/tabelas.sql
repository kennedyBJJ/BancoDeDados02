CREATE TABLE tb_pessoa(
	
	idPessoa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	dataNasc DATE NOT NULL,
	salario NUMERIC(7,2) NOT NULL,
	status SMALLINT
);

CREATE TABLE tb_tecnico(
	
	idPessoa_FK INTEGER PRIMARY KEY NOT NULL,
	anosExp FLOAT,
	FOREIGN KEY(idPessoa_FK) REFERENCES tb_pessoa(idPessoa)
);

CREATE TABLE tb_cor(
	
	idCor INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	cor VARCHAR(50) 
);

CREATE TABLE tb_time(

	idTime INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	nomeTime VARCHAR(100) NOT NULL,
	dataFundacao DATE NOT NULL,
	idTecnico_FK INTEGER,
	FOREIGN KEY(idTecnico_FK) REFERENCES tb_tecnico(idPessoa_FK)
);

CREATE TABLE tb_jogador(

	idPessoa_FK INTEGER PRIMARY KEY NOT NULL,
	nomeCamisa VARCHAR(60),
	golsCarreira INTEGER NOT NULL DEFAULT 0,
	bonus NUMERIC(7,2) NOT NULL DEFAULT 0,
	idTime_FK INTEGER NOT NULL,
	FOREIGN KEY(idPessoa_FK) REFERENCES tb_pessoa(idPessoa),
	FOREIGN KEY(idTime_FK) REFERENCES tb_time(idTime)
);

CREATE TABLE tb_timeCor(

	idTime_FK INTEGER NOT NULL,
	idCor_FK INTEGER NOT NULL,
	PRIMARY KEY(idTime_FK, idCor_FK)
	FOREIGN KEY(idTime_FK) REFERENCES tb_time(idTime),
	FOREIGN KEY(idCor_FK) REFERENCES tb_cor(idCor)
);

CREATE TABLE tb_campeonato(

	idCampeonato INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	nomeCamp VARCHAR(80) NOT NULL,
	dataInicio DATE NOT NULL,
	dataFim DATE,
	idVencedor_FK INTEGER ,
	FOREIGN KEY(idVencedor_FK) REFERENCES tb_time(idTime)
);
 
CREATE TABLE tb_disputa (

	idTime_FK INTEGER NOT NULL,
	idCampeonato_FK INTEGER NOT NULL,
	PRIMARY KEY(idTime_FK,idCampeonato_FK),
	FOREIGN KEY(idTime_FK) REFERENCES tb_time(idTime),
	FOREIGN KEY(idCampeonato_FK) REFERENCES tb_campeonato(idCampeonato)
	
);

CREATE TABLE tb_jogo(

	idJogo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	dataJogo DATE NOT NULL,
	horario TIME,
	estadio VARCHAR(80) NOT NULL,
	publicoPagante INTEGER NOT NULL DEFAULT 0,
	resultado INTEGER DEFAULT 0 NOT NULL,
	idTimeCasa_FK INTEGER NOT NULL,
	idTimeVisita_FK INTEGER NOT NULL,
	idCampeonato_FK INTEGER NOT NULL,
	FOREIGN KEY(idTimeCasa_FK) REFERENCES tb_time(idTime),
	FOREIGN KEY(idTimeVisita_FK) REFERENCES tb_time(idTime),
	FOREIGN KEY(idCampeonato_FK) REFERENCES tb_campeonato(idCampeonato)
);

CREATE TABLE tb_escalacao(
	
	idJogo_FK INTEGER NOT NULL,
	idPessoa_FK INTEGER NOT NULL,
	idTime_FK INTEGER NOT NULL,
	gols INTEGER DEFAULT 0,
	PRIMARY KEY(idTime_FK, idPessoa_FK, idJogo_FK),
	FOREIGN KEY(idJogo_FK) REFERENCES tb_jogo(idJogo),
	FOREIGN KEY(idPessoa_FK) REFERENCES tb_jogador(idPessoa_FK),
	FOREIGN KEY(idTime_FK) REFERENCES tb_time(idTime)
);

