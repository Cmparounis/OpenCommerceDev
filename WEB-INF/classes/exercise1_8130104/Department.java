package exercise1_8130104;

public class Department {

	private int id;
	private String name;

	/**
	 * @param id
	 * @param name
	 */
	public Department(int id, String name) {

		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
