# Modelo Relacional


* Library(**library_operation**, **library_user**, **library_session**);
* Session(id, **session_category**);
* Category(id, **category_book**);
* Functionary(id, name, cpf, telephone, email, salary, **functionary_adress**, **functionary_operation**);
* Operation(id, day, horary, workload, **operation_library**, **operation_functionary**);
* User(id, username, name, email, registration, password, status, **user_adress**, **user_loan**);
* Adress(id, street, neighborhood, zipcode, city, state, country);
* Book(id, isbn, unity, title, subtitle, status, gender, **book_author**, **book_publisher**, **book_category**, **book_loan**);
* Gender(id, name);
* Publisher(id, name, cnpj, telephone, email);
* Author(id, name);
* Loan(id, expedition, deadline, **loan_book**);
