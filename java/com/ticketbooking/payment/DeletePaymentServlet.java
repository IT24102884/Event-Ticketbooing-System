package com.ticketbooking.payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deletePayment")
public class DeletePaymentServlet extends HttpServlet {
    private final PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String paymentId = request.getParameter("paymentId");
            boolean deleted = paymentDAO.deletePayment(paymentId);

            if (deleted) {
                response.sendRedirect("views/payments.jsp?deleted=true");
            } else {
                response.sendRedirect("views/payments.jsp?error=Payment not found");
            }
        } catch (Exception e) {
            response.sendRedirect("views/payments.jsp?error=" + e.getMessage());
        }
    }
}
