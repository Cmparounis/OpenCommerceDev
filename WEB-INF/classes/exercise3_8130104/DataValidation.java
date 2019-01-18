package exercise3_8130104;

public class DataValidation {

	public boolean isAmValid(String am) {

		if( am == null || am.length() != 7) {
			return false;
		}

		try {

			Integer.parseInt(am);

		} catch (NumberFormatException e) {
			return false;
		}

		return true;
	}

	public boolean isFullnameValid(String fullname) {

		return (fullname == null || fullname.length() < 5 ? false : true);

	}

	public boolean isValidEmailAddress(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        return m.matches();
	}

	public boolean isValidPhoneNumber(String phone) {

		if( phone == null || phone.length() != 10) {

			return false;
		}

		try {

			Long.parseLong(phone);

		} catch (NumberFormatException e) {

			return false;
		}

		return true;
	}

	public boolean isValidGender(String gender) {
/*
		if( gender == null ) {
			return false;
		} else if ( gender.equals("Male")) {
			return true;
		} else if ( gender.equals("Female")) {
			return true;
		} else {
			return false;
		}
*/
		return (gender == null || ( !gender.equals("Male") && !gender.equals("Female") ) ? false : true);
	}

	public boolean checkDepartment(String depertmentId) {

		int id;

		try {

			id = Integer.parseInt(depertmentId);

		} catch (NumberFormatException e) {

			return false; //not an integer.

		}

		DepartmentDAO db = new DepartmentDAO();
		Department department = null;

		try {

			department = db.getDepartmentByID( id );

			if( department != null ) {
				return true; //is valid.
			}

		} catch (Exception e) {
			return false; //department id is not valid.
		}

		return false;
	}

	public DataValidation() {

	}

}
