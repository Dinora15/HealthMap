<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="estilos.css/menu.css" />
</head>
<body>
<%
	HttpSession sesion = request.getSession(true); 
%>


  <h2 align-text="center"> Bienvenido: <%=sesion.getAttribute("usuarioAcceso") %></h2>
  <a href="http://localhost:8082/HealthMap/index.jsp?estado=2">Cerrar Sesión</a>
  <div class="a">
  
  <h2>Menú</h2>
  <list>
<ul class="a">
  
  <li id=listaAdministracion>Administración</li>
  	<ul class="b">
  		
  		<li><a href="">Data</a></li>
  		<li><a href="http://localhost:8082/HealthMap/CRUDCountry.jsp">Country</a></li>
  		<li><a href="http://localhost:8082/HealthMap/CRUDIndicador.jsp">Health Indicador</a></li>
  	</ul>
  </li>
  <li><a href="http://localhost:8082/HealthMap/index.jsp">Inicio</a></li>
</ul>
</list>
</div>
</body>
</html>