package g05_customer.checkout.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import g05_customer.checkout.controller.OrdDetailBean;
import g05_customer.checkout.hibernate.HibernateUtil;

public class OrdDetailDAO {
	
	private SessionFactory sessionfactory;
	public OrdDetailDAO() {
		sessionfactory = HibernateUtil.getSessionFactory();
	}

	public Session getSession() {
		if (sessionfactory != null) {
			return sessionfactory.getCurrentSession();
		}
		return null;
	}
	
	
	private Session session = HibernateUtil.getSessionFactory().openSession();
	public static void main(String[] args) {
		
		OrdDetailDAO service = new OrdDetailDAO();
		service.session.beginTransaction();
		OrdDetailBean detBean = new OrdDetailBean();
		detBean.setMem_id(10);
		detBean.setSeller_id(11);
		detBean.setProd_id(100);
		detBean.setProd_name("123");
		detBean.setPrice(1000);
		detBean.setCount(10);
		detBean.setSubtotal(10000);

		service.insert(detBean);
		service.session.getTransaction().commit();
		service.session.close();

	}
	
	public void insert(OrdDetailBean detalBean){
		getSession().save(detalBean);
		getSession().evict(detalBean);
		System.out.println(detalBean);
		
	}
	
	
	

}
