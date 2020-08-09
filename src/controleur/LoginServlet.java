package controleur;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import modele.Utilisateur;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String login = (req.getParameter("login")).trim();
			String password = (req.getParameter("password")).trim();
			System.out.println(login);

			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery("select * from utilisateur where login='" + login + "'");
			if (rs.next()) {
				if (rs.getString(4).equals(password)) {

					int idUser = rs.getInt("idUser");
					String nom = rs.getString("nom");
					login = rs.getString("login");
					password = rs.getString("password");
					String email = rs.getString("email");
					int telephone = rs.getInt("telephone");
					String ville = rs.getString("ville");
					String profil = rs.getString("profil");
					String photo = rs.getString("photo");

					req.getSession().setAttribute("user",new Utilisateur(idUser, nom, login, password, email, telephone, ville, profil, photo));

//					String sql = "DELETE FROM panier WHERE idUser=?";
//					PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
//					ps.setLong(1, idUser);
//					ps.executeUpdate();

					resp.sendRedirect("index.jsp");

				} else {

					System.out.println("Mot de passe incorrect");
					resp.sendRedirect("login.jsp");
				}
			} else {

				System.out.println("Vérifier vos informations de connexion.");
				resp.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			System.out.println("Erreur de connexion a la base de données!!");
		}

	}

}
