package g05_customer.checkout.controller;

import java.util.List;
import java.util.Map;

import g01_login.controller.MemberBean;
import g01_login.model.MemberDAO;
import g03_product.model.StoreDAOImpl;
import g03_product.model.StoreVO_M;
import g05_customer.checkout.model.OrdDetailDAO;
import g05_customer.checkout.model.ProdOrderDAO;
import g05_customer.shoppingCar.controller.CarDetailBean;
import g05_customer.shoppingCar.controller.ShoppingCar;
import g05_customer.shoppingCar.controller.ShoppingCarBean;
import g05_customer.shoppingCar.model.CarDetailDAO;
import g05_customer.shoppingCar.model.ShoppingCarDAO;
import g05_customer.shoppingCar.model.ShowProDAO;
import gb05_mail.MailDAO;

public class CheckDetailService {
	
	public void insertOrder(MemberBean memBean, ShoppingCar shopcar , ProdOrderBean orderBean){
		
		ShoppingCarDAO carDAO = new ShoppingCarDAO();
		ShoppingCarBean carBean = carDAO.select(memBean.getMem_id());
		
		ProdOrderBean ordBean = new ProdOrderBean();
		ordBean.setMem_id(memBean.getMem_id());
		ordBean.setAddress(orderBean.getAddress());
		ordBean.setZip_code(orderBean.getZip_code());
		ordBean.setAddressee(orderBean.getAddressee());
		ordBean.setPhone(orderBean.getPhone());
		ordBean.setSender(orderBean.getSender());
		ordBean.setSender_address(orderBean.getSender_address());
		ordBean.setZip_code_sen(orderBean.getZip_code_sen());
		ordBean.setSender_phone(orderBean.getSender_phone());
		ordBean.setPayment(orderBean.getPayment());
		ordBean.setPayment_status(orderBean.getPayment_status());
		ordBean.setOrd_date(orderBean.getOrd_date());
		ordBean.setTotal(carBean.getTotal());
		
		//insert to SQL table prod_ord
		ProdOrderDAO prOrderDAO = new ProdOrderDAO();
		prOrderDAO.insert(ordBean);
		
		//CartDetail copy -> OrderDetail
		Map<String, CarDetailBean> carmap = shopcar.getCar();
		OrdDetailDAO prDetailDAO = new OrdDetailDAO();
		OrdDetailBean ordDetailBean = new OrdDetailBean();
		ShowProDAO proDAO = new ShowProDAO();

		for (Object key : carmap.keySet()) {
			CarDetailBean sellerBean = new CarDetailBean();
			sellerBean = carmap.get(key);		
			
			ordDetailBean.setProdBean(ordBean);
			ordDetailBean.setMem_id(memBean.getMem_id());
			ordDetailBean.setSeller_id(sellerBean.getSeller_Id());
			ordDetailBean.setProd_id(sellerBean.getProd_Id());
			ordDetailBean.setProd_name(sellerBean.getProd_Name());
			ordDetailBean.setPrice(sellerBean.getPrice());
			ordDetailBean.setCount(sellerBean.getCount());
			ordDetailBean.setSubtotal(sellerBean.getSubtotal());
			prDetailDAO.insert(ordDetailBean);
			proDAO.update(sellerBean.getProd_Id(), sellerBean.getCount());
			MailDAO mail = new MailDAO();
			String title = "新通知!!";
			String content = "您的商品：" + sellerBean.getProd_Name() + "已被" + memBean.getMail() + "購買";
			try {
				MemberDAO memberDAO = new MemberDAO();
				System.out.println("sellerBean.getSeller_Id()= " + String.valueOf(sellerBean.getSeller_Id()));
				MemberBean memberBean = memberDAO.selectMail(String.valueOf(sellerBean.getSeller_Id()));
				System.out.println("memberBean= " +memberBean);
				System.out.println("memBean.getMail()=" + memBean.getMail());
				System.out.println("memberBean.getMail()=" + memberBean.getMail());
				System.out.println("title=" + title);
				System.out.println("content=" + content);
				mail.insert(memBean.getMail(), memberBean.getMail() ,title , content);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
            //System.out.println(key + " : " + carmap.get(key));
			//System.out.println(ordDetailBean);
        }
		
		//Delete shoppingCar and CarDetail
		CarDetailDAO carDetail = new CarDetailDAO();
		carDetail.delete(memBean.getMem_id());
		
		carDAO.delete(memBean.getMem_id());

	}
	//select OrderDetail by mem_id-----------------------------------------------------------
	
	public List<OrdDetailBean> selectOrdDetailHis(int memId,ProdOrderBean bean){
		
		OrdDetailDAO oddao = new OrdDetailDAO();
		return oddao.select(memId,bean);
		
	}
	
	
	//select ProdOrderBean by mem_id-----------------------------------------------------------
	
		public List<ProdOrderBean> selectOrdHis(int memId){
			
			ProdOrderDAO Prod = new ProdOrderDAO();
			return Prod.select(memId);
			
		}

	//select ProdOrderBean find mem_id-----------------------------------------------------------	
		public StoreVO_M selectMem_id(int prodId){
			StoreDAOImpl DAO = new StoreDAOImpl();
			return DAO.getOneProd(prodId);
		}
		
		
		public void  SendProdMail(){
			
		}
		
}
















