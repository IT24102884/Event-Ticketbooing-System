package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.Event;
import Services.EventService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet("/add-event")
public class EventAddServlet extends HttpServlet {

    //upload file path
    private static final String uploadDirectory = "assets/images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get the attributes from the form
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String location = request.getParameter("location");
        int seats = Integer.parseInt(request.getParameter("tickets"));
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        //Get the upload folder path
        String uploadPath = getServletContext().getRealPath("") + File.separator + uploadDirectory;


        //create directory is it doesn't path
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        //Get the upload file
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = uploadPath + File.separator + fileName;

        //save the file
        filePart.write(filePath);

        //create product with image path
        String imagePath = uploadDirectory + "/" + fileName;

        //add attributes to the event object
        String eventId = EventService.createEventID();
        Event event = new Event(eventId,name,date,time,description,location,category,seats,imagePath,price);

        //save the file
        boolean success = EventService.addNewEvent(event);

        //check the success condition and do the tasks
        if (success) {
            response.sendRedirect("add-events.jsp?message=Event+created+successfully");
        }else{
            request.setAttribute("error", "Something went wrong! Please try again.");
            doGet(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //send messages back to the add-product.jsp
        getServletContext().getRequestDispatcher("/add-events.jsp").forward(request, response);
    }
}