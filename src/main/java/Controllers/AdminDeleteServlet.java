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

@WebServlet("/adminDelete")
public class AdminDeleteServlet extends HttpServlet {

      AdminService adminService = new AdminService();

   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   }

}
