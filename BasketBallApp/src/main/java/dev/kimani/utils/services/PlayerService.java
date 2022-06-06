package dev.kimani.utils.services;

import dev.kimani.utils.daos.BasketballDaoPostgres;
import dev.kimani.utils.entities.Player;
import dev.kimani.utils.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PlayerService {

    BasketballDaoPostgres basketballDaoPostgres = new BasketballDaoPostgres();

    public Player createPlayer(Player player) {

        // try connecting to database
        try(Connection connection = ConnectionUtil.getInstance().getConnection()) {
            String sql = "INSERT INTO players VALUES ( ?, ?, ?, ?, ?, ?)";

            // set the sql code variable as the prepared statement to be passed to the database
            PreparedStatement ps = connection.prepareStatement(sql);

            // set new entry column values
            ps.setInt(1, player.getPlayerNumber());
            ps.setString(2, player.getFirstName());
            ps.setString(3, player.getLastName());
            ps.setString(4, player.getUsername());
            ps.setString(5, player.getPassword());
            ps.setString(6, player.getPosition());

            // Execute the prepared statement to create new player
            ps.execute();

            //get the generated primary key value
            ResultSet rs = ps.getGeneratedKeys();
            // read result values
            rs.next();
            // get the generated id from database column 'id'
            int generatedId = rs.getInt("id");

            // set the player objects id to the retrieved generated id from the database
            player.setId(generatedId);

            // return the new player object
            return player;


        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        // Otherwise, return null
        return null;
    }



    public Player Login(String username, String password) {
        Player player = basketballDaoPostgres.getPlayerByUsername(username);

        if (player.getUsername() != null && password.equals(player.getPassword())) {
            System.out.println("Logged in successfully!");
            return player;

        } else if (player.getUsername() != null && !password.equals(player.getPassword())) {
            System.out.println("Wrong password");
            throw new InvalidCredentialException("User does not exist.");

        } else {
            System.out.println("User does not exist!");
            throw new InvalidCredentialException("User does not exist.");

        }

    }

}
