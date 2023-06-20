<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"  import="unedMasterJavaModelo.*" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Insert title here</title>

</head>

<body>
<%
	String estado = request.getParameter("estado");
	if (estado != null){
		if(estado.equals("1")){
%>

<center><h2>Usuario inválido</h2></center>

<%
}else if (estado.equals("2")){
%>

<center><h2>Has salido de la sesión</h2></center>

<%
}else{
%>
<center><h2>Situacion desconocida</h2></center>
<%
	}
} else {
%>
<center><h2>Bienvenido</h2></center>
<%
	}
%>



<table>
	<tr>
		<td>

			<form  action="./Sesion" method="get">
				<fieldset>
					<h1 >World Health Bank</h1>
					<input type="hidden" name="tipo" />
					<label>Usuario</label>			<input name="nombre" type="text"  />

					<label> Clave</label>			<input name="clave" type="password"  />


					<input type= "submit"  value= "Login"/>

				</fieldset>
			</form>
		</td>
	</tr>
	<tr>
		<td>

			<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=-148.97460937500003%2C3.2502085616531686%2C-63.80859375000001%2C45.27488643704894&amp;layer=mapnik&amp;marker=26.115985925333536%2C-106.3916015625" style="border: 1px solid black"></iframe><br/><small><a href="https://www.openstreetmap.org/?mlat=26.12&amp;mlon=-106.39#map=4/26.12/-106.39">Ver mapa más grande</a></small>
		</td>
		<td>

			<%
				CountryDbd countryDbd=new CountryDbd();
				List<Country> listapaises= new ArrayList();


			%>


			<form align="center" name="formSelect" action="index.jsp" method="get">
				<label for="nombre">Seleccion del pais:</label> <br/>
				<select id="pais" name="pais">
					<option value="" selected="selected">- selecciona pais-</option>
					<% for (int i = 0; i < listapaises.size(); i++) { %>
					<option value="<% out.print(listapaises.get(i).getCountry_code());%>"><% out.print(listapaises.get(i).getCountry_name()); %></option>
					<%} %>

				</select>
				<br/>
				<%
					HealthIndicadorDbd healthIndicadorDbd =new HealthIndicadorDbd();
					List<HealthIndicador> listadoIndicadores= new ArrayList();

				%>

				<label for="nombre">Seleccion del indicador:</label> <br/>
				<select id="indicador" name="indicador">
					<option value="" selected="selected">- selecciona indicador-</option>
					<% for (int i = 0; i < listadoIndicadores.size(); i++) { %>
					<option value="<% out.print(listadoIndicadores.get(i).getIndicador_code());%>"><% out.print(listadoIndicadores.get(i).getIndicador_name()); %></option>
					<%} %>




				</select>
				<h4><input type="submit" name="ver" value="Ver">

			</form>

		</td>
	</tr>
</table>
</body>
</html>