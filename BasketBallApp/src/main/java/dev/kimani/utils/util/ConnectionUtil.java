package dev.kimani.utils.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {

    private static ConnectionUtil instance;

    private ConnectionUtil() {super();}

    public static ConnectionUtil getInstance(){
        if(instance == null) {
            instance =new ConnectionUtil();
        }

        return instance;
    }

    public static Connection getConnection() {
        try{
            String dbInfo = System.getenv("DB_CONNECTION");
            Connection connection = DriverManager.getConnection(dbInfo);
            return connection;
        } catch (SQLException exception) {
            exception.printStackTrace();
            return null;
        }
    }
}
