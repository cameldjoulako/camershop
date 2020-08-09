<%-- 
    Document   : login
    Created on : 1 juil. 2019, 09:42:24
    Author     : Nkainsa Legrand
--%>

<%@page pageEncoding="UTF-8" %>

<body>
	<!-- HEADER -->
	<%@ include file="../WEB-INF/inclu/header.jsp" %>
	<!-- /HEADER -->

	
	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Accueil</a></li>
				<li class="active">Commexion</li>
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
				<form id="checkout-form" class="clearfix" action="Login" method="post">
					<div class="col-md-6">
						<div class="billing-details">
							<p>Already a customer ? <a href="#">Login</a></p>
							<div class="section-title">
								<h3 class="title">Connecter vous</h3>
							</div>
							
							<div class="form-group">
								<input class="input" type="text" name="login" placeholder="Entrez votre login" required>
							</div>
                                                        <div class="form-group">
								<input class="input" type="password" name="password" placeholder="Entrez votre mot de passe..." required>
							</div>
							
							
							<div class="form-group">
                                                            <button type="submit" class="btn btn-light">Connexion</button>
							</div>
						</div>
					</div>

					

					
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	<%@ include file="../WEB-INF/inclu/footer_inc.jsp" %>
	

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>

