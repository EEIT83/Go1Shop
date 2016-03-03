package g05_customer.shoppingCar.controller;

import java.util.Collection;

import g05_customer.shoppingCar.model.ShopProImgDAO;

public class ShowProdImgIdService {
	private ShopProImgDAO service = new ShopProImgDAO();
	
	public Collection<Integer> selectImgId(int prodId){
		return service.selectImgId(prodId);
	}
	
	public void selectImg(){
				
	}
	
	
}
