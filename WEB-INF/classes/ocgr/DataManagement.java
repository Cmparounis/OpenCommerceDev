package ocgr;

import java.util.Random;
import java.util.List;
import java.util.LinkedList;
import java.util.LinkedHashSet;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataManagement {
	
	public static LinkedHashSet<Product> simpleSearch(String str){
		ProductDAO pdao = new ProductDAO();
		LinkedList<String> searchInput = toWords(str);
		LinkedHashSet<Product> searchResults = new LinkedHashSet<Product>();
		List<Product> allProducts = new LinkedList<Product>();
		HashSet<String> keywords = new HashSet<String>();
		try {
			for (String word : searchInput) {
			allProducts = pdao.getProducts();
				for (Product product : allProducts) {
					keywords = getKeywords(product);
					if (keywords.contains(word)) {
						searchResults.add(product);
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return searchResults;
	}

	public static HashSet<String> getKeywords(Product product) {
		HashSet<String> keywords = new HashSet<String>();
		Category category = product.getCategory();
		keywords.addAll(toWords(product.getName()));
		keywords.addAll(toWords(product.getDescription()));
		keywords.addAll(toWords(category.getName()));
		keywords.addAll(toWords(category.getDescription()));
		return keywords;
	}

	public static LinkedList<String> toWords(String str) {
		LinkedList<String> currentList = new LinkedList<String>();
		String[] wordArray = new String[100];
		Pattern UNWANTED_SYMBOLS = Pattern.compile("\\p{Punct}");
		Matcher unwantedMatcher = UNWANTED_SYMBOLS.matcher(str);
		str = unwantedMatcher.replaceAll("");
		wordArray = str.split(" ");
		for (String element : wordArray) {
			currentList.add(element);
			currentList.add(element.toLowerCase());
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



