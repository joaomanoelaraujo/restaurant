-- Usuário
CREATE TABLE Usuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Senha VARCHAR(255),
    Telefone VARCHAR(20),
    CPF VARCHAR(20),
    EnderecoID INT,
    FOREIGN KEY (EnderecoID) REFERENCES Endereco(ID)
);

-- Restaurante
CREATE TABLE Restaurante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Telefone VARCHAR(20),
    CategoriaEstadoID INT,
    Descricao TEXT,
    EnderecoID INT,
    Rate DECIMAL(3, 2),
    FOREIGN KEY (CategoriaEstadoID) REFERENCES CategoriaEstado(ID),
    FOREIGN KEY (EnderecoID) REFERENCES Endereco(ID)
);

-- Categoria Estado
CREATE TABLE CategoriaEstado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT
);

-- Categoria Produto
CREATE TABLE CategoriaProduto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT
);

-- Pedido
CREATE TABLE Pedido (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    RestauranteID INT,
    DataCriacao DATETIME,
    StatusPagamentoID INT,
    Descricao TEXT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID),
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(ID),
    FOREIGN KEY (StatusPagamentoID) REFERENCES StatusPagamento(ID)
);

-- Endereço
CREATE TABLE Endereco (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Rua VARCHAR(255),
    Bairro VARCHAR(255),
    Cidade VARCHAR(255),
    CEP VARCHAR(20),
    Numero INT,
    Complemento VARCHAR(255)
);

-- Produto
CREATE TABLE Produto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Preco DECIMAL(10, 2),
    Descricao TEXT,
    RestauranteID INT,
    CategoriaProdutoID INT,
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(ID),
    FOREIGN KEY (CategoriaProdutoID) REFERENCES CategoriaProduto(ID)
);

-- Adicional
CREATE TABLE Adicional (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProdutoID INT,
    Nome VARCHAR(255),
    Preco DECIMAL(10, 2),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ID)
);

-- Pagamento
CREATE TABLE Pagamento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    MetodoPagamentoID INT,
    Valor DECIMAL(10, 2),
    Data DATETIME,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID),
    FOREIGN KEY (MetodoPagamentoID) REFERENCES MetodoPagamento(ID)
);

-- Cupom
CREATE TABLE Cupom (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(255),
    Valor DECIMAL(10, 2),
    Validade DATE
);

-- Método Pagamento
CREATE TABLE MetodoPagamento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT
);

-- Funcionário
CREATE TABLE Funcionario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    RestauranteID INT,
    Cargo VARCHAR(255),
    Salario DECIMAL(10, 2),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID),
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(ID)
);

-- Favoritos
CREATE TABLE Favoritos (
    UsuarioID INT,
    RestauranteID INT,
    PRIMARY KEY (UsuarioID, RestauranteID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID),
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(ID)
);

-- Status Pagamento
CREATE TABLE StatusPagamento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT
);

-- Rate
CREATE TABLE Rate (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    RestauranteID INT,
    UsuarioID INT,
    Nota DECIMAL(3, 2),
    Data DATETIME,
    Descricao TEXT,
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(ID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID)
);

-- Histórico de Pedido
CREATE TABLE HistPedido (
    PedidoID INT,
    StatusPedidoID INT,
    DataMudanca DATETIME,
    PRIMARY KEY (PedidoID, StatusPedidoID),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID),
    FOREIGN KEY (StatusPedidoID) REFERENCES StatusPedido(ID)
);

-- Status Pedido
CREATE TABLE StatusPedido (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT
);
