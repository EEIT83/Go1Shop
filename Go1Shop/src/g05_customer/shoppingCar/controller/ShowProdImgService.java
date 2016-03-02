package g05_customer.shoppingCar.controller;

import g05_customer.shoppingCar.model.ShopProImgDAO;

public class ShowProdImgService {
	private ShopProImgDAO service = new ShopProImgDAO();
	
	public byte[] selectImg(int imgId){
		return service.selectImg(imgId);
	}
	

}
