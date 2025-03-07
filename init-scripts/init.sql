-- Create the User table
CREATE TABLE IF NOT EXISTS User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the BankAccount table
CREATE TABLE IF NOT EXISTS BankAccount (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    AccountNumber VARCHAR(20) UNIQUE NOT NULL,
    Balance DECIMAL(15, 2) DEFAULT 0.00,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Transactions table
CREATE TABLE IF NOT EXISTS Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    Amount DECIMAL(15, 2) NOT NULL,
    TransactionType ENUM('Deposit', 'Withdrawal') NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES BankAccount(AccountID)
);

-- Insert sample users
INSERT INTO User (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.com'),
('Charlie', 'Davis', 'charlie.davis@example.com'),
('Eva', 'Wilson', 'eva.wilson@example.com'),
('Frank', 'Moore', 'frank.moore@example.com'),
('Grace', 'Taylor', 'grace.taylor@example.com'),
('Henry', 'Anderson', 'henry.anderson@example.com'),
('Ivy', 'Thomas', 'ivy.thomas@example.com');

-- Insert sample bank accounts
INSERT INTO BankAccount (UserID, AccountNumber, Balance) VALUES
(1, '1234567890', 1000.00),
(2, '0987654321', 500.00),
(3, '1122334455', 1500.00),
(4, '2233445566', 2000.00),
(5, '3344556677', 750.00),
(6, '4455667788', 3000.00),
(7, '5566778899', 1200.00),
(8, '6677889900', 2500.00),
(9, '7788990011', 1800.00),
(10, '8899001122', 900.00);

-- Insert sample transactions
INSERT INTO Transactions (AccountID, Amount, TransactionType) VALUES
(1, 200.00, 'Deposit'),
(1, 50.00, 'Withdrawal'),
(2, 100.00, 'Deposit'),
(3, 300.00, 'Deposit'),
(3, 100.00, 'Withdrawal'),
(4, 500.00, 'Deposit'),
(4, 200.00, 'Withdrawal'),
(5, 150.00, 'Deposit'),
(5, 75.00, 'Withdrawal'),
(6, 1000.00, 'Deposit'),
(6, 500.00, 'Withdrawal'),
(7, 200.00, 'Deposit'),
(7, 100.00, 'Withdrawal'),
(8, 300.00, 'Deposit'),
(8, 150.00, 'Withdrawal'),
(9, 400.00, 'Deposit'),
(9, 200.00, 'Withdrawal'),
(10, 100.00, 'Deposit'),
(10, 50.00, 'Withdrawal'),
(1, 300.00, 'Deposit'),
(2, 200.00, 'Deposit'),
(3, 150.00, 'Deposit'),
(4, 100.00, 'Deposit'),
(5, 50.00, 'Deposit'),
(6, 250.00, 'Deposit'),
(7, 300.00, 'Deposit'),
(8, 400.00, 'Deposit'),
(9, 500.00, 'Deposit'),
(10, 600.00, 'Deposit');