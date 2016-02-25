package gb04_marketing.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import gb04_marketing.controller.ImgVO;

public class ImgDAO {
	private DataSource ds;
	public ImgDAO(){
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Go1ShopDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	private final String SELECT="select * from image where id = ?";
	public ImgVO select(int id){
		ResultSet rs=null;
		try (Connection conn = ds.getConnection();
			 PreparedStatement ps = conn.prepareStatement(SELECT);	){
			
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()){
				ImgVO ivo = new ImgVO();
				ivo.setImg(rs.getBlob(1));
				ivo.setId(id);
				return ivo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private final String UPDATE="update image set img=? where id=?";
	public void updateImg(InputStream is, long size, int id){
		
		try ( Connection conn = ds.getConnection();
			  PreparedStatement ps = conn.prepareStatement(UPDATE);	){
			
			ps.setBinaryStream(1, is, size);
			ps.setInt(2, id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return;
	}
	
	private final String INSERT="insert into image values(?,?)";
	public void insertImg(InputStream is, long size, int id){
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(INSERT);
				){
			ps.setBinaryStream(1, is, size);
			ps.setInt(2, id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ;
	}
	
	
}
