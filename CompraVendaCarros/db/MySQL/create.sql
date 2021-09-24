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
valor float not null, data_p varchar(10) not null, estado varchar(10) not null, primary key(id_cliente,id_loja,id_veiculo), 
foreign key(id_cliente) references Cliente(id),foreign key(id_loja) references Loja(id),
foreign key(id_veiculo) references Veiculo(id));

insert into Cliente(email,senha,cpf,nome,telefone,sexo,nascimento,papel) values ('cliente1@gmail.com','cliente1','111.111.111-11',
'cliente1','1111111111','M','2000-01-01','USER');
insert into Cliente(email,senha,cpf,nome,telefone,sexo,nascimento,papel) values ('cliente2@gmail.com','cliente2','222.222.222-11',
'cliente2','3543543455','F','1989-01-01','USER');

insert into Cliente(email,senha,cpf,nome,telefone,sexo,nascimento,papel) values ('admin','admin','cpf_admin',
'admin01','12345678','M','1997-08-20','ADMIN');

insert into Loja(email,senha,cnpj,nome,descricao) values ('loja1@gmail.com','loja1','111.111.111/0001-11','loja1','primeira loja');
insert into Loja(email,senha,cnpj,nome,descricao) values ('loja2@gmail.com','loja2','222.222.222/0001-11','loja2','segunda loja');
insert into Loja(email,senha,cnpj,nome,descricao) values ('loja3@gmail.com','loja3','333.333.333/0001-11','loja3','terceira loja');

insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('AAA0-7473', 'Corsa','1A1A1111111111111',2005,1200000, 'primeiro carro',7547,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('WTBW-7473', 'Fusca','5643563563456346',2009,54642562, '2 carro',6456,2);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('RBWT-7473', 'Uno','345634564356346',2007,563, '3 carro',6346,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('RWTBRW-7473', 'Palio','7547458548764',2005,456, '4 carro',2626,2);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('WREB-7473', 'Monza','25645636465456',2005,2456, '5 carro',4457,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('RTJN-7473', 'Kombi','34563476765477',2005,8568, '6 carro',9696,2);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('NQEA-7473', 'Corolla','134513253656456',2005,237, '7 carro',7567,3);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('KYTRT-7473', 'Ka','096068784784563',2005,96766, '8 carro',3737,3);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('HEBBT-7473', 'Focus','257564769897897',2005,7357, '9 carro',7756,3);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('ERBVE-7473', 'F50','24575687686786',2005,96967, '10 carro',750067,3);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('EQB-7473', 'R8','25765878976536546',2005,24626, '11 carro',224003,3);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('BEBE-7473', 'RX-7','175785635744747',2005,780, '12 carro',34034,1);
insert into Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja) 
values ('EBRH-7473', 'Camaro','54562575734747',2005,1345, '13 carro',78868,1);

insert into Proposta(id_cliente,id_loja,id_veiculo, valor,data_p, estado) values (1,1,1,4366,'2021-09-23', 'ABERTO');
insert into Proposta(id_cliente,id_loja,id_veiculo, valor,data_p, estado) values (1,1,3,8663,'2021-09-23', 'ACEITO');
insert into Proposta(id_cliente,id_loja,id_veiculo, valor,data_p, estado) values (2,2,2,1543,'2021-09-23', 'ABERTO');
insert into Proposta(id_cliente,id_loja,id_veiculo, valor,data_p, estado) values (2,1,3,4255,'2021-09-23', 'NÃO ACEITO');



