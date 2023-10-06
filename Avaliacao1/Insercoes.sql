INSERT INTO tb_pessoa (nome, dataNasc, salario, status)
VALUES ("João Carlos", "02/10/1998", 2000.00, 1),
		("Mario Miranda", "12/01/1996", 3000.00, 1),
		("Marco Brito", "25/08/1999", 2500.00, 1),
		("José Roberto", "11/11/2000", 4000.00, 1),
		("Mateus Oliveira", "02/05/1997", 5000.00, 1),
		("Willian Kennedy", "02/10/2001", 2800.00, 1),
		("Jamil", "05/07/1998", 2300.00, 1),
		("Jonathan", "08/08/1998", 3000.00, 1),
		("Kaiky", "04/10/1998", 2400.00, 1),
		("Kaleu", "07/11/1997", 2500.00, 1),
		("Jeová", "04/05/1998", 2600.00, 1),
		("John", "03/02/1996", 2700.00, 1),
		("João Victor", "05/112/1998", 4000.00, 1),
		("Davi", "04/03/2000", 2700.00, 1),
		("Enzo", "02/10/2000", 4200.00, 1),
		("Miguel", "06/06/1998", 3000.00, 1),
		("Cristiano", "02/04/1996", 2900.00, 1),
		("Leandro", "29/10/1999", 3800.00, 1),
		("Leonardo", "18/07/1998", 4000.00, 1),
		("Pedro", "03/09/1995", 3900.00, 1),
		("Arthur", "17/01/1998", 2000.00, 1),
		("Joanderson", "01/01/2001", 2000.00, 1),
		("Peterson", "05/11/1999", 2000.00, 1),
		("Alisson", "02/10/1998", 2000.00, 1),
		("Hallison", "02/10/1998", 2000.00, 1),
		("Maria Silva", "15/03/1997", 2800.00, 1),
    	("Luiz Fernandes", "28/07/1995", 3200.00, 1),
	    ("Camila Santos", "20/11/1998", 2600.00, 1),
	    ("Rafaela Oliveira", "10/09/1996", 3500.00, 1),
	    ("Paulo Lima", "05/12/1997", 3100.00, 1),
	    ("Lucas Sousa", "02/04/1999", 2700.00, 1),
	    ("Aline Almeida", "08/06/2000", 3000.00, 1),
	    ("Gustavo Castro", "19/10/1994", 3300.00, 1),
	    ("Fernanda Rocha", "25/01/1998", 2900.00, 1),
	    ("Marcelo Costa", "14/08/1993", 3700.00, 1),
	    ("Bruno Pereira", "22/02/2001", 2500.00, 1),
	    ("Carolina Vieira", "30/07/1992", 3600.00, 1),
	    ("Samuel Carvalho", "11/05/1994", 3400.00, 1),
	    ("Bianca Ribeiro", "07/03/2002", 2300.00, 1),
	    ("Juliana Fernandes", "03/01/1990", 3800.00, 1),
	    ("Eduardo Oliveira", "19/09/1991", 4200.00, 1),
	    ("Thais Rodrigues", "26/06/1993", 4100.00, 1),
	    ("Amanda Gonçalves", "14/12/1996", 2700.00, 1),
	    ("Vitor Santos", "02/08/1990", 4000.00, 1),
	    ("Rodrigo Barbosa", "01/07/1993", 3500.00, 1),
	    ("Tatiana Lima", "30/04/1995", 3100.00, 1),
	    ("Giovanni Pereira", "23/03/1998", 3300.00, 1),
	    ("Renata Costa", "12/10/1992", 3200.00, 1),
	    ("Mariana Souza", "28/05/1994", 3000.00, 1),
	    ("Felipe Alves", "09/11/1995", 2800.00, 1);

	   
--Inserir 10 técnicos
INSERT INTO tb_tecnico 
	SELECT idPessoa, ABS(RANDOM() % 7) as 'anosExp' -- ABS() retorna um valor absoluto, RANDOM() retorna um número aleatório, %7 Limita esse número a um número de -6 a 6
	FROM tb_pessoa
	LIMIT 10;
	
--Criar 5 cores
INSERT INTO tb_cor (cor)
VALUES 	('azul'),
		('preto'),
		('vermelho'),
		('branco'),
		('verde');
		
--Criar 10 times
INSERT INTO tb_time (nomeTime, dataFundacao, idTecnico_FK)
VALUES 	("Time A", "05/09/1986", 1),
		("Time B", "02/11/1979", 2),
		("Time C", "15/12/1989", 3),
		("Time D", "29/09/1984", 4),
		("Time E", "15/03/1982", 5),
		("Time F", "04/08/1990", 6),
		("Time G", "08/04/1983", 7),
		("Time H", "03/06/1991", 8),
		("Time I", "07/09/1992", 9),
		("Time J", "06/11/1978", 10) ;

	
--Criar as cores dos times
INSERT INTO tb_timeCor 
VALUES	(1, 1),
		(2, 2),
		(3, 3),
		(4, 4),
		(5, 5),
		(2, 6),
		(5, 7),
		(4, 8),
		(1, 9),
		(3, 10),
		(4, 9);

