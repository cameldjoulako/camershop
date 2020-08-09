package controleur;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import modele.Panier;
import modele.Produit;
import modele.Utilisateur;

/**
 * Servlet implementation class AjoutPanierServlet
 */
@WebServlet("/AjoutPanier")
public class AjoutPanierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public String nomArticle, description, image;
	public int idPanier, idArticle, idUser, quantite;
	public float prix;

	private PreparedStatement pr = null;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		idArticle = Integer.parseInt(req.getParameter("id"));
		idUser = Integer.parseInt(req.getParameter("idUser"));
		System.out.println("IdUser: " + idUser);
		quantite = 1;
		System.out.println("idArticle: " + idArticle);
		System.out.println("Quantité à ajouter: " + quantite);
		Boolean trouve = false;
		int cpt = 0;

		if (action.equals("add")) {

			try {

				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
				Statement st1 = (Statement) con.createStatement();
				ResultSet rs1 = st1.executeQuery("select * from panier where idUser='" + idUser + "'");
				if (rs1.next()) {
					if (rs1.getInt("idArticle") == idArticle) {
						System.out.println("Article deja dans le panier");

						int idPanier = rs1.getInt("idPanier");
						int qte = rs1.getInt("quantite");
						// update de la quantite d'article dans le panier
						String sql = "UPDATE panier SET quantite=? where idPanier=?";

						PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
						ps.setInt(1, quantite + qte);
						ps.setInt(2, idPanier);

						ps.executeUpdate();

						trouve = true;
						cpt++;
						ps.close();

						System.out.println("Mise à jour de la quantité effectué !");
						resp.sendRedirect("panier.jsp");

					} else {

						if (cpt == 0) {
							trouve = false;
						}
					}
				} else {

					if (cpt != 0) {
						trouve = true;
					}
				}

			} catch (Exception e) {
				// TODO: handle exception
			}

			if (!(trouve == true)) {
				System.out.println("L'article n'est pas dans le panier: Ajout du produit au panier");

				try {

					Class.forName("com.mysql.jdbc.Driver");
					Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop",
							"root", "");
					Statement stmt = (Statement) cnx.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM article WHERE idArticle=" + idArticle);
					Produit produit = new Produit();

					while (rs.next()) {

						produit.setIdArticle(rs.getInt("idArticle"));
						produit.setIdCategorie(rs.getInt("idCategorie"));
						produit.setIdMarque(rs.getInt("idMarque"));
						produit.setDesignation(rs.getString("designation"));
						produit.setPrix(rs.getFloat("prix"));
						produit.setQuantite(rs.getInt("quantite"));
						produit.setDescription(rs.getString("description"));
						produit.setImage(rs.getString("image"));

						nomArticle = produit.getDesignation();
						description = produit.getDescription();
						prix = produit.getPrix();
						image = produit.getImage();

					}
					System.out.println(idArticle);
					System.out.println(idUser);
					System.out.println(quantite);
					System.out.println(nomArticle);
					System.out.println(prix);
					System.out.println(image);

					pr = (PreparedStatement) cnx.prepareStatement(
							"insert into panier(idPanier,idArticle,idUser,quantite,nomArticle,prix,image) values (default,?,?,?,?,?,?)");

					pr.setInt(1, idArticle);
					pr.setInt(2, idUser);
					pr.setInt(3, quantite);
					pr.setString(4, nomArticle);
					pr.setFloat(5, prix);
					pr.setString(6, image);
					pr.executeUpdate();

					System.out.println("Le produit a été inserer au panier");
					pr.close();
					rs.close();
					resp.sendRedirect("panier.jsp");
				} catch (Exception e) {
				}
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		idArticle = Integer.parseInt(req.getParameter("id"));
		idUser = Integer.parseInt(req.getParameter("idUser"));
		System.out.println("IdUser: " + idUser);
		quantite = Integer.parseInt(req.getParameter("qte"));
		System.out.println("idArticle: " + idArticle);
		System.out.println("Quantité à ajouter: " + quantite);
		Boolean trouve = false;
		int cpt = 0;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			Statement st1 = (Statement) con.createStatement();
			ResultSet rs1 = st1.executeQuery("select * from panier where idUser='" + idUser + "'");
			if (rs1.next()) {
				if (rs1.getInt("idArticle") == idArticle) {
					System.out.println("Article deja dans le panier");

					int idPanier = rs1.getInt("idPanier");
					int qte = rs1.getInt("quantite");
					// update de la quantite d'article dans le panier
					String sql = "UPDATE panier SET quantite=? where idPanier=?";

					PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
					ps.setInt(1, quantite + qte);
					ps.setInt(2, idPanier);

					ps.executeUpdate();

					trouve = true;
					cpt++;
					ps.close();

					System.out.println("Mise à jour de la quantité effectué !");
					resp.sendRedirect("panier.jsp");

				} else {

					if (cpt == 0) {
						trouve = false;
					}
				}
			} else {

				if (cpt != 0) {
					trouve = true;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		if (!(trouve == true)) {
			System.out.println("L'article n'est pas dans le panier: Ajout du produit au panier");

			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
						"");
				Statement stmt = (Statement) cnx.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM article WHERE idArticle=" + idArticle);
				Produit produit = new Produit();

				while (rs.next()) {

					produit.setIdArticle(rs.getInt("idArticle"));
					produit.setIdCategorie(rs.getInt("idCategorie"));
					produit.setIdMarque(rs.getInt("idMarque"));
					produit.setDesignation(rs.getString("designation"));
					produit.setPrix(rs.getFloat("prix"));
					produit.setQuantite(rs.getInt("quantite"));
					produit.setDescription(rs.getString("description"));
					produit.setImage(rs.getString("image"));

					nomArticle = produit.getDesignation();
					description = produit.getDescription();
					prix = produit.getPrix();
					image = produit.getImage();

				}
				System.out.println(idArticle);
				System.out.println(idUser);
				System.out.println(quantite);
				System.out.println(nomArticle);
				System.out.println(prix);
				System.out.println(image);

				pr = (PreparedStatement) cnx.prepareStatement(
						"insert into panier(idPanier,idArticle,idUser,quantite,nomArticle,prix,image) values (default,?,?,?,?,?,?)");

				pr.setInt(1, idArticle);
				pr.setInt(2, idUser);
				pr.setInt(3, quantite);
				pr.setString(4, nomArticle);
				pr.setFloat(5, prix);
				pr.setString(6, image);
				pr.executeUpdate();

				System.out.println("Le produit a été inserer au panier");
				pr.close();
				rs.close();
				resp.sendRedirect("panier.jsp");
			} catch (Exception e) {
			}
		}

	}
}