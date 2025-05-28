package com.event.model;

import com.event.Service.Booking;
import com.event.Service.Node;

public class BookingQueue {
    private Node front, rear;

    public BookingQueue() {
        this.front = this.rear = null;
    }

    public void enqueue(Booking booking) {
        Node newNode = new Node(booking);
        if (rear == null) {
            front = rear = newNode;
            return;
        }
        rear.next = newNode;
        rear = newNode;
    }

    public Booking dequeue() {
        if (front == null) return null;
        Booking booking = front.data;
        front = front.next;
        if (front == null) rear = null;
        return booking;
    }

    public Node getFront() {
        return front;
    }

    public boolean isEmpty() {
        return front == null;
    }
}