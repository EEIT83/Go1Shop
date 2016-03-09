package g03_product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import g99_Connection.ConnDB;

import javax.sql.DataSource;

public class StoreDAOImpl implements StoreDAO_M {
	
	private DataSource ds = ConnDB.getConnDB();
	
	private static final String GET_ONE = "select * from store where mem_id = ?";
	private static final String INSERT_STMT = "INSERT INTO store (mem_id,store_name,store_address,note) VALUES(?,?,?,?)";
	private static final String UPDATE = "UPDATE store set store_name=?,store_address=?,note=? where mem_id=?";

	@Override
	public int insert(StoreVO_M storeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		int updateCount = 0;
		try {			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, storeVO.getMemId());
			pstmt.setString(2, storeVO.getStoreName());
			pstmt.setString(3, storeVO.getStoreAddress());
			pstmt.setString(4, storeVO.getNote());			
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
	public int update(StoreVO_M storeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StoreVO_M getOneByMemId(int memId) {
		// TODO Auto-generated method stub
		return null;
	}

}
