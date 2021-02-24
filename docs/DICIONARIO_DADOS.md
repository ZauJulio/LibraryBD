# Data dictionary

## Table: Operation

| Field name            | Key                  | Data type | Field Description                                                      | Field Size (bytes) |
| --------------------- | -------------------- | --------- | ---------------------------------------------------------------------- | ------------------ |
| id                    | NOT NULL PRIMARY     | NUMERIC   | Incremental identifier of the work scheme.                             | 4                  |
| day                   | NOT NULL             | NUMERIC   | Number corresponding to the day of the week, Sunday - 1: Saturday - 7. | 4                  |
| horary_start          | NOT NULL             | TIME      | Opening hours with time zone.                                          | 12                 |
| horary_end            | NOT NULL             | TIME      | Closing time with time zone.                                           | 12                 |
| workload              | NOT NULL             | NUMERIC   | Employee hourly load.                                                  | 4                  |
| operation_functionary | NOT NULL FOREIGN KEY | NUMERIC   | Reference for an employees.                                            |                    |

# Table: Session

| Field name       | Key              | Data type     | Field Description                                  | Field Size (bytes) |
| ---------------- | ---------------- | ------------- | -------------------------------------------------- | ------------------ |
| id               | NOT NULL PRIMARY | NUMERIC       | Incremental identifier of the session schema.      | 4                  |
| name             | NOT NULL         | VARCHAR [100] | Name, can be abbreviated. 100 character limit. 100 |
| session_category | NOT NULL FOREIGN | NUMERIC       | Reference to a categorie.                          |                    |

# Table: User

| Field name   | Key              | Data type        | Field Description                                     | Field Size (bytes) |
| ------------ | ---------------- | ---------------- | ----------------------------------------------------- | ------------------ |
| id           | NOT NULL PRIMARY | NUMERIC          | Incremental identifier of the session schema.         | 4                  |
| username     | NOT NULL         | NUMERIC          | Unique identifier of the book.                        | 8                  |
| name         | NOT NULL         | VARCHAR [100]    | Name, can be abbreviated. Limit of 100 characters.    | 100                |
| registration | NOT NULL         | NUMERIC AUTO INC | Self incremental user registration.                   | 4                  |
| telephone    | NOT NULL         | VARCHAR [14]     | Formatted telephone: (XX) XXXXX-XXXX                  | 14                 |
| email        | NOT NULL         | VARCHAR [256]    | Email following the standard limit of 256 characters. | 256                |
| password     | NOT NULL         | VARCHAR [32]     | Alphanumeric password of up to 32 characters.         | 32                 |
| status       | NOT NULL         | NUMERIC          | Validity status for loan.                             | 4                  |
| user_loan    | NOT NULL FOREIGN | NUMERIC          | Reference for a loan made.                            |                    |
| user_adress  | NOT NULL FOREIGN | NUMERIC          | Reference to an address.                              |                    |

## Table: Library

| Field name        | Key              | Data type | Field Description                  | Field Size (bytes) |
| ----------------- | ---------------- | --------- | ---------------------------------- | ------------------ |
| library_operation | NOT NULL FOREIGN | NUMERIC   | Reference to an operating diagram. |                    |
| library_user      | NOT NULL FOREIGN | NUMERIC   | Reference for a user.              |                    |
| library_session   | NOT NULL FOREIGN | NUMERIC   | Reference for a session.           |                    |

## Table: Employee

| Field name | Key      | Data type     | Field Description                                  | Field Size (bytes) |
| ---------- | -------- | ------------- | -------------------------------------------------- | ------------------ |
| id         | PRIMARY  | NUMERIC       | Incremental identifier of the employee scheme.     | 4                  |
| name       | NOT NULL | VARCHAR [100] | Name, can be abbreviated. Limit of 100 characters. | 100                |
