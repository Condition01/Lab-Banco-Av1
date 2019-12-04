--************************************************************************************************--
---AREA DE TESTES
use prova1_final

--*************************************************************************************************--
---PROCEDURE PRINCIPAL QUE GERA TODOS OS ELEMENTOS

exec sp_gera_tabela_jogos


select * from jogos order by dataJogo

exec contaJogos

select count(codTimeA) from jogos where codTimeA = 1 or codTimeB = 2

exec sp_preenche_grupo
select * from grupos
create procedure sp_gera_tabela_jogos as begin
	exec sp_preenche_grupo
	exec sp_reseta_jogos
	declare @possibilidades int, @rotacao int, @data date, @jogos int
	set @data = '31/01/2016'
	declare @g_jogo1 varchar(2), @g_jogo2 varchar(2)
	set @possibilidades = 1
	set @rotacao = 1
	set @jogos = 0
	while(@possibilidades<=3)	begin -- e
		exec sp_roda_grupo @g_jogo1 output, @g_jogo2 output, @rotacao output
		exec sp_jogos_rotacao  @g_jogo1 output, @g_jogo2 output, @data output, @jogos output
		set @possibilidades = @possibilidades + 1
	end -- e
end


--******************************************************************************************--
-----PROCEDURE PARA GERAR RODADA

drop procedure sp_jogos_rotacao

select convert (varchar(10),dataJogo,108) from jogos order by dataJogo

create procedure sp_jogos_rotacao (@g_jogo1 varchar(2) output, @g_jogo2 varchar(2) output, @data date output, @jogos int output) as begin
	declare @time1 int, @time2 int, @time3 int, @time4 int
	declare @jogosPossiveis int,@rotacaoTime int, @g_troca_ordem varchar(2)
	set @jogosPossiveis = 1
	set @rotacaoTime = 1
	while(@jogosPossiveis <= 5)begin
		while(@rotacaoTime <= 5) begin
			set @time1 = (select top 1 codTime from grupos where grupo = substring(@g_jogo1,1,1))
			set @time2 = (select top 1 codTime from grupos where grupo = substring(@g_jogo1,2,1))
			insert into jogos values (@time1, @time2, 0, 0, @data)
			set @jogos = @jogos + 1
			if(@jogos % 5 = 0 and @jogos % 10 != 0) begin
				exec sp_pega_nova_data @data output
			end
			set @time3 = (select top 1 codTime from grupos where grupo = substring(@g_jogo2,1,1))
			set @time4 = (select top 1 codTime from grupos where grupo = substring(@g_jogo2,2,1))
			insert into jogos values (@time3, @time4, 0, 0, @data)
			set @jogos = @jogos + 1
			if(@jogos % 10 = 0 and @jogos / 5 != 1) begin
				exec sp_pega_nova_data @data output
			end
			exec sp_inverte_grupo @time1, @time2, @g_jogo1
			exec sp_inverte_grupo @time3, @time4, @g_jogo2
			set @rotacaoTime = @rotacaoTime + 1
			
		end	
		set @jogos = 0
		set @rotacaoTime = 1
		set @jogosPossiveis = @jogosPossiveis + 1
		set @g_troca_ordem = substring(@g_jogo1,2,1) + substring (@g_jogo2,2,1)
		set @time2 = (select top 1 codTime from grupos where grupo = substring(@g_jogo1,2,1))
		set @time4 = (select top 1 codTime from grupos where grupo = substring(@g_jogo2,2,1))
		exec sp_inverte_grupo @time2, @time4, @g_troca_ordem
	end
end

--******************************************************************************************--

create procedure sp_pega_nova_data (@data date output) as begin 
	declare @dia int 
	set @dia = datepart(weekday, @data)
	if(@dia = 7) begin
		set @data = dateadd(weekday, 3, @data)
	end
	else begin
		set @data = dateadd(weekday, 4, @data)
	end
end

--******************************************************************************************--
-----PROCEDURE PARA INVERTER GRUPO

create procedure sp_inverte_grupo (@time1 int, @time2 int, @g_jogo varchar(2)) as begin
	delete grupos where codTime = @time1
	delete grupos where codTime = @time2
	insert into grupos values(substring(@g_jogo,1,1), @time1)
	insert into grupos values(substring(@g_jogo,2,1), @time2)
