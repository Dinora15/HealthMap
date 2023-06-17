package unedMasterControlador;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import unedMasterJavaModelo.*;
import java.util.*;


import java.io.IOException;

/**
 * Servlet implementation class Estadisticas
 */
@WebServlet("/data")
public class Estadisticas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Estadisticas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession sesion = request.getSession(true);
		String pais = request.getParameter("pais");
		String indicador = request.getParameter("indicador");
		
		DataDbd dbd = new DataDbd();
		List<Data> listado = dbd.getDataIndicadorCountry(pais, indicador);
		CountryDbd pai = new CountryDbd();
		List<Country> lisPaises=pai.getCountry(pais);
		HealthIndicadoresDbd ind = new HealthIndicadoresDbd();
		HealthIndicadores lisCode=ind.getHealthIndicadoresByCode(indicador);
		
		if((lisPaises.size() == 0) || (lisCode.getIndicadores_code() == null)) {
			System.out.println("ERROR: Seleccion incorrecta");
			response.sendRedirect("main.jsp?estado=2");
		}else {
			
			sesion.setAttribute("listaData",listado);
			sesion.setAttribute("listaPais",lisPaises);
			sesion.setAttribute("Indicador",lisCode);
			response.sendRedirect("MapaD.jsp");
			
		}
		
		
	}

}
