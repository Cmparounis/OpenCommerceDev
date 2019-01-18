package exercise2_8130104;

import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO provides all the necessary methods for "handling" user's data.
 * In further lessons we will change all the code of the body of the methods and use
 * JDBC API in order to handle (real) user's data from a database.
 *
 * @author sofos@aueb.gr
 *
 */
public class UserDAO {

	/**
	 * This method returns a List with all Users
	 *
	 * @return List<User>
	 */
	public List<User> getUsers() {

		List<User> users = new ArrayList<User>();

		// adding some users for the sake of the example
		users.add(new User("user1", "1111", "user1@somewhere.com"));
		users.add(new User("user2", "2222", "user2@somewhere.com"));
		users.add(new User("user3", "3333", "user3@somewhere.com"));

		return users;

	}

	/**
	 * Search user by username
	 *
	 * @param username, String
	 * @return User, the User object
	 * @throws Exception, if user not found
	 */
	public User findUser(String username) throws Exception {

		List<User> users = getUsers();

		for (User user : users) {

			if ( user.getUsername().equals(username) ) {
				return user;
			}

		}

		throw new Exception("User with username: " + username + " does not exist");
	}

	/**
	 * Checks if the credentials are valid.
	 *
	 * @param username
	 * @param password
	 * @throws Exception, if the credentials are not valid
	 */
	public void authenticate(String username, String password) throws Exception {

		List<User> users = getUsers();

		for (User user : users) {

			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				return; // credentials are valid, so do nothing (return)
			}

		}

		throw new Exception("Wrong username or password");
	}

	public UserDAO() {

	}

}
