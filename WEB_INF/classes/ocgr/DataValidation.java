package ocgr;

public class DataValidation {

	public boolean isValidEmailAddress(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);

		return m.matches();
	}

	public boolean isPasswordValid(String password) {

			String ePattern =  "[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{8,}";
			java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
			java.util.regex.Matcher m = p.matcher(password);

			return m.matches();
	}

	public boolean isFullnameValid(String fullname) {

		String ePattern =  "[a-zA-Z ]{5,}";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(fullname);

		return m.matches();
	}

	public boolean isCompanynameValid(String compName) {

		String ePattern =  "[a-zA-Z0-9 ]{5,}";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(compName);

		return m.matches();
	}

	public boolean isAddressValid(String address) {

		String ePattern =  "[a-zA-Z0-9 ]{5,}";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(address);

		return m.matches();
	}


	public boolean isValidPhoneNumber(String phone) {

		String ePattern =  "[0-9]{10}";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(phone);

		return m.matches();
	}

	public boolean isValidInit(String init) {

		String ePattern =  "[0-9]{9}";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(init);

		return m.matches();
	}

	public boolean isDoiValid(String doi) {

		String ePattern =  "[a-zA-Z ]{5,}";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(doi);

		return m.matches();
	}

	public DataValidation() {

	}

}
