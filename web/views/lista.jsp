<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Agenda - Contactos</title>
  <style>
    body{font-family: Arial, sans-serif; max-width: 900px; margin: 2rem auto;}
    table{border-collapse: collapse; width:100%;}
    th, td{border:1px solid #ccc; padding:8px;}
    .topbar{display:flex; justify-content:space-between; align-items:center; margin-bottom:1rem;}
    a.button{padding:8px 12px; border:1px solid #444; text-decoration:none;}
  </style>
</head>
<body>
  <div class="topbar">
    <h1>Contactos</h1>
    <a class="button" href="${pageContext.request.contextPath}/contactos?action=new">Nuevo</a>
  </div>

  <c:choose>
    <c:when test="${empty lista}">
      <p>No hay contactos aún.</p>
    </c:when>
    <c:otherwise>
      <table>
        <thead>
        <tr><th>ID</th><th>Nombre</th><th>Email</th><th>Teléfono</th><th>Acciones</th></tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${lista}">
          <tr>
            <td>${c.id}</td>
            <td>${c.nombre}</td>
            <td>${c.email}</td>
            <td>${c.telefono}</td>
            <td>
              <a href="${pageContext.request.contextPath}/contactos?action=edit&id=${c.id}">Editar</a>
              |
              <a href="${pageContext.request.contextPath}/contactos?action=delete&id=${c.id}" onclick="return confirm('¿Eliminar?');">Eliminar</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>
</body>
</html>
