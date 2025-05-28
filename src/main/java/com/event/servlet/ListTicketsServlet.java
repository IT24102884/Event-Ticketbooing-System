package com.event.servlet;

import com.event.model.MyLinkedQueue;
import com.event.model.Ticket;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/listTickets")
public class ListTicketsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = getServletContext().getRealPath("/data/ticket.txt");
        MyLinkedQueue<Ticket> queue = new MyLinkedQueue<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 8) {
                    try {
                        String ticketId = parts[0];
                        String userId = parts[1];
                        String eventId = parts[2];
                        String seatNumber = parts[3];
                        String status = parts[4];
                        double price = Double.parseDouble(parts[5]);
                        int quantity = Integer.parseInt(parts[6]);
                        double totalPrice = Double.parseDouble(parts[7]);
                        Ticket ticket = new Ticket(ticketId, userId, eventId, seatNumber, status, price, quantity, totalPrice);
                        queue.offer(ticket);
                    } catch (NumberFormatException e) {
                        System.err.println("Invalid data format in ticket.txt: " + line);
                        continue;
                    }
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading ticket.txt: " + e.getMessage());
            throw new ServletException("Error reading ticket file", e);
        }
        List<Ticket> tickets = new ArrayList<>();
        while (!queue.isEmpty()) {
            tickets.add(queue.poll());
        }
        request.setAttribute("tickets", tickets);
        request.getRequestDispatcher("/listTickets.jsp").forward(request, response);
    }
    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("ListTicketsServlet initialized at " + new java.util.Date());
    }
}