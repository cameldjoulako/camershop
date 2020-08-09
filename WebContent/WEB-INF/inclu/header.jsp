<%@ include file="./head_ind.jsp"%>
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
					<li class="dropdown default-dropdown"><a
						class="dropdown-toggle" data-toggle="dropdown"
						aria-expanded="true">FRANC <i class="fa fa-caret-down"></i></a>
						<ul class="custom-menu">
							<li><a href="#">FRANC (FCFA)</a></li>

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
			<%-- <%
				if (!(utilisateur == null)) {
			%>
			 <% out.print("connexion ok"); %>
			<%
				}else{
			%> --%>
			<div class="pull-right">
				<ul class="header-btns">
					<!-- Account -->
					<li class="header-account dropdown default-dropdown">
						<div class="dropdown-toggle" role="button" data-toggle="dropdown"
							aria-expanded="true">
							<div class="header-btns-icon">
								<i class="fa fa-user-o"></i>
							</div>
							<strong class="text-uppercase">Mon Compte <i
								class="fa fa-caret-down"></i></strong>
						</div> <a href="login.jsp">Login</a> / <a href="inscription.jsp">S'inscrire</a>
						<ul class="custom-menu">
							<li><a href="#"><i class="fa fa-user-o"></i> MON COMPTE</a></li>
							<li><a href="login.jsp"><i class="fa fa-unlock-alt"></i>
									Login</a></li>
							<li><a href="inscription.jsp"><i class="fa fa-user-plus"></i>s'inscrire</a></li>
						</ul>
					</li>
					<%-- <%
									}
								%> --%>
								
					<!-- /Account -->

					<!-- Cart -->
					<li class="header-cart dropdown default-dropdown"><a
						class="dropdown-toggle" data-toggle="dropdown"
						aria-expanded="true">
							<div class="header-btns-icon">
								<i class="fa fa-shopping-cart"></i> <span class="qty">0</span>
							</div> <strong class="text-uppercase">Mon Panier:</strong> <br> <span>0.0 FCFA
								CFA</span>
					</a>
						<div class="custom-menu">
							<div id="shopping-cart">
								<div class="shopping-cart-list">
									<div class="product product-widget">
										<div class="product-thumb">
											<img src="./img/thumb-product01.jpg" alt="">
										</div>
										<div class="product-body">
											<h3 class="product-price">
												0 F CFA <span class="qty">x3</span>
											</h3>
											<h2 class="product-name">
												<a href="#">Product Name Goes Here</a>
											</h2>
										</div>
										<button class="cancel-btn">
											<i class="fa fa-trash"></i>
										</button>
									</div>
									<div class="product product-widget">
										<div class="product-thumb">
											<img src="./img/thumb-product01.jpg" alt="">
										</div>
										<div class="product-body">
											<h3 class="product-price">
												32.50 F CFA <span class="qty">x3</span>
											</h3>
											<h2 class="product-name">
												<a href="#">Product Name Goes Here</a>
											</h2>
										</div>
										<button class="cancel-btn">
											<i class="fa fa-trash"></i>
										</button>
									</div>
								</div>
								<div class="shopping-cart-btns">
									<button class="main-btn">Voir le panier</button>
									<button class="primary-btn">
										Checkout <i class="fa fa-arrow-circle-right"></i>
									</button>
								</div>
							</div>
						</div></li>
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