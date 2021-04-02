# Modelo Relacional


* Adress(id, street, neighborhood, zipcode, city, state, country, number);
* Author(id, name);
* Gender(id, name);
* Category(id, name);
* Publisher(id, name, cnpj, telephone, email, **cod_address**);
* Book(id, isbn, unity, title, subtitle, status, **cod_author**, **cod_publisher**, **cod_category**, **cod_gender**);
* Functionary(id, name, cpf, telephone, email, salary, **cod_address**);
* Operation(id, name, description, day, horary_start, horary_end, workload, **cod_functionary**, **cod_library**);
* Library(name, **cod_adress**);
* User(id, username, name, email, password, status, **cod_address**, **cod_library**);
* Loan(id, expedition, deadline, **cod_book**, **cod_user**);
* Session(id, name, **cod_category**, **cod_library**);
