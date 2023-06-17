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
	<h1>Administración de los HealthIndicadores</h1>
</div>


<form  name="nuevoindicador"  action="./HealthIndicadores" method="get">
<div class="content">
<fieldset>
<legend>Agregar HealthIndicador</legend>
<input name="indicadorcode" type="text"  placeholder="Indicador Code" />
<input name="indicadorname" type="text"  placeholder="Indicador Nombre" />
<input name="sourcenote" type="text"  placeholder="source Note" />
<input name="sourceorganization" type="text" placeholder="Source Organization" />
<input type= "submit"  name="Agregar_Indicador" value= "Agregar"> 
</fieldset>
</div>
</form>

<br/>

<form   id="edit"  name="editindicator"  action="./HealthIndicadores" method="get">
<div class="content">
<fieldset>
<legend>Actualizar HealthIndicador</legend>
<input  name="actualizarindicadorcode" type="text"  placeholder="Indicador Code" />
<input  name="actualizarindicadorname" type="text"  placeholder="Indicador Nombre" />
<input  name="actualizarsourcenote" type="text"  placeholder="source Note" />
<input  name="actualizarsourceorganization" type="text"  placeholder="Source Organization" />
<input id="editbutton" type="submit"  name="Actualizar_Indicador" value= "Actualizar"> 
</fieldset>
</div>
</form>
<br/><br/>

<table border="1" align="center" id="tblDatos">

<% 

 List<HealthIndicadores> listadoIndicadores1 = (List<HealthIndicadores>)sesion.getAttribute("listaIndicadores1");

for (int i = 0; i < listadoIndicadores1.size(); i++) {
       System.out.println( "OK!! " + listadoIndicadores1.get(i).toString());
}%>

<table  border=1>
 <thead>
  <tr>
     <th>INDICADOR_CODE</th>
     <th>INDICADOR_NAME</th>
     <th>SOURCE_NOTE</th>
     <th>SOURCE_ORGANIZATION</th>
     <th>ACCION</th>
  </tr>
 </thead>

<tbody>
<% for (int i = 0; i < listadoIndicadores1.size(); i++) { %>
<tr>
  
 <td id="indicatorid"><% out.print(listadoIndicadores1.get(i).getIndicadores_code());%> </td> 
 <td><% out.print(listadoIndicadores1.get(i).getIndicadores_name());%> </td>
 <td><% out.print(listadoIndicadores1.get(i).getSource_note());%> </td>
 <td><% out.print(listadoIndicadores1.get(i).getSource_organization());%> </td>
 <td>
    <form action="./HealthIndicadores"method="get">
        <input type="submit"  name="Eliminar_Indicador" value="Eliminar" />
        <input type="hidden" name="eliminar" value="<%=listadoIndicadores1.get(i).getIndicadores_code()%>" />
    </form>    
    
</td>
</tr> 
 <% }%>
 
 
 

</tbody>
</table>
</body>
</html>