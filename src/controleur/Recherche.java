package controleur;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import modele.*;

/**
 * Servlet implementation class Recherche
 */
@WebServlet("/Recherche")
public class Recherche extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recherche() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mot = request.getParameter("mot");
		ArrayList<Produit> listproduit = new ArrayList<Produit>();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
					"");
			PreparedStatement pr = (PreparedStatement) cnx.prepareStatement("SELECT DISTINCT idArticle, designation FROM article where designation like %?% OR description like %?% ");
			pr.setString(1, mot);
			pr.setString(2, mot);
			ResultSet rs = pr.executeQuery();
			
			

			while (rs.next()) {
				Produit produit = new Produit();
				
				produit.setIdArticle(rs.getInt("idArticle"));
				produit.setDesignation(rs.getString("designation"));
				
				listproduit.add(produit);
				
			}
			rs.close();
			pr.close();

		} catch (Exception e) { }
		
		
		request.setAttribute("listproduit", listproduit);
		request.getRequestDispatcher("recherche.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
