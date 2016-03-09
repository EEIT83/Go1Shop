package g03_product.model;

public interface StoreDAO_M {
	int insert(StoreVO_M storeVO);
	int update(StoreVO_M storeVO);
	StoreVO_M getOneByMemId(int memId);
}
