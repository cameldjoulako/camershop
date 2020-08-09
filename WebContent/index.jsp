<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="modele.*"%>
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


<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CamerShop | Vente en Ligne | Alimentation, Téléphones,
	TV, PC, vêtements, Beauté</title>


<link rel="icon" href="images/panier.png">
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
		<div id="header" class="navbar-fixed">
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
						<form class="form-inline my-2 my-lg-0 rechercher">
							<input class="form-control mr-sm-2" type="text" name="mot"
								placeholder="Chercher un produit, une marque ou une catégorie...">

							<button class="btn btn-light my-2 my-sm-0" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						<div class="container-fluid result" style="display:none;"></div>
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
								<li><a href="#"><i class="fa fa-user-o"></i> MON COMPTE</a></li>
								<li><a href="login.jsp"><i class="fa fa-sign-out"></i>Se
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
								<li class="header-cart dropdown default-dropdown" id="cart">
									<%-- <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
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
												<a class="main-btn" href="Panier">Voir le panier</a> <a
													class="primary-btn" href="CommandeProcess">Passer la
													Commande <i class="fa fa-arrow-circle-right"></i>
												</a>
											</div>
										</div>
									</div> --%>
									
								</li>
								<%
									} else {
								%>
								<li class="header-cart dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown"	aria-expanded="true">
										<div class="header-btns-icon">
											<i class="fa fa-shopping-cart"></i> <span class="qty">
												0 </span>
										</div> <strong class="text-uppercase">Mon Panier:</strong> <br>
										<span>0 FCFA</span>
								</a>
									<div class="custom-menu">
										<div id="shopping-cart">
											<div class="shopping-cart-list">
												<div class="product product-widget">
													<div class="product-body">
														<h2 class="product-name text-danger">panier vide !!!</h2>
													</div>
												</div>
											</div>
										</div>
									</div>
									</li>
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
	<%@ include file="/WEB-INF/inclu/nav-home.jsp"%>
	<!-- /NAVIGATION -->


	<!-- HOME -->
	<div id="home">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
				<!-- home slick -->
				<div id="home-slick">

					<!-- banner -->
					<div class="banner banner-1">
						<img src="./images/camershoppromo.jpg" alt="">
						<div class="banner-caption text-center">

							<button class="primary-btn">J'ACHETE</button>
						</div>
					</div>
					<!-- /banner -->
					<!-- banner -->
					<div class="banner banner-1">
						<img src="./images/prom2.jpg" alt="">
						<div class="banner-caption text-center">

							<button class="primary-btn">J'ACHETE</button>
						</div>
					</div>
					<!-- /banner -->
					<!-- banner -->
					<div class="banner banner-1">
						<img src="./images/prom3.jpg" alt="">
						<div class="banner-caption text-center">

							<button class="primary-btn">J'ACHETE</button>
						</div>
					</div>
					<!-- /banner -->
					<!-- banner -->
					<div class="banner banner-1">
						<img src="./images/prom4.jpg" alt="">
						<div class="banner-caption text-center">

							<button class="primary-btn">J'ACHETE</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1">
						<img src="./img/img01.jpg" alt="">
						<div class="banner-caption text-center">

							<button class="primary-btn">J'ACHETE</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1">
						<img src="./img/img02.jpg" alt="">
						<div class="banner-caption">

							<button class="primary-btn">J'ACHETE</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1">
						<img src="./img/img03.jpg" alt="">
						<div class="banner-caption">
							<button class="primary-btn">J'ACHETE</button>
						</div>
					</div>
					<!-- /banner -->
				</div>
				<!-- /home slick -->
			</div>
			<!-- /home wrap -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">Nos Produits</h2>
					</div>
				</div>
				<!-- section title -->

				<%
					for (Produit u : listproduit) {
				%>
				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single">
						<div class="product-thumb">
							<button class="main-btn quick-view">
								<i class="fa fa-search-plus"></i><a href="Produit?id=<%=u.getIdArticle()%>&action=show">Détails</a> 
							</button>
							<img src="./images/<%=u.getImage()%>" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price"><%=u.getPrix()%>
								FCFA
							</h3>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name">
								<a href="#"><%=u.getDesignation()%></a>
							</h2>
							<div class="product-btns">
								<button class="main-btn icon-btn">
									<i class="fa fa-heart"></i>
								</button>
								<button class="main-btn icon-btn">
									<i class="fa fa-exchange"></i>
								</button>
								<%
									if (utilisateur != null) {
								%>
								<a class="primary-btn add-to-cart addpanier"
									href="AjoutPanier?id=<%=u.getIdArticle()%>&idUser=<%=utilisateur.getIdUser()%>&action=add"
									title="Add to Cart" ident=<%=u.getIdArticle()%> idUser=<%=utilisateur.getIdUser()%>> <i class="fa fa-shopping-cart"></i>
									Ajouter au panier
								</a>
								<%
									} else {
								%>
								<button class="primary-btn add-to-cart needconnect">
									<i class="fa fa-shopping-cart"></i> Ajouter au panier
								</button>

								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->
				<%
					}
				%>

			</div>
			<!-- /row -->

			<!-- row2 -->
			<!-- row -->
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">ALIMENTATION</h2>
					</div>
				</div>
				<!-- section title -->

				<%
					for (Produit u : listproduit2) {
				%>
				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single">
						<div class="product-thumb">
							<button class="main-btn quick-view">
								<i class="fa fa-search-plus"></i><a href="Produit?id=<%=u.getIdArticle()%>&action=show">Détails</a>
							</button>
							<img src="./images/<%=u.getImage()%>" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price"><%=u.getPrix()%>
								FCFA
							</h3>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name">
								<a href="#"><%=u.getDesignation()%></a>
							</h2>
							<div class="product-btns">
								<button class="main-btn icon-btn">
									<i class="fa fa-heart"></i>
								</button>
								<button class="main-btn icon-btn">
									<i class="fa fa-exchange"></i>
								</button>
								<%
									if (utilisateur != null) {
								%>
								<a class="primary-btn add-to-cart"
									href="AjoutPanier?id=<%=u.getIdArticle()%>&idUser=<%=utilisateur.getIdUser()%>&action=add"
									title="Add to Cart"> <i class="fa fa-shopping-cart"></i>
									Ajouter au panier
								</a>
								<%
									} else {
								%>
								<button class="primary-btn add-to-cart needconnect">
									<i class="fa fa-shopping-cart"></i> Ajouter au panier
								</button>

								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->
				<%
					}
				%>

			</div>

			<!-- Modale connexion obligatoire -->
			<div class="modal cartShow fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" data-dismiss="modal">X</button>
							<h3 class="modal-title">Ajout panier</h3>
						</div>
						<div class="modal-body">
							<p class="">Produit ajouté au panier avec succès.</p>
							<p>
							<div class="pull-right">
							<button data-dismiss="modal" class="btn btn-default"><i class="fa fa-unlock-alt"></i> Continuer</button> 
										
							</div> 
								<div class="">
							<a href="Inscription" class="btn btn-default"><i class="fa fa-unlock-alt"></i> Finaliser</a> 
										
							</div> 
							
							</p>

						</div>
					</div>
				</div>
			</div>
			
		
			<div class="modal panconnexion fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" data-dismiss="modal">X</button>
							<h3 class="modal-title">Connexion obligatoire</h3>
						</div>
						<div class="modal-body">
							<p class="alert-danger">Merci de vous connectez pour ajouter
								des articles au panier.</p>
							<p>
							<div class="pull-right">
							<a href="Login" class="btn btn-default"><i class="fa fa-unlock-alt"></i> Se connecter</a> 
										
							</div> 
								<div class="">
							<a href="Inscription" class="btn btn-default"><i class="fa fa-unlock-alt"></i> S'inscrire</a> 
										
							</div> 
							
							</p>

						</div>
					</div>
				</div>
			</div>
			<!-- Modale connexion obligatoire -->
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
	<%@ include file="./WEB-INF/inclu/footer_inc.jsp"%>


	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
