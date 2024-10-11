CREATE DATABASE estoque;

CREATE TABLE public.clientes (
	id bigserial NOT NULL,
	nome varchar(255) NOT NULL,
	cpf varchar(14) NULL,
	cnpj varchar(18) NULL,
	email varchar(255) NOT NULL,
	telefone varchar(11) NOT NULL,
	logradouro varchar(100) NOT NULL,
	numero varchar(10) NOT NULL,
	complemento varchar(50) NULL,
	bairro varchar(50) NOT NULL,
	cidade varchar(50) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT clientes_cnpj_unique UNIQUE (cnpj),
	CONSTRAINT clientes_cpf_unique UNIQUE (cpf),
	CONSTRAINT clientes_email_unique UNIQUE (email),
	CONSTRAINT clientes_pkey PRIMARY KEY (id)
);

CREATE TABLE public.produtos (
	id bigserial NOT NULL,
	nome varchar(255) NOT NULL,
	quantidade numeric(8, 2) NOT NULL,
	preco numeric(8, 2) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT produtos_pkey PRIMARY KEY (id)
);

CREATE TABLE public.usuarios (
	id bigserial NOT NULL,
	login varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);

CREATE TABLE public.compras (
	id bigserial NOT NULL,
	usuario_id int8 NOT NULL,
	cliente_id int8 NOT NULL,
	produto_id int8 NOT NULL,
	quantidade numeric(8, 2) NOT NULL,
	preco numeric(8, 2) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT compras_pkey PRIMARY KEY (id),
	CONSTRAINT compras_cliente_id_foreign FOREIGN KEY (cliente_id) REFERENCES public.clientes(id),
	CONSTRAINT compras_produto_id_foreign FOREIGN KEY (produto_id) REFERENCES public.produtos(id),
	CONSTRAINT compras_usuario_id_foreign FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id)
);

CREATE TABLE public.vendas (
	id bigserial NOT NULL,
	usuario_id int8 NOT NULL,
	cliente_id int8 NOT NULL,
	produto_id int8 NOT NULL,
	quantidade numeric(8, 2) NOT NULL,
	preco_venda numeric(8, 2) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT vendas_pkey PRIMARY KEY (id),
	CONSTRAINT vendas_cliente_id_foreign FOREIGN KEY (cliente_id) REFERENCES public.clientes(id),
	CONSTRAINT vendas_produto_id_foreign FOREIGN KEY (produto_id) REFERENCES public.produtos(id),
	CONSTRAINT vendas_usuario_id_foreign FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id)
);

INSERT INTO public.usuarios (login,"password",created_at,updated_at) VALUES
	 ('op1','op1',NULL,NULL),
	 ('op2','op2',NULL,NULL);

INSERT INTO public.clientes (nome,cpf,cnpj,email,telefone,logradouro,numero,complemento,bairro,cidade,created_at,updated_at) VALUES
 	 ('John Doe','123.456.789-00',NULL,'johndoe@example.com','1234567890','123 Main St','100','Apt 1','Downtown','Metropolis',NULL,NULL),
 	 ('Jane Smith',NULL,'12.345.678/0001-00','janesmith@example.com','0987654321','456 Elm St','200',NULL,'Uptown','Gotham',NULL,NULL);

INSERT INTO public.produtos (nome,quantidade,preco,created_at,updated_at) VALUES
	 ('Banana',100.00,5.00,NULL,NULL),
	 ('Laranja',500.00,2.00,NULL,NULL),
	 ('Manga',800.00,4.00,NULL,NULL);

INSERT INTO public.vendas (usuario_id,cliente_id,produto_id,quantidade,preco_venda,created_at,updated_at) VALUES
	 (1,1,1,10.00,50.00,NULL,NULL),
	 (2,2,2,20.00,40.00,NULL,NULL);

INSERT INTO public.compras (usuario_id,cliente_id,produto_id,quantidade,preco,created_at,updated_at) VALUES
	 (1,1,1,5.00,25.00,NULL,NULL),
	 (2,2,2,10.00,20.00,NULL,NULL);
