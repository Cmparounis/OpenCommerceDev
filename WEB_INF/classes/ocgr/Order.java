package ocgr;

import java.sql.Timestamp;
import java.math.BigDecimal;

public class Order {

	private String id;
	private Timestamp timestamp;
	private BigDecimal total;
	private String address;
	private String status;
	private String payment;
	private Client client;
	private Vendor vendor;

	/*
	 * Full Constructor
	 */

	public Order(String id, Timestamp timestamp, BigDecimal total, String address, String status,
					String payment, Client client, Vendor vendor) {
		this.id = id;
		this.timestamp = timestamp;
		this.total = total;
		this.address = address;
		this.status = status;
		this.payment = payment;
		this.client = client;
		this.vendor = vendor;
	}

	/*Getters and Setters*/

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
	
	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

}