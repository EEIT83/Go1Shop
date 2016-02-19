package g05_customer.checkout.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import g05_customer.checkout.controller.OrdDetailBean;
import g05_customer.checkout.controller.ProdOrderBean;
import g05_customer.checkout.hibernate.HibernateUtil;

public class ProdOrderDAO {
	
	private SessionFactory sessionfactory;
	private Session session = HibernateUtil.getSessionFactory().openSession();
	
	public ProdOrderDAO() {
		sessionfactory = HibernateUtil.getSessionFactory();
	}

	public Session getSession() {
		if (sessionfactory != null) {
			return sessionfactory.getCurrentSession();
		}
		return null;
	}
	
	static ProdOrderBean bean = new ProdOrderBean();
	public static void main(String[] args){
		
		ProdOrderDAO service = new ProdOrderDAO();
		
		service.session.beginTransaction();

		bean.setMem_id(60);
		bean.setAddress("aaaa");
		bean.setAddressee("bbbb");
		bean.setPhone(123);
		bean.setSender("cccccc");
		bean.setSender_address("dddddd");
		bean.setSender_phone(12321);
		bean.setPayment("111");
		bean.setTotal(10000);

		OrdDetailBean detBean = new OrdDetailBean();
		detBean.setProdBean(bean);
		detBean.setMem_id(60);
		detBean.setSeller_id(11);
		detBean.setProd_id(100);
		detBean.setProd_name("123");
		detBean.setPrice(1000);
		detBean.setCount(10);
		detBean.setSubtotal(10000);
		
		
				
		service.insertTest(bean);
		
		//service.select();
		service.session.getTransaction().commit();
		service.session.close();
	}
	
	public void insertTest(ProdOrderBean probean){
		session.save(probean);
		
		OrdDetailBean detBean = new OrdDetailBean();
		for(int i=1 ; i<4 ; i++){
		detBean.setProdBean(bean);
		detBean.setMem_id(60);
		detBean.setSeller_id(12);
		detBean.setProd_id(100+i);
		detBean.setProd_name("123");
		detBean.setPrice(1000);
		detBean.setCount(10);
		detBean.setSubtotal(10000);
		
		insertDetail(detBean);
		
		}
		
	}
	
	public void insertDetail(OrdDetailBean detailBean){
		session.save(detailBean);

		session.evict(detailBean);

		System.out.println(detailBean);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void insert(ProdOrderBean probean){
		getSession().save(probean);
		
	}
	
	public void select(){
		
		System.out.println((OrdDetailBean)getSession().get(OrdDetailBean.class,60));
	}
	
	
}
