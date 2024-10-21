SHOW DATABASES;

USE sample;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS login (
    SrNo INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

DESCRIBE login;
SELECT * FROM login;

CREATE TABLE IF NOT EXISTS users (
    SrNo INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    DateOfBirth DATE,
    Gender VARCHAR(16),
    Username VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

DESCRIBE users;
SELECT * FROM users;

DELIMITER //

CREATE TRIGGER add_to_login AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO login (Username, Password) VALUES (NEW.Username, NEW.Password);
END;
//

DELIMITER ;

INSERT INTO users(Name, Age, DateOfBirth, Gender, Username, Password) VALUES (
    "Rishabdev Panchal",
    19,
    '2004-09-02',
    "Male",
    "abc123",
    "1234"
);

SELECT users.SrNo, users.Name, users.Age, users.DateOfBirth, users.Gender, login.Username, login.Password
FROM users
JOIN login ON users.Username = login.Username;

