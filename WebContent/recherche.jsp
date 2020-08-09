<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="modele.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>



<%
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

%>

<diV class="panel-group">
	<%
		for (Produit prod : listproduit) {
	%>
	<diV class="panel panel-default">

		<diV class="panel-heading">
			<h4> <a href="Produits?id=<%= prod.getIdArticle() %>?action=show"><%= prod.getDesignation() %></a> </h4>
		</diV>

	</diV>

	<%
		}
	%>

</diV>
