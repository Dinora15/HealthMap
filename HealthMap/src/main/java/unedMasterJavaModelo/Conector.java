package unedMasterJavaModelo;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.net.URL;


public class Conector {

	private static Connection connection = null;


    public static Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            try {

                // Load the database properties
                Properties properties = new Properties();
                InputStream input = Conector.class.getClassLoader().getResourceAsStream("database.properties");

                if(input != null) {
                    properties.load(input);
                    input.close();
                } else {
                    throw new FileNotFoundException("property file 'database.properties' not found in the classpath");
                }

                String url = properties.getProperty("database.url");
                String user = properties.getProperty("database.user");
                String password = properties.getProperty("database.password");

                // Load the MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to the database
                connection = DriverManager.getConnection(url, user, password);

                initializeDatabase(connection);  // Initialize the database

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IOException e) { // Catch IOException here
                e.printStackTrace();
            }
            return connection;
        }

    }

    private static void initializeDatabase(Connection connection) {
        try {
            // Read the SQL file
            URL url = Conector.class.getClassLoader().getResource("schema.sql");
            String sql = new String(Files.readAllBytes(Paths.get(url.toURI())));

            // Split SQL script into individual statements
            String[] sqlStatements = sql.split(";");

            // Create a Statement
            Statement statement = connection.createStatement();

            // Add each SQL statement to batch
            for (String sqlStatement : sqlStatements) {
                if (sqlStatement != null && sqlStatement.trim().length() > 0) {
                    statement.addBatch(sqlStatement);
                }
            }

            // Execute the batch of SQL statements
            statement.executeBatch();

            System.out.println("Database tables created and data populated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
