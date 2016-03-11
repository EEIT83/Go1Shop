package gb04_marketing.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class NameDAO {
	private DataSource ds;
	public NameDAO(){
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Go1ShopDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	private final String INSERT="insert into test values(?)";
	public int insert(String name){
		
		try ( Connection conn=ds.getConnection();
			  PreparedStatement ps = conn.prepareStatement(INSERT);	){
			
			ps.setString(1, name);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
