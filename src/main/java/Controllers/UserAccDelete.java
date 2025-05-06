package Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Models.User;
import Services.UserService;

import java.io.IOException;

@WebServlet("/delete")
public class UserAccDelete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null  && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            boolean isDeleted = UserService.deleteUser(user.getEmail());
            session.invalidate();

            if (isDeleted) {
                response.sendRedirect("index.jsp");
            }else{
                request.setAttribute("error", "Failed to delete account!");
                doGet(request, response);
            }
        }else {
            response.sendRedirect("login.jsp");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}

