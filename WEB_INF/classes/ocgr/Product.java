package ocgr;

public class Product {

	private String id;
	private String description;
	private String name;
	private Category category;

	public Product(String id, String description, String name, Category category) {
		this.id = id;
		this.description = description;
		this.name = name;
		this.category = category;
	}

	/*Getters and Setters*/

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
