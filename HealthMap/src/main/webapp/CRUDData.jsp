<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.lang.String, unedMasterJavaModelo.*, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession sesion = request.getSession(true); 
%>

<div >
	<h1>Administración de la Data</h1>
</div>


<form  name="nuevaData"  action="./Data" method="get">
<div class="content">
<fieldset>
<legend>Agregar Data</legend>
<input name="indicadorcode" type="text"  placeholder="Código Indicador" />
<input name="countrycode" type="text"  placeholder="Código del País" />
<input name="year" type="text"  placeholder="year" />

<input type= "submit"  name="Agregar_Data" value= "Agregar" /> 
</fieldset>
</div>
</form>

<br/>

<form     name="editData"  action="./Data" method="get">
<div class="content">
<fieldset>
<legend>Actualizar Data</legend>
<input  name="actualizarindicadorcode" type="text"  placeholder="Código Indicador" />
<input  name="actualizarcountrycode" type="text"  placeholder="Código del País" />
<input  name="actualizaryear" type="text"  placeholder="Year" />
<input id="editbutton" type="submit"  name="Actualizar_Data" value= "Actualizar" /> 
</fieldset>
</div>
</form>
<br></br>
<table border="1" align="center" id="tblDatos">

<% 

 List<Data> listadoDatas = (List<Data>)sesion.getAttribute("listaDatas");

for (int i = 0; i < listadoDatas.size(); i++) {
       System.out.println( "OK!! " + listadoDatas.get(i).toString());
}%>

<table class="login-form" border=1>
 <thead>
  <tr>
     <th>INDICADOR</th>
     <th>CODIGO PAIS</th>
     <th>AÑO</th>
     
  </tr>
 </thead>

<tbody>
<% for (int i = 0; i < listadoDatas.size(); i++) { %>
<tr>
  
 <td id="indicatorid"><% out.print(listadoDatas.get(i).getIndicador_code());%> </td> 
 <td><% out.print(listadoDatas.get(i).getCountry_code());%> </td>
 <td><% out.print(listadoDatas.get(i).getYear());%> </td>
 
 <td>
    <form action="./"method="get">
        <input type="submit" class="button" name="Eliminar_Data" value="Eliminar" />
        
    </form>    
    
</td>
</tr> 
 <% }%>
 
 
 

</tbody>
</table>

</body>
</html>