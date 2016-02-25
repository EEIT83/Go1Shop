package g03_product.controller.img;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

	@Override
	public int insert(Prodimg prodimg) {
		Connection con = null;
		PreparedStatement pstmt = null;
	

		int updateCount = 0;
		try {
//			Class.forName(DRIVER);
//			con = DriverManager.getConnection(URL, USER, PASSWARD);
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
		// TODO Auto-generated method stub
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
	public List<Prodimg> getAllByImgId(Integer imgId) {
		// TODO Auto-generated method stub
		return null;
	}

}
