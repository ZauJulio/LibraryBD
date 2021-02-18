# Dicionário de Dados
## Tabela: Operation

| Nome do campo         | Chave                | Tipo de dado | Descrição do Campo                                                | Tamanho do Campo(bytes) |
|-----------------------|----------------------|--------------|-------------------------------------------------------------------|-------------------------|
| id                    | Primária             | NUMERIC      | Identificador incremental do esquema de trabalho.                 | 4                       |
| day                   | NOT NULL             | NUMERIC      | Número correspondente ao dia da semana, Domingo - 1 : Sábado - 7. | 4                       |
| horary_start          | NOT NULL             | TIME         | Horário de abertura com time zone.                                | 12                      |
| horary_start          | NOT NULL             | TIME         | Horário de fechamento com time zone.                              | 12                      |
| workload              | NOT NULL             | NUMERIC      | Carga horário do funcionário.                                     | 4                       |
| operation_functionary | NOT NULL FOREIGN KEY |              | Referência para um ou vários funcionários.                        |                         |

## Tabela: Funcionário

| Nome do campo         | Chave            | Tipo de dado | Descrição do Campo                                   | Tamanho do Campo(bytes) |
|-----------------------|------------------|--------------|------------------------------------------------------|-------------------------|
| id                    | PRIMARY          | NUMERIC      | Identificador incremental do esquema de funcionário. | 4                       |
| name                  | NOT NULL         | CHAR[100]    | Nome, pode ser abreviado. Limite de 100 caracteres.  | 100                     |
| cpf                   | NOT NULL         | CHAR[14]     | CPF com formatação: XXX.XXX.XXX-XX                   | 14                      |
| telephone             | NOT NULL         | CHAR[14]     | Telefone com formatação: (XX)XXXXX-XXXX              | 14                      |
| email                 | NOT NULL         | CHAR[256]    | Email seguindo o limite padrão de 256 caracteres.    | 256                     |
| salary                | NOT NULL         | DOUBLE       | Salário em reais e centavos.                         | 8                       |
| functionary_operation | NOT NULL FOREIGN |              | Chave para um ou mais esquemas de trabalho.          |                         |
| functionary_adress    | NOT NULL FOREIGN |              | Chave para um endereço.                              |                         |

