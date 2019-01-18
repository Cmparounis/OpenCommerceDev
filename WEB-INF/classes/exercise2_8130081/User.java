package exercise2_8130081;

public class User {

	private String username;
	private String password;
	private String email;

	/**
	 * Constructor
	 *
	 * @param username, String
	 * @param password, String
	 * @param email, String
	 */
	public User(String username, String password, String email) {
		this.username = username;
		this.password = password;
		this.email = email;
	}

	/*Getters and Setters*/

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

} //End of class
