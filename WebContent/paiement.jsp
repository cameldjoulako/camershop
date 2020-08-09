<%@page pageEncoding="UTF-8"%>

<body>
	<!-- HEADER -->
	<%@ include file="../WEB-INF/inclu/header.jsp"%>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<%@ include file="../WEB-INF/inclu/nav.jsp"%>
	<!-- /NAVIGATION -->
	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Checkout</li>
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
				<form id="checkout-form" class="clearfix" method="post" action="Paiement">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="shiping-methods">
							<div class="section-title">
								<h4 class="title">Methode de livraison</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-1" checked>
								<label for="shipping-1">Dans un point relais - 500 F CFA</label>
								<div class="caption">
									<label for="pet-select">Points de livraison</label> <select
										id="pet-select">
										<option value="">--Please choose an option--</option>
										<option value="Entree campus">Entree campus</option>
										<option value="Brasseries">Brasseries</option>
										<option value="Rondeau">Rondeau</option>
										<option value="parrot">Parrot</option>
										<option value="spider">Spider</option>
										<option value="goldfish">Goldfish</option>
									</select>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-2"> <label
									for="shipping-2">A domicile - 1.500 F CFA</label>
								<div class="caption"></div>
							</div>
						</div>

						<div class="payments-methods">
							<div class="section-title">
								<h4 class="title">Mode de paiements</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-1" checked>
								<label for="payments-1">MTN Mobile Money</label>
								<div class="caption">
									<form id="formmomo" method="GET"
										action="https://developer.mtn.cm/OnlineMomoWeb/faces/transaction/transactionRequest.xhtml"
										target="_top">
										<input type="hidden" name="idbouton" value="2"
											autocomplete="off"> <input type="hidden"
											name="typebouton" value="PAIE" autocomplete="off"> <input
											class="momo mount" type="hidden" placeholder=""
											name="_amount" value="0" id="montant" autocomplete="off">
										<input class="momo host" type="hidden" placeholder=""
											name="_tel" value="651306222" autocomplete="off"> <input
											class="momo pwd" placeholder="" name="_clP" value=""
											autocomplete="off" type="hidden"> <input
											type="hidden" name="_email"
											value="adrienne.tchamgoue@gmail.com" autocomplete="off">
										<input type="image" id="Button_Image"
											src="https://developer.mtn.cm/OnlineMomoWeb/console/uses/itg_img/buttons/MOMO_Checkout_EN.jpg"
											style="width: 250px; height: 100px;" border="0" name="submit"
											alt="OnloneMomo, le réflexe sécurité pour payer en ligne"
											autocomplete="off">
									</form>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-2"> <label
									for="payments-2">A la livraison</label>
								<div class="caption">
									<p>Vous paierez la facture au livreur avant d'entrer en
										possession de votre commande.
										<input type="submit" name="confirm" id="" class="btn btn-primary" value="Terminer"> 
									<p>
								</div>
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
