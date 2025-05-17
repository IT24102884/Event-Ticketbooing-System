package controllers;

import jakarta.servlet.HttpConstraintElement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Event;
import Services.EventService;

import java.io.IOException;

@WebServlet("/UpdateProducts")
public class EventUpdateServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id= request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int seats = Integer.parseInt(request.getParameter("tickets"));
        String location = request.getParameter("location");
        String image = request.getParameter("imagePath");


        Event updatedEvent = new Event(id,name,date,time,description,location,category,seats,image,price);
        EventService.updateEvent(updatedEvent);

        response.sendRedirect(request.getContextPath() + "/admin-event.jsp");
    }
}
