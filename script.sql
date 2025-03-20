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

insert into Livros(Titulo, id_editora, id_categoria, id_autor) values
('Nano Machine', 1,5,1),
('Solo Leveling', 2,5,2),
('I Am The Fated Villain', 1,2,3);

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

-Inserção com os relacionamentos-

insert into Livros(Titulo, id_editora, id_categoria, id_autor)
	values
		('Nano Machine',
		(select id_editora from editoras where nome = 'Wiley-Vch'),
		(select id_categoria from categorias where nome = 'Manhwa'),
		(select id_Autor from autores where nome = 'Han Joong Wueol Ya')
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
select * from livros 1 ;
select titulo from livros 1 where titulo = 'Nano Machine';
select Titulo from livros 1 where id_categoria = 1;
select titulo from livros 1 order by titulo asc;
select titulo from livros 1 order by titulo desc;
select titulo from livros 1 limit 2;

-JOIN-
select livros.titulo, autores.nome 
from livros
inner join autores on livros.id_autor = autores.id_autor;


select * from categorias c ;
select * from autores a ;
select * from editoras e ;