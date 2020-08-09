package modele;

public class Livraison {
	
	int idLivraison;
	int idCommande;
	String dateLivraison;
	String etatLivraison;
	String pointLivraison;
	public Livraison() {
		// TODO Auto-generated constructor stub
	}
	
	public int getIdLivraison() {
		return idLivraison;
	}
	public void setIdLivraison(int idLivraison) {
		this.idLivraison = idLivraison;
	}
	public int getIdCommande() {
		return idCommande;
	}
	public void setIdCommande(int idCommande) {
		this.idCommande = idCommande;
	}
	public String getDateLivraison() {
		return dateLivraison;
	}
	public void setDateLivraison(String dateLivraison) {
		this.dateLivraison = dateLivraison;
	}
	public String getEtatLivraison() {
		return etatLivraison;
	}
	public void setEtatLivraison(String etatLivraison) {
		this.etatLivraison = etatLivraison;
	}
	public String getPointLivraison() {
		return pointLivraison;
	}
	public void setPointLivraison(String pointLivraison) {
		this.pointLivraison = pointLivraison;
	}
	

}
