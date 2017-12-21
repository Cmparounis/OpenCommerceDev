package ocgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * ClientDAO provides all the necessary methods for "handling" client's data.
 */

public class ClientDAO {

	/**
	 * Default constructor
	 */
	public ClientDAO() { }

	/**
	 * This method returns a List with all Clients
	 *
	 * @return List<Client>, the Client object
	 */
	public List<Client> getClients() throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ocgr_clients ;" ;

		DB db = new DB();
		List<Client> clients = new ArrayList<Client>();

		try {

			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while ( rs.next() ) {
				clients.add( new Client( rs.getString("client_id"), rs.getString("client_password"), rs.getString("client_email"),
											rs.getString("client_fullname"), rs.getString("client_compName"), rs.getString("client_address"),
											rs.getString("client_itin"), rs.getString("client_doy"), rs.getString("client_phone") ) );
			}

			rs.close();
			stmt.close();
			db.close();

			return clients;

		} catch (Exception e) {

			throw new Exception( e.getMessage() );

		} finally {

			try {
				db.close();
			} catch (Exception e) {	}
		}

	}//End of getClients

	/**
	 * This method is used to register a vendor
	 *
	 * @param vendor, the Vendor object
	 */
	public void registerClient(Client client) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		String sql = "insert into ocgr_clients values (?,?,?,?,?,?,?,?,?);";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,client.getId() );
			stmt.setString(2,client.getPassword() );
			stmt.setString(3,client.getEmail() );
			stmt.setString(4,client.getFullname() );
			stmt.setString(5,client.getCompName() );
			stmt.setString(6,client.getAddress() );
			stmt.setString(7,client.getItin() );
			stmt.setString(8,client.getDoy() );
			stmt.setString(9,client.getPhone() );

			stmt.executeUpdate();

			stmt.close();
			db.close();

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	}//End of registerClient

	/**
	 * Check Client's credentials.
	 *
	 * @param email, String
	 * @param password, String
	 * @throws Exception, if email or password do not match or encounter error.
	*/
	public void authenticate(String email, String password) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		String sql= "select * from ocgr_clients where client_email=? and client_password=?;";

		DB db = new DB();

		try {

			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString( 1, email );
			stmt.setString( 2, password );

			ResultSet rs = stmt.executeQuery();

			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong email or password");
			}

			rs.close();
			stmt.close();
			db.close();

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {	}
		}

	}//End of authenticate

	/**
	 * Find Client by email & password
	 *
	 * @param email, String
	 * @param password, String
	 * @return Client, the Client object
	 * @throws Exception, if Client not found or encounter error
	 */
	public Client findClient(String email, String password) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * ocgr_clients where client_email=? and client_password=? ;";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1, email );
			stmt.setString(2, password );
			rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				db.close();

				throw new Exception("Not valid Email or Password");
			}

			Client client = new Client( rs.getString("client_id"), rs.getString("client_password"), rs.getString("client_email"),
										rs.getString("client_fullname"), rs.getString("client_compName"), rs.getString("client_address"),
										rs.getString("client_itin"), rs.getString("client_doy"), rs.getString("client_phone") );
			rs.close();
			stmt.close();
			db.close();

			return client;

		}catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of findClient


	/**
	 * Update Client details
	 *
	 * @param Client, the Client object
	 * @throws Exception, if Client not found or encounter error
	 */
	public void updateClient(Client client) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		String sql = "update ocgr_clients set client_password=?, client_email=?, client_fullname=?, client_compName=?,  client_address=?, client_itin=?,  client_doy=?, client_phone=?  where client_id=? ;";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,client.getPassword() );
			stmt.setString(2,client.getEmail() );
			stmt.setString(3,client.getFullname() );
			stmt.setString(4,client.getCompName() );
			stmt.setString(5,client.getAddress() );
			stmt.setString(6,client.getItin() );
			stmt.setString(7,client.getDoy() );
			stmt.setString(8,client.getPhone() );
			stmt.setString(9,client.getId() );

			stmt.executeUpdate();

			stmt.close();
			db.close();

		}catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of updateClient

	public HashMap<Product, Rating>  getRatingsByClient (Client client) throws Exception{
		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_ratings LEFT JOIN  ocgr_products ON ocgr_ratings.product_id = ocgr_products.product_id WHERE client_id = ? ;";
		DB db = new DB();
		HashMap<Product, Rating> ratingMap = new HashMap<Product, Rating>();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, client.getId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				Category currentCategory = new Category( rs.getString("category_id"), rs.getString("category_description"), rs.getString("category_name") );
				Product currentProduct = new Product( rs.getString("product_id"), rs.getString("product_description"),rs.getString("product_name"), currentCategory );
				Rating currentRating = new Rating(client.getId(), rs.getString("product_id"), rs.getDouble("rating"));
				ratingMap.put(currentProduct, currentRating);
			}
			stmt.close();
			db.close();
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
		return ratingMap;
	}
}

