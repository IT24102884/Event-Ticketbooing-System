package Controllers;

import Models.User;
import Services.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AdminEdit")
public class AdminInfoEditServlet extends HttpServlet {

    AdminService adminService = new AdminService();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("admin");

        String username = request.getParameter("username");
        String password = request.getParameter("new-password");

        if(username == null || username.trim().isEmpty()){
            username = admin.getUsername();
        }
        if(password == null || password.trim().isEmpty()){
            password = admin.getPassword();
        }

        admin.setUsername(username);
        admin.setPassword(password);
        session.setAttribute("admin", admin);

        session.setAttribute("edited", true);

        adminService.EditAdmin(admin.getEmail(), username, password, admin.getRole());

        response.sendRedirect("AdminProfile.jsp");
    }
}