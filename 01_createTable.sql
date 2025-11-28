-- Tabela Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    ID_Cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    CNPJ TEXT,
    Endereco TEXT,
    Telefone TEXT
);

-- Tabela Motorista
CREATE TABLE IF NOT EXISTS Motorista (
    ID_Motorista INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    CPF TEXT,
    CNH TEXT,
    Categoria_CNH TEXT,
    Telefone TEXT
);

-- Tabela Veiculo
CREATE TABLE IF NOT EXISTS Veiculo (
    ID_Veiculo INTEGER PRIMARY KEY AUTOINCREMENT,
    Placa TEXT NOT NULL,
    Modelo TEXT,
    Capacidade_Peso REAL,
    Capacidade_Volume REAL,
    Status TEXT CHECK (Status IN ('DISPONIVEL', 'MANUTENCAO', 'EM_VIAGEM')),
    ID_Motorista INTEGER,
    FOREIGN KEY (ID_Motorista) REFERENCES Motorista(ID_Motorista)
);

-- Tabela Pedido
CREATE TABLE IF NOT EXISTS Pedido (
    ID_Pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    Endereco_Coleta TEXT,
    Data_Hora_Coleta TEXT,
    Observacoes TEXT,
    ID_Cliente INTEGER,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabela Carga
CREATE TABLE IF NOT EXISTS Carga (
    ID_Carga INTEGER PRIMARY KEY AUTOINCREMENT,
    Descricao TEXT,
    Peso REAL,
    Volume REAL,
    ID_Pedido INTEGER,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

-- Tabela Rota
CREATE TABLE IF NOT EXISTS Rota (
    ID_Rota INTEGER PRIMARY KEY AUTOINCREMENT,
    Origem TEXT,
    Destino TEXT,
    Distancia REAL,
    Tempo_Estimado INTEGER,
    ID_Carga INTEGER,
    FOREIGN KEY (ID_Carga) REFERENCES Carga(ID_Carga)
);

-- Tabela Entrega
CREATE TABLE IF NOT EXISTS Entrega (
    ID_Entrega INTEGER PRIMARY KEY AUTOINCREMENT,
    Data_Estimada TEXT,
    Data_Real TEXT,
    Comprovante_Entrega TEXT,
    ID_Carga INTEGER,
    FOREIGN KEY (ID_Carga) REFERENCES Carga(ID_Carga)
);

-- Tabela CTe 
CREATE TABLE IF NOT EXISTS CTe (
    ID_CTe INTEGER PRIMARY KEY AUTOINCREMENT,
    Numero_CTe TEXT,
    Data_Emissao TEXT,
    Valor_Frete REAL,
    Forma_Pagamento INTEGER,
    ID_Carga INTEGER,
    ID_Veiculo INTEGER,
    FOREIGN KEY (ID_Carga) REFERENCES Carga(ID_Carga),
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo(ID_Veiculo)
);

-- Tabela Veiculo_Motorista
CREATE TABLE IF NOT EXISTS Veiculo_Motorista (
    ID_Veiculo_Motorista INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Veiculo INTEGER,
    ID_Motorista INTEGER,
    CR TEXT,
    Data_Inicio TEXT,
    Data_Final TEXT,
    Condicao TEXT,
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo(ID_Veiculo),
    FOREIGN KEY (ID_Motorista) REFERENCES Motorista(ID_Motorista)
);
