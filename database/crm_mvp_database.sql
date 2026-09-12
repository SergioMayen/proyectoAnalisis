-- CRM MVP DATABASE - SQL SERVER

CREATE DATABASE crm_mvp;
GO

USE crm_mvp;
GO

CREATE TABLE roles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL
);
GO

INSERT INTO roles(code,name)
VALUES
('SUP','Supervisor'),
('ADM','Administrador'),
('OPR','Operativo'),
('CLI','Cliente'),
('SPT','Soporte');
GO

CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_code VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    second_name VARCHAR(100),
    first_last_name VARCHAR(100) NOT NULL,
    second_last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(10) NOT NULL,
    birth_date DATE NULL,
    is_active BIT NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY(role) REFERENCES roles(code)
);
GO

CREATE TABLE contacts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(30),
    empresa VARCHAR(150),
    pipeline_status VARCHAR(50) NOT NULL DEFAULT 'CONVERSACION_INICIAL',
    birth_date DATE NULL,
    is_active BIT NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE interactions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    contact_id INT NOT NULL,
    interaction_type VARCHAR(30) NOT NULL,
    descripcion VARCHAR(MAX) NOT NULL,
    created_by INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY(contact_id) REFERENCES contacts(id),
    FOREIGN KEY(created_by) REFERENCES users(id)
);
GO

CREATE TABLE tags (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE contact_tags (
    id INT IDENTITY(1,1) PRIMARY KEY,
    contact_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(contact_id) REFERENCES contacts(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    UNIQUE(contact_id, tag_id)
);
GO

CREATE TABLE contact_categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    contact_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY(contact_id) REFERENCES contacts(id),
    FOREIGN KEY(category_id) REFERENCES categories(id),
    UNIQUE(contact_id, category_id)
);
GO

CREATE TABLE tickets (
    id INT IDENTITY(1,1) PRIMARY KEY,
    contact_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(MAX),
    status VARCHAR(30) DEFAULT 'ABIERTO',
    created_by INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY(contact_id) REFERENCES contacts(id),
    FOREIGN KEY(created_by) REFERENCES users(id)
);
GO

CREATE TABLE alerts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    contact_id INT,
    user_id INT,
    alert_type VARCHAR(50),
    message VARCHAR(MAX),
    alert_date DATE,
    is_read BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY(contact_id) REFERENCES contacts(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);
GO

INSERT INTO users
(user_code, first_name, first_last_name, email, username, password, role)
VALUES
('ADM001','Administrador','Sistema','admin@crm.com','admin','Admin123*','ADM');
GO
