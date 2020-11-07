package br.com.gather.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static ConnectionManager instancia;

	private ConnectionManager() {
	}

	public static ConnectionManager getInstance() {
		if (instancia == null) {
			instancia = new ConnectionManager();
		}

		return instancia;
	}

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl = "jdbc:mysql://localhost:3306/gather"; // em gather, trocar para o nome da base de dados, caso nome seja diferente
		String dbUsr = "admin";
		String dbPwd = "admin";

		Connection connection = DriverManager.getConnection(dbUrl, dbUsr, dbPwd);
		
		return connection;
	}

}
