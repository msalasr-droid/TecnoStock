# TecnoStock — implementación de referencia para estudiar y adaptar
Actor: encargado de inventario. Objetivo: centralizar catálogo y movimientos. Alcance: autenticación, CRUD lógico, búsqueda, alertas y movimientos. Las cantidades existentes se ajustan mediante movimientos para preservar trazabilidad.
## Instalación
Copiar carpeta a C:\xampp\htdocs\tecnostock_proyecto. Iniciar Apache y MySQL. Importar base_datos.sql una sola vez desde phpMyAdmin. Abrir http://localhost/tecnostock_proyecto/. Usuario local admin@tecnostock.local, clave de prueba Tecno2026. Bootstrap se carga por CDN (requiere internet). Cambiar credenciales antes de publicar; no usar en producción.
## Arquitectura
index.php: vistas y controlador de formularios; conexion.php: PDO, sesión y utilidades; assets: CSS y validaciones JS; SQL: cuatro entidades con PK/FK y códigos únicos. Movimientos usan transacción y bloqueo de fila. El catálogo conserva productos desactivados.
## Pruebas propuestas (pendientes de ejecutar en XAMPP)
- Login correcto e incorrecto: acceso o mensaje de error.
- Crear producto con stock 10 y mínimo 5: aparece en catálogo.
- Repetir código: rechazo; buscar por código y categoría: coincidencias.
- Editar precio y mínimo: persistencia.
- Salida 6: stock 4 y alerta; salida 5: rechazo, stock sigue 4.
- Entrada 3: stock 7 y desaparece alerta; historial muestra responsable y fecha.
- Desactivar producto: desaparece del catálogo, historial se conserva.
Registrar resultado real y capturas de cada prueba. No declarar pruebas ejecutadas sin verificarlas.
