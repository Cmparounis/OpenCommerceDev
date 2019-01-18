import java.math.BigDecimal;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import ocgr.*;

public class ProductController extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		response.setContentType("text/html; charset=utf-8");
    	HttpSession session = request.getSession(true);

    	/*
		 * gets parameters from the request.
		 */
		String category_id = request.getParameter("category");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String pieces = request.getParameter("pieces");
		String string_price = request.getParameter("price");
		String discount = request.getParameter("discount");
		String scaling = request.getParameter("scaling");

		DataManagement data = new DataManagement();
		ProductDAO pdao = new ProductDAO();
		CategoryDAO cdao = new CategoryDAO();
		Category category = null;
		String id = null;
		Product product = null;

		try{
			id = data.generateId("product");
			category = cdao.getCategorybyId(category_id);
			product = new Product(id, description, name, category);
			Vendor vendor = (Vendor)session.getAttribute("user-object");
			int stock = Integer.parseInt(pieces);
			BigDecimal price = new BigDecimal(string_price);
			price = price.setScale(2, BigDecimal.ROUND_HALF_UP);
			String scaling_info = "EOS"+discount+"%"+scaling;

			pdao.registerProduct(product, vendor, stock, price, scaling_info);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("submitProduct.jsp");
			dispatcher.forward(request, response);
			return;
		}

		request.setAttribute("category", category);
		request.setAttribute("prod_name", name);
		request.setAttribute("description", description);
		request.setAttribute("product", product);
		request.setAttribute("pieces", pieces);
		request.setAttribute("price", string_price);
		request.setAttribute("scaling", discount+"%  discount up to "+scaling+" pieces");
		RequestDispatcher dispatcher = request.getRequestDispatcher("successfull_submission.jsp");
		dispatcher.forward(request, response);

	}
}


