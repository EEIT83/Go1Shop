package g05_customer.checkout.controller;

import java.util.Map;

import g05_customer.checkout.model.OrdDetailDAO;
import g05_customer.checkout.model.ProdOrderDAO;
import g05_customer.shoppingCar.controller.CarDetailBean;
import g05_customer.shoppingCar.controller.ShoppingCar;
import g05_customer.shoppingCar.controller.ShoppingCarBean;
import g05_customer.shoppingCar.model.CarDetailDAO;
import g05_customer.shoppingCar.model.ShoppingCarDAO;

public class CheckDetailService {
	
	public void insertOrder(MemberBean memBean, ShoppingCar shopcar , ProdOrderBean orderBean){
		
		ShoppingCarDAO carDAO = new ShoppingCarDAO();
		ShoppingCarBean carBean = carDAO.select(memBean.getMem_id());
		
		ProdOrderBean ordBean = new ProdOrderBean();
		ordBean.setMem_id(memBean.getMem_id());
		ordBean.setAddress(orderBean.getAddress());
		ordBean.setAddressee(orderBean.getAddressee());
		ordBean.setPhone(orderBean.getPhone());
		ordBean.setSender(orderBean.getSender());
		ordBean.setSender_address(orderBean.getSender_address());
		ordBean.setSender_phone(orderBean.getSender_phone());
		ordBean.setPayment(orderBean.getPayment());
		ordBean.setTotal(carBean.getTotal());
		//insert to SQL table prod_ord
		ProdOrderDAO prOrderDAO = new ProdOrderDAO();
		prOrderDAO.insert(ordBean);
		
		//CartDetail copy -> OrderDetail
		Map<String, CarDetailBean> carmap = shopcar.getCar();
		OrdDetailDAO prDetailDAO = new OrdDetailDAO();
		OrdDetailBean ordDetailBean = new OrdDetailBean();
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
			
            //System.out.println(key + " : " + carmap.get(key));
			//System.out.println(ordDetailBean);
        }
		
		//Delete shoppingCar and CarDetail
		CarDetailDAO carDetail = new CarDetailDAO();
		carDetail.delete(memBean.getMem_id());
		
		carDAO.delete(memBean.getMem_id());

		
		
		


		
		
	}
}
