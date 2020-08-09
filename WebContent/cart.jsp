<%@ page import="java.util.ArrayList" import="modele.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<!--  GESTION DU PANIER-->
<%
	PreparedStatement pre = null;
	ArrayList<Panier> listpanier = new ArrayList<Panier>();
	Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
				"");
		pre = (PreparedStatement) cnx
				.prepareStatement("select * from panier where idUser=" + utilisateur.getIdUser());
		ResultSet rse = pre.executeQuery();

		while (rse.next()) {
			Panier panier = new Panier();
			panier.setIdPanier(rse.getInt("idPanier"));
			panier.setIdArticle(rse.getInt("idArticle"));
			panier.setIdUser(rse.getInt("idUser"));
			panier.setQuantite(rse.getInt("quantite"));
			panier.setNomArticle(rse.getString("nomArticle"));
			panier.setPrix(rse.getFloat("prix"));
			panier.setImage(rse.getString("image"));

			listpanier.add(panier);

		}

		pre.close();
		rse.close();

	} catch (Exception e) {

	}

	float livraison = 1500, sousTotale = 0, totale = 0;
	int quantite = 0;
	String Commande = "";

	for (Panier pa : listpanier) {
		quantite = quantite + pa.getQuantite();
		sousTotale = sousTotale + (pa.getPrix() * pa.getQuantite());
		Commande = Commande + " \n Produit: " + pa.getNomArticle() + " || Quantité: " + pa.getQuantite() + "\n";

	}

	if (sousTotale == 0) {
		totale = 0;
		livraison = 0;
	} else {
		totale = sousTotale + livraison;
	}
%>
<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
	<div class="header-btns-icon">
		<i class="fa fa-shopping-cart"></i> <span class="qty"><%=quantite%></span>
	</div> <strong class="text-uppercase">Mon Panier:</strong> <br> <span><%=sousTotale%>
		CFA</span>
</a>
<div class="custom-menu">
	<div id="shopping-cart">
		<div class="shopping-cart-list">
			<%
				for (Panier pan : listpanier) {
			%>
			<div class="product product-widget">
				<div class="product-thumb">
					<img src="./images/<%=pan.getImage()%>" alt="">
				</div>
				<div class="product-body">
					<h3 class="product-price">
						<%=pan.getPrix() + " "%>
						FCFA <span class="qty">x<%=pan.getQuantite()%></span>
					</h3>
					<h2 class="product-name">
						<a href="Produit?id=<%=pan.getIdArticle()%>&action=show"><%=pan.getNomArticle()%></a>
					</h2>
				</div>
				<button class="cancel-btn">
					<a href="Panier?id=<%=pan.getIdPanier()%>&action=delete" class="delpanier" idPanier="<%=pan.getIdPanier()%>"><i
						class="fa fa-trash"></i></a>

				</button>
			</div>
			<%
				}
			%>
		</div>
		<div class="shopping-cart-btns">
			<a class="main-btn" href="Panier">Voir le panier</a> <a
				class="primary-btn" href="panier.jsp">Passer la Commande <i
				class="fa fa-arrow-circle-right"></i>
			</a>
		</div>
	</div>
</div>
