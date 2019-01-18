package exercise3_8130081;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class StudentDAO {

	/**
	 * Default constructor
	 */
	public StudentDAO() {  }

	public void saveStudent(Student student) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		String sql = "insert into ismgroup42.students_ex3_8130081 values (?,?,?,?,?,?);";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,student.getAm() );
			stmt.setString(2,student.getFullname() );
			stmt.setString(3,student.getEmail() );
			stmt.setString(4,student.getPhone() );
			stmt.setString(5,student.getGender() );
			Department stDep = student.getDepartment();
			stmt.setInt(6,stDep.getId() );

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
	} //End of saveStudent


	public List<Student> getStudents() throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select am, fullname, email, phone, gender, id, name from ismgroup42.students_ex3_8130081 left join ismgroup42.departments_ex3_8130081 on ismgroup42.students_ex3_8130081.department_id = ismgroup42.departments_ex3_8130081.id ;";

		DB db = new DB();

		List<Student> students = new ArrayList<Student>();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Department stDep = new Department(rs.getInt("id") , rs.getString("name") );

				students.add( new Student(rs.getString("am"),rs.getString("fullname"),rs.getString("email"),
					rs.getString("phone"),rs.getString("gender"),stDep ) );
			}
			rs.close();
			stmt.close();
			db.close();

			return students;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of getStudents

	/*
	public boolean duplicateStudent (String st_AM) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ismgroup42.students_ex3_8130081 ;";

		boolean duplicate = false;

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {

				if (rs.getString("am") == st_AM) {
					duplicate = true;
				}
			}
			return duplicate;
		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of duplicateStudent
	*/


} //End of class
