package unedMasterJavaModelo;
import java.util.*;
import java.sql.*;

public class HealthIndicadorDbd {

	 private Connection connection;

	    public HealthIndicadorDbd() {
	        connection = Conector.getConnection();
	    }
	    
	    public void addHealthIndicador(HealthIndicador healthIndicador) {
	        try {
	            PreparedStatement preparedStatement = connection
	                    .prepareStatement("insert into healthindicador(indicador_code,indicador_name) values (?, ? )");
	            // Parameters start with 1
	            preparedStatement.setString(1, healthIndicador.getIndicador_code());
	            preparedStatement.setString(2, healthIndicador.getIndicador_name());
	           
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public void deleteHealthIndicador(String code) {
	        try {
	            PreparedStatement preparedStatement = connection
	                    .prepareStatement("delete from healthindicador where indicador_code=?");
	            // Parameters start with 1
	            preparedStatement.setString(1, code);
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public void updateHealthIndicador(HealthIndicador healthIndicador) {
	        try {
	            PreparedStatement preparedStatement = connection
	                    .prepareStatement("update healthindicador set indicador_name=?" +
	                            "where indicador_code=?");
	            // Parameters start with 1
	            preparedStatement.setString(1, healthIndicador.getIndicador_name());
	            
	           

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public List<HealthIndicador> getAllHealth() {
	        List<HealthIndicador> healthIndicadores = new ArrayList<HealthIndicador>();
	        try {
	            Statement statement = connection.createStatement();
	            ResultSet rs = statement.executeQuery("select * from healthindicador");
	            while (rs.next()) {
	            	HealthIndicador healthIndicador = new HealthIndicador();
	            	healthIndicador.setIndicador_code(rs.getString("indicador_code"));
	            	healthIndicador.setIndicador_name(rs.getString("indicador_name"));	            	
	            	healthIndicadores.add(healthIndicador);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return healthIndicadores;
	    }
	    
	    public HealthIndicador getHealthIndicadorByCode(String code) {
	    	HealthIndicador healthIndicador = new HealthIndicador();
	        try {
	            PreparedStatement preparedStatement = connection.
	                    prepareStatement("select * from healthindicador where indicador_code=?");
	            preparedStatement.setString(1, code);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	healthIndicador.setIndicador_code(rs.getString("indicador_code"));
	            	healthIndicador.setIndicador_name(rs.getString("indicador_name"));
	            	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return healthIndicador;
	    }
	    
	   

}

