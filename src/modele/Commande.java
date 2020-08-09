package modele;

public class Commande {

	int idCommande;
	int idUser;
	String dateCmde;
	String etatCmde;
	float totale;

	public Commande() {
		// TODO Auto-generated constructor stub
	}

	public int getIdCommande() {
		return idCommande;
	}

	public void setIdCommande(int idCommande) {
		this.idCommande = idCommande;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getDateCmde() {
		return dateCmde;
	}

	public void setDateCmde(String dateCmde) {
		this.dateCmde = dateCmde;
	}

	public String getEtatCmde() {
		return etatCmde;
	}

	public void setEtatCmde(String etatCmde) {
		this.etatCmde = etatCmde;
	}

	public float getTotale() {
		return totale;
	}

	public void setTotale(float totale) {
		this.totale = totale;
	}

}
