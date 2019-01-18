import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import ocgr.*;

@SuppressWarnings("serial")
public class RegisterController extends HttpServlet {


	/**
	* Handles HTTP POST requests.
	*
	* @param request
	*            the request object
	* @param response
	*            the response object
	*
	* @throws IOException
	*             if an input or output error is detected when the servlet
	*             handles the POST request
	* @throws ServletException
	*             if the request for the POST could not be handled
	*/
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	   throws IOException, ServletException {

		response.setContentType("text/html; charset=utf-8");
    	HttpSession session = request.getSession(true);

		/*
		 * gets parameters from the request.
		 */
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String fullname = request.getParameter("name");
		String companyName = request.getParameter("companyName");
		String address = request.getParameter("address");
		String itin = request.getParameter("itin");
		String doi = request.getParameter("doi");
		String phone = request.getParameter("phone");
		String userType = request.getParameter("userType");

		DataValidation checkData = new DataValidation();

		if ( checkData.isValidEmailAddress(email) && checkData.isPasswordValid(password) && checkData.isPasswordValid(confirmPassword) &&
				checkData.isFullnameValid(fullname) && checkData.isCompanynameValid(companyName) && checkData.isAddressValid(address)
				&& checkData.isValidPhoneNumber(phone) && checkData.isValidInit(itin) && checkData.isDoiValid(doi) ) {

			DataManagement data = new DataManagement();

			if (userType.equals("client")) {

				ClientDAO cdao = new ClientDAO();
				String id = null;
				Client client = null;

				try {
					id = data.generateId("client");
					client = new Client(id, password, email, fullname, companyName, address, itin, doi, phone );
					cdao.registerClient(client);
					session.setAttribute("user-object", client);
					session.setAttribute("user-type", "client");

					RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
					dispatcher.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("message", "A problem occured! Please register again");
					RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
					dispatcher.forward(request, response);
				}
			}else if (userType.equals("vendor")) {

				VendorDAO vdao = new VendorDAO();
				String id = null;
				Vendor vendor = null;

				try {
					id = data.generateId("vendor");
					vendor = new Vendor(id, password, email, fullname, companyName, address, itin, doi, phone );
					vdao.registerVendor(vendor);
					session.setAttribute("user-object", vendor);
					session.setAttribute("user-type", "vendor");

					RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
					dispatcher.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("message", "A problem occured! Please register again");
					RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
					dispatcher.forward(request, response);
				}
			} else {
				request.setAttribute("message", "Invalid data. Please register again");
				RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			if (!checkData.isValidEmailAddress(email)) {
				request.setAttribute("message", "Invalid email. Please register again");
			}
			if (!checkData.isPasswordValid(password)) {
						request.setAttribute("message", "Invalid email. Please register again");
			}
			if (!checkData.isFullnameValid(fullname)) {
						request.setAttribute("message", "Invalid fullname. Please register again");
			}
			if (!checkData.isCompanynameValid(companyName)) {
						request.setAttribute("message", "Invalid Company Name. Please register again");
			}
			if (!checkData.isAddressValid(address)) {
						request.setAttribute("message", "Invalid address. Please register again");
			}
			if (!checkData.isValidPhoneNumber(phone)) {
						request.setAttribute("message", "Invalid phone number. Please register again");
			}
			if (!checkData.isValidInit(itin)) {
						request.setAttribute("message", "Invalid tax registration number. Please register again");
			}
			if (!checkData.isDoiValid(doi)) {
						request.setAttribute("message", "Invalid doi. Please register again");
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            doPost(request, response);
	}

}

