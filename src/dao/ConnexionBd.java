package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnexionBd {
	private Connection cnx = null;
	private Statement st = null;
	String username = "root";
	String password = "";
	private String url = "jdbc:mysql://localhost:3306/camershop";

	public ConnexionBd() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cnx = DriverManager.getConnection(url, username, password);
			st = cnx.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Statement getStatement() {
		return st;
	}

}
