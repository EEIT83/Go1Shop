package g03_product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		Connection con = null;
		PreparedStatement pstmt = null;

		int updateCount = 0;
		try {			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, storeVO.getStoreName());
			pstmt.setString(2, storeVO.getStoreAddress());
			pstmt.setString(3, storeVO.getNote());
			pstmt.setInt(4, storeVO.getMemId());
			
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
	public StoreVO_M getOneByMemId(int memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO_M storeVO = null;
		try {		
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setInt(1, memId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO = new StoreVO_M();
				storeVO.setStoreId(rs.getInt(1));				
				storeVO.setStoreName(rs.getString(2));
				storeVO.setStoreAddress(rs.getString(3));	
				storeVO.setMemId(rs.getInt(4));
				storeVO.setNote(rs.getString(5));
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
		return storeVO;
	}

}
