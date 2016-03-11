package g02_member.controller.store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.jdom2.Document;
import org.jdom2.Element;

import g99_Connection.ConnDB;

public class XMLService {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=Project";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "sa123456";
	private DataSource ds = ConnDB.getConnDB();
	
	public static void main(String[] args){
		XMLService se = new XMLService();
		se.select();
	}
	
	public Document select(){
		

		try (//Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			Connection conn = ds.getConnection();	
			PreparedStatement ps = conn.prepareStatement("select store_address from store");
				){
			ResultSet rs = ps.executeQuery();
			Document document = new Document();
			Element root = new Element("store_address");
			document.addContent(root);
			while(rs.next()){
				Element e = new Element("store_address");
				root.addContent(e);
				e.addContent(new Element("store_address").setText(rs.getString(1)));
				return document;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
		
		
	}
	
}
