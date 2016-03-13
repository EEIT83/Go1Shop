package g03_product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import g03_product.controller.img.Prodimg;
import g03_product.controller.img.ProdimgDAO;
import g03_product.controller.img.ProdimgDAOImpl;
import g99_Connection.ConnDB;

public class ProductDAOImpl_M implements ProductDAO_M {

	// private static final String DRIVER =
	// "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	// private static final String URL =
	// "jdbc:sqlserver://localhost:1433;DatabaseName=Project";
	// private static final String USER = "sa";
	// private static final String PASSWARD = "sa123456";
	private DataSource ds = ConnDB.getConnDB();
	private static final String GET_ONE = "select * from product where prod_id = ? and ctr in (1,2)";
	private static final String INSERT_STMT = "INSERT INTO product (mem_id,prod_name,size,color,count,price,brand,gender,part,launch_date,note,ctr) VALUES(?,?,?,?,?,?,?,?,?,GETDATE(),?,1)";
	private static final String UPDATE = "UPDATE product set mem_id=?,prod_name=?,size=?,color=?,count=?,price=?,brand=?,gender=?,part=?,note=? where prod_id=?";
	private static final String UPDATE_CTR = "UPDATE product set ctr=? where prod_id = ?";
	private static final String GET_ALL = "select * from product order by prod_id";
	private static final String DELETE = "DELETE from product where prod_id = ?";
	private static final String GET_ALL_BY_MEMID = "select * from product where mem_id = ? and ctr in (1,2)";

