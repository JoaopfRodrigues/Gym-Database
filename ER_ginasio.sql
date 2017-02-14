DROP TABLE CASCADE CONSTRAINTS nivel_socios;

CREATE TABLE nivel_socios (
    nome_nivel VARCHAR2(30) NOT NULL,
    PRIMARY KEY(nome_nivel)
);

DROP TABLE socios;

CREATE TABLE socios (
    n_socio NUMBER(9),
    nome_nivel VARCHAR2(30) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    data_nas DATE NOT NULL,
    data_ins DATE NOT NULL,
    data_term DATE NOT NULL,
    telefone NUMBER(9) NOT NULL,
    morada VARCHAR2(30) NOT NULL,
    nome VARCHAR2(30) NOT NULL,
    PRIMARY KEY(n_socio),
    FOREIGN KEY(nome_nivel) REFERENCES nivel_socios(nome_nivel)
    CONSTRAINT TEST_MAIL_SOCIOS CHECK "@" in email
);

DROP TABLE nome_funcao;

CREATE TABLE nome_funcao (
    nome_funcao VARCHAR2(30),
    PRIMARY KEY (nome_funcao)
);

DROP TABLE empregados;

CREATE TABLE empregados (
    n_empregado NUMBER,
    nome_funcao VARCHAR2(30) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    data_nas DATE NOT NULL,
    telefone NUMBER(9) NOT NULL,
    morada VARCHAR2(30) NOT NULL,
    nome VARCHAR2(30) NOT NULL,
    PRIMARY KEY(n_empregado),
    FOREIGN KEY (nome_funcao) REFERENCES nome_funcao(nome_funcao)
    CONSTRAINT TEST_MAIL_EMPREGADOS CHECK "@" in email
);

DROP TABLE professores;

CREATE TABLE professores (
    n_professor NUMBER(9),
    email VARCHAR2(30) NOT NULL,
    data_nas DATE NOT NULL,
    telefone NUMBER(9) NOT NULL,
    morada VARCHAR2(30) NOT NULL,
    nome VARCHAR2(30) NOT NULL,
    certificado NUMBER NOT NULL,
    PRIMARY KEY(n_professor),
    CONSTRAINT TEST_MAIL_PROFESSORES CHECK "@" in email
);

DROP TABLE tipo_aula;

CREATE TABLE tipo_aula (
  nome_aula VARCHAR2(20),
  PRIMARY KEY(nome_aula)
);

DROP TABLE aulas;

CREATE TABLE aulas (
    n_aula NUMBER,
    nome_aula VARCHAR2(20) NOT NULL,
    data DATE NOT NULL,
    duracao INTERVAL DAY(1) TO SECOND NOT NULL,
    capacidade NUMBER(2) NOT NULL,
    PRIMARY KEY(n_aula),
    FOREIGN KEY(nome_aula) REFERENCES tipo_aula(nome_aula),
);

DROP TABLE nao_socio;

CREATE TABLE nao_socio (
    n_aula NUMBER,
    telefone NUMBER(9) NOT NULL,
    PRIMARY KEY(n_aula, telefone),
    FOREIGN KEY(n_aula) REFERENCES aulas(n_aula)
);

DROP TABLE leciona;

CREATE TABLE leciona (
    n_professor NUMBER(9),
    n_aula NUMBER,
    PRIMARY KEY(n_professor, n_aula),
    FOREIGN KEY(n_professor) REFERENCES professores(n_professor),
    FOREIGN KEY(n_aula) REFERENCES aulas(n_aula)
);

DROP TABLE inscreve;

CREATE TABLE inscreve (
    n_socio NUMBER(9),
    n_aula NUMBER,
    PRIMARY KEY(n_socio, n_aula),
    FOREIGN KEY(n_socio) REFERENCES socios(n_socio),
    FOREIGN KEY(n_aula) REFERENCES aulas(n_aula)
);

DROP TABLE salas;

CREATE TABLE salas (
    n_sala NUMBER,
    tipo_sala VARCHAR2(20),
    PRIMARY KEY(n_sala)
);

DROP TABLE localiza_se;

CREATE TABLE localiza_se (
    n_aula NUMBER,
    n_sala NUMBER,
    PRIMARY KEY(n_aula, n_sala),
    FOREIGN KEY(n_aula) REFERENCES aulas(n_aula),
    FOREIGN KEY(n_sala) REFERENCES salas(n_sala)
);
