CREATE DATABASE IF NOT EXISTS CommunityIssueReporting;
USE CommunityIssueReporting;

-- Users table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Categories table
CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Problems table
CREATE TABLE IF NOT EXISTS Problems (
    problem_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    image TEXT,
    images TEXT,
    status VARCHAR(50) NOT NULL,
    reported_date DATETIME NOT NULL,
    resolved_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- StatusUpdates table
CREATE TABLE IF NOT EXISTS StatusUpdates (
    update_id INT AUTO_INCREMENT PRIMARY KEY,
    problem_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    update_date DATETIME NOT NULL,
    comments TEXT,
    authority_id INT,
    FOREIGN KEY (problem_id) REFERENCES Problems(problem_id),
    FOREIGN KEY (authority_id) REFERENCES Users(user_id)
);

-- Comments table
CREATE TABLE IF NOT EXISTS Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    problem_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    comment_date DATETIME NOT NULL,
    FOREIGN KEY (problem_id) REFERENCES Problems(problem_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


INSERT INTO Categories (category_name) VALUES
('Road Maintenance'),
('Street Lighting'),
('Waste Management'),
('Water Supply'),
('Public Safety'),
('Parks and Recreation'),
('Education'),
('Healthcare');


-- Replace 'hashed_password_here' with the actual hashed password
INSERT INTO Users (name, email, password, role) VALUES
('Admin', 'admin@example.com', 'hashed_password_here', 'Admin');
