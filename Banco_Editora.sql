create database CONTROLE_DE_LIVROS;
use CONTROLE_DE_LIVROS;

create table Editora(
	Id_Editora int primary key auto_increment,
    Nome_Editora varchar(50),
    CNPJ char(14) not null
);

create table Categoria(
	Id_Categoria int primary key auto_increment,
    Nome_Categoria varchar(50) not null,
    Publico_Alvo varchar(50)
);

create table Autores(
	Id_Autor int primary key auto_increment,
	Nome_Autor varchar(50) not null,
    Sobrenome_Autor varchar(50) not null,
    Idade int
);

create table Livros(
	Id_Livro int primary key auto_increment,
	Nome_Livro varchar(50) not null,
    Autor varchar(30) not null,
    Id_Editora int not null,
    constraint fk_Editora_Id_Editora foreign key (Id_Editora) references Editora(Id_Editora)
);

create table Livros_Categoria(
	Id_Categoria int,
    Id_Livro int,
    primary key (Id_Livro, Id_Categoria),
    constraint fk_Categoria_Id_Categoria foreign key (Id_Categoria) references Categoria(Id_Categoria),
    constraint fk_Livros_Id_Livro foreign key (Id_Livro) references Livros(Id_Livro)
);

create table Autores_Livros(
	Id_Autor int,
    Id_Livro int,
    primary key (Id_Autor, Id_Livro),
    constraint fk_Autores_Id_Autor foreign key (Id_Autor) references Autores(Id_Autor),
    constraint fk_Livros_Id_Livro_2 foreign key (Id_Livro) references Livros(Id_Livro)
);

insert into Editora(Nome_Editora, CNPJ)
	values("Editora Cultura", 12345678912345),
	("Editora Cometa", 23456789123456);

insert into Livros(Nome_Livro, Autor, Id_Editora)
	values("A lenda do et bilu", "Howard", 1),
    ("Baianinho de Mauá: uma auto biografia", "Baianinho", 2);
    
insert into Autores(Nome_Autor, Sobrenome_Autor)
	values("Howard", "Lovecraft"),
    ("Baianinho", "de Mauá");
    
insert into Categoria(Nome_Categoria, Publico_Alvo)
	values("Terror cósmico", "Adulto"),
    ("Biografia", "Sinuqueiros");

insert into Autores_Livros(Id_Autor, Id_Livro)
	values(1, 1),
    (2, 2);

insert into Livros_Categoria(Id_Categoria, Id_Livro)
	values(1, 1),
    (2, 2);

update Editora
	set	Nome_Editora = "Editora Knight"
    where Nome_Editora = "Editora Cometa";

update Livros 
	set Nome_Livro = "A lenda do et bilu de Corguinho"
    where Id_Livro = 1;

update Autores
	set Nome_Autor = "Dadinho"
    where Id_Autor = 1;
    
delete from Autores_Livros
	where  Id_Autor = 2;
    
delete from Autores_Livros
	where  Id_Autor = 1;

delete from Livros_Categoria
	where Id_Categoria = 2;

delete from Autores
	where  Id_Autor = 2;

delete from Livros
	where Nome_Livro = "Baianinho de Mauá: uma auto biografia";

delete from Editora
	where Id_Editora = 2;