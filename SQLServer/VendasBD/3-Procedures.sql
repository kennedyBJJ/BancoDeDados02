USE VendasBD 


GO
--criando store procedure de forma geral
CREATE PROCEDURE spOlaMundo
as
begin
	SELECT 'OLA MUNDO'
end


--executando um store procedure
EXEC spOlaMundo

--apagando um store procedur
DROP PROCEDURE spOlaMundo 


GO
-- alterando
ALTER PROCEDURE spOlaMundo
as
begin
 SELECT 'Ol , Mundo 2!!'
end
EXEC spOlaMundo

-----------------------------------
-- podemos colocar qualquer comando SQL
-- dentro da store procedure
go
CREATE PROCEDURE spTeste
as
begin
 SELECT * FROM funcionarios
end

go
-- criando sp com passagem de par metro
CREATE PROCEDURE spRetornoMsg(@meuTexto varchar(100))
as
BEGIN
 SELECT 'Texto informado: ' + @meuTexto[Text]
END
-- executando
EXEC spRetornoMsg 'Deu certo'

GO
-- criando sp com passagem de par metro
CREATE PROCEDURE spRetornoMsg2(@meuTexto varchar(100), @valor int)
as
begin
	PRINT @meuTexto + ' ' + cast(@valor as varchar)
end

EXEC spRetornoMsg2 'Valor de x: ', 20

GO
CREATE PROCEDURE spExemploIf (@valor int)
as
begin
	if (@valor	> 0	)
		print cast(@valor as varchar) + N'   Positivo'
	else if (@valor < 0 )
		print cast(@valor as varchar) + N'   Negativo'
	else
		print cast(@valor as varchar) + N'   Nulo'
end

exec spExemploIf -8

go
-- Quando o if tem apenas 1 comando pode-se retirar o begin   end
CREATE PROCEDURE spExemploIf2(@valor int)
as
begin
 if (@valor > 0)
	print 'Positivo'
 else
	if (@valor < 0)
		print 'Negativo'
	else
		print 'Nulo'
end

go
CREATE PROCEDURE spBoasVindas (@nome varchar(50))
as
begin
	PRINT 'Seja Bem-vindo(a)' + ' ' + @nome
	if (DATEPART(hour, getdate())>8 and DATEPART(hour, getdate())<=12)
	begin
		PRINT 'Bom Dia!!'
	end
	else
	begin
		if(DATEPART(hour, getdate())>12 and DATEPART(hour, getdate())<=18)
		begin
			PRINT 'Boa Tarde!!'
		end
		else
		begin
			PRINT 'Boa Noite!!'
		end
	 end
end

EXEC spBoasVindas 'Willian'

go
create procedure spTabuada(@tab int)
as
begin
 declare @cont int
 set @cont = 0
 while (@cont<=10)
 begin
	 print cast(@cont as nvarchar) + N' X '+ cast(@tab as nvarchar) + N'   = ' + cast(@cont * @tab as nvarchar)
	set @cont = @cont +1
 end
end

exec spTabuada 7

go
CREATE procedure spContador(@num int)
as
begin
 declare @cont int
 set @cont = 0
 while (@cont<= @num)
 begin
	 print cast(@cont as nvarchar)
	 set @cont = @cont +1 
 end
end

EXEC spContador 5