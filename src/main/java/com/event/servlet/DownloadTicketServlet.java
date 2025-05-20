package com.event.servlet;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfGState;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/downloadTicket")
public class DownloadTicketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String eventName = req.getParameter("eventName");
        String seatNumber = req.getParameter("seatNumber");
        String price = req.getParameter("price");
        String quantity = req.getParameter("quantity");
        String bookingTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        String qrText = "Event: " + eventName + " Seats: " + seatNumber + " Name: " + username +
                " Quantity: " + quantity + " Total Price: $" + price;
        ByteArrayOutputStream qrOut = new ByteArrayOutputStream();
        try {
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(qrText, BarcodeFormat.QR_CODE, 150, 150);
            BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix);
            ImageIO.write(qrImage, "png", qrOut);
        } catch (WriterException e) {
            throw new ServletException("QR code generation failed", e);
        }
        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "attachment; filename=ticket.pdf");
        try {
            Document doc = new Document();
            PdfWriter writer = PdfWriter.getInstance(doc, resp.getOutputStream());
            doc.open();
            
            // Add background
            String bgPath = getServletContext().getRealPath("/images/ticket-background.jpg");
            Image background = Image.getInstance(bgPath);
            
            // Scale background to fit page
            float width = PageSize.A4.getWidth();
            float height = PageSize.A4.getHeight();
            background.scaleToFit(width, height);
            
            // Position background
            background.setAbsolutePosition(0, 0);
            
            // Set background opacity
            PdfContentByte canvas = writer.getDirectContentUnder();
            canvas.saveState();
            PdfGState state = new PdfGState();
            state.setFillOpacity(0.3f); // Adjust opacity (0.0-1.0)
            canvas.setGState(state);
            canvas.addImage(background);
            canvas.restoreState();

            try {
                String logoPath = getServletContext().getRealPath("/images/logo.png");
                Image logo = Image.getInstance(logoPath);
                logo.scaleToFit(100, 100);
                doc.add(logo);
            } catch (Exception e) {
                // Ignore if logo is missing
            }
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20);
            Paragraph title = new Paragraph("Event Ticket", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            doc.add(title);
            doc.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(90);
            table.setSpacingBefore(10f);

            table.addCell("Name:");
            table.addCell(username);
            table.addCell("Event:");
            table.addCell(eventName);
            table.addCell("Seats:");
            table.addCell(seatNumber);
            table.addCell("Quantity:");
            table.addCell(quantity);
            table.addCell("Total Price:");
            table.addCell("$" + price);
            table.addCell("Booked At:");
            table.addCell(bookingTime);

            doc.add(table);

            Image qrItextImage = Image.getInstance(qrOut.toByteArray());
            qrItextImage.setAlignment(Element.ALIGN_CENTER);
            qrItextImage.scalePercent(80);
            doc.add(Chunk.NEWLINE);
            doc.add(qrItextImage);

            doc.close();
        } catch (DocumentException e) {
            throw new IOException(e.getMessage());
        }
    }
}