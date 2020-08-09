<%@page pageEncoding="UTF-8" %>

<body>
	<!-- HEADER -->
	<%@ include file="../WEB-INF/inclu/header.jsp" %>
	<!-- /HEADER -->

		<!-- NAVIGATION -->
	<%@ include file="../WEB-INF/inclu/nav.jsp" %>
	<!-- /NAVIGATION -->
	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">inscription</li>
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
				<form id="checkout-form" class="clearfix" action="Inscription" method="post">
					<div class="col-md-6">
						<div class="billing-details">
							<p>Already a customer ? <a href="#">Login</a></p>
							<div class="section-title">
								<h3 class="title">Entrez Vos Informations</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="nom" placeholder="Entrez votre nom..." required>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="login" placeholder="Entrez votre login..." required>
							</div>
                                                        <div class="form-group">
								<input class="input" type="password" name="password" placeholder="Entrez votre mot de passe..." required>
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="Entrez votre email..." required>
							</div>
                                                        <div class="form-group">
								<input class="input" type="tel" name="telephone" placeholder="Telephone" required>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="ville" placeholder="Ville" required>
							</div>
							
							<div class="form-group">
								<input class="input" type="text" name="photo" placeholder="photo" required>
							</div>
                                                       
							
							<div class="form-group">
                                                            <button type="submit" class="btn btn-light">S'inscrire</button>
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
