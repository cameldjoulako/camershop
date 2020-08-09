package controleur;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import modele.Produit;

/**
 * Servlet implementation class ProduitServlet
 */
//@WebServlet("/Produit")
public class ProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String designation = req.getParameter("designation");
		String description = req.getParameter("description");
		float prix = Float.parseFloat(req.getParameter("prix"));
		String image = req.getParameter("image");
		int quantite = Integer.parseInt(req.getParameter("quantite"));
		int idCategorie = Integer.parseInt(req.getParameter("categorie"));
		int idMarque = Integer.parseInt(req.getParameter("marque"));

		System.out.println(designation);
		System.out.println(description);
		System.out.println(prix);
		System.out.println(image);

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			String sql = "insert into article(idArticle,idCategorie,idMarque,designation,prix,quantite,description,image) values (default,?,?,?,?,?,?,?)";
			PreparedStatement pr = (PreparedStatement) cnx.prepareStatement(sql);

			pr.setInt(1, idCategorie);
			pr.setInt(2, idMarque);
			pr.setString(3, designation);
			pr.setFloat(4, prix);
			pr.setInt(5, quantite);
			pr.setString(6, description);
			pr.setString(7, image);

			pr.executeUpdate();
			pr.close();
			
			String message = "Article inserer avec success !!!";
			req.setAttribute("message", message);
			System.out.println("Article inserer avec success !!!!");
			
			req.setAttribute("message", message);
			req.getRequestDispatcher("addproduit.jsp").forward(req, resp);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String action = req.getParameter("action");

		if (action.equals(null)) {
			req.getRequestDispatcher("listProduit.jsp").forward(req, resp);
		}

		if (action.equals("show")) {
			System.out.println(action);
			Produit produit = new Produit();
			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
						"");
				Statement stmt = (Statement) cnx.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM article WHERE idArticle = " + id);

				while (rs.next()) {

					produit.setIdArticle(rs.getInt(1));
					produit.setIdCategorie(rs.getInt(2));
					produit.setIdMarque(rs.getInt(3));
					produit.setDesignation(rs.getString("designation"));
					produit.setPrix(rs.getFloat("prix"));
					produit.setQuantite(rs.getInt("quantite"));
					produit.setDescription(rs.getString("description"));
					produit.setImage(rs.getString("image"));

					req.setAttribute("produit", produit);

				}
				rs.close();

			} catch (Exception e) {
			}

			req.getRequestDispatcher("showProduit.jsp").forward(req, resp);
		}
		
/*Modification d'un produit*/
		else if (action.equals("edit")) {

			System.out.println(action);

			Produit produit = new Produit();
			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
						"");
				Statement stmt = (Statement) cnx.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM article WHERE idArticle = " + id);

				while (rs.next()) {
					produit.setIdArticle(rs.getInt(1));
					produit.setIdCategorie(rs.getInt(2));
					produit.setIdMarque(rs.getInt(3));
					produit.setDesignation(rs.getString("designation"));
					produit.setPrix(rs.getFloat("prix"));
					produit.setQuantite(rs.getInt("quantite"));
					produit.setDescription(rs.getString("description"));
					produit.setImage(rs.getString("image"));

					req.setAttribute("produit", produit);

				}
				
				rs.close();

			} catch (Exception e) {
			}

			req.getRequestDispatcher("editProduit.jsp").forward(req, resp);

		}

		else if (action.equals("delete")) {

			System.out.println(action);

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root","");
				String sql = "DELETE FROM article WHERE idArticle=?";
				PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
				ps.setString(1, id);
				ps.executeUpdate();
				ps.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			req.getRequestDispatcher("listProduit.jsp").forward(req, resp);
		}

	}

}
