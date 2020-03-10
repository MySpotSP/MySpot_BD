Create database Estacionamento;
drop table Sensor;
create table Sensor (
    ID_sensor int primary key auto_increment,
	Vaga boolean not null,
    Rua varchar (40),
    Bairro varchar (20),
    CEP varchar (20),
    Localizador_GPS varchar (100) not null
);

insert into Sensor (Vaga, Rua, Bairro, CEP, Localizador_GPS) values
    (false, 'Rua Haddock Lobo', 'Cerqueira César', '01414-001', '-23.558010, -46.661676');

-- Quando 'Vaga' Mudar de True para False ou vice-versa, a data e hora da mudança são inseridos em 'dados_sensor'--

select * from sensor;

drop table dados_sensor;
Create table dados_sensor (
    ID_row int primary key auto_increment,
    fk_IdSensor int,
    foreign key(fk_IdSensor)
    references Sensor (ID_sensor),
    Dia date not null,
    Horário time (1) not null	
) auto_increment = 10000;

insert into dados_sensor (fk_IdSensor, Dia, Horário) values
    (1, 20200227, 143945);
    
insert into dados_sensor (fk_IdSensor, Dia, Horário) values
     (20200227, 143945);

select * from dados_sensor;

create table Clientes (
    Nome_Cliente char (30) not null,
    Data_nascimento date not null,
    CPF char (20) primary key,
    CNH char (12) not null,
    Email varchar (40) not null,
    Telefone char (20) not null,
    Deficiência boolean not null,
    Tipo_deficiência char (30) not null
    );

 -- Se 'Deficiência' for verdadeira, o aplicativo exibe os sensores para deficientes--    
 
 insert into Clientes values
     ('Guilherme Alves Ferreira', 20010702, 45187602802, 1234567890, 'guilherme99908@gmail.com', 11941448998, false, null);
     
select * from Sensor, dados_sensor where fk_IdSensor = ID_sensor;

select * from Clientes;