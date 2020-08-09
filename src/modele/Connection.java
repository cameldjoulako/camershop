package modele;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;

public class Connection {
	
	String sql="select *from utilisateur where login=? and password=?";
	String url = "jdbc:mysql://localhost:3306/camershop";
	String utilisateur = "root";
	String motDePasse = "";
	
	public boolean check(String login,String password) {
		Connection con=null;
	    try{
		Class.forName("com.mysql.jdbc.Driver");

    	
    	 con= (Connection) DriverManager.getConnection( url, utilisateur, motDePasse );
    	 PreparedStatement st=  ((java.sql.Connection) con).prepareStatement(sql);
    	 st.setString(1,login);
    	 st.setString(2,password);
    	 ResultSet rs=st.executeQuery();
    	 if(rs.next()) {
    		 return true;
    	 }
    	 
    	 
    	 
    }catch(Exception e){System.out.println(e);}
		
		return false;
	}
	

}
