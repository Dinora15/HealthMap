<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "unedMasterJavaModelo.*, unedMasterControlador.*, java.util.Iterator, java.util.List" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
List<Data> listado = (List<Data>)sesion.getAttribute("listaDatas");
System.out.println("Using for loop lisado Data:");
for (int i = 0; i < listado.size(); i++) {
    System.out.println( "OK!! " + listado.get(i).toString());
} //Recorro el arraylist para mostrar con el metodo toString cada dato

List<Country> lisPaises = (List<Country>)sesion.getAttribute("listaPais"); //alamceno el arraylist de la clase country(paises) con la select para obtener solo un unico pais

System.out.println("Using for loop lisPaises Data:");
for (int i = 0; i < lisPaises.size(); i++) {
    System.out.println( "OK!! " + lisPaises.get(i).toString());
}//Recorro el arraylist para mostrar con el metodo toString el pais(solo se mostrará un pais)

//visualizo el nombre del pais obtenido a partir del code_country
String nombrePais = lisPaises.get(0).getCountry_name();
System.out.println("Obtenemos el nombre del pais = " + nombrePais);

HealthIndicadores indi = (HealthIndicadores)sesion.getAttribute("Indicador");
String nombreIndicador = indi.getIndicadores_name();
%>

<h2><% out.print(nombreIndicador);%> from <% out.print(nombrePais);%></h2>
    <script type="text/javascript">
		function mostrar(){
		document.getElementById('oculto').style.display = 'block';}
		
		function ocultar(){
		document.getElementById('oculto').style.display = 'none';}
	</script>
	 <input type="button" value="Mostrar tabla" onclick="mostrar()">
    <input type="button" value="Ocultar tabla" onclick="ocultar()">
    </br></br>
    
     <table class="login-form" border=1>
        <thead>
            <tr>
                <th>Indicator_code</th>
                <th>Country_code</th>
                <th>Year</th>
                
            </tr>
        </thead>
        <tbody>
        	<% for (int i = 0; i < listado.size(); i++) { %>
    
                <tr>
                    <td> <% out.print(listado.get(i).getIndicador_code());%> </td>
                    <td> <% out.print(listado.get(i).getCountry_code()); %> </td>
                    <td> <% out.print(listado.get(i).getYear()); %> </td>
                    
                </tr>
             <%} %>
        </tbody>
    </table>
    </br>
	</div>
    
</body>
</html>