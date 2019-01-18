package exercise3_8130104;

public class Department {
	
	private int id;
	private String name;
		
	/**
	 * Constructor
	 * 
	 * @param id, integer
	 * @param name, String
	 */
	public Department(int id, String name) {
		
		this.id = id;
		this.name = name;
	}
	
	/*Getters and Setters*/
	
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

} //End of class
