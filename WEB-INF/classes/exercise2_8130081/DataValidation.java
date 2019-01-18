package exercise2_8130081;

import java.util.List;

public class DataValidation {

	public DataValidation() { }


	public boolean isAmValid(String am) {

		//must return true only when the AM is valid (7 digits and Integer)

		int mitrwo;
		int am_length = am.length();
		boolean valid = true;

		try{
			if(am_length != 7) valid = false;
			mitrwo = Integer.parseInt(am);
		}catch (NumberFormatException e) {
			valid = false;
		}
		return valid;
	}

	public boolean isFullnameValid(String fullname) {

		//must return true only when the Fullname is valid (at least 5 characters long)

		boolean valid = false;
		int fullname_length = fullname.length();
		String[] names = fullname.split(" ");
		if(fullname_length > 5) {
			for (String name : names) {
				if(name.matches("[a-zA-Z]+")) valid = true;
			}
		}
		return valid;
	}

	public boolean isValidPhoneNumber(String phone) {

		//must return true only when the phone is valid (10 digits and Long Integer)

		long tilefono;
		int phone_length = phone.length();
		boolean valid = true;

		try{
			if(phone_length != 10) valid = false;
			tilefono = Long.parseLong(phone);
		}catch (NumberFormatException e) {
			valid = false;
		}
		return valid;
	}

	public boolean isValidGender(String gender) {

		//must return true only when the gender is valid (Female of Male)

		boolean valid = false;
		try {
			if(gender.matches("(?i:female)") || gender.matches("(?i:male)"))
				valid = true;
		}catch (NullPointerException e){
			valid = false;
		}
		return valid;
	}

	public boolean isValidEmailAddress(String email) {

		if(email == null) {
			return false;
		}

		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);

		return m.matches();
	}

	public boolean checkDepartment(String departmentId) {

		int id;

		try {

			id = Integer.parseInt(departmentId);

		} catch (NumberFormatException e) {

			return false;

		}

		DepartmentDAO db = new DepartmentDAO();

		List<Department> departments = db.getDepartments();

		for(Department d : departments) {

			if(d.getId() == id) {
				return true;
			}
		}

		return false;

	}

}//End of class
