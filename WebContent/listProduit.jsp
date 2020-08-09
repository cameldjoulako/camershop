<%@page import="java.util.List"%>
<%@page import="modele.Produit"%>
<%@page import="modele.Utilisateur"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Operateur"%>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%@ page import="modele.*"%>
<%
	Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
%>
<%
	Operateur operateur = new Operateur();
	ArrayList<Produit> list = operateur.getAllProduit();
%>

<%@ page import="java.io.*"%>

<%
	if (utilisateur != null) {
		if (utilisateur.getProfil().equals("admin")) {
%>
<!-- Dashboard -->
<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Liste des Articles - CamerShop</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link
	href="./assets/TemplateAdmin/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="./assets/TemplateAdmin/assets/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="./assets/TemplateAdmin/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="./assets/TemplateAdmin/css/style.css" rel="stylesheet" />
<link href="./assets/TemplateAdmin/css/style_responsive.css"
	rel="stylesheet" />
<link href="./assets/TemplateAdmin/css/style_default.css"
	rel="stylesheet" id="style_color" />

<link
	href="./assets/TemplateAdmin/assets/fancybox/source/jquery.fancybox.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="./assets/TemplateAdmin/assets/uniform/css/uniform.default.css" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="fixed-top">
	<!-- BEGIN HEADER -->
	<div id="header" class="navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- BEGIN LOGO -->
				<a class="brand" href="index.html"> <img
					src="./assets/TemplateAdmin/img/logo.png" alt="Admin Lab" />
				</a>
				<!-- END LOGO -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a class="btn btn-navbar collapsed" id="main_menu_trigger"
					data-toggle="collapse" data-target=".nav-collapse"> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="arrow"></span>
				</a>
				<!-- END RESPONSIVE MENU TOGGLER -->

				<!-- END  NOTIFICATION -->
				<div class="top-nav ">
					<ul class="nav pull-right top-menu">

						<!-- BEGIN USER LOGIN DROPDOWN -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <img width="20" height="20"
								src="<%=utilisateur.getPhoto()%>" alt=""> <span
								class="username"><%=utilisateur.getLogin()%></span> <b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu">

								<li><a href="logout.jsp"><i class="icon-key"></i>
										Deconnexion </a></li>
							</ul></li>
						<!-- END USER LOGIN DROPDOWN -->
					</ul>
					<!-- END TOP NAVIGATION MENU -->
				</div>
			</div>
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN CONTAINER -->
	<div id="container" class="row-fluid">
		<!-- BEGIN SIDEBAR -->
		<div id="sidebar" class="nav-collapse collapse">
			<div class="sidebar-toggler hidden-phone"></div>
			<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
			<div class="navbar-inverse">
				<form class="navbar-search visible-phone">
					<input type="text" class="search-query" placeholder="Search" />
				</form>
			</div>
			<!-- END RESPONSIVE QUICK SEARCH FORM -->
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="sidebar-menu">
				<li class="has-sub "><a href="dashboard.jsp" class=""> <span
						class="icon-box"> <i class="icon-book"></i></span> Dashboard

				</a></li>

				<li class="has-sub "><a href="listeCommandes.jsp" class="">
						<span class="icon-box"> <i class="icon-book"></i></span> Commandes

				</a></li>


				<li class="has-sub "><a href="listUtilisateur.jsp" class="">
						<span class="icon-box"> <i class="icon-book"></i></span>
						Utilisateurs

				</a></li>


				<li class="has-sub active"><a href="listProduit.jsp" class="">
						<span class="icon-box"> <i class="icon-book"></i></span> Articles

				</a></li>

				<li class="has-sub active"><a href="listCategorie.jsp" class="">
						<span class="icon-box"> <i class="icon-book"></i></span>
						Catégories

				</a></li>

				<li class="has-sub active"><a href="listMarque.jsp" class="">
						<span class="icon-box"> <i class="icon-book"></i></span> Marques

				</a></li>
			</ul>


			</li>

			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div id="main-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN THEME CUSTOMIZER-->
						<div id="theme-change" class="hidden-phone">
							<i class="icon-cogs"></i> <span class="settings"> <span
								class="text">Theme:</span> <span class="colors"> <span
									class="color-default" data-style="default"></span> <span
									class="color-gray" data-style="gray"></span> <span
									class="color-purple" data-style="purple"></span> <span
									class="color-navy-blue" data-style="navy-blue"></span>
							</span>
							</span>
						</div>
						<!-- END THEME CUSTOMIZER-->
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							CamerShop<small>Ajout d'un article</small>
						</h3>
						<ul class="breadcrumb">
							<li><a href="#"><i class="icon-home"></i></a><span
								class="divider">&nbsp;</span></li>
							<li><a href="#">Administration</a> <span class="divider">&nbsp;</span>
							</li>
							<li><a href="#">Produits</a><span class="divider-last">&nbsp;</span></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid"></div>
				<!-- BEGIN ADVANCED TABLE widget-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE widget-->
						<div class="widget">
							<div class="widget-title">
								<h4>
									<i class="icon-reorder"></i>Liste des Articles
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<table class="table table-striped table-bordered" id="sample_1">
									<thead>
										<tr>
											<th class="hidden-phone">Numéro</th>
											<th class="hidden-phone">Image</th>
											<th class="hidden-phone">Nom</th>
											<th class="hidden-phone">Prix</th>
											<th class="hidden-phone">quantite</th>
											<th class="hidden-phone">description</th>

											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									
										<%
											int i=1;
											for (Produit u : list) {
										%>
										<tr>

											<td><a
												href="Produit?id=<%=u.getIdArticle()%>&action=show"><%=u.getIdArticle()%></a>
											</td>
											<td><IMG src="./images/<%=u.getImage()%>" WIDTH="50"
												HEIGHT="50" /></td>
											<td><%=u.getDesignation()%></td>
											<td><%=u.getPrix()%></td>

											<td><%=u.getQuantite()%></td>
											<td><%=u.getDescription()%></td>
											<td><a
												href="Produit?id=<%=u.getIdArticle()%>&action=delete"><i class="fa fa-user"></i> <input
													class="btn btn-danger" type="button" value="Supprimer">
											</a> <a href="Produit?id=<%=u.getIdArticle()%>&action=edit">
													<input class="btn btn-success" type="button"
													value="Modifier">
											</a></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<br> <a href="AjoutArticle"> <input
									class="btn btn-primary" type="button"
									value="Ajouter un Article">
								</a>
							</div>
						</div>
						<!-- END EXAMPLE TABLE widget-->
					</div>
				</div>

				<!-- END ADVANCED TABLE widget-->

				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div id="footer">
		2019 &copy; CamerShOP Admin Panel
		<div class="span pull-right">
			<span class="go-top"><i class="icon-arrow-up"></i></span>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS -->
	<!-- Load javascripts at bottom, this will reduce page load time -->
	<script src="./assets/TemplateAdmin/js/jquery-1.8.3.min.js"></script>
	<script
		src="./assets/TemplateAdmin/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="./assets/TemplateAdmin/js/jquery.blockui.js"></script>
	<!-- ie8 fixes -->
	<!--[if lt IE 9]>
   <script src="./assets/TemplateAdmin/js/excanvas.js"></script>
   <script src="./assets/TemplateAdmin/js/respond.js"></script>
   <![endif]-->
	<script type="text/javascript"
		src="./assets/TemplateAdmin/assets/uniform/jquery.uniform.min.js"></script>
	<script type="text/javascript"
		src="./assets/TemplateAdmin/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="./assets/TemplateAdmin/assets/data-tables/DT_bootstrap.js"></script>
	<script src="./assets/TemplateAdmin/js/scripts.js"></script>
	<script>
		jQuery(document).ready(function() {
			// initiate layout and plugins
			App.init();
		});
	</script>
</body>
<!-- END BODY -->
</html>

<%
	} else {
			out.print("C'est un client");
			response.sendRedirect("Accueil");
		}
	} else {
		response.sendRedirect("admin");
	}
%>


