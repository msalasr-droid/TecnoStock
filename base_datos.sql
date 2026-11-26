CREATE DATABASE IF NOT EXISTS tecnostock_proyecto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tecnostock_proyecto;
CREATE TABLE usuarios(id INT AUTO_INCREMENT PRIMARY KEY,nombre VARCHAR(100) NOT NULL,correo VARCHAR(150) NOT NULL UNIQUE,clave VARCHAR(255) NOT NULL,activo BOOLEAN NOT NULL DEFAULT TRUE) ENGINE=InnoDB;
CREATE TABLE categorias(id INT AUTO_INCREMENT PRIMARY KEY,nombre VARCHAR(100) NOT NULL UNIQUE,descripcion VARCHAR(255),activo BOOLEAN NOT NULL DEFAULT TRUE) ENGINE=InnoDB;
CREATE TABLE productos(id INT AUTO_INCREMENT PRIMARY KEY,codigo VARCHAR(50) NOT NULL UNIQUE,nombre VARCHAR(150) NOT NULL,categoria_id INT NOT NULL,descripcion TEXT,precio DECIMAL(10,2) UNSIGNED NOT NULL,stock INT UNSIGNED NOT NULL, minimo INT UNSIGNED NOT NULL,activo BOOLEAN NOT NULL DEFAULT TRUE,FOREIGN KEY(categoria_id) REFERENCES categorias(id)) ENGINE=InnoDB;
CREATE TABLE movimientos(id INT AUTO_INCREMENT PRIMARY KEY,producto_id INT NOT NULL,usuario_id INT NOT NULL,tipo ENUM('entrada','salida') NOT NULL,cantidad INT UNSIGNED NOT NULL CHECK(cantidad>0),observacion VARCHAR(255),fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(producto_id) REFERENCES productos(id),FOREIGN KEY(usuario_id) REFERENCES usuarios(id)) ENGINE=InnoDB;
INSERT INTO categorias(nombre) VALUES ('Conectividad'),('Audio'),('Periféricos'),('Almacenamiento');
INSERT INTO productos(codigo,nombre,categoria_id,descripcion,precio,stock,minimo) VALUES ('USB-101','Adaptador USB-C',1,'Adaptador multipuerto',14990,12,4),('AUD-102','Audífonos USB',2,'Audio estéreo',19990,2,5),('SSD-103','SSD externo',4,'Unidad portátil',49990,8,3);
INSERT INTO usuarios(nombre,correo,clave) VALUES ('Administrador','admin@tecnostock.local','$2y$12$xMXUsA1YFLZes0xNFH6mJ.7DujFRwMj/RaS4ApgmUVaAdj6carJni');
