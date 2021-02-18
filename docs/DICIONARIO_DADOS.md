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
