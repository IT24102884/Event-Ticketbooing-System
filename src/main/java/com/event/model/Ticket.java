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
        String path = "E:\\SLIIT_java\\TicketBookingSystem\\src\\main\\webapp\\data\\ticket.txt";
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path, true))) {
            String ticketData = String.format("%s,%s,%s,%s,%s,%.2f,%d,%.2f",
                ticketId, userId, eventId, seatNumber, status, price, quantity, totalPrice);
            writer.write(ticketData);
            writer.newLine();
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