end

--******************************************************************************************--
-----PROCEDURE PARA INSERIR TIMES
drop procedure sp_insere_times
create procedure sp_insere_times (@time1 int, @time2 int) as begin
	declare @data date
	set @data = GETDATE()
	exec sp_insere_jogo @time1, @time2, @data 
end

--******************************************************************************************--
----PROCEDURE PARA RODAR TIMES
drop procedure sp_roda_grupo
create procedure sp_roda_grupo (@g_jogo1 varchar(2) output, @g_jogo2 varchar(2) output, @rotacao int output) as begin
	if(@rotacao = 1 or @rotacao = 4)begin
		set @g_jogo1 = 'AB'
		set @g_jogo2 = 'CD'
		set @rotacao = @rotacao + 1
	end
	else if(@rotacao = 2)begin
		set @g_jogo1 = 'AC'
		set @g_jogo2 = 'BD'
		set @rotacao = @rotacao + 1
	end
	else if(@rotacao = 3)begin
		set @g_jogo1 = 'AD'
		set @g_jogo2 = 'BC'
		set @rotacao = 1
	end	
end
--*******************************************************************************************-
----PROCEDURE PARA CONTAR JOGOS

exec contaJogos
create procedure contaJogos
as begin
	declare @contador int, @nJogos int
	set @contador = 1
	while(@contador<=20) begin
		set @nJogos = (select count(codTimeA) from jogos where codTimeA = @contador) + (select count(codTimeB) from jogos where codTimeB = @contador)
		print 'time ' + cast(@contador as varchar) + ' jogou ' + cast(@nJogos as varchar)
		set @contador = @contador + 1
	end
end


--*******************************************************************************************_
--------PROCEDURE PARA PREENCHER GRUPOS
drop procedure sp_preenche_grupo

exec sp_preenche_grupo

create procedure sp_preenche_grupo
as begin
	exec sp_reseta_grupos
	insert into grupos values
	('A',5), 
	('B',12),
	('C',16),
	('D',19)

	declare @rand char(1), @cont int, @totGrupo int
	set @cont = 1
	while(@cont <= 20)
	begin -- C
	exec sp_grupo_randomico @rand output
	exec sp_retorna_quantidade @rand, @totGrupo output
	if(@totGrupo <5 )
	begin -- B
		-- diferente de Corinthians, Palmeiras, São Paulo e Santos
		if(@cont != 5 and @cont != 12 and @cont != 16 and @cont != 19)
		begin   --   A
			insert grupos values(@rand, @cont)
			set @cont = @cont + 1
		end     --   A
		else
		begin 
			set @cont = @cont + 1
		end
	end  -- B
	end	 -- C
end

--*******************************************************************************************_
----PROCEDURE PARA GERAR VALORES ALEATORIOS PARA OS GRUPOS


create procedure sp_grupo_randomico(@r char(1) output)
as begin
	declare @soma int
	set @soma = (select(abs(checksum(newid()))% 4) + 1)
	set @r = case 
			when (@soma = 1) then 'A'
			when (@soma = 2) then 'B'
			when (@soma = 3) then 'C'
			when (@soma = 4) then 'D'
		end  -- case		
end




--******************************************************************************************--
--**************************************ESTRUTURAIS*****************************************--
--******************************************************************************************--
------PROCEDURE PARA RESETAR JOGOS
drop procedure sp_reseta_jogos
create procedure sp_reseta_jogos as begin
	drop table jogos
	create table jogos(
		id			   int	identity not null,
		codTimeA       int           not null,
		codTimeB       int           not null,
		golsTimeA      int                   ,
		golsTimeB      int                   ,
		dataJogo	   date   not null
		primary key(id)
		foreign key(codTimeA) references times(id),
		foreign key(codTimeB) references times(id)
	)
end

--******************************************************************************************--
------PROCEDURE PARA RESETAR GRUPO TESTE

create procedure sp_reseta_grupo_teste as begin
	drop table grupo_teste
	create table grupo_teste(
		codTimeA int not null,
		codTimeB int not null,
		grupoTimeA char(1) not null,
		grupoTimeB char(1) not null
	)
