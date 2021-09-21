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
values ('AAA0-7473', 'Corsa','1A1A1111111111111',2005,1200000, 'primeiro carro',7547,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Fusca','1A1A1111111111111',2005,54642562, 'primeiro carro',6456,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Uno','1A1A1111111111111',2005,563, 'primeiro carro',6346,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Palio','1A1A1111111111111',2005,456, 'primeiro carro',2626,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Monza','1A1A1111111111111',2005,2456, 'primeiro carro',457457,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Kombi','1A1A1111111111111',2005,8568, 'primeiro carro',96796,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Corolla','1A1A1111111111111',2005,237, 'primeiro carro',7567,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Ka','1A1A1111111111111',2005,96766, 'primeiro carro',375737,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Focus','1A1A1111111111111',2005,7357, 'primeiro carro',756756,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'F50','1A1A1111111111111',2005,96967, 'primeiro carro',7657567,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'R8','1A1A1111111111111',2005,24626, 'primeiro carro',234243,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'RX-7','1A1A1111111111111',2005,780, 'primeiro carro',34534534,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Camaro','1A1A1111111111111',2005,1345, 'primeiro carro',786868,1);

