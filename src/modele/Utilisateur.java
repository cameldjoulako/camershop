package modele;

public class Utilisateur {
	
	int idUser;
	String nom;
	String login;
	String password;
	String email;
	int telephone;
	String ville;
	String profil;
	String photo;

	public Utilisateur() {
		// TODO Auto-generated constructor stub
	}

	public Utilisateur(int idUser2, String nom2, String login2, String password2, String email2, int telephone2,
			String ville2, String profil2, String photo2) {
		// TODO Auto-generated constructor stub
		this.idUser = idUser2 ;
		this.nom = nom2;
		this.login = login2;
		this.password = password2;
		this.email = email2;
		this.telephone = telephone2;
		this.ville = ville2;
		this.profil = profil2;
		this.photo = photo2;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTelephone() {
		return telephone;
	}

	public void setTelephone(int telephone) {
		this.telephone = telephone;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getProfil() {
		return profil;
	}

	public void setProfil(String profil) {
		this.profil = profil;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