--Inserir jogadores gols na carreira são de 0 a 29, bonus é de 500 a 1999, idTime é de 1 a 10
INSERT INTO tb_jogador (idPessoa_FK, nomeCamisa, golsCarreira, bonus, idTime_FK)
SELECT idPessoa, nome, ABS(RANDOM() % 21) AS golsCarreira, ABS(RANDOM() %1500 + 500) AS bonus, ((ROWID -1 ) % 10 + 1) AS numero
FROM tb_pessoa;

--Inserir Campeonato 1
INSERT INTO tb_campeonato (nomeCamp, dataInicio, dataFim, idVencedor_FK)
SELECT "Copinha", "02/09/2012", "15/09/2012", idTime
FROM tb_time tt
WHERE tt.nomeTime = "Time A";

--Inserir Campeonato 2
INSERT INTO tb_campeonato (nomeCamp, dataInicio, dataFim, idVencedor_FK)
SELECT "Copa Uespiana", "03/04/2013", "15/09/2013", idTime
FROM tb_time tt
WHERE tt.nomeTime = "Time H";

--Inserindo times que disputaram a Copinha na tabela disputa
INSERT INTO tb_disputa 
SELECT idTime, 1
FROM tb_time tt
WHERE tt.nomeTime = "Time A";

INSERT INTO tb_disputa 
SELECT idTime, 1
FROM tb_time tt
WHERE tt.nomeTime = "Time B";

INSERT INTO tb_disputa 
SELECT idTime, 1
FROM tb_time tt
WHERE tt.nomeTime = "Time C";

INSERT INTO tb_disputa 
SELECT idTime, 1
FROM tb_time tt
WHERE tt.nomeTime = "Time D";

INSERT INTO tb_disputa 
SELECT idTime, 1
FROM tb_time tt
WHERE tt.nomeTime = "Time E";

--Inserindo times que disputaram a Copa Uespiana na tabela disputa
INSERT INTO tb_disputa
SELECT idTime, 2
FROM tb_time tt
WHERE tt.nomeTime = "Time F";

INSERT INTO tb_disputa 
SELECT idTime, 2
FROM tb_time tt
WHERE tt.nomeTime = "Time G";

INSERT INTO tb_disputa 
SELECT idTime, 2
FROM tb_time tt
WHERE tt.nomeTime = "Time H";

INSERT INTO tb_disputa 
SELECT idTime, 2
FROM tb_time tt
WHERE tt.nomeTime = "Time I";

INSERT INTO tb_disputa 
SELECT idTime, 2
FROM tb_time tt
WHERE tt.nomeTime = "Time J";

--Inserindo jogos do campeonato 1
INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "02/09/2012", "16:00:00", "Quadra Uespi-FL", 70, tt1.idTime, tt2.idTime , 1, 1
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time A" AND tt2.nomeTime = "Time B";

INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "02/09/2012", "16:00:00", "Quadra Uespi-TE", 150, tt1.idTime, tt2.idTime , 1, 1
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time C" AND tt2.nomeTime = "Time D";

INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "13/09/2012", "19:00:00", "Quadra Uespi-TE", 100, tt1.idTime, tt2.idTime , 1, 2
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time C" AND tt2.nomeTime = "Time E";

INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "15/09/2012", "19:00:00", "Quadra Uespi-FL", 90, tt1.idTime, tt2.idTime , 1, 1
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time A" AND tt2.nomeTime = "Time E";

--Inserindo jogos do campeonato 2
INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "03/04/2013", "19:00:00", "Quadra Uespi-FL", 100, tt1.idTime, tt2.idTime , 2, 1
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time G" AND tt2.nomeTime = "Time F";

INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "03/04/2013", "16:00:00", "Quadra Uespi-TE", 120, tt1.idTime, tt2.idTime , 2, 2
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time I" AND tt2.nomeTime = "Time H";

INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "10/04/2013", "19:00:00", "Quadra Uespi-FL", 130, tt1.idTime, tt2.idTime , 2, 1
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time H" AND tt2.nomeTime = "Time J";

INSERT INTO tb_jogo (dataJogo, horario, estadio, publicoPagante, idTimeCasa_FK, idTimeVisita_FK, idCampeonato_FK, resultado)
SELECT "15/09/2012", "19:00:00", "Quadra Uespi-FLG", 90, tt1.idTime, tt2.idTime , 2, 2
FROM tb_time as tt1, tb_time tt2
WHERE tt1.nomeTime = "Time G" AND tt2.nomeTime = "Time H";

--Inserindo escalações
INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 1;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 1;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 2;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 2;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 3;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 3;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 4;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 4;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 5;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 5;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 6;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 6;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 7;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 7;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeCasa_FK = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 8;

INSERT INTO tb_escalacao (idJogo_FK, idPessoa_FK, idTime_FK, gols)
SELECT tj.idJogo , tjd.idPessoa_FK , tt.idTime, ABS(RANDOM() % 4)
FROM 	tb_jogo tj INNER JOIN tb_time tt ON (tj.idTimeVisita_FK  = tt.idTime)
		INNER JOIN tb_jogador tjd ON (tt.idTime = tjd.idTime_FK)
WHERE tj.idJogo = 8;


