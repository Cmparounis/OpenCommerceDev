package ocgr;


import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import java.util.Set;

public class OrderDAO {

	public static void main(String args[]) {

		BigDecimal big = new BigDecimal(12.56);
		Category cat = new Category("1", "category", "cat name");
		Client client = new Client("2", "pass", "mail", "full", "comp", "add", "itin", "doy", "phone");
		Vendor vendor = new Vendor("5", "pass", "mail", "full", "comp", "add", "itin", "doy", "phone");
		Product prod = new Product("3", "desc", "name", cat);
		java.util.Date today = new java.util.Date();
		Timestamp date = new Timestamp(today.getTime());
		Order order = new Order("18", date, big, "add", "stat", "pay", client, vendor);
		Map<Product, Integer> map = new HashMap<Product, Integer>();
		map.put(prod, 4);

		try{
			System.out.println(order.getAddress());
			submitOrder(order, map);
			System.out.println(order.getStatus());
		} catch (Exception e) {

		}
	}


	/**
	 * Default constructor
	 */
	public OrderDAO() {  }

	/**
	 * This method returns a List with all Orders
	 *
	 * @return ArrayList<Order>, the Order Object
	 */
	public List<Order> getOrders() throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ocgr_orders left join ocgr_clients on ocgr_orders.client_id = ocgr_clients.client_id left join ocgr_vendors on ocgr_orders.vendor_id = ocgr_vendors.vendor_id;";

		DB db = new DB();

		List<Order> orders = new ArrayList<Order>();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Client client = new Client( rs.getString("client_id"), rs.getString("client_password"), rs.getString("client_email"),
											rs.getString("client_fullname"), rs.getString("client_compName"), rs.getString("client_address"),
											rs.getString("client_itin"), rs.getString("client_doy"), rs.getString("client_phone") );
				
				Vendor vendor = new Vendor( rs.getString("vendor_id"), rs.getString("vendor_password"), rs.getString("vendor_email"),
											rs.getString("vendor_fullname"), rs.getString("vendor_compName"), rs.getString("vendor_address"),
											rs.getString("vendor_itin"), rs.getString("vendor_doy"), rs.getString("vendor_phone") );

