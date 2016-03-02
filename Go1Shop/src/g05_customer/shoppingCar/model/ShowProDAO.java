package g05_customer.shoppingCar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import org.hibernate.Session;
import org.hibernate.SessionFactory;

import g05_customer.checkout.hibernate.HibernateUtil;
import g05_customer.shoppingCar.controller.ProductBean;
import g99_Connection.ConnDB;



public class ShowProDAO {
	
	private SessionFactory sessionfactory;
	public ShowProDAO() {
		sessionfactory = HibernateUtil.getSessionFactory();
	}

	public Session getSession() {
		if (sessionfactory != null) {
			return sessionfactory.getCurrentSession();
		}
		return null;
	}
	
	private DataSource ds = ConnDB.getConnDB();
	
	private final String select = "select * from product where prod_id=2";
	public List<ProductBean> select(){
		List<ProductBean> result = null;
		try (Connection conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement(select);
			){
			ResultSet rs  = ps.executeQuery();
			result = new ArrayList<ProductBean>();
			while(rs.next()){
				ProductBean bean = new ProductBean();
				bean.setProdId(rs.getInt(1));
				bean.setMemId(rs.getInt(2));
				bean.setProductName(rs.getString(3));
				bean.setSize(rs.getString(4));
				bean.setColor(rs.getString(5));
				bean.setCount(rs.getInt(6));
				bean.setPrice(rs.getInt(7));
				bean.setBrand(rs.getString(8));
				bean.setGender(rs.getString(9));
				bean.setPart(rs.getString(10));
				bean.setLanchDate(rs.getDate(11));
				bean.setNote(rs.getString(12));
				
				
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	private final String selectId = "select * from product where prod_id=?";
	public ProductBean selectId(int id){
		
		try (Connection conn = ds.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(selectId);	
			){
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			ProductBean bean = null;
			if(rs.next()){
				bean = new ProductBean();
				bean.setProdId(rs.getInt(1));
				bean.setMemId(rs.getInt(2));
				bean.setProductName(rs.getString(3));
				bean.setSize(rs.getString(4));
				bean.setColor(rs.getString(5));
				bean.setCount(rs.getInt(6));
				bean.setPrice(rs.getInt(7));
				bean.setBrand(rs.getString(8));
				bean.setGender(rs.getString(9));
				bean.setPart(rs.getString(10));
				bean.setLanchDate(rs.getDate(11));
				
			}
			return bean;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	public void update(int prod_id, int count){
		ProductBean oldPro = (ProductBean)getSession().get(ProductBean.class, prod_id);
		oldPro.setCount(oldPro.getCount()-count);
		getSession().update(oldPro);
		
	}

}
