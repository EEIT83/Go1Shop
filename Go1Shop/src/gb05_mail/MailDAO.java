package gb05_mail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MailDAO {
	private DataSource ds;
	public MailDAO(){
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/GoEshopDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private final String SELECT="select * from mail where addressee = ?";
	public List<MailVO> select(String addressee){
		List<MailVO> list = new ArrayList<>();
		ResultSet rs=null;
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(SELECT);
				){
			ps.setString(1, addressee);
			rs = ps.executeQuery();
			
			while(rs.next()){
				MailVO mvo = new MailVO();
				mvo.setMailId(rs.getInt(1));
				mvo.setSender(rs.getString(2));
				mvo.setAddressee(rs.getString(3));
				mvo.setTitle(rs.getString(4));
				mvo.setContent(rs.getString(5));
				list.add(mvo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return list;
	}
	
	private final String INSERT="insert into mail values(?,?,?,?,?)";
	public int insert(int id, String sender, String addressee, String title, String content){
		int i=0;
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(INSERT);
				){
			ps.setInt(1, id);
			ps.setString(2, sender);
			ps.setString(3, addressee);
			ps.setString(4, title);
			ps.setString(5, content);
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
}

























