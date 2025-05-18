package com.ticketbooking.payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updatePayment")
public class UpdatePaymentServlet extends HttpServlet {
    private final PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String paymentId = request.getParameter("paymentId");
            String newPaymentMethod = request.getParameter("paymentMethod");

            boolean updated = paymentDAO.updatePayment(paymentId, newPaymentMethod);

            if (updated) {
                response.sendRedirect("views/payments.jsp?updated=true");
            } else {
                response.sendRedirect("views/update_payment.jsp?error=Payment not found");
            }
        } catch (Exception e) {
            response.sendRedirect("views/update_payment.jsp?error=" + e.getMessage());
        }
    }
}
