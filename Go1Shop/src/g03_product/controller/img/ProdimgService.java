package g03_product.controller.img;

import g03_product.model.img.ProdimgDAOImpl;

public class ProdimgService {
	
private ProdimgDAO dao;
	
	public ProdimgService(){
		dao = new ProdimgDAOImpl();
	}
	
	public int addImg(Prodimg prodimg){
		return dao.insert(prodimg);
	}
}
