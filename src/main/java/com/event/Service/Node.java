package com.event.Service;

public class Node {
    public Booking data;
    public Node next;

    public Node(Booking data) {
        this.data = data;
        this.next = null;
    }
}
