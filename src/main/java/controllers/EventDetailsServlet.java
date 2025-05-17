package controllers;

import Services.EventService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Event;
import Services.EventService;

import java.io.IOException;

@WebServlet("/event")
public class EventDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String eventId = request.getParameter("id");
        Event event = EventService.getProductById(eventId);

        if(event != null){
            request.setAttribute("event", event);
            request.getRequestDispatcher("event-card.jsp").forward(request, response);
        }else{
            System.out.println("Event not found");
        }
    }
}
