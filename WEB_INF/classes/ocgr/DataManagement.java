package ocgr;

import java.util.Random;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataManagement {

	public static ArrayList<String> getKeywords(Product product) {
		ArrayList<String> keywords = new ArrayList<String>();
		Category category = product.getCategory();
		keywords.addAll(toWords(product.getName()));
		keywords.addAll(toWords(product.getDescription()));
		keywords.addAll(toWords(category.getName()));
		keywords.addAll(toWords(category.getDescription()));
		return keywords;
	}

	public static ArrayList<String> toWords(String str) {
		ArrayList<String> currentList = new ArrayList<String>();
		String[] wordArray = new String[100];
		Pattern UNWANTED_SYMBOLS = Pattern.compile("\\p{Punct}");
		Matcher unwantedMatcher = UNWANTED_SYMBOLS.matcher(str);
		str = unwantedMatcher.replaceAll("");
		wordArray = str.split(" ");
		for (String element : wordArray) {
			currentList.add(element);
		}
		return currentList;
	}


	public String generateId (String type) throws Exception {

		String id;

		if (!(type.equals("client") || type.equals("vendor") || type.equals("product") || type.equals("category") || type.equals("order")) )
			throw new Exception("Incorrect Input");
		else {
			boolean found;
			do {
				found = false;
				Random random = new Random();
				int randomId = random.nextInt(899999) + 100000;

				id = type.substring(0,2).concat(Integer.toString(randomId));

				Connection con = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;

				String sql = null;
				switch(type) {
					case "client": sql = "select `client_id` from ismgroup42.OCGR_Clients ;" ;
					break;
					case "vendor": sql = "select `vendor_id` from ismgroup42.OCGR_Vendors ;" ;
					break;
					case "product": sql = "select `product_id` from ismgroup42.OCGR_Products ;" ;
					break;
					case "category": sql = "select `category_id` from ismgroup42.OCGR_Categories ;" ;
					break;
					case "order": sql = "select `order_id` from ismgroup42.OCGR_Orders ;" ;
					break;
					default: break;
				}

				DB db = new DB();

				try {

					db.open();
					con = db.getConnection();

					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();

					while ( rs.next() ) {
						if (rs.getString(type+"_id").equals(id)) {
							found = true;
						}
					}

					rs.close();
					stmt.close();
					db.close();
				} catch (SQLException e) {
					throw new Exception( e.getMessage() );
				} finally {
					try {
						db.close();
					} catch (Exception e) {	}
				}

			}while (found == true);
			return id;
		}
	}

}



