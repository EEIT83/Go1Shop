package g03_product.model;

import g03_product.controller.img.Prodimg;

import java.util.List;

public class ProductService_M {
	
	private ProductDAO_M dao;
	
	public ProductService_M(){
		dao = new ProductDAOImpl_M();
	}

	public int addProd(Integer memId,String prodName,String size,String color,int count,int price,String brand,String gender,String part,String note){
		ProductVO_M productVO  = new ProductVO_M();
		
		productVO.setMemId(memId);		
		productVO.setProdName(prodName);
		productVO.setSize(size);		
		productVO.setColor(color);
		productVO.setCount(count);		
		productVO.setPrice(price);		
		productVO.setBrand(brand);
		productVO.setGender(gender);		
		productVO.setPart(part);		
		productVO.setNote(note);
		
		
		return dao.insert(productVO);
	}
	
	public int addProd(ProductVO_M productVO){		
		return dao.insert(productVO);
	}
	
	public int addProd(ProductVO_M productVO,List<Prodimg> prodimgList){		
		return dao.insertWithImg(productVO, prodimgList);
	}
	
	public List<ProductVO_M> getOneByMemId(Integer memId){
		return dao.getAllByMemId(memId);
	} 
	
	public int delete(Integer prodId){
		return dao.delete(prodId);
	}
	
	public int updateCtr(Integer prodId,Integer ctr){
		return dao.updateCtr(prodId, ctr);
	}
	
	public int updateProdByProdId(Integer prodId,Integer memId,String prodName,String size,String color,int count,int price,String brand,String gender,String part,String note){
		ProductVO_M productVO  = new ProductVO_M();
		
		productVO.setMemId(memId);		
		productVO.setProdName(prodName);
		productVO.setSize(size);		
		productVO.setColor(color);
		productVO.setCount(count);		
		productVO.setPrice(price);		
		productVO.setBrand(brand);
		productVO.setGender(gender);		
		productVO.setPart(part);		
		productVO.setNote(note);
		
		
		return dao.update(productVO);  
	}
		
	public int update(ProductVO_M productVO){		
		return dao.update(productVO);
	}

	public int update(ProductVO_M productVO,List<Prodimg> prodimgList){		
		return dao.updateWithImg(productVO, prodimgList);		
	}

	
	public  ProductVO_M getOne(Integer prodId) {		
		return dao.getOne(prodId);
	}

	
}
