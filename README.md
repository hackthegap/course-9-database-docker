---

# Bank Account Database with Docker and MySQL

**Created by Fabricio Braga**  
**Last Updated: March 7, 2025**

---

## Project Overview

This project sets up a **MySQL database** using **Docker** to simulate a simple bank account system. It includes tables for `User`, `BankAccount`, and `Transactions`, along with a substantial amount of sample data for testing and demonstration purposes.

---

## Features

- **Dockerized MySQL Database**: Easy to set up and run using Docker.
- **Sample Data**: Preloaded with 10 users, 10 bank accounts, and 30 transactions.
- **Relational Database Design**: Demonstrates key concepts like primary keys, foreign keys, and relationships.
- **Compatible with Database Clients**: Works with tools like DBeaver, MySQL Workbench, etc.

---

## Prerequisites

Before running the project, ensure you have the following installed:

### 1. **Docker**
- Download and install Docker from [https://www.docker.com/](https://www.docker.com/).
- Verify the installation:
  ```bash
  docker --version
  ```

### 2. **MySQL Client (Optional)**
- Install the MySQL client to interact with the database:
  ```bash
  sudo apt-get install mysql-client  # On Ubuntu
  brew install mysql-client          # On macOS
  ```

---

## Getting Started

Follow these steps to set up and run the project.

### 1. **Clone the Repository**

Clone the repository to your local machine:

```bash
git clone https://github.com/hackthegap/course-9-database-docker.git
cd course-9-database-docker
```

### 2. **Start the MySQL Container**

Run the following command to start the MySQL container:

```bash
docker-compose up -d
```

This will:
- Pull the MySQL 8.0 image.
- Create a database named `bankdb`.
- Create a user `bankuser` with password `bankpassword`.
- Execute the `init.sql` script to create tables and insert sample data.

---

## Connecting to the Database

### 1. **Using MySQL Client**
Connect to the database using the MySQL client:

```bash
mysql -h 127.0.0.1 -P 3306 -u bankuser -pbankpassword bankdb
```

### 2. **Using DBeaver or Other Database Clients**
When connecting to the database using a client like **DBeaver**, ensure the following properties are set in the connection settings:

- **Host**: `127.0.0.1`
- **Port**: `3306`
- **Database**: `bankdb`
- **Username**: `bankuser`
- **Password**: `bankpassword`
- **Connection Properties**:
  - `allowPublicKeyRetrieval=true`

Without `allowPublicKeyRetrieval=true`, the connection may fail due to MySQL's authentication plugin.

---

## Project Structure

```
course-9-database-docker/
├── docker-compose.yml      # Docker configuration for MySQL
├── init-scripts/
│   └── init.sql            # SQL script to create tables and insert data
```

---

## Sample Data

The database is preloaded with the following data:

### 1. **Users**
- 10 users with unique names and emails.

### 2. **Bank Accounts**
- 10 bank accounts, one for each user, with unique account numbers and balances.

### 3. **Transactions**
- 30 transactions, including deposits and withdrawals, to simulate realistic banking activity.

---

## Query Examples

### 1. **List All Users**
```sql
SELECT * FROM User;
```

### 2. **List All Bank Accounts with User Details**
```sql
SELECT u.FirstName, u.LastName, b.AccountNumber, b.Balance
FROM User u
JOIN BankAccount b ON u.UserID = b.UserID;
```

### 3. **List All Transactions for a Specific Account**
```sql
SELECT t.TransactionID, t.Amount, t.TransactionType, t.TransactionDate
FROM Transactions t
WHERE t.AccountID = 1;
```

### 4. **Calculate Total Balance for Each User**
```sql
SELECT u.FirstName, u.LastName, SUM(b.Balance) AS TotalBalance
FROM User u
JOIN BankAccount b ON u.UserID = b.UserID
GROUP BY u.UserID;
```

### 5. **List All Deposits**
```sql
SELECT * FROM Transactions WHERE TransactionType = 'Deposit';
```

### 6. **List All Withdrawals**
```sql
SELECT * FROM Transactions WHERE TransactionType = 'Withdrawal';
```

---

## Stopping and Restarting the Container

### 1. **Stop the Container**
Stop the container:

```bash
docker-compose down
```

### 2. **Restart the Container**
Restart the container:

```bash
docker-compose up -d
```

### 3. **Reinitialize the Database**
To reinitialize the database (e.g., reload the sample data), delete the Docker volume:

```bash
docker-compose down -v
docker-compose up -d
```

---

## Contributing

If you'd like to contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Open a pull request.

---

## Acknowledgments

- This project was created as part of a course to teach Docker and MySQL integration.
- Special thanks to the Docker and MySQL communities for providing excellent resources and tools.

---

## Questions?

If you have any questions or need further assistance, feel free to reach out to the instructor or open an issue in the repository.

---
