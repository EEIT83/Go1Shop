package gb05_mail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import g99_Connection.ConnDB;

public class MailDAO {
	private DataSource ds = ConnDB.getConnDB();
//	public MailDAO(){
//		try {
//			Context context = new InitialContext();
//			ds = (DataSource) context.lookup("java:comp/env/jdbc/GoEshopDB");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}
	
	private final String SELECT="select * from mail where mail = ?";
	public List<MailVO> select(String mail){
		List<MailVO> list = new ArrayList<>();
		ResultSet rs=null;
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(SELECT);
				){
			ps.setString(1, mail);
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
	
	private final String INSERT="insert into mail values(?,?,?)";
	public int insert(int sender,int addressee, String title, String content){
		int i=0;
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(INSERT);
				){

			ps.setInt(1, sender);
			ps.setInt(2, addressee);
			ps.setString(3, title);
			ps.setString(4, content);
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
}

























