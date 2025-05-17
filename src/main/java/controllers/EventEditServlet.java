package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Event;
import Services.EventService;

import java.io.IOException;

@WebServlet("/edit-event")
public class EventEditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventId = request.getParameter("id");
        Event event = EventService.getProductById(eventId);

        if (event != null) {
            request.setAttribute("event", event);
            request.getRequestDispatcher("/edit-events.jsp").forward(request, response);
        }else{
            response.sendRedirect("/index.jsp");
            System.out.println("Product not found");
        }
    }
}
