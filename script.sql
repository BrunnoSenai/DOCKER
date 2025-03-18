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