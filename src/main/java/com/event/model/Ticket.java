package com.event.model;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class Ticket {

    private String ticketId;
    private String userId;
    private String eventId;
    private String seatNumber;
    private String status;
    private double price;
    private int quantity;
    private double totalPrice;



    //parameterise constructor


    public Ticket(String ticketId, String userId, String eventId, String seatNumber, String status, double price, int quantity, double totalPrice) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.eventId = eventId;
        this.seatNumber = seatNumber;
        this.status = status;
        this.price = price;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public void saveToFile() throws IOException {
       String path="tickets.txt";
        try(BufferedWriter bw = new BufferedWriter(new FileWriter("tickets.txt"))){
           bw.write(ticketId+","+userId+","+eventId+","+seatNumber+","+status+","+price+","+quantity+","+totalPrice);
           bw.newLine();
       }catch(IOException e){
           e.printStackTrace();
       }
    }

    public String getTicketId() {
        return ticketId;
    }

    public String getUserId() {
        return userId;
    }

    public String getEventId() {
        return eventId;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public String getStatus() {
        return status;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
}
