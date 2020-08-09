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

@WebServlet("/ConfirmEdit")
public class ConfirmEditServlet extends HttpServlet{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idUser = Integer.parseInt(req.getParameter("idUser"));
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
			   Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop","root","");
            String sql = "UPDATE utilisateur SET nom=?,login=?,password=?,email=?,telephone=?,ville=?,profil=?,photo=?" +
        " WHERE idUser=?";
        PreparedStatement pr = (PreparedStatement) cnx .prepareStatement(sql);
        pr.setString(1, nom);
		pr.setString(2, login);
		pr.setString(3, password);
		pr.setString(4, email);
		pr.setInt(5, telephone);
		pr.setString(6, ville);
		pr.setString(7, profil);
		pr.setString(8, photo); 
		pr.setInt(9, idUser);
		
		pr.executeUpdate();
		pr.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
		req.getRequestDispatcher("listUtilisateur.jsp").forward(req, resp);
	}
	
}
