package com.ticketbooking.payment;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Payment implements Serializable {
    private String paymentId;
    private double amount;
    private String paymentMethod;
    private String userId;
    private LocalDateTime paymentDate;
    private String status;

    public Payment() {}

    public Payment(String paymentId, double amount, String paymentMethod, String userId, LocalDateTime paymentDate, String status) {
        this.paymentId = paymentId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.userId = userId;
        this.paymentDate = paymentDate;
        this.status = status;
    }

    // Getters and Setters
    public String getPaymentId() { return paymentId; }
    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public LocalDateTime getPaymentDate() { return paymentDate; }
    public void setPaymentDate(LocalDateTime paymentDate) { this.paymentDate = paymentDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return String.format("%s|%.2f|%s|%s|%s|%s",
            paymentId, amount, paymentMethod, userId, 
            paymentDate.toString().replace('T', ' '), // Format date for better readability
            status);
    }
}
