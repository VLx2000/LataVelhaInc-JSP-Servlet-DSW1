drop database if exists Aluguel_Veiculos;

create database Aluguel_Veiculos;
use Aluguel_Veiculos;

create table Cliente(id bigint not null auto_increment,email varchar(30) not null, senha varchar(50) not null, cpf varchar(20) not null, nome varchar (50) not null,
telefone varchar(20) not null, sexo varchar(10) not null, nascimento varchar(10) not null, papel varchar(10) not null, primary key(id));

create table Loja(id bigint not null auto_increment, email varchar(30) not null, senha varchar(50) not null, cnpj varchar(20), nome varchar (50) not null, 
descricao varchar(120),primary key(id));

create table Veiculo(id bigint not null auto_increment, placa varchar(20) not null, modelo varchar(20) not null,
chassi varchar(17) not null, ano integer not null, quilometragem integer not null, descricao varchar(120) not null, 
valor float not null,id_loja bigint not null, primary key(id),foreign key(id_loja) references Loja(id));

create table Proposta(id_cliente bigint not null, id_loja bigint not null, id_veiculo bigint not null,
valor float not null, data date not null, primary key(id_cliente,id_loja,id_veiculo), 
foreign key(id_cliente) references Cliente(id),foreign key(id_loja) references Loja(id),
foreign key(id_veiculo) references Veiculo(id));

insert into Cliente(email,senha,cpf,nome,telefone,sexo,nascimento,papel) values ('cliente1@cliente1','cliente1','111.111.111-11',
'cliente1','1111111111','M','2000-01-01','USER');

insert into Loja(email,senha,cnpj,nome,descricao) values ('loja@loja1','loja1','111.111.111/0001-11','loja1','primeira loja');

insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Corsa','1A1A1111111111111',2005,1200000, 'primeiro carro',15000.0,1);
