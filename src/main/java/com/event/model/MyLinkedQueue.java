package com.event.model;



    public class MyLinkedQueue<T> implements MyQueue<T> {
        private static class Node<T> {
            T data;
            Node<T> next;
            Node(T data) { this.data = data; }
        }

        private Node<T> front, rear;
        private int size = 0;

        public boolean offer(T item) {
            Node<T> node = new Node<>(item);
            if (rear != null) rear.next = node;
            rear = node;
            if (front == null) front = node;
            size++;
            return true;
        }

        public T poll() {
            if (front == null) return null;
            T data = front.data;
            front = front.next;
            if (front == null) rear = null;
            size--;
            return data;
        }

        public T peek() {
            return (front != null) ? front.data : null;
        }

        public boolean isEmpty() {
            return size == 0;
        }

        public int size() {
            return size;
        }
    }


