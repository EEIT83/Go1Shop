package g03_product.model;

public class ProductBean_Y {	
    private int prod_id;
	private int mem_id;
    private String prod_name;
    private String size;
    private String color;
    private int count;
    private int price;
    private String brand;
    private String gender;
    private String part;
    private java.sql.Date launch_date;
    private String note;
	

	@Override
	public String toString() {
		return "ProductProject1Bean [prod_id=" + prod_id + ", mem_id=" + mem_id + ", prod_name=" + prod_name + ", size="
				+ size + ", color=" + color + ", count=" + count + ", price=" + price + ", brand=" + brand + ", gender="
				+ gender + ", part=" + part + ", launch_date=" + launch_date + ", note=" + note + "]";
	}
	public int getProd_id() {
		return prod_id;
	}

	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public java.sql.Date getLaunch_date() {
		return launch_date;
	}
	public void setLaunch_date(java.sql.Date launch_date) {
		this.launch_date = launch_date;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
    
	
	
}