package exercise2_8130081;

import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {

	public DepartmentDAO() {

	}

	public List<Department> getDepartments() {

		List<Department> departments =  new ArrayList<Department>();

		departments.add( new Department(1, "Accounting and Finance") );
		departments.add( new Department(2, "Business Administration") );
		departments.add( new Department(3, "Economics") );
		departments.add( new Department(4, "International and European Economic Studies") );
		departments.add( new Department(5, "Informatics") );
		departments.add( new Department(6, "Management Science and Technology") );
		departments.add( new Department(7, "Marketing and Communication") );
		departments.add( new Department(8, "Statistics") );

		return departments;
	}

	public Department getDepartmentByID(int depid) {

		List<Department> departments = getDepartments();

		for(Department d : departments) {

			if(d.getId() == depid) {
				return d;
			}
		}

		return null;
	}

}