	@Override
	public int insert(ProductVO_M productVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		int updateCount = 0;
		try {
			// Class.forName(DRIVER);
			// con = DriverManager.getConnection(URL, USER, PASSWARD);
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, productVO.getMemId());
			pstmt.setString(2, productVO.getProdName());
			pstmt.setString(3, productVO.getSize());
			pstmt.setString(4, productVO.getColor());
			pstmt.setInt(5, productVO.getCount());
			pstmt.setInt(6, productVO.getPrice());
			pstmt.setString(7, productVO.getBrand());
			pstmt.setString(8, productVO.getGender());
			pstmt.setString(9, productVO.getPart());
			pstmt.setString(10, productVO.getNote());
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
	public int update(ProductVO_M product) {

		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			// con = DriverManager.getConnection(URL, USER, PASSWARD);
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setInt(1, product.getMemId());
			pstmt.setString(2, product.getProdName());
			pstmt.setString(3, product.getSize());
			pstmt.setString(4, product.getColor());
			pstmt.setInt(5, product.getCount());
			pstmt.setInt(6, product.getPrice());
			pstmt.setString(7, product.getBrand());
			pstmt.setString(8, product.getGender());
			pstmt.setString(9, product.getPart());
			pstmt.setString(10, product.getNote());
			pstmt.setInt(11, product.getProdId());
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
	public int delete(Integer prodId) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// Class.forName(DRIVER);
			// con = DriverManager.getConnection(URL, USER, PASSWARD);
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, prodId);

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
	public ProductVO_M getOne(Integer prodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO_M product = new ProductVO_M();
		try {
			// Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			// con = DriverManager.getConnection(URL, USER, PASSWARD);
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setInt(1, prodId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product.setProdId(rs.getInt(1));
				product.setMemId(rs.getInt(2));
				product.setProdName(rs.getString(3));
				product.setSize(rs.getString(4));
				product.setColor(rs.getString(5));
				product.setCount(rs.getInt(6));
				product.setPrice(rs.getInt(7));
				product.setBrand(rs.getString(8));
				product.setGender(rs.getString(9));
				product.setPart(rs.getString(10));
				product.setLaunchDate(rs.getDate(11));
				product.setNote(rs.getString(12));
				product.setCtr(rs.getInt(13));
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
		return product;
	}

	@Override
	public List<ProductVO_M> getAll() {
		List<ProductVO_M> list = new ArrayList<ProductVO_M>();
		ProductVO_M product = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// Class.forName(DRIVER);
			// con = DriverManager.getConnection(URL, USER, PASSWARD);
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				product = new ProductVO_M();
				product.setProdId(rs.getInt(1));
				product.setMemId(rs.getInt(2));
				product.setProdName(rs.getString(3));
				product.setSize(rs.getString(4));
				product.setColor(rs.getString(5));
				product.setCount(rs.getInt(6));
				product.setPrice(rs.getInt(7));
				product.setBrand(rs.getString(8));
				product.setGender(rs.getString(9));
				product.setPart(rs.getString(10));
				product.setLaunchDate(rs.getDate(11));
				product.setNote(rs.getString(12));
				product.setCtr(rs.getInt(13));
				list.add(product);
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
	public List<ProductVO_M> getAllByMemId(Integer memId) {

		List<ProductVO_M> list = new ArrayList<ProductVO_M>();
		ProductVO_M product = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// Class.forName(DRIVER);
			// con = DriverManager.getConnection(URL, USER, PASSWARD);
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_MEMID);

			pstmt.setInt(1, memId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				product = new ProductVO_M();
				product.setProdId(rs.getInt(1));
				product.setMemId(rs.getInt(2));
				product.setProdName(rs.getString(3));
				product.setSize(rs.getString(4));
				product.setColor(rs.getString(5));
				product.setCount(rs.getInt(6));
				product.setPrice(rs.getInt(7));
				product.setBrand(rs.getString(8));
				product.setGender(rs.getString(9));
				product.setPart(rs.getString(10));
				product.setLaunchDate(rs.getDate(11));
				product.setNote(rs.getString(12));
				product.setCtr(rs.getInt(13));
				list.add(product);
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
	public int insertWithImg(ProductVO_M productVO, List<Prodimg> prodimgList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ProdimgDAO prodimgDAO = new ProdimgDAOImpl();

		int updateCount = 0;
		try {
			con = ds.getConnection();

			con.setAutoCommit(false);
			String cols[] = { "ProdId" };
			pstmt = con.prepareStatement(INSERT_STMT, cols);

			pstmt.setInt(1, productVO.getMemId());
			pstmt.setString(2, productVO.getProdName());
			pstmt.setString(3, productVO.getSize());
			pstmt.setString(4, productVO.getColor());
			pstmt.setInt(5, productVO.getCount());
			pstmt.setInt(6, productVO.getPrice());
			pstmt.setString(7, productVO.getBrand());
			pstmt.setString(8, productVO.getGender());
			pstmt.setString(9, productVO.getPart());
			pstmt.setString(10, productVO.getNote());
			updateCount = pstmt.executeUpdate();

			Integer next_prod_id = null;
			ResultSet rs = pstmt.getGeneratedKeys();

			if (rs.next()) {
				next_prod_id = rs.getInt(1);
			}

			for (Prodimg prodimg : prodimgList) {
				prodimg.setProdId(next_prod_id.intValue());
				prodimgDAO.insertWithConnection(prodimg, con);
			}

			con.commit();
			con.setAutoCommit(true);
		} catch (Exception e) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
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
	public int updateWithImg(ProductVO_M product, List<Prodimg> prodimgList) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ProdimgDAO prodimgDAO = new ProdimgDAOImpl();

		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setInt(1, product.getMemId());
			pstmt.setString(2, product.getProdName());
			pstmt.setString(3, product.getSize());
			pstmt.setString(4, product.getColor());
			pstmt.setInt(5, product.getCount());
			pstmt.setInt(6, product.getPrice());
			pstmt.setString(7, product.getBrand());
			pstmt.setString(8, product.getGender());
			pstmt.setString(9, product.getPart());
			pstmt.setString(10, product.getNote());
			pstmt.setInt(11, product.getProdId());
			updateCount = pstmt.executeUpdate();

			for(Prodimg prodimg : prodimgList){				
				prodimgDAO.updateWithConnection(prodimg, con);
			}
			
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException se) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
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
	public int updateCtr(Integer prodId, Integer ctr) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_CTR);			
			pstmt.setInt(1, ctr);	
			pstmt.setInt(2,prodId);
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
}
