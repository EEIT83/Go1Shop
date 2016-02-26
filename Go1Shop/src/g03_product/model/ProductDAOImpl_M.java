package g03_product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import g99_Connection.ConnDB;

public class ProductDAOImpl_M implements ProductDAO_M {

//	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	private static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=Project";
//	private static final String USER = "sa";
//	private static final String PASSWARD = "sa123456";
	private DataSource ds = ConnDB.getConnDB();
	private static final String GET_ONE = "select * from product where prod_id = ?";
	private static final String INSERT_STMT = "INSERT INTO product (mem_id,prod_name,size,color,count,price,brand,gender,part,launch_date,note) VALUES(?,?,?,?,?,?,?,?,?,GETDATE(),?)";
	private static final String UPDATE = "UPDATE product set mem_id=?,prod_name=?,size=?,color=?,count=?,price=?,brand=?,gender=?,part=?,note=? where prod_id=?";
	private static final String GET_ALL = "select * from product order by prod_id";
    private static final String DELETE = "DELETE from product where prod_id = ?";
	private static final String GET_ALL_BY_MEMID = "select * from product where mem_id = ?";
	
	@Override

	public int insert(ProductVO_M productVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
	

		int updateCount = 0;
		try {
//			Class.forName(DRIVER);
//			con = DriverManager.getConnection(URL, USER, PASSWARD);
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
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			con = DriverManager.getConnection(URL, USER, PASSWARD);
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
		int updateCount = 0 ;
		Connection con = null;
		PreparedStatement pstmt = null;
		

			try {
//				Class.forName(DRIVER);
//                con = DriverManager.getConnection(URL, USER, PASSWARD);
				con = ds.getConnection();
                pstmt = con.prepareStatement(DELETE);
                
				pstmt.setInt(1, prodId);
				
				updateCount = pstmt.executeUpdate();
                
			} catch (SQLException se){
				se.printStackTrace();
			}finally{
				if(con!=null){
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
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			con = DriverManager.getConnection(URL, USER, PASSWARD);
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
//			Class.forName(DRIVER);
//			con = DriverManager.getConnection(URL, USER, PASSWARD);
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

	public static void main(String[] args) {

		ProductDAOImpl_M dao = new ProductDAOImpl_M();
		// query
		// ProductVO productVO = dao.getOne(1);
		// System.out.print(productVO.getProdName()+" ");
		// System.out.print(productVO.getSize()+" ");
		// System.out.print(productVO.getColor()+" ");
		// System.out.print(productVO.getCount()+"件 ");
		// System.out.print(productVO.getPrice()+" ");
		// System.out.print(productVO.getBrand()+" ");
		// System.out.print(productVO.getGender()+" ");
		// System.out.print(productVO.getPart()+" ");
		// System.out.print(productVO.getLaunchDate()+" ");
		// System.out.print(productVO.getNote()+" ");

		// insert
//		 ProductVO productVO = new ProductVO();
//		 productVO.setMemId(1);
//		 productVO.setProdName("阿罵的內褲");
//		 productVO.setSize("s");
//		 productVO.setColor("黃");
//		 productVO.setCount(6);
//		 productVO.setPrice(720000);
//		 productVO.setBrand("志明與春嬌系列");
//		 productVO.setGender("女 ");
//		 productVO.setPart("內褲");
//		 productVO.setLaunchDate(java.sql.Date.valueOf("2015-01-01"));
//		 productVO.setNote("原汁原味");
//		 int upCount = dao.insert(productVO);
//		 System.out.println("���蕭謚渲雓���蕭"+upCount+"嚙踝蕭豯歹蕭��嚙踝���");

		// update
		// ProductVO productVO = new ProductVO();
		// productVO.setMemId(1);
		// productVO.setProdName("���蕭��嚙踝����嚙踝蕭��嚙踝�蕭嚙踝xo");
		// productVO.setSize("XL");
		// productVO.setColor("嚙踝蕭謚喉蕭����蕭");
		// productVO.setCount(6);
		// productVO.setPrice(720000);
		// productVO.setBrand("嚙踝蕭賹���");
		// productVO.setGender("���蕭嚙�");
		// productVO.setPart("��������蕭");
		// productVO.setLaunchDate(java.sql.Date.valueOf("2015-01-01"));
		// productVO.setNote("嚙踝蕭謕蕭豲��蕭");
		// productVO.setProdId(4);
		// int upCount = dao.update(productVO);
		// System.out.println("���蕭謚渲雓���蕭"+upCount+"嚙踝蕭豯歹蕭��嚙踝���");
		
		//delete
//		int prod_id = 1;
//		int updateCount_delete = dao.delete(prod_id);		
//		System.out.println("���蕭��雓�嚙踐郁���頩都嚙踝����" + prod_id +"�����"+ updateCount_delete + "嚙踝蕭��" );
//		
		// getall		
//		List<ProductVO> list = dao.getAll();
//		for (ProductVO p : list) {
//			System.out.print(p.getProdId()+ " ");
//			System.out.print(p.getMemId()+ " ");
//			System.out.print(p.getProdName() + " ");
//			System.out.print(p.getSize() + " ");
//			System.out.print(p.getColor() + " ");
//			System.out.print(p.getCount() + "��蕭 ");
//			System.out.print(p.getPrice() + " ");
//			System.out.print(p.getBrand() + " ");
//			System.out.print(p.getGender() + " ");
//			System.out.print(p.getPart() + " ");
//			System.out.print(p.getLaunchDate() + " ");
//			System.out.print(p.getNote() + " ");
//            System.out.println();
//		}
		
		///get_all_by_memid
		List<ProductVO_M> list2 = dao.getAllByMemId(1);
		for (ProductVO_M p : list2) {
			System.out.print(p.getProdId()+ " ");
			System.out.print(p.getMemId()+ " ");
			System.out.print(p.getProdName() + " ");
			System.out.print(p.getSize() + " ");
			System.out.print(p.getColor() + " ");
			System.out.print(p.getCount() + " 件");
			System.out.print(p.getPrice() + " ");
			System.out.print(p.getBrand() + " ");
			System.out.print(p.getGender() + " ");
			System.out.print(p.getPart() + " ");
			System.out.print(p.getLaunchDate() + " ");
			System.out.print(p.getNote() + " ");
            System.out.println();
		}

	}

	@Override
	public List<ProductVO_M> getAllByMemId(Integer memId) {
		
		List<ProductVO_M> list = new ArrayList<ProductVO_M>();
		ProductVO_M product = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
//			Class.forName(DRIVER);
//			con = DriverManager.getConnection(URL, USER, PASSWARD);
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
}
