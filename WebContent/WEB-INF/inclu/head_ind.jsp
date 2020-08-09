<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="modele.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>


<!-- Connexion de l'utilisateur via la session -->
<%-- <%
	Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

	if (utilisateur == null) {

		System.out.println("User non connecter");
		response.sendRedirect("Accueil");

	} else if (utilisateur.getProfil().equals("admin")) {

		response.sendRedirect("dashboard.jsp");

	} else if (utilisateur.getProfil().equals("client")) {

	}
%> --%>


<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CamerShop | Vente en Ligne | Téléphones, TV, PC,	Vêtements, Maison, Beauté</title>



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