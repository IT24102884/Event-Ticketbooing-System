package com.event.model;

import java.util.LinkedList;
import java.util.Queue;

public class TicketQueue {
    private Queue<Ticket> queue=new LinkedList<>();

    public void addTicket(Ticket ticket) {
        queue.add(ticket);
    }
    public Ticket processNextTicket(){
        return queue.poll();
    }

    public boolean isEmpty(){
        return queue.isEmpty();
    }
}
