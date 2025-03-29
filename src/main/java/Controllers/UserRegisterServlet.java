package Controllers;

import Services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Models.User;

import java.io.IOException;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        String regex = "^(?=.*[A-Z])(?=.*\\d).+$";

        if(!email.contains("@")){
            request.setAttribute("error","Invalid email");
            doGet(request,response);
            return;
        }else if(password.length() < 6){
            request.setAttribute("error","Password should be at least 6 characters");
            doGet(request,response);
            return;
        }else if(!password.matches(regex)){
            request.setAttribute("error","Password must contain at least one uppercase letter and one number.");
            doGet(request,response);
            return;
        }

        if(UserService.isUserExist(email)){
            request.setAttribute("error","Email already exist");
            doGet(request,response);
        }else if (email.contains("@") && password.length() >= 6 && password.matches(regex)) {
            userService.saveUser(username, password, email);
            response.sendRedirect("login.jsp");
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request,response);
    }
}

