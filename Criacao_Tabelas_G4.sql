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
cod_categoria integer
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
foreign key (codigo_cliente) references cliente(codigo),
quantidade integer
);

create table produtoPedido(
codigo serial primary key not null,
codigo_pedido integer,
codigo_produto integer,
foreign key (codigo_pedido) references pedido(codigo),
foreign key (codigo_produto) references produto(codigo)
);
