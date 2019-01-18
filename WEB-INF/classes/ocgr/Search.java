package ocgr;

import java.util.ArrayList;
import java.util.List;


public class Search {

	/**
	 * Default constructor
	 */
	public Search() {  }

	
	public static ArrayList<Product> SearchForProduct(String search){
		ArrayList<Product> Aaaaa = new ArrayList<Product>();
		ArrayList<String> searchwords = DataManagement.toWords(search);
		ProductDAO pdao = new ProductDAO();
		try {

			List<Product> allProducts = pdao.getProducts();
			for (String element: searchwords) {
				for (Product product : allProducts) {
					ArrayList<String> keywords = DataManagement.getKeywords(product);
					for (String key : keywords){
						if (element.equals(key)){
							Aaaaa.add(product);
						}
					}
				}
			}
		} catch (Exception e) {
		}
		return Aaaaa;
	}
}