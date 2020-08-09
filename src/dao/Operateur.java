package dao;

import java.awt.image.BufferedImage;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import com.mysql.jdbc.Blob;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import modele.Commande;
import modele.Produit;
import modele.Utilisateur;

public class Operateur {

	private PreparedStatement pr = null;

	public ArrayList<Produit> getAllProduit() {

		ArrayList<Produit> listproduit = new ArrayList<Produit>();

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			pr = (PreparedStatement) cnx.prepareStatement("select * from article");
			ResultSet rs = pr.executeQuery();

			while (rs.next()) {
				Produit produit = new Produit();
				produit.setIdArticle(rs.getInt(1));
				produit.setIdCategorie(rs.getInt(2));
				produit.setIdMarque(rs.getInt(3));
				produit.setDesignation(rs.getString("designation"));
				produit.setPrix(rs.getFloat("prix"));
				produit.setQuantite(rs.getInt("quantite"));
				produit.setDescription(rs.getString("description"));
				produit.setImage(rs.getString("image"));

				listproduit.add(produit);

			}

		} catch (Exception e) {
		}

		return listproduit;
	}

	public ArrayList<Commande> getAllCommandes() {

		ArrayList<Commande> listcommandes = new ArrayList<Commande>();

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			pr = (PreparedStatement) cnx.prepareStatement("select * from commande");
			ResultSet rs = pr.executeQuery();

			//idCommande 	idUser 	dateCmde 	etatCmde 	totale
			while (rs.next()) {
				Commande commande = new Commande();
				commande.setIdCommande(rs.getInt("idCommande"));
				commande.setIdUser(rs.getInt("idUser"));
				commande.setDateCmde(rs.getString("dateCmde"));
				commande.setEtatCmde(rs.getString("etatCmde"));				
				commande.setTotale(rs.getFloat("totale"));

				listcommandes.add(commande);

			}

		} catch (Exception e) {
		}

		return listcommandes;
	}

	public ArrayList<Utilisateur> getAllUser() {

		ArrayList<Utilisateur> listutilisateur = new ArrayList<Utilisateur>();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			pr = (PreparedStatement) cnx.prepareStatement("select * from utilisateur");
			ResultSet rs = pr.executeQuery();
//idUser	nom	login	password	email	telephone	ville	profil	photo
			while (rs.next()) {
				Utilisateur utilisateur = new Utilisateur();
				utilisateur.setIdUser(rs.getInt("idUser"));
				utilisateur.setNom(rs.getString("nom"));
				utilisateur.setLogin(rs.getString("login"));				
				utilisateur.setPassword(rs.getString("password"));
				utilisateur.setEmail(rs.getString("email"));
				utilisateur.setTelephone(rs.getInt("telephone"));
				utilisateur.setVille(rs.getString("ville"));
				utilisateur.setProfil(rs.getString("profil"));
				utilisateur.setPhoto(rs.getString("photo"));

				listutilisateur.add(utilisateur);

			}

		} catch (Exception e) {
		}

		return listutilisateur;

	}

	public Utilisateur ShowUser(String id) {

		Utilisateur user = new Utilisateur();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/camershop", "root", "");
			Statement stmt = (Statement) cnx.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE idUser = " + id);
			//idUser	nom	login	password	email	telephone	ville	profil	photo
			while (rs.next()) {				
				user.setIdUser(rs.getInt("idUser"));
				user.setNom(rs.getString("nom"));
				user.setLogin(rs.getString("login"));				
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setTelephone(rs.getInt("telephone"));
				user.setVille(rs.getString("ville"));
				user.setProfil(rs.getString("profil"));
				user.setPhoto(rs.getString("photo"));
			}

		} catch (Exception e) {
		}

		return user;
	}

	public void addUtilisateur(Utilisateur utilisateur) {

		try {
			
			
			String sql = "insert into utilisateur(idUser,nom,login,password,email,telephone,ville,profil,photo) values (default,?,?,?,?,?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/camershop", "root","");
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1, utilisateur.getNom());
			ps.setString(2, utilisateur.getLogin());
			ps.setString(3, utilisateur.getPassword());
			ps.setString(4, utilisateur.getEmail());
			ps.setInt(5, utilisateur.getTelephone());
			ps.setString(6, utilisateur.getVille());
			ps.setString(7, utilisateur.getProfil());
			ps.setString(8, utilisateur.getPhoto());
			
			ps.executeUpdate();
			 ps.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
