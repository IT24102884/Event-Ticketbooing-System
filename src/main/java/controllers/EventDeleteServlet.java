package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Services.EventService;

import java.io.IOException;
@WebServlet("/delete-event")
public class EventDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventId = request.getParameter("id");

        EventService.deleteEvent(eventId);
        response.sendRedirect("admin-event.jsp?successfully+deleted");
    }
}
