package ocgr;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Data {

	public static void main (String args[]) {

		ProductDAO pdao = new ProductDAO();
		CategoryDAO cdao = new CategoryDAO();
		String cid = "CA334455";
		Category categ = null;
		try{
			categ = cdao.getCategorybyId(cid);
		} catch (Exception e) {
					System.out.println(e.getMessage());
		}

		try{
			List<Product> pro = pdao.getThreeBest(categ);
			for (int i=0; i<pro.size(); i++) {
				System.out.println(pro.get(i).getName());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}