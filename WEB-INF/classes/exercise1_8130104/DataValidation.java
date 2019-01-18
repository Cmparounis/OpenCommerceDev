package exercise1_8130104;

import java.util.List;

public class DataValidation {

	public DataValidation() { }


	public boolean isAmValid(String am) {
		if(am == null) {
					return false;
		}
				int	rn;
				int indicator = am.length();

				try {
					rn = Integer.parseInt(am);
				} catch (NumberFormatException e) {
					return false;
				}
				if (indicator != 7) {
					return false;
				} else {
					return true;
				}
		}

		public boolean isFullnameValid(String fullname) {
			if(fullname == null) {
						return false;
		}
			int indicator = fullname.length();
			if (indicator >= 5){
				return true;
			} else {
				return false;
			}
		}

		public boolean isValidPhoneNumber(String phone) {
			if(phone == null) {
						return false;
			}
			long pn;
			 int indicator = phone.length();

			try {
				pn = Long.parseLong(phone);
				} catch (NumberFormatException e) {
					return false;
				}
				if (indicator != 10) {
					return false;
				} else {
					return true;
				}
		}

		public boolean isValidGender(String gender) {
			if(gender == null) {
						return false;
			}
			String string1 = "male";
			String string2 = "female";
			if ( gender.equals(string1)){
				return true;
			} else if ( gender.equals(string2)){
				return true;
			} else {
				return false;
			}
		}

	/*
	 * Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
	*/
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
