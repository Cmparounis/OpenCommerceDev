package ocgr;

import java.util.ArrayList;
import java.util.List;

public class Tester {
	public static void main(String[] args){
		
		CategoryDAO cdao = new CategoryDAO();
		List<Category> categories = new ArrayList<Category>();
		try {
			categories= cdao.getCategories();
		} catch (Exception e) {
	
		}
		int counter = 0;
		for (Category category: categories){
			counter++;
			switch (counter) {
				case 1: category.getName();
						category.getDescription();
						break;
				case 2: category.getName();
						category.getDescription();
				break;
				case 3: category.getName();
						category.getDescription();
				break;
				case 4: category.getName();
						category.getDescription();
				break;
				case 5: category.getName();
						category.getDescription();
				break;
				case 6: category.getName();
						category.getDescription();
				break;
				case 7: category.getName();
						category.getDescription();
				break;
				case 8: category.getName();
						category.getDescription();
				break;
				case 9: category.getName();
						category.getDescription();
						counter = 0;
				break;
			}
		}
	}
}
				

