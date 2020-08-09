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
 * Servlet implementation class PanierServlet
 */
@WebServlet("/Panier")
public class PanierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String idPanier = req.getParameter("id");
		String action = req.getParameter("action");

		if (action.equals("delete")) {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");

				String sql = "DELETE FROM panier WHERE idPanier=?";
				PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
				ps.setString(1, idPanier);
				ps.executeUpdate();
				
				ps.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			req.getRequestDispatcher("panier.jsp").forward(req, resp);

		}else{
			req.getRequestDispatcher("panier.jsp").forward(req, resp);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*Modification du panier*/
		int idPanier = Integer.parseInt(req.getParameter("id").trim());
		int quantite = Integer.parseInt(req.getParameter("qte").trim());
		System.out.println(quantite);

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			String sql = "UPDATE panier SET quantite=? where idPanier=?";

			PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
			ps.setInt(1, quantite);
			ps.setInt(2, idPanier);

			ps.executeUpdate();
			
			ps.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		resp.sendRedirect("panier.jsp");

	}

}