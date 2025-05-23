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
import jakarta.servlet.http.HttpSession;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

@WebServlet("/downloadTicket")
public class DownloadTicket extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(DownloadTicket.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
        LOGGER.info("DownloadTicketServlet initialized successfully");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOGGER.info("Received POST request to /downloadTicket");
        HttpSession session = req.getSession();


        String username = getParameterOrSessionAttribute(req, session, "username");
        String eventName = getParameterOrSessionAttribute(req, session, "eventName");
        String seatNumber = getParameterOrSessionAttribute(req, session, "seatNumber", "seat");
        String price = getParameterOrSessionAttribute(req, session, "price");
        String quantity = getParameterOrSessionAttribute(req, session, "quantity");
        String ticketId = getParameterOrSessionAttribute(req, session, "ticketId", "ticket");

        String bookingTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());


        if (username == null || eventName == null || seatNumber == null || price == null || quantity == null) {
            LOGGER.warning("Missing required parameters: username=" + username + ", eventName=" + eventName +
                    ", seatNumber=" + seatNumber + ", price=" + price + ", quantity=" + quantity);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required booking information. Please book a ticket first.");
            return;
        }


        double totalPrice;
        int ticketQuantity;
        try {
            totalPrice = Double.parseDouble(price);
            ticketQuantity = Integer.parseInt(quantity);

            if (totalPrice < 0 || ticketQuantity < 1) {
                throw new NumberFormatException("Invalid values");
            }
        } catch (NumberFormatException e) {
            LOGGER.warning("Invalid price or quantity format: price=" + price + ", quantity=" + quantity);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid price or quantity format.");
            return;
        }


        String qrText = String.format("Ticket ID: %s | Event: %s | Seats: %s | Name: %s | Quantity: %d | Total Price: $%.2f",
                (ticketId != null ? ticketId : "N/A"), eventName, seatNumber, username, ticketQuantity, totalPrice);

        ByteArrayOutputStream qrOut = new ByteArrayOutputStream();
        try {
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(qrText, BarcodeFormat.QR_CODE, 200, 200);
            BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix);
            ImageIO.write(qrImage, "png", qrOut);
        } catch (WriterException e) {
            LOGGER.severe("QR code generation failed: " + e.getMessage());
            throw new ServletException("QR code generation failed", e);
        }


        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "attachment; filename=ticket_" +
                (ticketId != null ? ticketId : System.currentTimeMillis()) + ".pdf");

        try {
            Document doc = new Document(PageSize.A4, 36, 36, 36, 36);
            PdfWriter writer = PdfWriter.getInstance(doc, resp.getOutputStream());
            doc.open();


            addBackgroundImage(doc, writer);


            addLogo(doc);

            // Add title
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 24, BaseColor.DARK_GRAY);
            Paragraph title = new Paragraph("EVENT TICKET", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(20f);
            doc.add(title);


            if (ticketId != null) {
                Font ticketIdFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.GRAY);
                Paragraph ticketIdPara = new Paragraph("Ticket ID: " + ticketId, ticketIdFont);
                ticketIdPara.setAlignment(Element.ALIGN_CENTER);
                ticketIdPara.setSpacingAfter(20f);
                doc.add(ticketIdPara);
            }


            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(90);
            table.setSpacingBefore(20f);
            table.setSpacingAfter(20f);


            float[] columnWidths = {1f, 2f};
            table.setWidths(columnWidths);


            addTableCell(table, "Customer Name:", username);
            addTableCell(table, "Event:", eventName);
            addTableCell(table, "Seat(s):", seatNumber);
            addTableCell(table, "Quantity:", String.valueOf(ticketQuantity));
            addTableCell(table, "Total Price:", String.format("$%.2f", totalPrice));
            addTableCell(table, "Booking Date:", bookingTime);

            doc.add(table);


            Image qrItextImage = Image.getInstance(qrOut.toByteArray());
            qrItextImage.setAlignment(Element.ALIGN_CENTER);
            qrItextImage.scalePercent(60);
            doc.add(qrItextImage);


            Font footerFont = FontFactory.getFont(FontFactory.HELVETICA, 10, BaseColor.GRAY);
            Paragraph footer = new Paragraph("Please present this ticket at the venue entrance. " +
                    "Scan the QR code for quick verification.", footerFont);
            footer.setAlignment(Element.ALIGN_CENTER);
            footer.setSpacingBefore(20f);
            doc.add(footer);

            doc.close();
            LOGGER.info("PDF ticket generated successfully for username=" + username +
                    ", event=" + eventName + ", ticketId=" + ticketId);

        } catch (DocumentException e) {
            LOGGER.severe("PDF generation failed: " + e.getMessage());
            throw new IOException("PDF generation failed: " + e.getMessage());
        }


    }


    private String getParameterOrSessionAttribute(HttpServletRequest req, HttpSession session,
                                                  String paramName, String sessionKey) {
        String value = req.getParameter(paramName);
        if (value == null) {
            value = (String) session.getAttribute(sessionKey);
        }
        return value;
    }


    private String getParameterOrSessionAttribute(HttpServletRequest req, HttpSession session, String name) {
        return getParameterOrSessionAttribute(req, session, name, name);
    }


    private void addBackgroundImage(Document doc, PdfWriter writer) {
        try {
            String bgPath = getServletContext().getRealPath("/images/ticket-background.jpg");
            if (bgPath != null) {
                Image background = Image.getInstance(bgPath);
                float width = PageSize.A4.getWidth();
                float height = PageSize.A4.getHeight();
                background.scaleToFit(width, height);
                background.setAbsolutePosition(0, 0);

                PdfContentByte canvas = writer.getDirectContentUnder();
                canvas.saveState();
                PdfGState state = new PdfGState();
                state.setFillOpacity(0.1f); // More subtle background
                canvas.setGState(state);
                canvas.addImage(background);
                canvas.restoreState();
            }
        } catch (Exception e) {
            LOGGER.warning("Background image not found or could not be loaded: " + e.getMessage());
        }
    }


    private void addLogo(Document doc) {
        try {
            String logoPath = getServletContext().getRealPath("/images/logo.png");
            if (logoPath != null) {
                Image logo = Image.getInstance(logoPath);
                logo.scaleToFit(80, 80);
                logo.setAlignment(Element.ALIGN_CENTER);
                doc.add(logo);
                doc.add(new Paragraph(" ")); // Add space after logo
            }
        } catch (Exception e) {
            LOGGER.warning("Logo image not found or could not be loaded: " + e.getMessage());
        }
    }


    private void addTableCell(PdfPTable table, String label, String value) {
        Font labelFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.DARK_GRAY);
        Font valueFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);

        com.itextpdf.text.pdf.PdfPCell labelCell = new com.itextpdf.text.pdf.PdfPCell(new Phrase(label, labelFont));
        labelCell.setBorder(Rectangle.NO_BORDER);
        labelCell.setPadding(8f);
        labelCell.setBackgroundColor(new BaseColor(245, 245, 245));

        com.itextpdf.text.pdf.PdfPCell valueCell = new com.itextpdf.text.pdf.PdfPCell(new Phrase(value, valueFont));
        valueCell.setBorder(Rectangle.NO_BORDER);
        valueCell.setPadding(8f);

        table.addCell(labelCell);
        table.addCell(valueCell);
    }
}