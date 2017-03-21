package br.ufba.laboratorios.connection;

import junit.framework.TestCase;

/**
 * Created by Bruno on 21/03/2017.
 */
public class ConnectTest extends TestCase {
    public void testGetConnection() throws Exception {
        try {
            Connect.getConnection();
        } catch (Exception e) {
            System.out.println("ERRO de conexão: " + e);
        }
    }

    public void testCloseConnection() throws Exception {

    }

}