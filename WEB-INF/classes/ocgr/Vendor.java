package ocgr;

public class Vendor {

	private String id;
	private String password;
	private String email;
	private String fullname;
	private String compName;
	private String address;
	private String itin;
	private String doy;
	private String phone;

	/*
	 * Full Constructor
	 */

	public Vendor(String id, String password, String email, String fullname, String compName, String address, String itin, String doy, String phone) {
		this.id = id;
		this.password = password;
		this.email = email;
		this.fullname = fullname;
		this.compName = compName;
		this.address = address;
		this.itin = itin;
		this.doy = doy;
		this.phone = phone;
	}

	/*
	 *  Email-Password Constructor
	 */

	public Vendor(String email, String password) {
		this.email = email;
		this.password = password;
	}

	/*Getters and Setters*/

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getItin() {
		return itin;
	}

	public void setItin(String itin) {
		this.itin = itin;
	}

	public String getDoy() {
		return doy;
	}

	public void setDoy(String doy) {
		this.doy = doy;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}