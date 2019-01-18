package ocgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class RatingDAO {
	
	public static void SubmitRating(Rating rating) throws Exception {

		Connection con = null;
		String sqlquery = "INSERT INTO ocgr_Ratings(client_id, product_id, rating, comment ) VALUES(?,?,?,?);";
		DB db = new DB();
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			if (rating == null ) {
				stmt.close();
				db.close();
				throw new Exception("Product was not valid" );
			}else {
				stmt.setString(1, rating.getClientId() );
				stmt.setString(2, rating.getProductId());
				stmt.setDouble(3, rating.getRating());
				stmt.setString(4, rating.getComment());

				stmt.executeUpdate();
				stmt.close();
				db.close();
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}

	}

	public static LinkedList<Rating> getRatingsForProduct(Product product) {
		LinkedList<Rating> ratings = new LinkedList<Rating>();
		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_Ratings left join ocgr_Products on ocgr_Ratings.product_id = ocgr_Products.product_id LEFT JOIN ocgr_Clients on ocgr_Ratings.client_id = ocgr_Clients.client_id WHERE product_id = ? ;";
		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, product.getId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				Rating currentRating = new Rating(rs.getString("client_id"), rs.getString("product_id"), rs.getDouble("rating"), rs.getString("comment"));
				ratings.add(currentRating);
			}
			stmt.close();
			db.close();
		} catch (Exception e) {
			 e.getMessage();
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
		return ratings;
		
	}

}
