# 📘 Agenda_Servlet_PIA  
Aplicación web desarrollada en Java utilizando Servlets, JSP, el patrón MVC y MySQL para implementar una Agenda de Contactos con operaciones CRUD completas.

---

## 🚀 Descripción del Proyecto
Este proyecto consiste en una aplicación web que permite gestionar un listado de contactos mediante una interfaz sencilla y funcional. El sistema está construido con Java y aplica el patrón Modelo–Vista–Controlador (MVC), utilizando Servlets como controladores, JSP como vistas, y una base de datos MySQL para el almacenamiento persistente.

Incluye las operaciones básicas:
- Crear contacto  
- Consultar lista de contactos  
- Editar información  
- Eliminar registros  
- Validaciones básicas de campos  

La aplicación fue desplegada en Apache Tomcat 9 y configurada para funcionar mediante JDBC con un driver MySQL 8.

---

## 📂 Estructura del Proyecto

Agenda_Servlet_PIA/
├─ src/
│ ├─ modelo/
│ │ └─ Contacto.java
│ ├─ dao/
│ │ └─ ContactoDAO.java
│ ├─ DBCon/
│ │ └─ DBConnection.java
│ └─ web/
│ └─ ContactoServlet.java
├─ web/
│ ├─ views/
│ │ ├─ lista.jsp
│ │ └─ form.jsp
│ └─ WEB-INF/
│ └─ web.xml
├─ build/ (generado por NetBeans)
├─ dist/ (generado por NetBeans)
├─ README.md
└─ agenda_dump.sql


---

## 🧱 Tecnologías utilizadas

### ✔ Backend
- Java 8  
- Servlets (`javax.servlet`)
- JDBC
- DAO pattern  
- JavaBeans

### ✔ Frontend
- JSP  
- HTML5  
- CSS básico  

### ✔ Base de datos
- MySQL 8  
- InnoDB  
- UTF8MB4  
- Scripts SQL incluidos

### ✔ Servidor
- Apache Tomcat 9

### ✔ Herramientas
- NetBeans
- MySQL Workbench
- Git / GitHub

---

## 🗄 Base de Datos

El sistema utiliza un esquema llamado **agenda** con una tabla:

### **contactos**
| Campo | Tipo | Descripción |
|-------|----------|--------------|
| id | INT (PK, AI) | Identificador único |
| nombre | VARCHAR(100) | Nombre del contacto |
| email | VARCHAR(150) | Email |
| telefono | VARCHAR(20) | Teléfono |

El dump completo se encuentra en el archivo:  
📄 **agenda_dump.sql**

---

## ⚙️ Instalación y Ejecución

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/J-Cazz/Agenda_Servlet_PIA.git
2️⃣ Importar el proyecto en NetBeans

Archivo → Abrir Proyecto

Selecciona la carpeta del repositorio

3️⃣ Importar la base de datos

Abrir MySQL Workbench

File → Run SQL Script

Cargar agenda_dump.sql

4️⃣ Ajustar la conexión si es necesario

En DBConnection.java actualizar credenciales:
private static final String USER = "root";
private static final String PASS = "TU_PASSWORD";

5️⃣ Ejecutar en Tomcat

Botón derecho en el proyecto → Run

NetBeans desplegará en Tomcat y abrirá el navegador.

URL de acceso:
http://localhost:8080/Agenda_Servlet_PIA/contactos
