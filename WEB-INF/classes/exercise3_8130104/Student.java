package exercise3_8130104;

public class Student {

	private String am;
	private String fullname;
	private String email;
	private String phone;
	private String gender;
	private Department department;
		
	/**
	 * Constructor
	 * 
	 * @param am
	 * @param fullname
	 * @param email
	 * @param phone
	 * @param gender
	 * @param department
	 */
	public Student(String am, String fullname, String email, String phone, String gender, Department department) {
		this.am = am;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.department = department;
	}	

	/*Getters and Setters*/
	
	public String getAm() {
		return am;
	}

	public void setAm(String am) {
		this.am = am;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}	
} //End of class
