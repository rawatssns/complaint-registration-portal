import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
public class dataconn { 
    protected static Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 
        // Initialize all the information regarding 
        // Database Connection 
        String dbDriver = "com.mysql.jdbc.Driver"; 
        String dbURL = "jdbc:mysql://10.106.88.26:3306/"; 
        // Database name to access 
        String dbName = "complaintportal"; 
        String dbUsername = "root"; 
        String dbPassword = "Welcome@01"; 
  
        Class.forName(dbDriver); 
        Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword); 
        return con; 
    } 
} 