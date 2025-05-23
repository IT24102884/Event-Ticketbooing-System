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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@WebServlet("/bookTicket")
public class BookTicketServlet extends HttpServlet {
    static TicketQueue queue = new TicketQueue();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userID = request.getParameter("userID");
            String eventID = request.getParameter("eventID");
            String quantityStr= request.getParameter("quantity");
            String totalPriceStr= request.getParameter("totalPrice");

            if (!isValidUser(userID)) {
                response.sendRedirect("bookTicket.jsp?error=InvalidUserID");
                return;
            }

            int quantity;
            double totalPrice;
            try{
                quantity = Integer.parseInt(quantityStr);
                totalPrice = Double.parseDouble(totalPriceStr);
            }catch(NumberFormatException e){
                response.sendRedirect("bookTicket.jsp?error=InvalidInput");
                return;
            }

            if(quantity< 1 || quantity > 10){
                response.sendRedirect("bookTicket.jsp?error=InvalidInput");
            }

            List<String>seats= getNextAvailableSeat(eventID, quantity);
            if (seats==null ||seats.size()<quantity){
                response.sendRedirect("bookTicket.jsp?error=InvalidInput");
                return;
            }

            String ticketID = "T" + System.currentTimeMillis();
            String seatNumber =String.join(",", seats);
            double pricePerTicket = totalPrice / quantity;
            Ticket ticket = new Ticket(ticketID, userID, eventID, seatNumber, "BOOKED",pricePerTicket,quantity,totalPrice);

            queue.addTicket(ticket);
            ticket.saveToFile();
            logBooking(ticket);
            updateEventSeats(eventID,quantity);

            response.sendRedirect("success.jsp?ticket=" + ticketID 
    + "&username=" + userID 
    + "&eventName=" + eventID 
    + "&seat=" + seatNumber 
    + "&price=" + totalPrice 
    + "&quantity=" + quantity);


         }catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=" + e.getMessage());
        }
    }
    private boolean isValidUser(String userID)throws Exception{
        String usersFile = "E:\\SLIIT_java\\TicketBookingSystem\\src\\main\\webapp\\data\\user.txt";
        try(BufferedReader br=new BufferedReader(new FileReader(usersFile))){
            String line;
            while((line=br.readLine())!=null){
                String[] parts = line.split(",");
                if(parts.length >= 1 && parts[0].equals(userID)){
                    return true;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    private List<String> getNextAvailableSeat(String eventID, int quantity) throws IOException {
        String path=getServletContext().getRealPath("/data/seats_"+eventID+".txt");
        File seatFile=new File(path);

        if(!seatFile.exists()){
           try (BufferedWriter bw = new BufferedWriter(new FileWriter(seatFile))) {
                for(int i=1;i<=50;i++){
                    bw.write(String.format("S%03d,Available",i));
                    bw.newLine();
                }
           }catch (IOException e){
               e.printStackTrace();
               return null;
           }

        }

          List<String> seatNumber=new ArrayList<>();
          List<String> allLines=new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(seatFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                allLines.add(line);
                String[] parts = line.split(",");
                if(parts.length==2 && parts[1].equals("Available")&&seatNumber.size()<quantity){
                   seatNumber.add(parts[0]);
                }
            }
        }
        if(seatNumber.size()<quantity){
            return null;
        }
        List<String> updatedLines=new ArrayList<>();
        for(String line:allLines){
            String[] parts = line.split(",");
            if(path.length()==2 && seatNumber.contains(parts[0])){
                updatedLines.add(parts[0]+",Booked");
            }else {
                updatedLines.add(line);
            }
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(seatFile))) {
            for (String updatedLine : updatedLines) {
                writer.write(updatedLine);
                writer.newLine();
            }
        }
       return seatNumber;
    }


    private void updateEventSeats(String eventID, int quantity) throws IOException {
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

    private void logBooking(Ticket ticket) throws IOException {
        String path = getServletContext().getRealPath("/data/booking_log.txt");
        String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path, true))) {

            writer.write(ticket.getTicketId() + ","
                    + ticket.getUserId() + ","
                    + ticket.getEventId() + ","
                    + ticket.getSeatNumber() + ","
                    +ticket.getPrice()+","
                    +ticket.getQuantity()+","
                    +ticket.getTotalPrice()+","
                    + timestamp);

            writer.newLine();

        }


    }




}