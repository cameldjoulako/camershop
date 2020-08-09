<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="modele.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>


<!--Recuperation des produits pour affichage dans la bd  -->

<%
	PreparedStatement pr = null;
	ArrayList<Produit> listproduit = new ArrayList<Produit>();

	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
				"");
		pr = (PreparedStatement) cnx.prepareStatement("SELECT * FROM article limit 4");
		ResultSet rs = pr.executeQuery();

		while (rs.next()) {
			Produit produit = new Produit();
			produit.setIdArticle(rs.getInt(1));
			produit.setIdCategorie(rs.getInt(2));
			produit.setIdMarque(rs.getInt(3));
			produit.setDesignation(rs.getString("designation"));
			produit.setPrix(rs.getFloat("prix"));
			produit.setQuantite(rs.getInt("quantite"));
			produit.setDescription(rs.getString("description"));
			produit.setImage(rs.getString("image"));

			listproduit.add(produit);

		}
		rs.close();
		pr.close();

	} catch (Exception e) {
	}
%>

<%
	PreparedStatement pr2 = null;
	ArrayList<Produit> listproduit2 = new ArrayList<Produit>();

	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root",
				"");
		pr2 = (PreparedStatement) cnx.prepareStatement("SELECT * FROM article where idCategorie=11 LIMIT 4");
		ResultSet rs2 = pr2.executeQuery();

		while (rs2.next()) {
			Produit produit2 = new Produit();
			produit2.setIdArticle(rs2.getInt(1));
			produit2.setIdCategorie(rs2.getInt(2));
			produit2.setIdMarque(rs2.getInt(3));
			produit2.setDesignation(rs2.getString("designation"));
			produit2.setPrix(rs2.getFloat("prix"));
			produit2.setQuantite(rs2.getInt("quantite"));
			produit2.setDescription(rs2.getString("description"));
			produit2.setImage(rs2.getString("image"));

			listproduit2.add(produit2);

		}

		pr2.close();
		rs2.close();

	} catch (Exception e) {
	}
%>


<!-- Connexion de l'utilisateur via la session -->
<%
	Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

	if (utilisateur == null) {

		System.out.println("User non connecter");
		//response.sendRedirect("index.jsp");

	} else if (utilisateur.getProfil().equals("admin")) {

		response.sendRedirect("dashboard.jsp");

	} else if (utilisateur.getProfil().equals("client")) {

	}
%>

<!--  GESTION DU PANIER-->
<%
	PreparedStatement pre = null;
	ArrayList<Panier> listpanier = new ArrayList<Panier>();

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
	String commande = "";

	for (Panier pa : listpanier) {
		quantite = quantite + pa.getQuantite();
		sousTotale = sousTotale + (pa.getPrix() * pa.getQuantite());
		commande = commande + " \n Produit: " + pa.getNomArticle() + " || Quantité: " + pa.getQuantite() + "\n";

	}

	if (sousTotale == 0) {
		totale = 0;
		livraison = 0;
	} else {
		totale = sousTotale + livraison;
	}
%>


<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CamerShop | Vente en Ligne | Alimentation, Téléphones,
	TV, PC, vêtements, Beauté</title>



<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />

<link type="text/css" rel="stylesheet" href="css/login_modal.css" />
<link rel="icon" href="images/panier.png">

