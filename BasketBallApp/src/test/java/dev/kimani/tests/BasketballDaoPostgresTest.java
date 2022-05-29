package dev.kimani.tests;

import dev.kimani.utils.daos.BasketballDaoPostgres;
import dev.kimani.utils.entities.Player;
import dev.kimani.utils.util.LogLevel;
import dev.kimani.utils.util.Logger;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class BasketballDaoPostgresTest {

    static BasketballDaoPostgres basketballDaoPostgres = new BasketballDaoPostgres();

    @AfterEach
    void tearDown() {
        resetTable();
    }

    @Test
    void getPlayerById() {
        Player player = basketballDaoPostgres.getPlayerById(4);
        if(player.getFirstName().isEmpty()) {
            Logger logger = new Logger();
            logger.log("getPlayerById Test failed. No player first name found.", LogLevel.ERROR);
        } else {
            Logger logger2 = new Logger();
            logger2.log("getPlayerById Test Passed!", LogLevel.DEBUG);
        }
        Assertions.assertNotNull(player);
    }

    @Test
    void getPlayerByUsername() {
        Player player = basketballDaoPostgres.getPlayerByUsername("mjordan");
        if(player.getUsername().isEmpty()) {
            Logger logger = new Logger();
            logger.log("getPlayerByUsername Test failed. No player username found.", LogLevel.ERROR);
        } else {
            Logger logger2 = new Logger();
            logger2.log("getPlayerByUsername Test Passed!", LogLevel.DEBUG);
        }
        Assertions.assertNotNull(player);
    }

    @Test
    void getAllPlayers() {
        List<Player> players = basketballDaoPostgres.getAllPlayers();
        Assertions.assertNotNull(players);
        if(players.isEmpty()) {
            Logger logger = new Logger();
            logger.log("getAllPlayers Test failed. No player first name found.", LogLevel.ERROR);
        }  else {
            Logger logger2 = new Logger();
            logger2.log("getAllPlayers Test Passed!", LogLevel.DEBUG);
        }
    }

    @Test
    void updatePlayer() {
        Player player = new Player(0, 7, "Test", "McTest", "Tester","Testing", "C");
        basketballDaoPostgres.updatePlayer(player);
        Player newPlayer = basketballDaoPostgres.getPlayerByUsername("Tester");
        if(newPlayer.getFirstName().isEmpty()) {
            Logger logger = new Logger();
            logger.log("updatePlayer Test failed. No player first name found.", LogLevel.ERROR);
        }  else {
            Logger logger2 = new Logger();
            logger2.log("updatePlayer Test Passed!", LogLevel.DEBUG);
        }
        Assertions.assertEquals(7, newPlayer.getPlayerNumber());
    }

    @Test
    void resetTable() {
        basketballDaoPostgres.resetTable();
        String expectedTable = "[Player{id=1, playerNumber=23, firstName='Michael', lastName='Jordan', username='mjordan', password='jumpman23', position='SG'}\n" +
                ", Player{id=2, playerNumber=30, firstName='Stephen', lastName='Curry', username='scurry', password='splashbro', position='PG'}\n" +
                ", Player{id=3, playerNumber=2, firstName='Kawhi', lastName='Leonard', username='kleonard', password='kltheclaw', position='C'}\n" +
                ", Player{id=4, playerNumber=6, firstName='Lebron', lastName='James', username='ljames', password='kingjames', position='SF'}\n" +
                ", Player{id=5, playerNumber=7, firstName='Kevin', lastName='Durant', username='kdurant', password='durantula', position='PF'}\n" +
                "]";
        if(basketballDaoPostgres.getAllPlayers().toString() == expectedTable) {
            Logger logger = new Logger();
            logger.log("resetTable Test failed. No player first name found.", LogLevel.ERROR);
        }  else {
            Logger logger2 = new Logger();
            logger2.log("resetTable Test Passed!", LogLevel.DEBUG);
        }
        Assertions.assertEquals("[Player{id=1, playerNumber=23, firstName='Michael', lastName='Jordan', username='mjordan', password='jumpman23', position='SG'}\n" +
                ", Player{id=2, playerNumber=30, firstName='Stephen', lastName='Curry', username='scurry', password='splashbro', position='PG'}\n" +
                ", Player{id=3, playerNumber=2, firstName='Kawhi', lastName='Leonard', username='kleonard', password='kltheclaw', position='C'}\n" +
                ", Player{id=4, playerNumber=6, firstName='Lebron', lastName='James', username='ljames', password='kingjames', position='SF'}\n" +
                ", Player{id=5, playerNumber=7, firstName='Kevin', lastName='Durant', username='kdurant', password='durantula', position='PF'}\n" +
                "]", basketballDaoPostgres.getAllPlayers().toString());

    }
}

