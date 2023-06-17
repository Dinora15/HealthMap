package unedMasterJavaModelo;
import java.sql.*;
import java.util.*;

public class UserDbd {

	 private static Connection connection;
	 
	  public UserDbd() {
	        connection = Conector.getConnection();
	    }
	    
	  public void crearteUser(User usuario){
	    	try {
	            PreparedStatement preparedStatement = connection
	                    .prepareStatement("insert into user(username,password,role) values (?, ? )");
	            // Parameters start with 1
	            preparedStatement.setString(1, usuario.getUsername());
	            //preparedStatement.setString(2, usuario.getPassword());

	            preparedStatement.setString(2, usuario.getPassword());
	            preparedStatement.executeUpdate();  
	            
	           

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	  
	  public static List<User> getAllUser() {
	        List<User> users = new ArrayList<User>();
	        try {
	            Statement statement = connection.createStatement();
	            ResultSet rs = statement.executeQuery("select * from user");
	            while (rs.next()) {
	                User user = new User();
	                user.setUsername(rs.getString("username"));
	                user.setPassword(rs.getString("password"));
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return users;
	    }
	  
	  public String getSession(User usuario){
	    	
	    	try{
	    			    		
	    		PreparedStatement user = connection.prepareStatement("select * from user where (username =? and password =?)");
	    		 
	    		
	    		 user.setString(1, usuario.getUsername());
	    		 user.setString(2,  usuario.getPassword());	    		 
	    		 ResultSet rs = user.executeQuery();
	    		 
	    		 
	    		 if (rs.next()) {
	                 usuario.setUsername(rs.getString("username"));
	                 usuario.setPassword(rs.getString("password"));
	                 if(usuario.getUsername().equals("admin")){
	                System.out.println("Administrador"); 
	                	 return "ADMIN";
	                 }
	                 else{
	                	  System.out.println("Usuario");
	                	 return "USER";
	                 }
	             }else{

	            	 System.out.println("No eres Usuario");
	         		return "NO_USER";
	            	 
	             } 
	    	
	    	
	    }
	    	catch (SQLException e) {
	    		return "Error"+e;
	        }
	    }

	       
	}

