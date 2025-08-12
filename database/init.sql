CREATE DATABASE IF NOT EXISTS elitepdf;
USE elitepdf;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pdf_jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    original_filename VARCHAR(255) NOT NULL,
    processed_filename VARCHAR(255),
    status ENUM('pending', 'processing', 'completed', 'failed') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE templates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    file_path VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO templates (name, description, file_path) VALUES
('Business', 'Professional business template', '/templates/business.pdf'),
('Creative', 'Artistic and creative design', '/templates/creative.pdf'),
('Minimalist', 'Clean and simple layout', '/templates/minimalist.pdf');

CREATE TABLE themes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    primary_color VARCHAR(7) NOT NULL,
    secondary_color VARCHAR(7) NOT NULL,
    accent_color VARCHAR(7) NOT NULL,
    is_dark BOOLEAN DEFAULT false
);

INSERT INTO themes (name, primary_color, secondary_color, accent_color, is_dark) VALUES
('Light', '#ffffff', '#f5f5f5', '#007bff', false),
('Dark', '#121212', '#1e1e1e', '#0d6efd', true),
('Blue', '#e3f2fd', '#bbdefb', '#1976d2', false);
