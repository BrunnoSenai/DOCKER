create table Livros(
	ID_Livro SERIAL primary key,
	Titulo varchar(255),
	Autor varchar(255),
	Editora varchar(255),
	Endereco_Editora varchar(255),
	Categoria varchar(255)
	
);

create table Editoras(
	ID_Editora SERIAL primary key,
	Nome varchar(255),
	Endereco varchar(255)
);

alter table livros
add column ID_Editora INT REFERENCES Editoras(ID_Editora);
-Exclusão de colunas Editoras e Endereço-
alter table livros
drop column Editora,
drop column Endereco_Editora;

-Criação de tabela Categorias-
create table Categorias(
	ID_Categoria SERIAL primary key,
	Nome varchar(255)
);

-Criar relacionamento Livros - Categorias-
alter table livros
add column ID_Categoria INT references Categorias(ID_Categoria);

-Criação de tabela Autor-
create table Autores(
	ID_Autor SERIAL primary key,
	Nome varchar(255)
);

-Criar relacionamento Autor - Livro-
alter table livros
add column ID_Autor INT references Autores(ID_Autor);

insert into Editoras(Nome, Endereco) values
('Wiley-Vch','Rua Cheia de agua n° 125'),
('Panini','Rua Feliz, Alameda Contente n° 123'),
('IndieVisivel','Rua Marques de Figueiredo n° 1502');

insert into Categorias(Nome) values
('Ficção'),
('Manhua'),
('Ação'),
('Manga'),
('Manhwa');

insert into Autores(Nome) values
('Han Joong Wueol Ya'),
('Chu-Gong'),
('Fated Villain'),
('Heitor Amatsu');

insert into Livros(Titulo, id_editora, id_categoria, id_autor) values
('Nano Machine', 1,5,1),
('Solo Leveling', 2,5,2),
('I Am The Fated Villain', 1,2,3);

-Inserção com os relacionamentos-
-Incluir livro importando dados dasd outras tabelas-
insert into Livros(Titulo, id_editora, id_categoria, id_autor)
	values
		('Nano Machine',
		(select id_editora from editoras where nome = 'Wiley-Vch'),
		(select id_categoria from categorias where nome = 'Manhwa'),
		(select id_autor from autores where nome = 'Han Joong Wueol Ya')
);

insert into Livros(Titulo, id_editora, id_categoria, id_autor) values
('Lampião', 3,4,4);

insert into Livros(Titulo, id_editora, id_categoria, id_autor)
	values
		('Lampião',
		(select id_editora from editoras where nome = 'IndieVisivel'),
		(select id_categoria from categorias where nome = 'Manga'),
		(select id_Autor from autores where nome = 'Heitor Amatsu')
);
	
-Mostrar dados-
select * from categorias c ;
select * from autores a ;
select * from editoras e ;
select * from livros l ;
	
-Mostrar dados-
select * from livros l ;
select titulo from livros l where titulo = 'Nano Machine';
select titulo from livros l where id_categoria = 1;
select titulo from livros l order by titulo asc;
select titulo from livros l order by titulo desc;
select * from livros l limit 2;

-Retorna registros que tem correspondência em ambas tabelas-
select livros.titulo, autores.nome 
from livros
inner join autores on livros.id_autor = autores.id_autor;

-Retorna registros da tabela esquerada os registros da tabela direita-
select Livros.titulo, Autores.nome 
from Livros
left join Autores on livros.id_autor = autores.id_autor;

-Retorna registros da tabela direita e registros da tabela esquerda-
select livros.titulo , autores.nome 
from livros
right join autores on livros.id_livro = autores.id_autor;

-Retorna todos os registros quando há uma correspondência-
select livros.titulo , autores.nome 
from livros
full outer join autores on livros.id_livro = autores.id_autor;

-Retornar os registros correspondentes a todas as tabelas-
select livros.titulo, autores.nome, categorias.nome, editoras.nome
from livros
inner join autores on livros.id_autor = autores.id_autor
inner join categorias on livros.id_categoria = categorias.id_categoria
inner join editoras on livros.id_livro = editoras.id_editora;

select * from categorias c ;
select * from autores a ;
select * from editoras e ;