package g03_product.controller.dao;

import java.io.InputStream;
import java.io.OutputStream;
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

import g03_product.model.ProductBean_Y;
import g03_product.model.ProductDAOI_Y;

public class ProductDAO_Y implements ProductDAOI_Y {
	// private static final String URL =
	// "jdbc:sqlserver://localhost:1433;database=project";
	// private static final String USERNAME = "sa";
	// private static final String PASSWORD = "sa123456";

	private DataSource dataSource = null;
	private List<ProductBean_Y> result = null;

	public ProductDAO_Y() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
	
	@Override
	public List<ProductBean_Y> select(String prod_name, String SQLprice, String SQLorder, String SQLgender,
			String SQLpart) {
		// List<ProductProject1Bean> result = null;
		try (// Connection conn = DriverManager.getConnection(URL,
				// USERNAME,PASSWORD);
				Connection conn = dataSource.getConnection();) {

			StringBuilder SELECT = new StringBuilder("select * from product where ");

			if (prod_name != null) {
				SELECT.append(" prod_name like '%'+?+'%' ");
			} else {
				SELECT.append(" prod_name like '%'+''+'%' ");
			}

			SELECT.append(SQLpart);// and part = 'x'
			SELECT.append(SQLgender);// and gender = 'M/F'
			SELECT.append(SQLprice);// and price between x and x / and price > x
									// / and price < x
			SELECT.append(SQLorder);// order by x

			System.out.println("SELECT = " + SELECT.toString());

			PreparedStatement stmt = conn.prepareStatement(SELECT.toString());
			if (prod_name != null) {
				stmt.setString(1, prod_name);
			}
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<ProductBean_Y>();
			while (rset.next()) {
				ProductBean_Y bean = new ProductBean_Y();
				bean.setProd_id(rset.getInt("prod_id"));
				bean.setMem_id(rset.getInt("mem_id"));
				bean.setProd_name(rset.getString("prod_name"));
				bean.setSize(rset.getString("size"));
				bean.setColor(rset.getString("color"));
				bean.setCount(rset.getInt("count"));
				bean.setPrice(rset.getInt("price"));
				bean.setBrand(rset.getString("brand"));
				bean.setGender(rset.getString("gender"));
				bean.setPart(rset.getString("part"));
				bean.setLaunch_date(rset.getDate("launch_date"));
				bean.setNote(rset.getString("note"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;// 資料結果傳回service
	}

	@Override
	public List<ProductBean_Y> selectimg(String prod_name, String SQLprice, String SQLorder, String SQLgender,
			String SQLpart) {
		
		
		OutputStream os = null;
		InputStream is = null;
		
		try (// Connection conn = DriverManager.getConnection(URL,
				// USERNAME,PASSWORD);
				Connection conn = dataSource.getConnection();) {

			StringBuilder SELECT = new StringBuilder("select * from product p join prodimg pimg on p.prod_id = pimg.prod_id where");

			if (prod_name != null) {
				SELECT.append(" prod_name like '%'+?+'%' ");
			} else {
				SELECT.append(" prod_name like '%'+''+'%' ");
			}

			SELECT.append(SQLpart);// and part = 'x'
			SELECT.append(SQLgender);// and gender = 'M/F'
			SELECT.append(SQLprice);// and price between x and x / and price > x
									// / and price < x
			SELECT.append(SQLorder);// order by x

			System.out.println("SELECT = " + SELECT.toString());

			PreparedStatement stmt = conn.prepareStatement(SELECT.toString());
			if (prod_name != null) {
				stmt.setString(1, prod_name);
			}
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<ProductBean_Y>();
			while (rset.next()) {
				ProductBean_Y bean = new ProductBean_Y();
				bean.setProd_id(rset.getInt("prod_id"));
				bean.setMem_id(rset.getInt("mem_id"));
				bean.setProd_name(rset.getString("prod_name"));
				bean.setSize(rset.getString("size"));
				bean.setColor(rset.getString("color"));
				bean.setCount(rset.getInt("count"));
				bean.setPrice(rset.getInt("price"));
				bean.setBrand(rset.getString("brand"));
				bean.setGender(rset.getString("gender"));
				bean.setPart(rset.getString("part"));
				bean.setLaunch_date(rset.getDate("launch_date"));
				bean.setNote(rset.getString("note"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;// 資料結果傳回service
	}

	public static void main(String[] args) {
		ProductDAOI_Y dao = new ProductDAO_Y();
		// List<ProductProject1Bean> beans = dao.select();
		// System.out.println(beans);

		// ProductBean bean1 = new ProductBean();
		// bean.setId(11);
		// dao.insert(bean);
		// dao.update("xxx", 123, new java.util.Date(), 456, 11);
		// dao.delete(11);
		// 測1
		// ProductProject1Bean select = dao.select("a");
		// System.out.println(select);
		// 測2
		// List<ProductProject1Bean> beans = dao.select("a");
		// for (ProductProject1Bean bean : beans) {
		// System.out.print(bean+"\n");
		// }
	}

}
