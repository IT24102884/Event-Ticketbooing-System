package Controllers;

import Services.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/usersList")
public class UsersListServlet extends HttpServlet {

    AdminService adminService = new AdminService();

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        List<String[]> usersList = AdminService.getList("user");
        req.setAttribute("usersList",usersList);
        req.getRequestDispatcher("UsersList.jsp").forward(req,res);
    }

}
