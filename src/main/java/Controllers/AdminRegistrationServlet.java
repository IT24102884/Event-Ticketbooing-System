package Controllers;

import Services.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AdminRegistration")
public class AdminRegistrationServlet extends HttpServlet {

    private final AdminService adminService = new AdminService();

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        if (!email.contains("@")) {
            req.setAttribute("error", "Invalid email");
            req.getRequestDispatcher("AdminRegistration.jsp").forward(req, res);
            return;
        } else if (password.length() < 6) {
            req.setAttribute("error", "Password should be at least 6 characters");
            req.getRequestDispatcher("AdminRegistration.jsp").forward(req, res);
            return;
        }

        if (adminService.isAdminExist(email)) {
            req.setAttribute("error", "Email already exists");
            req.getRequestDispatcher("AdminRegistration.jsp").forward(req, res);
        } else {
            adminService.saveAdmin(username, password, email);
            req.setAttribute("success", "Admin registered successfully");
            req.getRequestDispatcher("AdminRegistration.jsp").forward(req, res);
        }
    }
}
