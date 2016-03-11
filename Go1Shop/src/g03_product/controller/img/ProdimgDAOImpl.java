package g03_product.controller.img;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import g99_Connection.ConnDB;

public class ProdimgDAOImpl implements ProdimgDAO {
	
//	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	private static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=Project";
//	private static final String USER = "sa";
//	private static final String PASSWARD = "sa123456";
	private DataSource ds = ConnDB.getConnDB();
	private static final String INSERT_STMT = "INSERT INTO prodimg (prod_id,img) VALUES(?,?)";
	private static final String GET_ALL_BY_PRODID ="SELECT * FROM prodimg where prod_id = ?";
	private static final String UPDATE_IMG ="UPDATE prodimg SET img = ? WHERE img_id=?";

	@Override
	public int insert(Prodimg prodimg) {
		Connection con = null;
		PreparedStatement pstmt = null;
	

		int updateCount = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1,prodimg.getProdId());			
			pstmt.setBytes(2, prodimg.getImg());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return updateCount;
	}

	@Override
	public int update(Prodimg prodimg) {
		return 0;
	}

	@Override
	public int delete(Integer imgId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Prodimg getOne(Integer imgId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Prodimg> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insertWithConnection(Prodimg prodimg, Connection con) {	
		PreparedStatement pstmt = null;
		int updateCount = 0;
		try {			
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1,prodimg.getProdId());			
			pstmt.setBytes(2, prodimg.getImg());
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} 
		
		return updateCount;
	}

	@Override
	public List<Prodimg> getAllByProdId(Integer prodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Prodimg> list = new ArrayList<Prodimg>();
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_PRODID);			
			pstmt.setInt(1,prodId);
		
			rs = pstmt.executeQuery();
			while(rs.next()){
				Prodimg prodimg = new Prodimg();
				prodimg.setProdId(rs.getInt(1));
				prodimg.setImgId(rs.getInt(2));
				prodimg.setImg(rs.getBytes(3));
				list.add(prodimg);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public int updateWithConnection(Prodimg prodimg, Connection con) {
		
		PreparedStatement pstmt = null;
		int updateCount = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_IMG);
			
			pstmt.setBytes(1,prodimg.getImg());			
			pstmt.setInt(2, prodimg.getImgId());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			throw new RuntimeException(se);
		} 
		return updateCount;
	}

}
