package org.example.gotoeventreviwe;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.*;

@WebServlet(name = "ReviewServlet", urlPatterns = {"/review"})
public class ReviewServlet extends HttpServlet {
    private final String FILE_PATH = "C:\\Users\\ASUS\\Desktop\\gotoeventreviwe\\src\\main\\webapp\\reviews.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            deleteReview(request, response);
        } else if ("update".equals(action)) {
            updateReview(request, response);
        } else {
            // Default: Submit a new review
            String name = request.getParameter("name");
            String review = request.getParameter("review");
            String rating = request.getParameter("rating");
            String id = UUID.randomUUID().toString();

            try (FileWriter fw = new FileWriter(FILE_PATH, true)) {
                fw.write(id + "|" + name + "|" + review + "|" + rating + "\n");
            }
        }

        response.sendRedirect(request.getContextPath() + "/review");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String[]> reviews = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (file.exists()) {
            try (BufferedReader br = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = br.readLine()) != null) {
                    String[] parts = line.split("\\|");
                    if (parts.length == 4) {
                        reviews.add(parts);
                    }
                }
            }
        }

        // Sort by rating descending
        reviews.sort((a, b) -> Integer.parseInt(b[3]) - Integer.parseInt(a[3]));

        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private void deleteReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        File file = new File(FILE_PATH);
        List<String> updatedLines = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.startsWith(id + "|")) {
                    updatedLines.add(line);
                }
            }
        }

        try (FileWriter fw = new FileWriter(file, false)) {
            for (String l : updatedLines) {
                fw.write(l + "\n");
            }
        }
    }

    private void updateReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String review = request.getParameter("review");
        String rating = request.getParameter("rating");

        File file = new File(FILE_PATH);
        List<String> updatedLines = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.startsWith(id + "|")) {
                    updatedLines.add(id + "|" + name + "|" + review + "|" + rating);
                } else {
                    updatedLines.add(line);
                }
            }
        }

        try (FileWriter fw = new FileWriter(file, false)) {
            for (String l : updatedLines) {
                fw.write(l + "\n");
            }
        }
    }
}
