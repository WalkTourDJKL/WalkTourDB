# WalkTourDB
Banco de dados para a WalkTour
    ![ImageOfDataBase](https://github.com/LucasGuerega/WalkTourDB/blob/main/Image_DataBase.jpg)Image Of DataBase for WalkTour
    <h1 align="center">
    <a>
        Descrição do banco de dados para a WalkTour
    </a>
</h1>
<p align="Left">
Banco de Dados: Walktour
Tabelas:
Hotel:

hotelId (INT, chave primária)
horaCheckin (TIME)
horaCheckout (TIME)
enderecoId (INT, chave estrangeira referenciando Endereco)
Cliente:

idHospede (INT, chave primária)
nome (VARCHAR(45))
nomeSocial (VARCHAR(45))
dtNasc (DATE)
cpf (VARCHAR(45))
enderecoId (INT, chave estrangeira referenciando Endereco)
Reserva:

idHospedagem (INT, chave primária)
formaPag (VARCHAR(45))
dataIn (DATE)
dataOut (DATE)
preco (FLOAT)
enderecoId (INT, chave estrangeira referenciando Endereco)
Quarto:

numQuarto (INT, chave primária)
horaLimpeza (TIME)
servicoQuarto (TINYINT)
tipoId (INT, chave estrangeira referenciando ModeloQuarto)
enderecoId (INT, chave estrangeira referenciando Endereco)
ModeloQuarto:

tipoId (INT, chave primária)
nomeModelo (VARCHAR(45))
qtdBanheiro (INT)
qtdCamas (INT)
frigobar (TINYINT)
servicoQuarto (TINYINT)
PontoTuristico:

pontoId (INT, chave primária)
horaAbre (TIME)
horaFecha (TIME)
preco (FLOAT)
enderecoId (INT, chave estrangeira referenciando Endereco)
Evento:

idEvento (INT, chave primária)
diaInicio (DATE)
diaFim (DATE)
horaInicio (TIME)
horaFim (TIME)
nomeEvento (VARCHAR(45))
preco (FLOAT)
enderecoId (INT, chave estrangeira referenciando Endereco)
Endereco:

enderecoId (INT, chave primária)
cep (VARCHAR(45))
cidade (VARCHAR(45))
estado (VARCHAR(45))
pais (VARCHAR(45))
Relacionamentos:
A tabela Hotel possui uma relação de composição com Quarto e uma relação de composição com Cliente.
A tabela Cliente tem uma relação de composição com Reserva.
A tabela Quarto possui uma relação de composição com ModeloQuarto.
A tabela PontoTuristico e Evento possuem uma relação de composição com Endereco.
Essa estrutura de banco de dados permite armazenar informações sobre hotéis, clientes, reservas, quartos, modelos de quartos, pontos turísticos, eventos e endereços, facilitando a gestão de um sistema de hotelaria e turismo. As relações entre as tabelas refletem a associação lógica entre os diferentes elementos do sistema.
</p>
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
    
</p>
