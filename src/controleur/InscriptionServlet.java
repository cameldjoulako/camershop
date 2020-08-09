package controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class InscriptionServlet
 */
//@WebServlet("/InscriptionServlet")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/inscription.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String nom = request.getParameter("nom");
			String login = request.getParameter("login");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			int telephone = Integer.parseInt(request.getParameter("telephone"));
			String ville = request.getParameter("ville");
			String profil = "client";
			String photo = request.getParameter("photo");
			
			
			String sql = "insert into utilisateur(idUser,nom,login,password,email,telephone,ville,profil,photo) values (default,?,?,?,?,?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/camershop", "root","");
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1, nom);
			ps.setString(2, login);
			ps.setString(3, password);
			ps.setString(4, email);
			ps.setInt(5, telephone);
			ps.setString(6, ville);
			ps.setString(7, profil);
			ps.setString(8, photo);
			
			ps.executeUpdate();
//			PrintWriter out = response.getWriter();
//			out.println("Dans la bd");
			 ps.close();
			   
			   response.sendRedirect("index.jsp");
		}
		 catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
