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
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



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
                importDataFromExcel(connection); //Import data from Excel

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

    private static void importDataFromExcel(Connection connection) {
        try {
            // Read the Excel file
            InputStream inputStream = Conector.class.getClassLoader().getResourceAsStream("data1.xlsx");
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0); // Assuming the data is in the first sheet

            // Get the headers
            Row headerRow = sheet.getRow(0); // Assuming the first row has the headers
            int numColumns = headerRow.getLastCellNum();

            // Prepare SQL statements for data insertion
            String countryInsertSql = "INSERT IGNORE INTO country (country_code, country_name) VALUES (?, ?)";
            String healthIndicadorSql = "INSERT IGNORE INTO healthindicador (indicador_code, indicador_name) VALUES (?, ?)";
            String dataInsertSql = "INSERT INTO data (indicador_code, country_code, year, indicador_value) VALUES (?, ?, ?, ?)";

            // Create prepared statements
            PreparedStatement countryStatement = connection.prepareStatement(countryInsertSql);
            PreparedStatement healthIndicadorStatement = connection.prepareStatement(healthIndicadorSql);
            PreparedStatement dataStatement = connection.prepareStatement(dataInsertSql);

            // Iterate through rows and insert data into tables
            for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
                Row row = sheet.getRow(rowNum);

                // Extract data from the Excel row
                String countryName = row.getCell(0).getStringCellValue();
                String countryCode = row.getCell(1).getStringCellValue();
                String indicadorName = row.getCell(2).getStringCellValue();
                String indicadorCode = row.getCell(3).getStringCellValue();


                // Check if the country with the same code already exists
                PreparedStatement countryExistsStatement = connection.prepareStatement("SELECT 1 FROM country WHERE country_code = ?");
                countryExistsStatement.setString(1, countryCode);
                ResultSet countryExistsResult = countryExistsStatement.executeQuery();
                boolean countryExists = countryExistsResult.next();
                countryExistsResult.close();
                countryExistsStatement.close();

                // Check if the health indicator with the same code already exists
                PreparedStatement healthIndicadorExistsStatement = connection.prepareStatement("SELECT 1 FROM healthindicador WHERE indicador_code = ?");
                healthIndicadorExistsStatement.setString(1, indicadorCode);
                ResultSet healthIndicadorExistsResult = healthIndicadorExistsStatement.executeQuery();
                boolean healthIndicadorExists = healthIndicadorExistsResult.next();
                healthIndicadorExistsResult.close();
                healthIndicadorExistsStatement.close();

                // Insert data into the 'country' table if it doesn't already exist
                if (!countryExists) {
                    countryStatement.setString(1, countryCode);
                    countryStatement.setString(2, countryName);
                    countryStatement.executeUpdate();
                }

                // Insert data into the 'healthindicador' table if it doesn't already exist
                if (!healthIndicadorExists) {
                    healthIndicadorStatement.setString(1, indicadorCode);
                    healthIndicadorStatement.setString(2, indicadorName);
                    healthIndicadorStatement.executeUpdate();
                }


                for (int colNum = 4; colNum < numColumns; colNum++) {
                    Cell cell = row.getCell(colNum);
                    String year = headerRow.getCell(colNum).getStringCellValue();
                    String value = "";

                    if (cell != null) {
                        CellType cellType = cell.getCellType();
                        if (cellType == CellType.STRING) {
                            value = cell.getStringCellValue();
                        } else if (cellType == CellType.NUMERIC) {
                            value = String.valueOf(cell.getNumericCellValue());
                        }
                    }

                    // Insert data into the 'data' table
                    dataStatement.setString(1, indicadorCode);
                    dataStatement.setString(2, countryCode);
                    dataStatement.setString(3, year);
                    dataStatement.setString(4, value);
                    dataStatement.executeUpdate();
                }
            }

            // Close resources
            workbook.close();
            inputStream.close();
            countryStatement.close();
            healthIndicadorStatement.close();
            dataStatement.close();

            System.out.println("Data imported from Excel successfully.");
        } catch (Exception e) {
            e.printStackTrace();
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
