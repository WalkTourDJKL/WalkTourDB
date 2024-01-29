Banco de dados para a sistema da WalkTour
    ![WalkTour](https://github.com/WalkTourDJKL/WalkTourDB/blob/main/logo.png)
    ![Em Desenvolvimento](https://img.shields.io/badge/Status-Em%20Desenvolvimento-blue)
## 📚 Descrição do banco de dados para a WalkTour
<p align="Left">
Banco de Dados: Walktour
Tabelas:
<p align="Left">  
Hotel:
hotelId (INT, chave primária)
horaCheckin (TIME)
horaCheckout (TIME)
enderecoId (INT, chave estrangeira referenciando Endereco)
</p>
<p align="Left">
Cliente:
idHospede (INT, chave primária)
nome (VARCHAR(45))
nomeSocial (VARCHAR(45))
dtNasc (DATE)
cpf (VARCHAR(45))
enderecoId (INT, chave estrangeira referenciando Endereco)
</p>
<p align="Left">
Reserva:
idHospedagem (INT, chave primária)
formaPag (VARCHAR(45))
dataIn (DATE)
dataOut (DATE)
preco (FLOAT)
enderecoId (INT, chave estrangeira referenciando Endereco)
</p>
<p align="Left">
Quarto:
numQuarto (INT, chave primária)
horaLimpeza (TIME)
servicoQuarto (TINYINT)
tipoId (INT, chave estrangeira referenciando ModeloQuarto)
enderecoId (INT, chave estrangeira referenciando Endereco)
</p>
<p align="Left">    
ModeloQuarto:
tipoId (INT, chave primária)
nomeModelo (VARCHAR(45))
qtdBanheiro (INT)
qtdCamas (INT)
frigobar (TINYINT)
servicoQuarto (TINYINT)
</p>
<p align="Left">    
PontoTuristico:
pontoId (INT, chave primária)
horaAbre (TIME)
horaFecha (TIME)
preco (FLOAT)
enderecoId (INT, chave estrangeira referenciando Endereco)
</p>
<p align="Left">    
Evento:
idEvento (INT, chave primária)
diaInicio (DATE)
diaFim (DATE)
horaInicio (TIME)
horaFim (TIME)
nomeEvento (VARCHAR(45))
preco (FLOAT)
enderecoId (INT, chave estrangeira referenciando Endereco)
</p>
<p align="Left">
Endereco:
enderecoId (INT, chave primária)
cep (VARCHAR(45))
cidade (VARCHAR(45))
estado (VARCHAR(45))
pais (VARCHAR(45))
</p>
<p align="Left">
Relacionamentos:
A tabela Hotel possui uma relação de composição com Quarto e uma relação de composição com Cliente.
A tabela Cliente tem uma relação de composição com Reserva.
A tabela Quarto possui uma relação de composição com ModeloQuarto.
A tabela PontoTuristico e Evento possuem uma relação de composição com Endereco.
Essa estrutura de banco de dados permite armazenar informações sobre hotéis, clientes, reservas, quartos, modelos de quartos, pontos turísticos, eventos e endereços, facilitando a gestão de um sistema de hotelaria e turismo. As relações entre as tabelas refletem a associação lógica entre os diferentes elementos do sistema.
</p>
</p>

![ImageOfDataBase](https://github.com/LucasGuerega/WalkTourDB/blob/main/img_der_WalkTourDB.png)Imagem do banco de dados para a WalkTour
<h1 align="center">
    <a>
        Participantes
    </a>
</h1>
<p align="Left">
    👨‍💻Douglas Eduardo Fernandes;
</p>
<p align="Left">
    👨‍💻José Paulo Baptista;
</p>
<p align="Left">
    👩‍💻Kemily Cristina Schmidt de Oliveira;
</p>
<p align="Left">
    💻🐒Lucas Guerega;
</p>
<h1 align="center">
    <a>
        Outras informações do WalkTour Banco de Dados
    </a>
</h1>
<p align="Left">
    *Este banco de dados foi feito no modelo relacional utilizando a linguagem SQL*
</p>
