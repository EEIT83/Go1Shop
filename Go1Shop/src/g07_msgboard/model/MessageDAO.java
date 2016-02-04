package g07_msgboard.model;

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


public class MessageDAO {
	
	DataSource ds = null;
	public MessageDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Go1ShopDB");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	private final String INSERT = 
			"insert into message(mem_id,prod_id,message,message_date,message_state) values(?,?,?,?,?)";
	
	public MessageVO insert(MessageVO mvo){
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(INSERT);
			//ps.setInt(1, mvo.getMessage_id());
			ps.setInt(1, mvo.getMem_id());
			ps.setInt(2, mvo.getProd_id());
			ps.setString(3, mvo.getMessage());
			
			long time = mvo.getMessage_date().getTime();
			ps.setDate(4, new java.sql.Date(time));
			
			ps.setString(5, mvo.getMessage_state());
			
			int updateCount = ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(ps != null){
				try {
					ps.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
		
		return mvo;
	}
	
	
//	private final String SELECT = "select * from message";
	private final String SELECT = "select * from message order by message_date desc";

	
	public List<MessageVO> select(){
		
		ResultSet rs = null;
		
		try(Connection conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement(SELECT);
				){
			
			rs = ps.executeQuery();
			
			List<MessageVO> list = new ArrayList<>(); 
			while(rs.next()){
				MessageVO mvo = new MessageVO();
				mvo.setMessage_id(rs.getInt(1));
				mvo.setMem_id(rs.getInt(2));
				mvo.setProd_id(rs.getInt(3));
				mvo.setMessage(rs.getString(4));
				mvo.setMessage_date(rs.getDate(5));
				mvo.setMessage_state(rs.getString(6));
				list.add(mvo);
			}
			
			if(list != null){
				return list;
			}
			
			
		}catch(SQLException e){
			
			e.printStackTrace();
			
		}finally{
			if (rs != null) {

				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			};

		}
		
		
		
		return null;
	}
	
	
	
}

	
	
	
	
	
	
	
	
	
	
	
	
