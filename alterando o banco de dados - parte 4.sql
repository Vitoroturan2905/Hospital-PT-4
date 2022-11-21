create database testeHosp;
use testeHosp;

create table if not exists consultas( 
id_consulta int (200) not null auto_increment unique, 
data_consulta date not null, 
horario_consulta int (6) not null,
paciente_consulta varchar (200) not null,
medico_resp varchar (200) not null,
valor_consulta float (10) not null,
primary key (id_consulta)
);

create table if not exists quarto( 
id_quarto int(100)not null auto_increment unique, 
numero_quarto int(100)not null, 
tipo_quarto varchar(100) not null, 
paciente int(100)not null ,
primary key(id_quarto,numero_quarto), 
foreign key (paciente) references medicos(id_medico) 
);

create table if not exists internaçao( 
id_internacao int (100)not null auto_increment unique, 
nome_paciente varchar(100)not null, 
data_efetivada date not null, 
data_entrada date not null, 
data_alta date not null, 
procedimento varchar(100)not null, 
enfermeiro int(100)not null , 
medico int(100) not null , 
paciente int(100)not null ,
primary key(id_internacao), 
foreign key (enfermeiro)references enfermeiro(id_enfermeiro), 
foreign key(medico)references medicos(id_medico), 
foreign key(paciente)references pacientes(id_aciente)
);

create table if not exists receitas( 
id_receita int (200) not null auto_increment unique, 
nome_remedio varchar(200)not null, 
quantidade_remedio int(200)not null, 
hora_remedio int(6)not null, 
tipo_remedio varchar(200)not null,
primary key(id_receita)
);

create table if not exists convenios( 
id_convenio int(200)not null auto_increment unique, 
nome_convenio varchar(200)not null, 
cnpj_convenio int(100)not null unique, 
tempo_carencia int(200)not null, 
paciente int(200)not null,
primary key(id_convenio,cnpj_convenio),
foreign key(paciente) references medicos(id_medico)
);

create table if not exists medicos ( 
id_medico int (100)not null auto_increment unique, 
nome_medico varchar(200)not null, 
crm_medico int(200) not null unique, 
tipo_medico int(200) not null,
receita_medico int(200) not null, 
consulta_medico int(100)not null unique,
primary key (id_medico), 
foreign key(receita_medico) references receitas(id_receita), 
foreign key(consulta_medico)references consultas(id_consulta)
);



create table if not exists enfermeiro(
cpf_enfermeiro int(11)not null unique, 
cre_enfermeiro int(100)not null unique, 
id_enfermeiro int(100)not null auto_increment unique, 
nome_enfermeiro varchar(100)not null,
primary key(id_enfermeiro) 
);

create table if not exists tipoquarto( valor_quarto float(10)not null, 
id_tipoquarto int(100)not null auto_increment unique, 
descrição_quarto varchar(100)not null, 
tipo_quarto int(100)not null,
primary key(id_tipoquarto)
);

create table if not exists pacientes( 
id_paciente int(200)not null auto_increment unique, 
nome_paciente varchar(200)not null, 
endereço_paciente varchar(200)not null, 
datanascimento_paciente date not null, 
cpf_paciente int(100)not null unique, 
email_paciente varchar(200)not null, 
consulta_paciente int(100) not null unique , 
receita_paciente int(100)not null, 
conevenio_paciente int(100)not null, 
quarto_paciente int(100)not null,
primary key(id_paciente)
);

create table if not exists especialidades( 
especialidade varchar(200), 
medico int(100), 
id_especialidades int(100) unique auto_increment,
primary key(id_especialidades), 
foreign key (medico) references medicos(id_medico)
);

create table if not exists apartamentos( 
id_apartamento int(100)unique not null auto_increment, 
numero_apartamento int(100)unique not null, paciente int(100)not null,
foreign key(paciente)references pacientes(aciente_id), 
primary key(id_apartamento)
);

create table if not exists enfermarias( 
id_enfermaria int(100) unique not null auto_increment, 
numero_enfermaria int(100)unique not null, 
paciente int(100)not null,
primary key(id_enfermaria), 
foreign key(paciente)references pacientes(aciente_id)
);

create table if not exists quartos_duplos( 
id_quartosduplos int(100)not null auto_increment unique, 
numero_quartosduplos int(100)not null unique, 
paciente int(100)not null 
);

insert into medicos(
id_medico,nome_medico,
crm_medico,
tipo_medico,
receita_medico,
especialidade_medico,
consulta_medico) 
values(
1,"vitor",2558,"geriatra",1,"cardio",1);

insert into receitas(
id_receita,
nome_remedio,
quantidade_remedio,
hora_remedio,
tipo_remedio,
medico_receitas)
values(1,"silvio",10,10-20-05,"forte",1);

insert into pacientes(
id_paciente,
nome_paciente,
endereço_paciente,
datanascimento_paciente,
cpf_paciente,
email_paciente,
consulta_paciente,
receita_paciente,
conevenio_paciente,
quarto_paciente,
internaçao_paciente,
enfermeiro_paciente) 
values(10,"vitor","travessa estrada",'20-06-10',45454545,"dhgdyg@gmail.com",11,2,1,2,1,1);

insert into consultas( 
data_consulta,
hora_consulta,
valor_consulta, 
consulta_paciente, 
medico_consulta) 
values('04-01-18',10,100,7,1);

insert into enfermeiro(
cpf_enfermeiro,
cre_enfermeiro,
nome_enfermeiro)
values(317524170,3054,"jhonatan");

insert into quarto(
numero_quarto,
tipo_quarto,
paciente)
values(30,"subsolo",18);

insert into internaçao(
data_efetivada,
data_entrada,
data_alta,
procedimento,
enfermeiro,
medico,
paciente,
quarto) 
values('19-01-15','03,12,15','05-12-20',"wlwlwlwl",5,7,22,5);

insert into convenios(
nome_convenio,
cnpj_convenio,
tempo_carencia,
paciente,
consulta)
values("aoakoako",23522523,2,35,43);

insert into especialidades(
especialidade,
medico)
values("ancologista",9);

alter table medicos add column em_atividade varchar(100);
UPDATE testeHosp.medicos SET em_atividade = 'atuando' WHERE (id_medico = '15'); 
UPDATE testeHosp.medicos SET em_atividade = 'atuando' WHERE (id_medico = '14'); 
UPDATE testeHosp.medicos SET em_atividade = 'atuando' WHERE (id_medico = '10'); 
UPDATE testeHosp.medicos SET em_atividade = 'atuando' WHERE (id_medico = '12'); 
UPDATE testeHosp.medicos SET em_atividade = 'atuando' WHERE (id_medico = '9'); 
UPDATE testeHosp.medicos SET em_atividade = 'ausente' WHERE (id_medico = '7'); 
UPDATE testeHosp.medicos SET em_atividade = 'ausente' WHERE (id_medico = '4'); 
UPDATE testeHosp.medicos SET em_atividade = 'ausente' WHERE (id_medico = '3'); 
UPDATE testeHosp.medicos SET em_atividade = 'ausente' WHERE (id_medico = '2'); 
UPDATE testeHosp.medicos SET em_atividade = 'ausente' WHERE (id_medico = '1');
