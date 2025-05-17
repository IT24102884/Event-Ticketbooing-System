package com.event.model;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class Ticket {

    private String ticketId;
    private String userId;
    private String eventId;
    private String seatNumber;
    private String status;

    //parameterise constructor


    public Ticket(String ticketId, String userId, String eventId, String seatNumber, String status) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.eventId = eventId;
        this.seatNumber = seatNumber;
        this.status = status;
    }

    public void saveToFile() throws IOException {
       try(BufferedWriter bw = new BufferedWriter(new FileWriter("tickets.txt"))){
           bw.write(ticketId+","+userId+","+eventId+","+seatNumber+","+status);
           bw.newLine();
       }catch(IOException e){
           e.printStackTrace();
       }
    }

}
