package br.ufba.laboratorios.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    private static Connection connection;
    private static final String CONNECTION_URL = "jdbc:mysql://localhost/chaves";
    private static final String USER = "root";
    private static final String PASSWORD = "admin";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null){
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(CONNECTION_URL, USER, PASSWORD);
            System.out.println("Conexão com o banco de dados realizada com sucesso.");
        }

        return connection;
    }

    public void closeConnection() throws SQLException {
        if(connection != null){
            connection.close();
            connection = null;
        }
    }
}