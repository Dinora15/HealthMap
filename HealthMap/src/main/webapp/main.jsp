<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "unedMasterJavaModelo.*, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession sesion = request.getSession(true); //Obtengo la variable sesión.
%>
<h1>Seleccion de informacion:</h1>
<%
	
	List<Country> listadoPaises = (List<Country>)sesion.getAttribute("listaPaises");
	List<HealthIndicador> listadoIndicadores = (List<HealthIndicador>)sesion.getAttribute("listaIndicadores");	
	List<Data> listData = (List<Data>)sesion.getAttribute("datas");
	
   // System.out.println("Using for loop listadoPaises");
    for (int i = 0; i < listadoPaises.size(); i++) {
       // System.out.println( "OK!! " + listadoPaises.get(i).toString());
    }
    
    //System.out.println("Using for loop listadoIndicador");
    for (int i = 0; i < listadoIndicadores.size(); i++) {
        //System.out.println( "OK!! " + listadoIndicador.get(i).toString());
    }
	
%>

<form align="center" name="formSelect" action="./data" method="get">
	<label for="nombre">Seleccion del pais:</label> <br/>
	<select id="pais" name="pais">
  		<option value="" selected="selected">- selecciona pais-</option>
  		<% for (int i = 0; i < listadoPaises.size(); i++) { %>
  		<option value="<% out.print(listadoPaises.get(i).getCountry_code());%>"><% out.print(listadoPaises.get(i).getCountry_name()); %></option>
		<%} %>
	</select>
	<br/>
	<label for="nombre">Seleccion del indicador:</label> <br/>
	<select id="indicador" name="indicador">
  		<option value="" selected="selected">- selecciona indicador-</option>
  		<% for (int i = 0; i < listadoIndicadores.size(); i++) { %>
  		<option value="<% out.print(listadoIndicadores.get(i).getIndicador_code());%>"><% out.print(listadoIndicadores.get(i).getIndicador_name()); %></option>
		<%} %>
	</select>
	<h4><input type="submit" name="ver" value="Ver">
	<%
		String estado = request.getParameter("estado");
		if (estado != null){
			if(estado.equals("2")){
	%>
	Seleccion incorrecta...</h4>
	<%
			}}
	%>
</form>

</body>
</html>