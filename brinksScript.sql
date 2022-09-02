select 
	m.nome as nome_musica,
	a.nome as nome_artista
from
	musica as m inner join artista as a on m.id_artista = a.id where a.popularidade between 75 and 95 and a.nome like '%the%';

select sigla, id
from pais;
	
select streams, posicao
from pais_musica pm where id_pais=31 group by streams, posicao order by posicao;

select * from musica m inner join pais_musica pm on m.id=pm.id_musica where pm.id_pais =31 group by m.id_artista, m.id,pm.id order by pm.streams  desc;

select 
	a.nome as nome_artista,
	sum(streams) as total_stream_artista
from
	artista as a inner join musica as m on a.id=m.id_artista
	inner join pais_musica pm on m.id=pm.id_musica where pm.id_pais=230
	group by a.nome
	order by sum(streams) desc limit 10;
	