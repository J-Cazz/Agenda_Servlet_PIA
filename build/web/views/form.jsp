<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contacto</title>
  <style>
    body{font-family: Arial, sans-serif; max-width: 700px; margin: 2rem auto;}
    form{display:grid; gap:.6rem;}
    label{font-weight:bold;}
    input[type=text], input[type=email]{padding:.5rem; width:100%;}
    .row{display:grid; grid-template-columns: 1fr 1fr; gap: 1rem;}
  </style>
</head>
<body>
  <h1><%= request.getAttribute("contacto") == null || ((modelo.Contacto)request.getAttribute("contacto")).getId() == 0 ? "Nuevo" : "Editar" %> contacto</h1>
  <%
    modelo.Contacto c = (modelo.Contacto) request.getAttribute("contacto");
    if (c == null) { c = new modelo.Contacto(); }
  %>
  <form method="post" action="${pageContext.request.contextPath}/contactos">
    <input type="hidden" name="id"
       value="<%= (c.getId() == 0 ? "" : c.getId()) %>"/>
    <label>Nombre</label>
    <input type="text" name="nombre" value="<%= c.getNombre() == null ? "" : c.getNombre() %>" required/>
    <div class="row">
      <div>
        <label>Email</label>
        <input type="email" name="email" value="<%= c.getEmail() == null ? "" : c.getEmail() %>"/>
      </div>
      <div>
        <label>Teléfono</label>
        <input type="text" name="telefono" value="<%= c.getTelefono() == null ? "" : c.getTelefono() %>"/>
      </div>
    </div>
    <div>
      <button type="submit">Guardar</button>
      <a href="${pageContext.request.contextPath}/contactos">Cancelar</a>
    </div>
  </form>
</body>
</html>
