<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ page import="modele.*"%>
<%
	Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
%>

<%
	if (utilisateur != null) {
		if (utilisateur.getProfil().equals("admin")) {
%>
<!-- Ajout d'un utilisateur -->
<!DOCTYPE html>
<html lang="fr">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Ajout d'un Utilisateur - Camershop</title>
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
					src="./assets/TemplateAdmin/img/logo.png" alt="CamerShop Admin" />
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
								src="./images/<%=utilisateur.getPhoto()%>" alt="CamelAdmin"> <span
								class="username"><%=utilisateur.getNom()%></span> <b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu">

								<li><a href="logout.jsp"><i class="icon-key"></i>Deconnexion</a></li>
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
					<input class="form-control form-control-lg" type="text"
						class="search-query" placeholder="Recherche" />
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
				<li class="has-sub active"><a href="statistique.jsp" class="">
						<span class="icon-box"> <i class="icon-book"></i></span>
						Statistiques

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
							CamerShop <small>Ajout d'un nouvel Utilisateur</small>
						</h3>
						<ul class="breadcrumb">
							<li><a href="#"><i class="icon-home"></i></a><span
								class="divider">&nbsp;</span></li>
							<li><a href="#">Administration</a> <span class="divider">&nbsp;</span>
							</li>
							<li><a href="#">Ajout Utilisateur</a><span
								class="divider-last">&nbsp;</span></li>
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
									<i class="icon-reorder"></i>Gestion des Utilisateurs
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">

								<form action="User" method="post" enctype="multipart/form-data">
									<table>

										<tr>
											<td>Nom:</td>
											<td><input type="text" name="nom"></td>
										</tr>

										<tr>
											<td>Login:</td>
											<td><input type="text" name="login"
												placeholder="nom d'utilisateur" /></td>
										</tr>
										<tr>
											<td>Password:</td>
											<td><input type="password" name="password"></td>
										</tr>

										<tr>
											<td>Email:</td>
											<td><input type="email" name="email"></td>
										</tr>

										<tr>
											<td>Telephone:</td>
											<td><input type="text" name="telephone"></td>
										</tr>

										<tr>
											<td>Ville:</td>
											<td><input type="text" name="ville"></td>
										</tr>

										<tr>
											<td>Profil:</td>
											<td><select name="profil">
													<option value="admin">admin</option>
													<option value="client">client</option>
											</select></td>
										</tr>

										<tr>
											<td></td>
											<td><input class="btn btn-warning" type="submit"
												value="Ajouter"><input class="btn btn-primary"
												type="reset" value="Effacer"></td>
										</tr>


									</table>

								</form>

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
		2019 &copy; CamerShop Admin Panel.
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



