--Consulta letra A
SELECT tp.nome, tp.dataNasc, tp.salario, tj.nomeCamisa, tj.golsCarreira  
FROM tb_jogador tj INNER JOIN tb_pessoa tp ON (tj.idPessoa_FK = tp.idPessoa)
ORDER BY tp.nome ASC

--Consulta letra B
SELECT tt.nomeTime, tp.nome, tp.dataNasc, tp.salario, tj.nomeCamisa, tj.golsCarreira
FROM 	tb_jogador tj INNER JOIN tb_pessoa tp ON (tj.idPessoa_FK = tp.idPessoa)
		INNER JOIN tb_time tt ON (tt.idTime = tj.idTime_FK)
ORDER BY tt.nomeTime ASC

--Consulta letra C
SELECT tt.nomeTime, tp.nome 
FROM	tb_campeonato tc INNER JOIN tb_disputa td ON (tc.idCampeonato = td.idCampeonato_FK)
		INNER JOIN tb_time tt ON ( td.idTime_FK = tt.idTime)
		INNER JOIN tb_pessoa tp ON ( tp.idPessoa = tt.idTecnico_FK)
WHERE tc.idCampeonato = 2;
ORDER BY tt.nomeTime DESC

--Consulta letra D
UPDATE tb_pessoa
SET nome = 'Jubs Claudio Burbs'
WHERE nome = (	SELECT tp.nome
				FROM 	tb_time tt INNER JOIN tb_pessoa tp ON ( tp.idPessoa = tt.idTecnico_FK)
				WHERE tt.idTime = 3 ); 
			
--Também deve ser atualizado o nome na camisa
UPDATE tb_jogador 
SET nomeCamisa = 'Jubs Claudio Burbs'
WHERE idPessoa_FK = (	SELECT tj.idPessoa_FK  
						FROM tb_time tt INNER JOIN tb_jogador tj ON (tt.idTecnico_FK = tj.idPessoa_FK)
						WHERE idTime = 3);
					
--Consulta letra E 
SELECT tj2.dataJogo, SUM(gols) AS 'Gols na Partida', tj2.idTimeCasa_FK AS 'Time da Casa', tj2.idTimeVisita_FK AS 'Time Visitante'
FROM tb_escalacao te 
INNER JOIN
(--Consulta que retorna os id's dos jogos que Jóse Roberto participou
	SELECT te2.idJogo_FK AS 'idJogoJose'
	FROM tb_pessoa tp 
	INNER JOIN tb_jogador tj ON (tp.idPessoa = tj.idPessoa_FK)
	INNER JOIN tb_escalacao te2 ON (tp.idPessoa = te2.idPessoa_FK)
	WHERE tp.nome = 'José Roberto'
) tbjg ON (te.idJogo_FK = tbjg.idJogoJose)
INNER JOIN tb_jogo tj2 ON (tj2.idJogo = te.idJogo_FK)
GROUP BY tj2.idJogo 
ORDER BY tj2.dataJogo;

--Consulta letra F
SELECT AVG(te.gols) AS 'Média de gols' 
FROM tb_campeonato tc 
INNER JOIN tb_jogo tj ON (tc.idCampeonato = tj.idCampeonato_FK)
INNER JOIN tb_escalacao te ON (tj.idJogo = te.idJogo_FK)
WHERE tc.idCampeonato = 1;

--Consulta letra G
SELECT COUNT(*) AS "qtd de jogos que oTime de id 4 jogou no campeonato de id 2"
FROM tb_time tt 
INNER JOIN tb_disputa td ON (td.idTime_FK = tt.idTime)
INNER JOIN tb_campeonato tc ON (tc.idCampeonato = td.idCampeonato_FK)
INNER JOIN tb_jogo tj ON (tj.idCampeonato_FK = tc.idCampeonato)
WHERE tc.idCampeonato = 2 AND ( tj.idTimeCasa_FK = 4 OR tj.idTimeVisita_FK = 4)

--Consulta letra H
SELECT tj.idJogo, tj.publicoPagante, ttC.nomeTime AS 'Casa', ttV.nomeTime AS 'Visita' 
FROM tb_jogo tj
INNER JOIN tb_time ttC ON (tj.idTimeCasa_FK = ttC.idTime)
INNER JOIN tb_time ttV ON (tj.idTimeVisita_FK = ttV.idTime)
ORDER BY tj.publicoPagante DESC 
LIMIT 1;

--Consulta letra I
SELECT tbc.jogo, tbc.idTimeCasa_FK, tbc.golsCasa, tbv.idTimeVisita_FK, tbv.golsVisita
FROM
( --Consulta que retorna os dados do time da casa
	SELECT tj2.idJogo AS 'jogo', tj2.idTimeCasa_FK, SUM(te.gols) AS 'golsCasa'
	FROM tb_escalacao te 
	INNER JOIN tb_jogo tj2 ON (te.idJogo_FK = tj2.idJogo AND tj2.idTimeCasa_FK = te.idTime_FK)
	WHERE tj2.resultado = 2
	GROUP BY tj2.idJogo
) tbc
INNER JOIN
(----Consulta que retorna os dados do time visitante
	SELECT tj2.idJogo AS 'jogoVisita', tj2.idTimeVisita_FK, SUM(te.gols) AS 'golsVisita'
	FROM tb_escalacao te 
	INNER JOIN tb_jogo tj2 ON (te.idJogo_FK = tj2.idJogo AND tj2.idTimeVisita_FK= te.idTime_FK)
	WHERE tj2.resultado = 2
	GROUP BY tj2.idJogo

) tbv ON (tbc.jogo = tbv.jogoVisita)
