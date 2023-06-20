package unedMasterControlador;

import jakarta.servlet.ServletException;
import unedMasterJavaModelo.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class AdministracionData
 */
@WebServlet("/Data")
public class AdministracionData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataDbd dataDbd;
	private UsuarioDbd dbd;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministracionData() {
        super();
        dbd=new UsuarioDbd();
        dataDbd = new DataDbd();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
HttpSession sesion = request.getSession(true);
		
		
		if ("Agregar".equals(request.getParameter("Agregar_Data"))) {
			// Add HealthIndicator
			String dataIndicadorcode = request.getParameter("indicadorcode");
			String datacountrycode = request.getParameter("countrycode");
			int datayear = Integer.parseInt(request.getParameter("year"));
			
			
			Data newdata = new Data(); 
	    
			newdata.setIndicador_code(dataIndicadorcode);
			newdata.setCountry_code(datacountrycode); 
			newdata.setYear(datayear); 
		
	
			dataDbd.createData(newdata);
		
		} else if ("Actualizar".equals(request.getParameter("Actualizar_Data"))) {
			
			String actualizardataIndicadorcode = request.getParameter("actualizarindicadorcode");
		    String actualizardataCountrycode = request.getParameter("actualizarcountrycode");
		    int actualizardatayear = Integer.parseInt(request.getParameter("actualizaryear"));
		    
		    
	        Data actualizarData = new Data(); 
	  
	        actualizarData.setIndicador_code(actualizardataIndicadorcode) ;
	        actualizarData.setCountry_code(actualizardataCountrycode); 
	        actualizarData.setYear(actualizardatayear);
	        
		    
		    dataDbd.updateData(actualizarData);
		
		} else if ("Eliminar".equals(request.getParameter("Eliminar_Data"))) {
			//Delete
			//String gi = request.getParameter("eliminar");
		    //System.out.print("button value"+ " " +gi);

		    //dataDbd.deleteData(gi, gi, gi);

			String indicador = request.getParameter("eliminarIndicador");
			String country = request.getParameter("eliminarCountry");
			int year = Integer.parseInt(request.getParameter("eliminarYear"));

			dataDbd.deleteData(indicador, country, year);
		
		}
		 
		response.sendRedirect("CRUDIndicador.jsp");
	}

	}


