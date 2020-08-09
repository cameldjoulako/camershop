package controleur;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import modele.Utilisateur;

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/User")
public class UserServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5352353356149926843L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String nom = req.getParameter("nom");
		String login = req.getParameter("login");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		int telephone = Integer.parseInt(req.getParameter("telephone"));
		String ville = req.getParameter("ville");
		String profil = req.getParameter("profil");
		String photo = req.getParameter("photo");

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			PreparedStatement pr = (PreparedStatement) cnx.prepareStatement(
					"insert into utilisateur(idUser,nom,login,password,email,telephone,ville,profil,photo) values (default,?,?,?,?,?,?,?,?)");

			pr.setString(1, nom);
			pr.setString(2, login);
			pr.setString(3, password);
			pr.setString(4, email);
			pr.setInt(5, telephone);
			pr.setString(6, ville);
			pr.setString(7, profil);
			pr.setString(8, photo);

			pr.executeUpdate();

			System.out.println("Insertion ok");
			pr.close();

			resp.sendRedirect("listUtilisateur.jsp");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idUser = req.getParameter("id");
		String action = req.getParameter("action");

		if (action.equals(null)) {

		}

		if (action.equals("show")) {
			System.out.println(action);
			Utilisateur user = new Utilisateur();
			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
						"");
				Statement stmt = (Statement) cnx.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE idUser = " + idUser);

				while (rs.next()) {
					user.setIdUser(rs.getInt(1));
					user.setNom(rs.getString("NOM"));
					user.setLogin(rs.getString("login"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setTelephone(rs.getInt("telephone"));
					user.setVille(rs.getString("ville"));
					user.setProfil(rs.getString("profil"));
					user.setPhoto(rs.getString("photo"));

					req.setAttribute("utilisateur", user);

				}
				
				rs.close();

			} catch (Exception e) {
			}

			req.getRequestDispatcher("ShowUser.jsp").forward(req, resp);
		}

		else if (action.equals("edit")) {

			System.out.println(action);

			Utilisateur user = new Utilisateur();
			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
						"");
				Statement stmt = (Statement) cnx.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE idUser = " + idUser);

				while (rs.next()) {
					user.setIdUser(rs.getInt("idUser"));
					user.setNom(rs.getString("nom"));
					user.setLogin(rs.getString("login"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setTelephone(rs.getInt("telephone"));
					user.setVille(rs.getString("ville"));
					user.setProfil(rs.getString("profil"));
					user.setPhoto(rs.getString("photo"));

					req.setAttribute("utilisateur", user);

				}
				
				rs.close();

			} catch (Exception e) {
			}

			req.getRequestDispatcher("editUser.jsp").forward(req, resp);

		}

		else if (action.equals("delete")) {

			System.out.println(action);

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
						"");
				String sql = "DELETE FROM utilisateur WHERE idUser=?";
				PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
				ps.setString(1, idUser);
				ps.executeUpdate();
				ps.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			req.getRequestDispatcher("listUtilisateur.jsp").forward(req, resp);
		}

	}

}
