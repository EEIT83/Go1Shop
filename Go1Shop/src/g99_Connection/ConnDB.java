package g99_Connection;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnDB {
	final Connection conn = null;
	private static DataSource ds = null;
	static{
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Go1ShopDB");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	public static DataSource getConnDB(){
		return ds;
	}
}