end

--*******************************************************************************************_
-----PROCEDURE PARA RETORNAR A QUANTIDADE EM UM DETERMINADO GRUPO
drop procedure sp_retorna_quantidade
create procedure sp_retorna_quantidade (@grupo char(1), @valor int output) as begin
	set @valor = (select count(gp.codTime) as codigo from grupos gp where gp.grupo = @grupo)
end



--*******************************************************************************************_
-----PROCEDURE QUE RESETA OS GRUPOS
drop procedure reseta_grupos

create procedure sp_reseta_grupos as begin
	drop table grupos

	create table grupos(
		id int identity,
		grupo char(1) not null,
		codTime int not null
		primary key(id, codTime)
		foreign key (codTime) references times(id)
	)
end 

select * from grupos order by grupo



SELECT codTime FROM 
	(SELECT ROW_NUMBER() OVER (ORDER BY [id] asc ) AS linha,* FROM grupos) AS tabela
		where linha = 19

--******************************************************************************************--
--**************************************NÃO UTILIZADAS**************************************--
--******************************************************************************************--
----PROCEDURE PARA PEGAR NA JOGADA
drop procedure sp_pega_times_jogada
create procedure sp_pega_times_jogada (@time1 int output, @time2 int output, @g_jogo varchar(2), @jogos int)as begin
	set @time1 = (SELECT codTime FROM 
	(SELECT ROW_NUMBER() OVER (ORDER BY [grupo] asc ) AS linha,* FROM grupos where grupo = substring(@g_jogo,1,1)) AS tabela
		where linha = @jogos )
	set @time2= (SELECT codTime FROM 
	(SELECT ROW_NUMBER() OVER (ORDER BY [grupo] asc ) AS linha,* FROM grupos where grupo = substring(@g_jogo,2,1)) AS tabela
		where linha = @jogos )
end
--******************************************************************************************--
-----PROCEDURE PARA PEGAR ELEMENTO

drop procedure sp_pega_times
create procedure sp_pega_times (@time1 int output, @time2 int output, @g_jogo varchar(2))as begin
	set @time1 = (SELECT codTime FROM 
	(SELECT ROW_NUMBER() OVER (ORDER BY [grupo] asc ) AS linha,* FROM grupos where grupo = substring(@g_jogo,1,1)) AS tabela
		where linha = 1 )
	set @time2= (SELECT codTime FROM 
	(SELECT ROW_NUMBER() OVER (ORDER BY [grupo] asc ) AS linha,* FROM grupos where grupo = substring(@g_jogo,2,1)) AS tabela
		where linha = 1 )
end

-- resumo ------------------------------------------------------------ AV1
-- tabelas
select * from jogos
select * from grupos
select * from times


exec sp_preenche_grupo
exec sp_gera_tabela_jogos
	
----------------------------------------------------------------------------
-- AV2 Colevati


-- gerar Gols
create procedure sp_preencher_gols (@contador int)
as begin
	declare @golsA int, @golsB int
	while(@contador <=150) begin
		set @golsA = (select(abs(checksum(newid()))% 6) + 0)
		set @golsB = (select(abs(checksum(newid()))% 6) + 0)
		update jogos set golsTimeA = @golsA, golsTimeB = @golsB where id = @contador
		set @contador = @contador + 1
	end
end
-- test  sp_preencher_gols
exec sp_gera_tabela_jogos
exec sp_preencher_gols 1
select * from jogos
--------------------------------------------

-- gerar contagem de vitorias, derrotas e Empates
select * from fn_resultadoPrimeiraFase() 
inner join times t
on t.id = fn_resultadoPrimeiraFase().codTime
where t.id = 1

