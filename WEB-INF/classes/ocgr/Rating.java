/**
 * 
 */
package ocgr;

/**
 * @author Divis
 *
 */
public class Rating {
	
	private String client_id;
	private String product_id;
	private double rating;
	private String comment;

	/*
	 * Full Constructor
	 */

	public Rating(String client_id, String product_id, double rating, String comment) {
		this.client_id = client_id;
		this.product_id = product_id;
		this.rating = rating;
		this.comment = comment;
	}


	/*Getters and Setters*/

	public String getClientId() {
		return client_id;
	}

	public void setClientId(String client_id) {
		this.client_id = client_id;
	}
	
	public String getProductId() {
		return product_id;
	}

	public void setProductId(String product_id) {
		this.product_id = product_id;
	}
	
	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getComment() {
		return comment;
	}

}
