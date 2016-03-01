package g05_customer.shoppingCar.model;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import g99_Connection.ConnDB;

public class ShopProImgDAO {
	private DataSource ds = ConnDB.getConnDB();

	public void selectProdId() {

	}

	private String selectImgId = "select img_id from prodimg where prod_id = 2";

	public void selectImgId() {
		try (Connection conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement(selectImgId);
				){
			ResultSet rs = ps.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
