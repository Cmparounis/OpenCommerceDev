package exercise3_8130081;

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
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ismgroup42.departments_ex3_8130081;";

		DB db = new DB();

		List<Department> departments = new ArrayList<Department>();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				departments.add( new Department(rs.getInt("id"),rs.getString("name") ) );
			}
			rs.close();
			stmt.close();
			db.close();

			return departments;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of getDepartments


	public Department getDepartmentByID(int depid) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ismgroup42.departments_ex3_8130081 where id=?;";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setInt(1,depid);
			rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				db.close();

				throw new Exception("Not valid Department id");
			}

			Department dep = new Department(rs.getInt("id"),rs.getString("name") );
			rs.close();
			stmt.close();
			db.close();

			return dep;

		}  catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of getDepartmentByID

} //End of class
