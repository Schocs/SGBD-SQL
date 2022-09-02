create table cliente(
codigo serial	primary key not null,
nome varchar(50) not null,
cpf varchar(11) unique not null,
login varchar(20) unique not null,
senha varchar(10) not null,
email varchar(30) not null, 
nascimento date not null,
rua varchar(50) not null,
cep varchar(8) not null,
bairro varchar(30) not null,
numero varchar(10) not null,
cidade varchar(30) not null,
uf varchar(2) default 'RJ',
telefone varchar(11)
);




create table funcionario(
codigo serial primary key not null,
nome varchar(50) not null,
cpf varchar(11) unique not null,
salario float
);

create table categoria(
codigo	serial primary key not null,
nome varchar(50) not null
);



create table produto(
codigo serial primary key not null,
nome varchar(50) not null,
quantidade integer not null,
data_fabricacao date not null,
valor_unidade float,
data_cadastro date not null, 
cod_categoria integer,
foreign key (cod_categoria) references categoria(codigo)
);

create table cadastroProduto(
codigo serial primary key not null,
cod_funcionario integer,
cod_produto integer,
foreign key (cod_funcionario) references funcionario(codigo),
foreign key (cod_produto) references produto(codigo)
);


create table pedido(
codigo serial primary key not null,
data_pedido date not null,
codigo_cliente integer,
foreign key (codigo_cliente) references cliente(codigo)
);


create table produtoPedido(
codigo serial primary key not null,
quantidade integer,
codigo_pedido integer,
codigo_produto integer,
foreign key (codigo_pedido) references pedido(codigo),
foreign key (codigo_produto) references produto(codigo)
);


insert into cliente(nome, cpf, login, senha, email, nascimento, rua, cep, bairro, numero, cidade, uf, telefone) values
('João Pedro','17824378075', 'jotape', 'jotape10', 'jotape96@outlook.com', '1996-11-07', 'yeda', '25975890', 'Tijuca', '210', 'teresopolis', 'RJ', '21988584327'),
('Priscila', '12345678910', 'prizinha', 'pri10', 'pris2000@outlook.com', '2000-11-07', 'principal da rua 8', '25975243', 'Quitandinha', '21', 'Petropolis', 'RJ','21976563829'),
('Maria', '06412729717', 'marinha', 'mariaclara', 'maria@outlook.com', '1990-01-25', 'Rua Alfredo Timbira de Carvalho', '25975000', 'Centro', '298', 'Duque de Caxias', 'RJ','2127429900');

insert into cliente(nome, cpf, login, senha, email, nascimento, rua, cep, bairro, numero, cidade, uf) values
('Rafael','26345477623', 'rafinha10', 'rafas1234', 'rafapeoutlook.com', '1998-10-19', 'Delfim Moreira', '25975450', 'Varzea', '10', 'teresopolis', 'RJ'),
('Yuri', '34112576012', 'yurie', 'yuri1240', 'yurimesq@outlook.com', '1994-12-27', 'Avenida Francisco Torres', '24210223', 'Centro', '51', 'Nova Friburgo', 'RJ');

select * from cliente;

insert into funcionario(nome, cpf, salario) values
('Manoel Carvalho', '06412378220', 10500.33),
('Ayrton Barbosa', '14728397833', 2500.00),
('Jorge Lima', '17622378597', 7250.27),
('Maria Vasquez', '14423526617', 15000.45),
('Paula Pacheco', '21278896029', 4300.00);

select * from funcionario;

insert into categoria(nome) values
('Jardinagem'), ('Cama e Banho'), ('Cozinha'), ('Móveis'), ('Eletrodomésticos');

select * from categoria;

insert into produto(nome, quantidade, data_fabricacao, valor_unidade, data_cadastro, cod_categoria) values
('Regador de Jardim', 200, '2022-06-25', 54.99, '2022-08-26', 1),
('Jogo de lençol de casal 4 peças', 50, '2022-08-01', 109.99, '2022-08-26', 2),
('Panela de pressão elétrica preta - Eletrolux', 30, '2022-06-15', 649.99, '2022-08-26', 3),
('Escrivaninha inglesa em Jacarandá', 10, '2015-10-13', 15599.99, '2022-01-25', 4),
('Geladeira Smart French Door - Eletrolux', 23, '2022-05-15', 21999.99, '2022-06-13', 5);

select * from produto;

insert into cadastroProduto(cod_funcionario, cod_produto) values
(2, 1),
(2, 2),
(2, 3),
(5, 4),
(5, 5);

select*from cadastroproduto;

insert into pedido(data_pedido, codigo_cliente) values
('2022-08-26', 1), ('2022-08-26', 1), ('2022-08-26', 3), ('2022-08-26', 3), ('2022-08-26',5);

select * from pedido;

insert into produtopedido (quantidade, codigo_pedido, codigo_produto) values 
(2, 1, 1), (3, 2, 2), (1, 3, 5), (1, 4, 4), (2, 5, 3);

select * from produtoPedido;

/*
 *5-  2 SQLs de atualização:
a. Um SQL que mude o salário de todos os funcionários: eles
passarão a ganhar R$ 500,00 a mais; (5 pontos)
b. Um SQL que altere o email e o telefone de um cliente qualquer
cadastrado. (5 pontos)
*/
UPDATE funcionario 
SET salario = salario + 500;

select * from funcionario ;

update cliente
set email = 'emailatualizado@gmail.com' where codigo=1;
update cliente set telefone = 'telAtual' where codigo = 1;

select * from cliente c;

/*
 *6- SQL de exclusão, dos clientes que foram cadastrados sem o caractere
“@” no email ou que possuem uma senha com menos de 8 caracteres.
(5 pontos)
 * */

delete from cliente where length(senha)<8;

select * from cliente;

delete from cliente where email not like '%@%';


/*4 SQLs de consulta:
a. Uma consulta mostrando todos os produtos cadastrados, com o
nome da categoria e o nome do funcionário que o cadastrou; (5
pontos)
b. Uma consulta mostrando todos os pedidos feitos (sem os itens
do pedido), com o nome e telefone do cliente; (5 pontos)
c. Uma consulta mostrando todos os pedidos feitos, com seus
itens, mostrando: número do pedido, nome do cliente, data do
pedido, nome do produto comprado e a quantidade comprada
de cada produto; (5 pontos)
d. Uma consulta mostrando a quantidade de pedidos por cliente,
com resultado ordenado por nome do cliente, de modo
crescente. (5 pontos)*/

select nome.produto, nome.funcionario, nome.categoria 
from produto p inner join categoria c on p.cod_categoria=c.codigo 
inner join cadastroProduto cp on p.codigo=cp.cod_produto 
inner join funcionario f on cp.cod_funcionario=f.codigo;