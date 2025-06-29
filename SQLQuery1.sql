CREATE TABLE Alunos (
    IDAluno INT  PRIMARY KEY,
    Nome VARCHAR(100),
    Turma VARCHAR(20),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE CategoriasItem (
    IDCategoria INT  PRIMARY KEY,
    NomeCategoria VARCHAR(100),
    DescricaoCategoria VARCHAR(255)
);

CREATE TABLE Itens (
    IDItem INT  PRIMARY KEY,
    NomeItem VARCHAR(100),
    Descricao VARCHAR(255),
    EstadoConservacao VARCHAR(50),
    IDCategoria INT,
    DataCadastro DATETIME,
    FotoItem VARCHAR(255),
    FOREIGN KEY (IDCategoria) REFERENCES CategoriasItem(IDCategoria)
);

CREATE TABLE Transacoes (
    IDTransacao INT  PRIMARY KEY,
    IDItem INT,
    IDAlunoDoador INT,
    IDAlunoReceptor INT,
    DataTransacao DATETIME,
    TipoTransacao VARCHAR(20),
    FOREIGN KEY (IDItem) REFERENCES Itens(IDItem),
    FOREIGN KEY (IDAlunoDoador) REFERENCES Alunos(IDAluno),
    FOREIGN KEY (IDAlunoReceptor) REFERENCES Alunos(IDAluno)
);

CREATE TABLE Eventos (
    IDEvento INT identity(1,1) PRIMARY KEY,
    NomeEvento VARCHAR(100),
    DescricaoEvento VARCHAR(255),
    DataEvento DATETIME,
    LocalEvento VARCHAR(100)
);

CREATE TABLE ConvitesEvento (
    IDConvite INT identity(1,1) PRIMARY KEY,
    IDEvento INT,
    IDAlunoConvidado INT,
    StatusConvite varchar(30),
    DataEnvio DATETIME,
    FOREIGN KEY (IDEvento) REFERENCES Eventos(IDEvento),
    FOREIGN KEY (IDAlunoConvidado) REFERENCES Alunos(IDAluno)
);

CREATE TABLE Usuarios (
    IDUsuario INT identity(1,1) PRIMARY KEY,
    NomeLogin VARCHAR(50),
    Senha VARCHAR(50),
    Perfil VARCHAR(20)
);