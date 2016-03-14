package g01_login.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;

public class SQLserver {

	private Connection conn ;
	private static final String className = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String url ="jdbc:sqlserver://localhost:1433;databaseName=Project";
//	private static final String url ="jdbc:sqlserver://wlgfm7oxcs.database.windows.net:1433;database=Project";
	
	public SQLserver() throws SQLException{
		DbUtils.loadDriver(className);
		conn = DriverManager.getConnection(url, "sa", "sa123456");
	}
	
	public Connection getConn() {
		return conn;
	}
	
	public void colseConn(){
		try {
			DbUtils.close(conn);
		} catch (SQLException e) {	
			e.printStackTrace();
		}
	}
}
