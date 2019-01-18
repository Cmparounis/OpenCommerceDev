package ocgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import java.math.BigDecimal;

public class ProductDAO {

	/**
	 * Default constructor
	 */
	public ProductDAO() {  }

	public void saveProduct(Product product) throws Exception {

		Connection con = null;
		String sqlquery = "INSERT INTO ocgr_products(product_id, product_description, product_name, category_id ) VALUES(?,?,?,?);";
		DB db = new DB();
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			if (product == null ) {
				stmt.close();
				db.close();
				throw new Exception("Product was not valid" );
			}else {
				stmt.setString(1, product.getId());
				stmt.setString(2, product.getDescription());
				stmt.setString(3, product.getName());
				Category category = product.getCategory();
				stmt.setString(4, category.getId());

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

	public void registerProduct(Product product, Vendor vendor, int stock, BigDecimal pricing, String scaling_info) throws Exception{
		Connection con = null;
		String sqlquery = "INSERT INTO ocgr_products(product_id, product_description, product_name, category_id ) VALUES(?,?,?,?);";
		DB db = new DB();
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			if (product == null ) {
				stmt.close();
				db.close();
				throw new Exception("Product was not valid" );
			}else {
				stmt.setString(1, product.getId());
				stmt.setString(2, product.getDescription());
				stmt.setString(3, product.getName());
				Category category = product.getCategory();
				stmt.setString(4, category.getId());

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
		String sqlquery2 = "INSERT INTO ocgr_isSupplied(vendor_id, product_id, available_stock, pricing, scaling_info ) VALUES(?,?,?,?,?);";

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery2);
			if (product == null || vendor == null || stock == 0 ||  pricing == null || scaling_info.equals(null) ) {
				stmt.close();
				db.close();
				throw new Exception("Product was not valid" );
			}else {
				stmt.setString(1, vendor.getId());
				stmt.setString(2, product.getId());
				stmt.setInt(3, stock);
				stmt.setBigDecimal(4, pricing);
				stmt.setString(5, scaling_info);

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
				throw new Exception( e.getMessage() );
			}
		}

	}

	public void updateProduct(Product product, Vendor vendor, int stock, BigDecimal pricing, String scaling_info) throws Exception{
		Connection con = null;
		String sqlquery = "UPDATE `ocgr_products` SET product_description = ?, product_name = ?, category_id =?  WHERE product_id = ?;";
		DB db = new DB();
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			if (product == null ) {
				stmt.close();
				db.close();
				throw new Exception("Could not update product" );
			}else {
				stmt.setString(1, product.getDescription());
				stmt.setString(2, product.getName());
				Category category = product.getCategory();
				stmt.setString(3, category.getId());
				stmt.setString(4, product.getId());

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
		String sqlquery2 = "UPDATE `ocgr_isSupplied` SET available_stock = ?, pricing = ?, scaling_info =?  WHERE product_id = ? AND vendor_id = ?;";

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery2);
			if (product == null || vendor == null || stock == 0 ||  pricing == null || scaling_info.equals(null) ) {
				stmt.close();
				db.close();
				throw new Exception("Product was not valid" );
			}else {
				stmt.setInt(1, stock);
				stmt.setBigDecimal(2, pricing);
				stmt.setString(3, scaling_info);
				stmt.setString(4, vendor.getId());
				stmt.setString(5, product.getId());

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
				throw new Exception( e.getMessage() );
			}
		}
	}

