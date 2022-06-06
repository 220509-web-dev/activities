package dev.kimani.utils.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import dev.kimani.utils.daos.BasketballDaoPostgres;
import dev.kimani.utils.entities.Player;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(
//        urlPatterns = "/player",
//        loadOnStartup = 2,
//        initParams =  {
//                @WebInitParam(name = "player-servlet-key", value = "player-servlet-value")
//        }
//)
public class PlayerServlet extends HttpServlet {

    private final ObjectMapper mapper;
    private final BasketballDaoPostgres basketballDaoPostgres;


    public PlayerServlet(ObjectMapper mapper, BasketballDaoPostgres basketballDaoPostgres) {
        this.mapper = mapper;
        this.basketballDaoPostgres = basketballDaoPostgres;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NullPointerException {
        Player player = basketballDaoPostgres.getPlayerByUsername("mjordan");
        String respPayload = mapper.writeValueAsString(player);
        resp.setContentType("application/json");
        resp.getWriter().write(respPayload);

    }
}
