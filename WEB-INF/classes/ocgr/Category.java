package ocgr;

public class Category {

	private String id;
	private String description;
	private String name;

	public Category(String id, String description, String name) {
		this.id = id;
		this.description = description;
		this.name = name;
	}
	/*G's and S's*/

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
} //End of class
