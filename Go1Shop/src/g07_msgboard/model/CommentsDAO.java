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

public class CommentsDAO {
	private DataSource ds;
	
	public CommentsDAO(){
		try {
			Context context = new InitialContext();
			ds =(DataSource) context.lookup("java:comp/env/jdbc/Go1ShopDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private final String RECOVER="update comments set report='ok' where commentId=?";
	public int recover(int commentId){
		int i=0;
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(RECOVER);
				)
		{
			ps.setInt(1, commentId);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	private final String HIDE="update comments set comment='hide',report='hide' where commentId=?";
	public int hide(int commentId){
		int i=0;
		
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(HIDE);
				){
			ps.setInt(1, commentId);
			i =  ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	private final String UPDATE="update comments set report='report' where commentId=?";
	public int update(int commentId){
		int i = 0;
		
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(UPDATE);
				){
			ps.setInt(1, commentId);
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	private final String INSERT="insert into comments(userName,comment) values(?,?)";
	public int insert(String userName, String comment){
		int i=0;
		try (
				Connection conn=ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(INSERT);
				){
			ps.setString(1, userName);
			ps.setString(2, comment);
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	private final String SELECT="select * from comments order by commentId desc";
	public List<CommentsVO> select(){
		ResultSet rs=null;
		List<CommentsVO> list = new ArrayList<>();
		
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(SELECT);
				){
			 rs= ps.executeQuery();
			 
			 while(rs.next()){
				 CommentsVO cvo = new CommentsVO();
				 cvo.setUserName(rs.getString(1));
				 cvo.setComment(rs.getString(2));
				 cvo.setMoment(rs.getString(3));
				 cvo.setCommentId(rs.getInt(4));
				 cvo.setReport(rs.getString(5));
				 list.add(cvo);
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
	
	private final String DELETE="delete from comments where commentId = ?";
	public int delete(int commentId){
		int i = 0;
		try (
				Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(DELETE);
				){
			ps.setInt(1, commentId);
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return i;
	}
	
	
}