drop function fn_resultadoPrimeiraFase
create function fn_resultadoPrimeiraFase()
returns @tabelaPrimeiraFase table(
	grupo         char(1),     
	codTime       int,
	vitorias      int,
	derrotas      int,
	empates       int,
	gols          int,
	golsSofridos  int,
	saldoGols     int,
	pontos        int
	primary key(codTime)
)
as begin
	declare @contador int, @vitorias int, @derrotas int, @empates int, @gols int,
	@golsSofridos int, @golsSaldo int
	set @contador = 1
	set @derrotas = 0
	set @vitorias = 0
	set @empates = 0
	set @gols = 0
	set @golsSofridos = 0
	set @golsSaldo = 0
	insert into @tabelaPrimeiraFase (grupo, codTime) select grupo, codTime from grupos
	while(@contador <=20) begin
	-- calcular vitorias
		set @vitorias = @vitorias + (select count(res_a) from fn_vitorias_derrotas() 
			where codTimeA = @contador and res_a = 'V')
		set @vitorias = @vitorias + (select count(res_b) from fn_vitorias_derrotas() 
			where codTimeB = @contador and res_b = 'V')
		update @tabelaPrimeiraFase set pontos = @vitorias * 3 where codTime = @contador
	-- calcular derrotas
		set @derrotas = @derrotas + (select count(res_a) from fn_vitorias_derrotas() 
			where codTimeA = @contador and res_a = 'D')
		set @derrotas = @derrotas + (select count(res_b) from fn_vitorias_derrotas() 
			where codTimeB = @contador and res_b = 'D')

	-- calcular empates
		set @empates = @empates + (select count(res_a) from fn_vitorias_derrotas() 
			where codTimeA = @contador and res_a = 'E')
		set @empates = @empates + (select count(res_b) from fn_vitorias_derrotas() 
			where codTimeB = @contador and res_b = 'E')
		update @tabelaPrimeiraFase set pontos = pontos + @empates * 1 where codTime = @contador
		
		update @tabelaPrimeiraFase set vitorias = @vitorias, 
			derrotas = @derrotas, empates = @empates where codTime = @contador
		
		set @gols = (select dbo.fn_pegarGols(@contador))
		update @tabelaPrimeiraFase set gols = @gols where codTime = @contador 
		
		set @golsSofridos = (select dbo.fn_pegarGolsSofridos(@contador))
		update @tabelaPrimeiraFase set golsSofridos = @golsSofridos where codTime = @contador

		set @golsSaldo = @gols - @golsSofridos
		update @tabelaPrimeiraFase set saldoGols = @golsSaldo where codTime = @contador

			set @contador = @contador + 1
			set @derrotas = 0
			set @vitorias = 0
			set @empates = 0
			set @gols = 0 	 
		end
	return
end

drop function fn_pegarGols
create function fn_pegarGols(@contador int) returns int 
as begin
	declare @somaGols int, @aux int
	set @somaGols = 0
	set @aux = (select sum(golsTimeA) from jogos where codTimeA = @contador)
	if(@aux is not null)begin
		set @somaGols = @aux
	end
	set @aux = 0
	set @aux = (select sum(golsTimeB) from jogos where codTimeB = @contador )
	if(@aux is not null)begin
		set @somaGols = @somaGols + @aux
	end
	return @somaGols
end



drop function fn_vitorias_derrotas
create function fn_vitorias_derrotas () 
returns @tabela table(
id  int,
codTimeA  int,
codTimeB  int,
golsTimeA int,
golsTimeB int, 
dataJogo  date,
res_A     char(1),
res_b     char(1)
)
as begin
	declare @contador int, @res_a char(1), @res_b char(1), @golA int, @golB int
	set @contador = 1
	insert @tabela (id, codTimeA, codTimeB, golsTimeA, golsTimeB, dataJogo) select id, codTimeA, codTimeB, golsTimeA, golsTimeB, dataJogo from jogos
	while(@contador <= 150) begin
		set @golA = (select (golsTimeA) from @tabela where id = @contador)
		set @golB = (select (golsTimeB) from @tabela where id = @contador)
		set @res_a = case 
			when (@golA = @golB ) then 'E'
			when (@golA > @golB) then  'V'
			when (@golA < @golB) then  'D'
		end  -- case
		set @res_b = case 
			when (@golB = @golA ) then  'E'
			when (@golB > @golA ) then  'V'
			when (@golB < @golA ) then  'D'
		end  -- case
		update @tabela set res_a = @res_a, res_b = @res_b where id = @contador
		set @contador = @contador + 1
	end
	return
end

