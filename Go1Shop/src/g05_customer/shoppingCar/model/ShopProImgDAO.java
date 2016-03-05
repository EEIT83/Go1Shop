package g05_customer.shoppingCar.model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.sql.DataSource;

import g99_Connection.ConnDB;

public class ShopProImgDAO {
	private String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Project";
	private String username="sa";
	private String password="sa123456";
	private DataSource ds = ConnDB.getConnDB();

	
	
	public static void main(String args[]) throws FileNotFoundException{
		
		ShopProImgDAO service = new ShopProImgDAO();
		Collection<Integer> imgId = new ArrayList<>();
		
	}
	private String selectImg = "select img from prodimg where img_id = ?";
	public byte[] selectImg(int imgId) {
		try (//Connection conn = DriverManager.getConnection(url, username, password);
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(selectImg);
					){
				ps.setInt(1, imgId);
				ResultSet rs = ps.executeQuery();
				byte[] inbyte = null;
				if(rs.next()){
					return  inbyte = rs.getBytes("img");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return null;
	}

	private String selectImgId = "select img_id from prodimg where prod_id = ?";
	public Collection<Integer> selectImgId(int prodId) {
		Collection<Integer> imgId = new ArrayList<>();
		try (//Connection conn = DriverManager.getConnection(url, username, password);
			Connection conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement(selectImgId);
				){
			ps.setInt(1, prodId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				imgId.add(rs.getInt("img_id"));
			}
			return imgId;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