	public Product getProductById(String id) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_products LEFT JOIN ocgr_categories ON ocgr_products.category_id = ocgr_categories.category_id WHERE product_id = ?;";
		DB db = new DB();
		Product currentProduct = null ;

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				Category currentCategory = new Category( rs.getString("category_id"), rs.getString("category_description"), rs.getString("category_name") );
				currentProduct = new Product( rs.getString("product_id"), rs.getString("product_description"),rs.getString("product_name"), currentCategory );
			}
			
			rs.close();
			stmt.close();
			db.close();

			return currentProduct;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public List<Product> getProductByCategory(Category category) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_products WHERE category_id = ?;";
		DB db = new DB();

		List<Product> products = new ArrayList<Product>();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, category.getId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){

				products.add( new Product( rs.getString("product_id"), rs.getString("product_description"),rs.getString("product_name"), category ) );
			}
			
			rs.close();
			stmt.close();
			db.close();

			return products;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public List<Product> getProductByVendor(Vendor vendor) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_products LEFT JOIN ocgr_issupplied ON ocgr_products.product_id = ocgr_issupplied.product_id LEFT JOIN ocgr_categories ON ocgr_products.category_id = ocgr_categories.category_id WHERE vendor_id = ? ;";
		DB db = new DB();
		List<Product> products = new ArrayList<Product>();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, vendor.getId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				Category currentCategory = new Category( rs.getString("category_id"), rs.getString("category_description"), rs.getString("category_name") );
				Product currentProduct = new Product( rs.getString("product_id"), rs.getString("product_description"),rs.getString("product_name"), currentCategory );
				products.add(currentProduct);
			}
			
			rs.close();
			stmt.close();
			db.close();

			return products;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public double getAverageRatings(Product product) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT AVG(rating) FROM ocgr_ratings WHERE product_id = ? ;";

		DB db = new DB();

		double averageRating = 0;
		String temp;
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, product.getId() );
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong product id");
			}

			temp = rs.getString(1);
			averageRating = Double.parseDouble(temp);
			
			rs.close();
			stmt.close();
			db.close();

			return averageRating;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public List<Product> getThreeBest(Category category) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT ocgr_products.product_id, product_description, product_name,ocgr_categories.category_id ,AVG(rating) AS Average \r\n" + 
				"FROM ocgr_ratings LEFT JOIN ocgr_products ON ocgr_ratings.product_id=ocgr_products.product_id LEFT JOIN ocgr_categories \r\n" +
				"ON ocgr_categories.category_id=ocgr_products.category_id \r\n" + 
				"where ocgr_categories.category_id=? \r\n" + 
				"GROUP BY product_id ORDER BY Average ;" ;
		DB db = new DB();

		List<Product> products = new ArrayList<Product>();
		List<Product> threeBest = new ArrayList<Product>();
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, category.getId() );
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				products.add(new Product( rs.getString("product_id"), rs.getString("product_description"),rs.getString("product_name"), category ));
			}
			
			if (products.size()>2) {
				for (int j=products.size(); j>(products.size()-3); j--) {
					threeBest.add(products.get(j-1));
				}
			} else if (products.size()==2) {
				threeBest.add(products.get(1));
				threeBest.add(products.get(0));
			}
				
			rs.close();
			stmt.close();
			db.close();

			return threeBest;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}


	public BigDecimal getPricing(Product product) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT pricing FROM ocgr_isSupplied WHERE product_id = ? ;";

		DB db = new DB();
		BigDecimal pricing = new BigDecimal(0) ;
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, product.getId() );
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong product id");
			}
			
			pricing = rs.getBigDecimal("pricing");
			
			rs.close();
			stmt.close();
			db.close();

			return pricing;

		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public int getStock(Product product) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT available_stock FROM ocgr_isSupplied WHERE product_id = ? ;";

		DB db = new DB();
		int stock = 0;
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, product.getId() );
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong product id");
			}
			
			stock = rs.getInt("available_stock");
			
			rs.close();
			stmt.close();
			db.close();

			return stock;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public String getScaling(Product product) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT scaling_info FROM ocgr_isSupplied WHERE product_id = ? ;";

		DB db = new DB();
		String scaling = null;
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, product.getId() );
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong product id");
			}
			
			scaling = rs.getString("scaling_info");
			
			rs.close();
			stmt.close();
			db.close();

			return scaling;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public int getQuantity(Product product) throws Exception {
		Connection con = null;
		String sqlquery = "SELECT quantity FROM ocgr_isOrdered WHERE product_id = ? ;";

		DB db = new DB();
		int quantity = 0;
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, product.getId() );
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong product id");
			}
			
			quantity = rs.getInt("quantity");
			
			rs.close();
			stmt.close();
			db.close();

			return quantity;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}

	public List<Product> getProducts() throws Exception {
		Connection con = null;
		String sqlquery = "SELECT * FROM ocgr_products LEFT JOIN ocgr_categories ON ocgr_products.category_id = ocgr_categories.category_id;";

		DB db = new DB();
		List<Product> products = new ArrayList<Product>();

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				Category currentCategory = new Category( rs.getString("category_id"), rs.getString("category_description"), rs.getString("category_name") );
				Product currentProduct = new Product( rs.getString("product_id"), rs.getString("product_description"),rs.getString("product_name"), currentCategory );
				products.add(currentProduct);
			}
			
			rs.close();
			stmt.close();
			db.close();

			return products;
		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		} finally {
			try {
				db.close();
			} catch (Exception e) {
			}
		}
	}
	
	public List<Product> getRecommended() throws Exception {
		Connection con = null;
		String sqlquery = "SELECT ocgr_products.product_id, product_description, product_name, category_id, AVG(rating) AS Average FROM ocgr_ratings LEFT JOIN ocgr_products ON ocgr_ratings.product_id=ocgr_products.product_id GROUP BY product_id ORDER BY Average ;";

		DB db = new DB();

		List<Product> products = new ArrayList<Product>();
		List<Product> recommended = new ArrayList<Product>();
		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			ResultSet rs = stmt.executeQuery();
			
			while ( rs.next() ) {
				CategoryDAO cdao = new CategoryDAO();
				Category category = cdao.getCategorybyId(rs.getString("category_id"));
				products.add(new Product( rs.getString("product_id"), rs.getString("product_description"),rs.getString("product_name"), category ));
			}
			
			if (products.size()>2) {
				for (int j=products.size(); j>(products.size()-3); j--) {
					recommended.add(products.get(j-1));
				}
			} else if (products.size()==2) {
				recommended.add(products.get(1));
				recommended.add(products.get(0));
			}

			rs.close();
			stmt.close();
			db.close();

			return recommended;
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