--
--2.1 gols

create function fn_pegarGolsSofridos(@contador int) returns int 
as begin
	declare @somaGols int, @aux int
	set @somaGols = 0
	set @aux = (select sum(golsTimeB) from jogos where codTimeA = @contador)
	if(@aux is not null)begin
		set @somaGols = @aux
	end
	set @aux = 0
	set @aux = (select sum(golsTimeA) from jogos where codTimeB = @contador )
	if(@aux is not null)begin
		set @somaGols = @somaGols + @aux
	end
	return @somaGols
end

select * from fn_vitorias_derrotas () 

drop function fn_vitorias_derrotas

select * from fn_finalistas()

create function fn_finalistas()
returns @finalistas table(
grupo char(1),
	codTime int,
	vitorias int,
	derrotas int,
	empates int,
	gols int,
	golsSofridos int,
	saldoGols int,
	pontos int
	primary key(codTime)
)
as begin 
	insert into @finalistas select top 2 * from fn_resultadoPrimeiraFase() where grupo ='A' order by pontos desc, 
		vitorias desc, gols desc, saldoGols desc
	insert into @finalistas	select top 2 * from fn_resultadoPrimeiraFase() where grupo ='B' order by pontos desc, 
		vitorias desc, gols desc, saldoGols desc 
	insert into @finalistas select top 2 * from fn_resultadoPrimeiraFase() where grupo ='C' order by pontos desc, 
		vitorias desc, gols desc, saldoGols desc 
	insert into @finalistas select top 2 * from fn_resultadoPrimeiraFase() where grupo ='D' order by pontos desc, 
		vitorias desc, gols desc, saldoGols desc 

	return
end


create procedure sp_preencher_gols_rodada (@contador int)
as begin
	declare @golsA int, @golsB int, @maximo int
	set @maximo = @contador + 4
	while(@contador <= @maximo) begin
		set @golsA = (select(abs(checksum(newid()))% 6) + 0)
		set @golsB = (select(abs(checksum(newid()))% 6) + 0)
		update jogos set golsTimeA = @golsA, golsTimeB = @golsB where id = @contador
		set @contador = @contador + 1
	end
end
-- test  sp_preencher_gols
exec sp_gera_tabela_jogos
exec sp_preencher_gols 1
select * from jogos


-- resumo ------------------------------------------------------------ AV1
-- tabelas
select * from jogos
select * from grupos
select * from times


exec sp_preenche_grupo
exec sp_gera_tabela_jogos
select * from times
------------------------------------------------------------------------------
Resumo ----------------------------------------------------------------AV2
-- gerar gols 2.1
exec sp_preencher_gols 1

-- resultado das partidas
select * from fn_vitorias_derrotas () 

-- gerar contagem de vitorias, derrotas e Empates 2.2 (4 tabelas 1 com cada grupo)
select * from fn_resultadoPrimeiraFase() order by grupo, pontos desc,  vitorias desc, gols desc, saldoGols desc

select c.grupo, t.nome, c.vitorias, c.derrotas, c.empates, c.gols, c.golsSofridos, c.saldoGols, c.pontos from fn_resultadoPrimeiraFase() c inner join times t  on c.codTime = t.id
					 order by grupo, pontos desc,  vitorias desc, gols desc, saldoGols desc 

-- apresentar os finalistas
select  c.grupo, t.nome, c.vitorias, c.derrotas, c.empates, c.gols, c.golsSofridos, c.saldoGols, c.pontos  from fn_finalistas() c inner join times t  on c.codTime = t.id
					 order by grupo,  pontos desc,  vitorias desc, gols desc, saldoGols desc 


--Rebaixados

select top 4 c.grupo, t.nome, c.vitorias, c.derrotas, c.empates, c.gols, c.golsSofridos, c.saldoGols, c.pontos from fn_resultadoPrimeiraFase() c inner join times t  on c.codTime = t.id
					 order by pontos asc,  vitorias desc, gols desc, saldoGols desc 


--Triggers


create trigger trigger_times on times instead of insert, update as print 'Testou hein! que isso'

create trigger trigger_jogos on jogos instead of insert, delete as print 'Ahaaa, pegadinha do malandro!!'