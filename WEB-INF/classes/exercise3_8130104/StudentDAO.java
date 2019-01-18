package exercise3_8130104;

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
		String sqlquery = "INSERT INTO students_ex3_8130104(am, fullname, email, phone, gender, department_id) VALUES(?,?,?,?,?,?);";
		DB db = new DB();
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			if (student == null ) {
				stmt.close();
				db.close();
				throw new Exception("User was not initiated" );
			}else {
				stmt.setString(1, student.getAm());
				stmt.setString(2, student.getFullname());
				stmt.setString(3, student.getEmail());
				stmt.setString(4, student.getPhone());
				stmt.setString(5, student.getGender());
				Department stDep = student.getDepartment();
				stmt.setInt(6, stDep.getId());

				stmt.executeUpdate();
				stmt.close();
				db.close();
			}
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}

	}

	public List<Student> getStudents() throws Exception {
		Connection con = null;
		String sqlquery = "SELECT * FROM students_ex3_8130104 LEFT JOIN departments_ex3_8130104 ON students_ex3_8130104.department_id = departments_ex3_8130104.id;";
		DB db = new DB();
		List<Student> students = new ArrayList<Student>();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				Department cDep = new Department(rs.getInt("department_id"), rs.getString("name"));
				Student cStu = new Student( rs.getString("am"), rs.getString("fullname"), rs.getString("email"), rs.getString("phone"), rs.getString("gender"),  cDep);
				students.add(cStu);
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
		return students;
	}
} //End of class

