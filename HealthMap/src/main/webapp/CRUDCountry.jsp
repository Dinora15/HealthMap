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

<%


	String estadobbdd = request.getParameter("estadobbdd");
	String estadogestion;
	if (estadobbdd != null){
		switch (estadobbdd) {
            case "addok":  estadogestion = "Insert realizado correctamente";
                     break;
            case "addnook":  estadogestion = "Insert no realizado: Formato incorrecto";
                     break;
            case "addexiste":  estadogestion = "Insert no realizado: Pa�s existente";
            		 break;
            case "upok":  estadogestion = "Actualizaci�n realizada correctamente";
                     break;
            case "upnook":  estadogestion = "Actualizaci�n no realizada: Formato incorrecto";
            		 break;
            case "upnoexiste":  estadogestion = "Actualizacion no realizada: Pa�s inexistente";
   		 			 break;
			case "delok":  estadogestion = "Eliminaci�n realizada correctamente";
                     break;
            case "delnook":  estadogestion = "Eliminaci�n no realizada: Formato incorrecto";
                     break;
            case "delnoexiste":  estadogestion = "Eliminaci�n no realizada: Pa�s inexistente";
            		 break;
            default: estadogestion = "Estado gestion erroneo";
                     break;
        }
	}else{
		estadogestion = "�Que gestion de informaci�n registrada de los Pa�ses quieres hacer?";
	}
%>









<form name="Country-form"  action="./administracion" method="get">
	
		<div >
		<h1>Administraci�n Country</h1>
		</div>
		
	<p><% out.print(estadogestion);%></p>
		<div >
		<fieldset>
    	<legend>Agregar Country</legend>
		<input name="country_code_agregar" type="text"  placeholder="country_code" />
		<input name="country_name_agregar" type="text"  placeholder="country_name" />
        <input type= "submit"  name="Agregar_Country" value= "Agregar"     />
		</fieldset>
		</div>

		<div >
		<fieldset>
    	<legend>Actualizar Country</legend>
		<input name="country_code_up" type="text"  placeholder="country_code" />
		<input name="country_name_up" type="text"  placeholder="country_name" />
        <input type= "submit"  name="Actualizar_Country" value= "Actualizar"     />
		</fieldset>
		</div>
		
		<div >
		<fieldset>
    	<legend>Eliminar Country</legend>
		<input name="country_code_del" type="text" placeholder="country_code" />
        <input type= "submit"  name="Eliminar_Country" value= "Eliminar"   />
		</fieldset>
		</div>
			
	</form>
	<div class="b">
	<ul class="b">
  		
  		<li><a href="http://localhost:8082/HealthMap/menu.jsp">Menu</a></li>
	</ul>
	</div>
</body>
</html>