package ocgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

public class CategoryDAO {

	public CategoryDAO() {  }

	public List<Category> getCategories() throws Exception {

		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_categories;";
		DB db = new DB();
		List<Category> categories = new ArrayList<Category>();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			ResultSet rs = stmt.executeQuery();
			while ( rs.next() ) {
				categories.add( new Category( rs.getString("id"), rs.getString("name"),rs.getString("description") ) );
			}
			rs.close();
			stmt.close();
			db.close();
			return categories;

		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}


}
