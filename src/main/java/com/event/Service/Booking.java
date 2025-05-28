package com.event.Service;

public class Booking {
    private String ticketId;
    private String userId;
    private String eventId;
    private String seatNumber;
    private String status;
    private double price;
    private int quantity;
    private double totalPrice;

    public Booking(String ticketId, String userId, String eventId, String seatNumber, String status, double price, int quantity) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.eventId = eventId;
        this.seatNumber = seatNumber;
        this.status = status;
        this.price = price;
        this.quantity = quantity;
        this.totalPrice = price * quantity;
    }

    public String getTicketId() { return ticketId; }
    public String getUserId() { return userId; }
    public String getEventId() { return eventId; }
    public String getSeatNumber() { return seatNumber; }
    public String getStatus() { return status; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public double getTotalPrice() { return totalPrice;}


}