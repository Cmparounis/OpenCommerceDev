package exercise3_8130104;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class DepartmentDAO {

	/**
	 * Default constructor
	 */
	public DepartmentDAO() {  }

	public List<Department> getDepartments() throws Exception {

		Connection con = null;
		String sqlquery = "SELECT * FROM departments_ex3_8130104;";
		DB db = new DB();
		List<Department> departments = new ArrayList<Department>();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			ResultSet rs = stmt.executeQuery();
			while ( rs.next() ) {
				departments.add( new Department( rs.getInt("id"), rs.getString("name") ) );
			}
			rs.close();
			stmt.close();
			db.close();
			return departments;

		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	} //End of getDepartments


	public Department getDepartmentByID(int depid) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT * FROM departments_ex3_8130104 WHERE id = ?;";
		DB db = new DB();
		try {

			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt(1, depid);
			ResultSet rs = stmt.executeQuery();
			if (!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Could not find Department with id:" + depid );
			}
			Department cDep = new Department( rs.getInt("id"), rs.getString("name"));
			rs.close();
			stmt.close();
			db.close();

			return cDep ;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	} //End of getDepartmentByID

} //End of class
