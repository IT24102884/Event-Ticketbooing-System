package com.ticketbooking.payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewPayments")
public class ViewPaymentsServlet extends HttpServlet {
    private final PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String userId = request.getParameter("userId");
            List<Payment> payments;
            
            if (userId != null && !userId.trim().isEmpty()) {
                payments = paymentDAO.getPaymentsByUserId(userId);
            } else {
                payments = paymentDAO.getAllPayments();
            }

            request.setAttribute("payments", payments);
            request.getRequestDispatcher("/views/payments.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }
}
