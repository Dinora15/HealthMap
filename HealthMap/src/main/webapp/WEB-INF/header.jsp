<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession sesion = request.getSession(true); //Obtengo la variable sesión.
%>

<div id=menu>
<ul>
  <li class="welcome" > Bienvenido <%=sesion.getAttribute("usuarioAcceso") %></li>
  <li><a href="http://localhost:8080/WorldHealthBank_Boza/index.jsp?estado=2">Cerrar Sesión</a></li>
  
  <li id = "adminList"><a href="#Administracion">Administración</a>
  	<ul>
  		<li><a href="#user">User</a></li>
  		<li><a href="http://localhost:8080/WorldHealthBank_Boza/data?action=get&pag=1">Data</a></li>
  		<li><a href="http://localhost:8080/WorldHealthBank_Boza/adminCountry.jsp">Country</a></li>
  		<li><a href="http://localhost:8080/WorldHealthBank_Boza/healthindicatoradmin.jsp">Health Indicator</a></li>
  	</ul>
  </li>
  <li><a href="http://localhost:8080/WorldHealthBank_Boza/main.jsp">Inicio</a></li>
</ul>
</div>
<script type="text/javascript">


var x = document.getElementById('adminList');
    x.style.display = 'none';
   
    <%
    if(sesion.getAttribute("usuarioAcceso").equals("admin")){%>
    	x.style.display = "block"; <%
    }
    %>

</body>
</html>