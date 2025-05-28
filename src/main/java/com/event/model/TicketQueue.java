package com.event.model;

public class TicketQueue {
    private MyQueue<Ticket> queue = new MyLinkedQueue<>();

    public void addTicket(Ticket ticket) {
        queue.offer(ticket);
    }

    public Ticket processNextTicket() {
        return queue.poll();
    }

    public boolean isEmpty() {
        return queue.isEmpty();
    }
}