				orders.add( new Order(rs.getString("order_id"), rs.getTimestamp("order_date"), rs.getBigDecimal("order_total"),
									  rs.getString("order_address"), rs.getString("order_address"),
									  rs.getString("order_paymentmethod"), client, vendor ) );
			}
			rs.close();
			stmt.close();
			db.close();

			return orders;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of getOrders

	/**
	 * This method finds an Order by the order_id
	 *
	 * @return Order, the Order object
	 */
	public Order getOrderByID(String order_id) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ocgr_orders left join ocgr_clients on ocgr_orders.client_id = ocgr_clients.client_id left join ocgr_vendors on ocgr_orders.vendor_id = ocgr_vendors.vendor_id where order_id=? ;";

		DB db = new DB();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,order_id);
			rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				db.close();

				throw new Exception("Not valid Order_id");
			}
			Client client = new Client( rs.getString("client_id"), rs.getString("client_password"), rs.getString("client_email"),
										rs.getString("client_fullname"), rs.getString("client_compName"), rs.getString("client_address"),
										rs.getString("client_itin"), rs.getString("client_doy"), rs.getString("client_phone") );
			
			Vendor vendor = new Vendor( rs.getString("vendor_id"), rs.getString("vendor_password"), rs.getString("vendor_email"),
										rs.getString("vendor_fullname"), rs.getString("vendor_compName"), rs.getString("vendor_address"),
										rs.getString("vendor_itin"), rs.getString("vendor_doy"), rs.getString("vendor_phone") );
			
			Order order = new Order(rs.getString("order_id"), rs.getTimestamp("order_date"), rs.getBigDecimal("order_total"),
									rs.getString("order_address"), rs.getString("order_address"),
									rs.getString("order_paymentmethod"), client, vendor );
			rs.close();
			stmt.close();
			db.close();

			return order;

		}  catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of getOrderByID

	/**
	 * This method finds an Order using the client given
	 *
	 * @param Client, the Client object
	 * @return List<Order>, the Order object
	 */
	public List<Order> getOrderByClient(Client client) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ocgr_orders left join ocgr_clients on ocgr_orders.client_id = ocgr_clients.client_id left join ocgr_vendors on ocgr_orders.vendor_id = ocgr_vendors.vendor_id where client_id=? ;";

		DB db = new DB();

		List<Order> orders = new ArrayList<Order>();
		
		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,client.getId() );
			rs = stmt.executeQuery();
			
			while (rs.next()) {
			
			Vendor vendor = new Vendor( rs.getString("vendor_id"), rs.getString("vendor_password"), rs.getString("vendor_email"),
										rs.getString("vendor_fullname"), rs.getString("vendor_compName"), rs.getString("vendor_address"),
										rs.getString("vendor_itin"), rs.getString("vendor_doy"), rs.getString("vendor_phone") );
			
			orders.add( new Order(rs.getString("order_id"), rs.getTimestamp("order_date"), rs.getBigDecimal("order_total"),
									rs.getString("order_address"), rs.getString("order_address"), 
									rs.getString("order_paymentmethod"), client, vendor ) );
			}
			rs.close();
			stmt.close();
			db.close();

			return orders;

		}  catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of getOrderByClient

	/**
	 * This method finds an Order using the vendor given
	 *
	 * @param Vendor, the Vendor object
	 * @return Order, the Order object
	 */
	public List<Order> getOrderByVendor(Vendor vendor) throws Exception {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ocgr_orders left join ocgr_clients on ocgr_orders.client_id = ocgr_clients.client_id left join ocgr_vendors on ocgr_orders.vendor_id = ocgr_vendors.vendor_id where vendor_id=? ;";

		DB db = new DB();
		
		List<Order> orders = new ArrayList<Order>();

		try {
			db.open();
			con = db.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setString(1,vendor.getId() );
			rs = stmt.executeQuery();

			while (rs.next()) {
			
			Client client = new Client( rs.getString("client_id"), rs.getString("client_password"), rs.getString("client_email"),
										rs.getString("client_fullname"), rs.getString("client_compName"), rs.getString("client_address"),
										rs.getString("client_itin"), rs.getString("client_doy"), rs.getString("client_phone") );

			orders.add( new Order(rs.getString("order_id"), rs.getTimestamp("order_date"), rs.getBigDecimal("order_total"),
									rs.getString("order_address"), rs.getString("order_status"), 
									rs.getString("order_paymentmethod"), client, vendor ) );
			}
			rs.close();
			stmt.close();
			db.close();

			return orders;

		}  catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {
				db.close();
			} catch (Exception e) {}
		}
	} //End of getOrderByClient  

	/**
	 * This method is used to submit an order
	 *
	 * @param order, the Order object
	 */
	public static void submitOrder(Order order, Map<Product,Integer> products) throws Exception {

			Connection con = null;
			PreparedStatement stmt1 = null;
			PreparedStatement stmt2 = null;
			String sql1 = "insert into ocgr_orders values (?,?,?,?,?,?,?,?);";
			String sql2 = "insert into ocgr_isordered values (?,?,?);";

			DB db = new DB();

			try {
				db.open();
				con = db.getConnection();

				stmt1 = con.prepareStatement(sql1);

				stmt1.setString(1,order.getId() );
				stmt1.setTimestamp(2,order.getTimestamp());
				stmt1.setBigDecimal(3,order.getTotal() );
				stmt1.setString(4,order.getAddress() );
				stmt1.setString(5,order.getStatus() );
				stmt1.setString(6,order.getPayment() );
				Client client = order.getClient();
				stmt1.setString(7,client.getId() );
				Vendor vendor = order.getVendor();
				stmt1.setString(8,vendor.getId() );

				System.out.println(order.getId());
				stmt1.executeUpdate();
				System.out.println(order.getTotal());

				Set<Product> prods = products.keySet();
				Iterator<Product> itr = prods.iterator();

				while (itr.hasNext()) {
					Product productOrdered = (Product)itr.next();
					System.out.println(productOrdered.getId());

					stmt2 = con.prepareStatement(sql2);
					stmt2.setString(1, order.getId() );
					stmt2.setString(2, productOrdered.getId() );
					stmt2.setInt(3, products.get(productOrdered) );

					stmt2.executeUpdate();
				}

				stmt1.close();
				stmt2.close();
				db.close();

			} catch (Exception e) {
				System.out.println(e.getMessage());
				throw new Exception(e.getMessage());

			} finally {
				try {
					db.close();
				} catch (Exception e) {}
			}
		}//End of submitOrder

} //End of class
