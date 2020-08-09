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
 * Servlet implementation class CommandeServlet
 */
@WebServlet("/Commande")
public class CommandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommandeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String idCommande = req.getParameter("id");
		
		if(action.equals("delete")){
			   
			   System.out.println(action);
			   
			   try {
				   Class.forName("com.mysql.jdbc.Driver");
				   Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop","root","");
	               String sql = "DELETE FROM commande WHERE idCommande=?";
	               PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
	               ps.setString(1, idCommande);
	               ps.executeUpdate();
	               
	               ps.close();
	               

	             } catch (Exception e) {
	                     e.printStackTrace();
	                   }
			   
			   req.getRequestDispatcher("listeCommandes.jsp").forward(req, resp);
		   }else if(action.equals("livrer")) {
			   //ajouter d'une nouvelle livraison
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
