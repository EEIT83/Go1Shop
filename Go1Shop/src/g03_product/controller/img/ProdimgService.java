package g03_product.controller.img;

import java.util.List;

public class ProdimgService {
	
private ProdimgDAO dao;
	
	public ProdimgService(){
		dao = new ProdimgDAOImpl();
	}
	
	public Prodimg getOneByProdId(int prodId){
		List<Prodimg> list = dao.getAllByProdId(prodId);
		if(list!=null && !list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	public int addImg(Prodimg prodimg){
		return dao.insert(prodimg);
	}
}
