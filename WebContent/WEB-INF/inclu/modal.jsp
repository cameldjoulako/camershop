<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!-- Modal de login -->

<div class="modal" id="monModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Formulaire de login/inscription</h5>
                <button class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input type="login"  id="login" name="login" class="form-control" placeholder="Entrez votre login...">
                    </div>
                    <div class="form-group">
                        <label for="password">mot de passe</label>
                        <input type="password"  id="password" name="password" class="form-control" placeholder="Entrez votre mot de  passe...">
                    </div>
                    <button class="btn btn-success"  type="submit">Se connecter</button>
                    <a class="btn btn-success" href="index.jsp">Retourner à l'accueille</a>

                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal" id="souscrire">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary text-center text-uppercase">Formulaire d'inscription</h5>
                <button class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="InscriptionServlet" method="Post">
                    <div class="form-group">
                        <label for="username">Nom Utilisateur</label>
                        <input type="text" placeholder="Nom utilisateur..." name="nom" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input type="text" placeholder="Votre Login..." name="login" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" placeholder="Votre Email..." name="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password">Mot de passe</label>
                        <input type="password" placeholder="Entrez votre mot de passe..." name="password" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password">Confirmer mot de passe</label>
                        <input type="password" placeholder="Entrez votre mot de passe de confirmation..." name="password" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="number"> Téléphone</label>
                        <input type="number" placeholder="Entrez votre numéro de téléphone..." name="telephone" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="ville">Ville</label>
                        <input type="text" placeholder="Entrez votre ville" name="ville" class="form-control">
                    </div>
                     <div class="form-group">
                   <!-- <label for="profile">Profile</label>
                    <select id="profile" name="profile" class="form-control">
                        <option >client</option>
                        <option>Admin</option>
                    </select>-->
                    
                        <button class="btn btn-success"  type="submit">Soumettre</button>
                </div>
                </form>
            </div>

            
        </div>
    </div>
</div>