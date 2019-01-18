package ocgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * VendorDAO provides all the necessary methods for "handling" vendor's data.
 */

public class VendorDAO {

	/**
	 * Default constructor
	 */
	public VendorDAO() { }

	/**
	 * This method returns a List with all Vendors
	 *
	 * @return List<Vendor>, the Vendor object
	 */
	public List<Vendor> getVendors() throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ocgr_vendors ;" ;

		DB db = new DB();
		List<Vendor> vendors = new ArrayList<Vendor>();

		try {

			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while ( rs.next() ) {
				vendors.add( new Vendor( rs.getString("vendor_id"), rs.getString("vendor_password"), rs.getString("vendor_email"),
											rs.getString("vendor_fullname"), rs.getString("vendor_compName"), rs.getString("vendor_address"),
											rs.getString("vendor_itin"), rs.getString("vendor_doy"), rs.getString("vendor_phone") ) );
			}

			rs.close();
			stmt.close();
			db.close();

			return vendors;

		} catch (Exception e) {

			throw new Exception( e.getMessage() );

		} finally {

			try {
				db.close();
			} catch (Exception e) {	}
		}

	}//End of getVendors


	/**
	 * This method is used to register a vendor
	 *
	 * @param vendor, the Vendor object
	 */
	public void registerVendor(Vendor vendor) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		String sql = "insert into ocgr_vendors values (?,?,?,?,?,?,?,?,?);";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,vendor.getId() );
			stmt.setString(2,vendor.getPassword() );
			stmt.setString(3,vendor.getEmail() );
			stmt.setString(4,vendor.getFullname() );
			stmt.setString(5,vendor.getCompName() );
			stmt.setString(6,vendor.getAddress() );
			stmt.setString(7,vendor.getItin() );
			stmt.setString(8,vendor.getDoy() );
			stmt.setString(9,vendor.getPhone() );

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
	}//End of registerVendor

	/**
	 * Check vendor's credentials.
	 *
	 * @param email, String
	 * @param password, String
	 * @throws Exception, if email or password do not match or encounter error.
	*/
	public void authenticate(String email, String password) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		String sql= "select * from ocgr_vendors where vendor_email=? and vendor_password=?;";

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
		 * Search Vendor by email & password
		 *
		 * @param email, String
		 * @param password, String
		 * @return Vendor, the Vendor object
		 * @throws Exception, if Vendor not found or encounter error
		 */
	public Vendor findVendor(String email, String password) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ocgr_vendors where vendor_email=? and vendor_password=? ;";

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

			Vendor vendor = new Vendor( rs.getString("vendor_id"), rs.getString("vendor_password"), rs.getString("vendor_email"),
										rs.getString("vendor_fullname"), rs.getString("vendor_compName"), rs.getString("vendor_address"),
										rs.getString("vendor_itin"), rs.getString("vendor_doy"), rs.getString("vendor_phone") );
			rs.close();
			stmt.close();
			db.close();

			return vendor;

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
	public void updateVendor(Vendor vendor) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		String sql = "update ocgr_vendors set vendor_password=?, vendor_email=?, vendor_fullname=?, vendor_compName=?,  vendor_address=?, vendor_itin=?,  vendor_doy=?, vendor_phone=?  where vendor_id=? ;";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,vendor.getPassword() );
			stmt.setString(2,vendor.getEmail() );
			stmt.setString(3,vendor.getFullname() );
			stmt.setString(4,vendor.getCompName() );
			stmt.setString(5,vendor.getAddress() );
			stmt.setString(6,vendor.getItin() );
			stmt.setString(7,vendor.getDoy() );
			stmt.setString(8,vendor.getPhone() );
			stmt.setString(9,vendor.getId() );

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
	
	public Vendor getVendorById(String id) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_vendors WHERE vendor_id = ?;";
		
		DB db = new DB();
		Vendor vendor = null ;

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, id );
			ResultSet rs = stmt.executeQuery();
			
			if (!rs.next()) {
				rs.close();
				stmt.close();
				db.close();

				throw new Exception("Not valid vendor_id");
			}
			
			vendor = new Vendor( rs.getString("vendor_id"), rs.getString("vendor_password"), rs.getString("vendor_email"),
								rs.getString("vendor_fullname"), rs.getString("vendor_compName"), rs.getString("vendor_address"),
								rs.getString("vendor_itin"), rs.getString("vendor_doy"), rs.getString("vendor_phone") );
			rs.close();
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
		return vendor;
	}
	
	public Vendor getVendorByProduct (Product product) throws Exception {

		Connection con = null;
		String sqlquery = "SELECT vendor_id FROM ocgr_isSupplied WHERE product_id = ? ;";

		DB db = new DB();
		String vendor_id = null;
		Vendor vendor  = null;
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, product.getId() );
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong product id");
			}
			
			vendor_id = rs.getString("vendor_id");
			vendor = getVendorById(vendor_id);
			
			rs.close();
			stmt.close();
			db.close();

			return vendor;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	} //End of getVendorByProduct

}

