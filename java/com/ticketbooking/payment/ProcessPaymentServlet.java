package com.ticketbooking.payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    private final PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("ProcessPaymentServlet: Starting payment processing");
        try {
            // Extract payment details from request
            String amountStr = request.getParameter("amount");
            String paymentMethod = request.getParameter("paymentMethod");
            String userId = request.getParameter("userId");
            
            System.out.println("Received parameters - Amount: " + amountStr + ", Method: " + paymentMethod + ", UserId: " + userId);
            
            double amount = Double.parseDouble(amountStr);

            // Create new payment object
            Payment payment = new Payment(
                UUID.randomUUID().toString(),
                amount,
                paymentMethod,
                userId,
                LocalDateTime.now(),
                "COMPLETED"
            );

            // Save payment to file
            System.out.println("Saving payment to file: " + payment);
            paymentDAO.createPayment(payment);

            System.out.println("Payment saved successfully");
            
            // Redirect to success page
            String redirectUrl = "views/payments.jsp?success=true";
            System.out.println("Redirecting to: " + redirectUrl);
            response.sendRedirect(redirectUrl);
        } catch (Exception e) {
            // Handle errors
            System.out.println("Error processing payment: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("views/payment_form.jsp?error=" + e.getMessage());
        }
    }
}
