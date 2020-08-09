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
 * Servlet implementation class PasserCommandeServlet
 */
@WebServlet("/PasserCommande")
public class PasserCommandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasserCommandeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idUser =  req.getParameter("idUser");
		System.out.println("idUser: "+idUser);
		String commande =  req.getParameter("commande");
		System.out.println("ArticleCommandés: "+commande);
		String totale =  req.getParameter("totale");
		System.out.println("PrixTotalCommande: "+totale);
		String etatCmde="nonPayer";
		
		try {
			   
			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop","root","");
		    PreparedStatement pr =  (PreparedStatement) cnx.prepareStatement(
					"insert into commande(idCommande, idUser, dateCmde, etatCmde, commande, totale) values(default,?,Now(),?,?,?)"
					);
			
			   pr.setString(1,idUser);
			   pr.setString(2,etatCmde );
			   pr.setString(3,commande );
			   pr.setString(4, totale);			  
			  
			   
			   pr.executeUpdate();
			   pr.close();
			   
			   //Avant je construit une commande puis je fais un set attribute pour l'utiliser lors du paiement et livraison
				   
			   resp.sendRedirect("Paiement");   
			   
			   
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
