package g03_product.controller.img;


import java.util.List;

public interface ProdimgDAO {
	public int insert(Prodimg prodimg);

	public int update(Prodimg prodimg);

	public int delete(Integer imgId);

	public Prodimg getOne(Integer imgId);

	public List<Prodimg> getAll();

	List<Prodimg> getAllByImgId(Integer imgId);

	
	
}
