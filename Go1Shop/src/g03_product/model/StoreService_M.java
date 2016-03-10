package g03_product.model;

public class StoreService_M {
	
	private StoreDAO_M dao;
	
	public StoreService_M() {	
		dao = new StoreDAOImpl();
	}
	public int insert(StoreVO_M storeVO){
		return dao.insert(storeVO);
	}
	public int update(StoreVO_M storeVO){
		return dao.update(storeVO);
	}
	public StoreVO_M getOneByMemId(int memId){
		return dao.getOneByMemId(memId);
	}
}