</head>
<body>
	<!-- HEADER -->

	<!-- HEADER -->
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Bienvenue sur Camer-shop!</span>
				</div>
				<div class="pull-right">
					<ul class="header-top-links">
						<li><a href="#">Catalogue</a></li>
						<li><a href="#">Newsletter</a></li>
						<li><a href="#">FAQ</a></li>
						<li class="dropdown default-dropdown"><a
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="true">ENG <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">Français (FR)</a></li>
								<li><a href="#">Anglais (ENG)</a></li>


							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /top Header -->

		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">
					<!-- Logo -->
					<div class="header-logo">
						<a class="logo" href="#"> <img src="./img/logo.png" alt="">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Search -->
					<div class="header-search">
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="text"
								placeholder="Chercher un produit, une marque ou une catégorie...">

							<button class="btn btn-light my-2 my-sm-0">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
					<!-- /Search -->
				</div>
				<%
					if (!(utilisateur == null)) {
				%>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown"
								aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase"><%=utilisateur.getLogin()%>
									<i class="fa fa-caret-down"></i></strong>
							</div> <a href="#"> Welcome</a>
							<ul class="custom-menu">
								<li><a href="Client"><i class="fa fa-user-o"></i> MON
										COMPTE</a></li>
								<li><a href="Deconnexion"><i class="fa fa-sign-out"></i>Se
										deconnecter</a></li>
							</ul>
						</li>
						<%
							} else {
						%>
						<div class="pull-right">
							<ul class="header-btns">
								<!-- Account -->
								<li class="header-account dropdown default-dropdown">
									<div class="dropdown-toggle" role="button"
										data-toggle="dropdown" aria-expanded="true">
										<div class="header-btns-icon">
											<i class="fa fa-user-o"></i>
										</div>
										<strong class="text-uppercase">Mon Compte <i
											class="fa fa-caret-down"></i></strong>
									</div> <a href="login.jsp">Login</a> / <a href="inscription.jsp">S'inscrire</a>
									<ul class="custom-menu">
										<li><a href="#"><i class="fa fa-user-o"></i> MON
												COMPTE</a></li>
										<li><a href="login.jsp"><i class="fa fa-unlock-alt"></i>
												Login</a></li>
										<li><a href="inscription.jsp"><i
												class="fa fa-user-plus"></i>s'inscrire</a></li>
									</ul>
								</li>
								<%
									}
								%>

								<!-- /Account -->


								<!-- Cart -->
								<%
									if (!(utilisateur == null)) {
								%>
								<li class="header-cart dropdown default-dropdown"><a
									class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true">
										<div class="header-btns-icon">
											<i class="fa fa-shopping-cart"></i> <span class="qty"><%=quantite%></span>
										</div> <strong class="text-uppercase">Mon Panier:</strong> <br>
										<span><%=sousTotale%> CFA</span>
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
														<a href="Panier?id=<%=pan.getIdPanier()%>&action=delete"><i
															class="fa fa-trash"></i></a>

													</button>
												</div>
												<%
													}
												%>
											</div>
											<div class="shopping-cart-btns">
												<a class="main-btn" href="panier.jsp">Voir le panier</a> <a
													class="primary-btn" href="panier.jsp">Passer la
													Commande <i class="fa fa-arrow-circle-right"></i>
												</a>
											</div>
										</div>
									</div></li>
								<%
									}
								%>
								<!-- /Cart -->

								<!-- Mobile nav toggle-->
								<li class="nav-toggle">
									<button class="nav-toggle-btn main-btn icon-btn">
										<i class="fa fa-bars"></i>
									</button>
								</li>
								<!-- / Mobile nav toggle -->
							</ul>
						</div>
				</div>
				<!-- header -->
			</div>
			<!-- container -->
	</header>
	<!-- /HEADER -->
	<!-- NAVIGATION -->
	<%@ include file="/WEB-INF/inclu/nav.jsp"%>
	<!-- /NAVIGATION -->
	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Accueil</a></li>
				<li class="active">Panier</li>
			</ul>
		</div>
	</div>
	<!-- /BREADCRUMB -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="order-summary clearfix">
						<div class="section-title">
							<h3 class="title">Panier d'achat</h3>
							<%
								if (sousTotale == 0) {
							%>
							<h4 class="text-danger">Panier vide !</h4>
							<%
								}
							%>
						</div>

						<table class="shopping-cart-table table">
							<thead>
								<tr>
									<th>Articles</th>
									<th></th>
									<th class="text-center">Prix</th>
									<th class="text-center">Quantité</th>
									<th class="text-center">Total</th>
									<th class="text-right"></th>
								</tr>
							</thead>
							<tbody>
								<%
									for (Panier pan : listpanier) {
								%>
								<tr>
									<td class="thumb"><img src="./images/<%=pan.getImage()%>"
										alt=""></td>
									<td class="details"><a href="#"><%=pan.getNomArticle()%></a>
									</td>
									<td class="price text-center"><strong><%=pan.getPrix() + " "%>
											FCFA</strong><br></td>
									<form action="Panier" method="post">
										<input type="hidden" name="id" value="<%=pan.getIdPanier()%>">
										<td class="qty text-center"><input class="input"
											type="number" size="3" value="<%=pan.getQuantite()%>"
											name="qte"> <input type="submit" value="Modifier"
											class="btn btn-primary" /></td>
									</form>
									<td class="total text-center"><strong
										class="primary-color"><%=pan.getPrix() + " "%>FCFA</strong></td>
									<td class="text-right"><a class="main-btn cancel-btn"
										href="Panier?id=<%=pan.getIdPanier()%>&action=delete"
										style="cursor: pointer;"> <i class="fa fa-trash"></i>
									</a></td>
								</tr>
								<%
									}
								%>
							</tbody>
							<tfoot>
								<tr>
									<th class="empty" colspan="3"></th>
									<th>SOUSTOTAL</th>
									<th colspan="2" class="sub-total"><%=sousTotale + " "%>
										FCFA</th>
								</tr>
								<tr>
									<th class="empty" colspan="3"></th>
									<th>Livraison</th>
									<td colspan="2"><%=livraison%> FCFA</td>
								</tr>
								<tr>
									<th class="empty" colspan="3"></th>
									<th>TOTAL</th>
									<th colspan="2" class="total"><%=totale + " "%> FCFA</th>
								</tr>
							</tfoot>
						</table>
						<form action="PasserCommande">
							<input type="hidden" name="idUser"
								value="<%=utilisateur.getIdUser()%>"> <input type="hidden"
								name="commande" value="<%=commande%>"> 
								<input type="hidden" name="totale" value="<%=totale%>"> <input
								type="submit" value="Valider la Commande"
								class="btn btn-success pull-right"> <input type="submit"
								value="Continuer les achats"
								class="btn btn-success pull-right mr10">

						</form>
												<div class="">
							<button class="primary-btn">
								<a href="index.jsp" style="color: white">Continuer vos
									Achats</a>
							</button>
						</div>
					</div>

				</div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	<%@ include file="../WEB-INF/inclu/footer_inc.jsp"%>


	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>
