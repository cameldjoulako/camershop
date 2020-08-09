package controleur;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class ConfirmEditProduitServlet
 */
//@WebServlet("/ConfirmEditProduitServlet")
public class ConfirmEditProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String designation = req.getParameter("designation");
		String description = req.getParameter("description");
		float prix = Float.parseFloat(req.getParameter("prix"));
		String image = req.getParameter("image");
		int quantite = Integer.parseInt(req.getParameter("quantite"));
		int idCategorie = Integer.parseInt(req.getParameter("categorie"));
		int idMarque = Integer.parseInt(req.getParameter("marque"));
		int idArticle = Integer.parseInt(req.getParameter("idArticle"));

		System.out.println(designation);
		System.out.println(description);
		System.out.println(prix);
		System.out.println(image);

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			String sql = "UPDATE article SET idCategorie=?,idMarque=?,designation=?,prix=?,quantite=?,description=?,image=?"+" WHERE idArticle=?";
			PreparedStatement pr = (PreparedStatement) cnx.prepareStatement(sql);

			pr.setInt(1, idCategorie);
			pr.setInt(2, idMarque);
			pr.setString(3, designation);
			pr.setFloat(4, prix);
			pr.setInt(5, quantite);
			pr.setString(6, description);
			pr.setString(7, image);
			pr.setInt(8, idArticle);

			pr.executeUpdate();
			pr.close();
			
			String message = "Article Modifié avec success !!!";
			req.setAttribute("message", message);
			System.out.println("Article inserer avec success !!!!");
			req.getRequestDispatcher("listProduit.jsp").forward(req, resp);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
