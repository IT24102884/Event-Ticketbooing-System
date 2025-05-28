package com.event.servlet;

import com.event.Service.Booking;
import com.event.model.BookingQueue;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {

    private void saveBookingToFile(Booking booking, String filePath) throws IOException {
        try (FileWriter fw = new FileWriter(filePath, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            out.println(booking.getTicketId() + "," +
                    booking.getUserId() + "," +
                    booking.getEventId() + "," +
                    booking.getSeatNumber() + "," +
                    booking.getStatus() + "," +
                    booking.getPrice() + "," +
                    booking.getQuantity());
        }
    }

    private BookingQueue loadBookingsFromFile(String filePath) throws IOException {
        BookingQueue queue = new BookingQueue();
        File file = new File(filePath);
        if (!file.exists()) return queue;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 7) {
                    Booking booking = new Booking(
                            parts[0], parts[1], parts[2], parts[3], parts[4],
                            Double.parseDouble(parts[5]),
                            Integer.parseInt(parts[6])
                    );
                    queue.enqueue(booking);
                }
            }
        }
        return queue;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketId = request.getParameter("ticketId");
        String userId = request.getParameter("userId");
        String eventId = request.getParameter("eventId");
        String seatNumber = request.getParameter("seatNumber");
        String status = request.getParameter("status");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Booking booking = new Booking(ticketId, userId, eventId, seatNumber, status, price, quantity);

        String filePath = getServletContext().getRealPath("/WEB-INF/bookings.txt");
        saveBookingToFile(booking, filePath);

        BookingQueue queue = loadBookingsFromFile(filePath);

        request.setAttribute("queue", queue);
        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}