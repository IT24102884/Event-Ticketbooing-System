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

@WebServlet("/update")
public class UserAccEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("user") != null) {

            User oldUser = (User) session.getAttribute("user");

            String newUserName = request.getParameter("uname");
            String newPassword = request.getParameter("pwd");

            boolean isUpdated = UserService.updateUser(oldUser.getEmail(), newUserName, newPassword,oldUser.getRole());

            if (isUpdated) {
                User updateUser = new User(newUserName, newPassword, oldUser.getEmail(), oldUser.getRole());
                session.setAttribute("user", updateUser);
                response.sendRedirect("index.jsp?success=Account updated successfully!");
            }else{
                request.setAttribute("error", "Failed to update account.");
                doGet(request, response);
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("edit-account").forward(request, response);
    }
}

