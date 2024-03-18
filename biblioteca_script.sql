create database biblioteca;

create table cliente (
	cli_id int primary key auto_increment,
    cli_nome varchar(100) not null,
    cli_contato varchar(50) not null,
    cli_cpf varchar(50) not null,
    cli_cep varchar(50) not null,
    cli_cidade varchar(50),
    cli_rua varchar(50),
    cli_bairro varchar(50),
    cli_numero int,
    cli_total_alugados int
);

create table forma_pagamento (
	pag_id int primary key auto_increment,
    pag_nome varchar(50) not null
);

create table funcionario (
	func_id int primary key auto_increment,
    func_nome varchar(50) not null
);

create table autor (
	aut_id int primary key auto_increment,
    aut_nome varchar(100)
);

create table editora (
	edi_id int primary key auto_increment,
    edi_nome varchar(50) not null,
	edi_contato varchar(50) not null not null,
    edi_cnpj varchar(50) not null not null,
    edi_cep varchar(50) not null,
    edi_cidade varchar(50),
    edi_rua varchar(50),
    edi_bairro varchar(50),
    edi_numero int
);

create table livro (
	liv_id int primary key auto_increment,
	liv_nome varchar(100),
    liv_fk_autor int not null,
    foreign key (liv_fk_autor) references autor(aut_id),
    liv_data_pub date,
    liv_num_paginas int,
    liv_isbn varchar(20),
    liv_fk_editora int not null,
    foreign key (liv_fk_editora) references editora(edi_id),
    liv_valor_aluguel float not null
);

create table genero (
	gen_id int primary key auto_increment,
    gen_nome varchar (50)
);

create table livro_genero (
	livgen_id int primary key auto_increment,
    livgen_fk_livro int not null,
    foreign key (livgen_fk_livro) references livro (liv_id),
    livgen_fk_genero int not null,
    foreign key (livgen_fk_genero) references genero (gen_id)
);

create table aluguel (
	alu_id int primary key auto_increment,
    alu_data_retirada date,
    alu_data_entrega date,
    alu_fk_forma_pagamento int,
    alu_total float(10,2) not null,
    alu_parcelas int not null,
    alu_obs_entrega varchar(200),
    alu_fk_cliente int not null,
    foreign key (alu_fk_cliente) references cliente(cli_id),
    foreign key (alu_fk_forma_pagamento) references forma_pagamento(pag_id)
);

create table aluguel_livro (
	aluliv_id int primary key auto_increment,
    aluliv_fk_aluguel int not null,
    aluliv_fk_livro int not null,
    aluliv_valor float not null,
    foreign key (aluliv_fk_aluguel) references aluguel(alu_id),
    foreign key (aluliv_fk_livro) references livro(liv_id)
);

create table recebimento (
	rec_id int primary key auto_increment,
    rec_fk_pag int not null,
    foreign key (rec_fk_pag) references forma_pagamento(pag_id),
    rec_fk_aluguel int not null,
    rec_data date not null,
    rec_valor float not null
);

