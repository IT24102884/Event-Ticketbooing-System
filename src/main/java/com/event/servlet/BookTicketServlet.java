package com.event.servlet;

import com.event.model.Ticket;
import com.event.model.TicketQueue;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@WebServlet("/bookTicket")
public class BookTicketServlet extends HttpServlet {
    static TicketQueue queue = new TicketQueue();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
         String eventID = request.getParameter("eventID");

        String seat=getNextAvailableSeat(eventID);
            if(seat==null){
                response.sendRedirect("bookTicket.jsp?error=NoSeatAvailable");
                return;
            }
            String ticketID="T"+System.currentTimeMillis();
            Ticket ticket=new Ticket(ticketID,userID,eventID,seat,"BOOKED");

            queue.addTicket(ticket);
            ticket.saveToFile();
            updateEventSeats(eventID);

           response.sendRedirect("success.jsp?ticket="+ticketID);





    }


    private void updateEventSeats(String eventID) throws IOException {
        String path=getServletContext().getRealPath("/data/events.txt");
        File inputFile=new File(path);
        if (!inputFile.exists()) {
            throw new FileNotFoundException("File not found at path: " + path);
        }
        String path2=getServletContext().getRealPath("/data/temp_events.txt");
        File tempFile=new File(path2);

        try(BufferedReader reader=new BufferedReader(new FileReader(inputFile));
            BufferedWriter writer=new BufferedWriter(new FileWriter(tempFile))){
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts[0].equals(eventID)) {
                    int available = Integer.parseInt(parts[6]);
                    available = available - 1;
                    parts[6] = String.valueOf(available);
                }
                writer.write(String.join(",", parts));
                writer.newLine();
            }
        }
        tempFile.renameTo(inputFile);

    }

    private String getNextAvailableSeat(String eventID) {
        return "S"+new Random().nextInt(100);
    }


}