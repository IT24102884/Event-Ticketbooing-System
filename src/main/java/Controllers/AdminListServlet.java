package Controllers;

import Models.User;
import Services.AdminService;
import Services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminsList")
public class AdminListServlet extends HttpServlet {

    AdminService adminService = new AdminService();

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        List<String[]> AdminList = AdminService.getList("admin");
        req.setAttribute("AdminList",AdminList);
        req.getRequestDispatcher("AdminList.jsp").forward(req,res);
    }

}
