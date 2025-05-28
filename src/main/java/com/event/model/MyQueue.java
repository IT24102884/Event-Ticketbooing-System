package com.event.model;

public interface MyQueue<T> {
    boolean offer(T item);
    T poll();
    T peek();
    boolean isEmpty();
    int size();
}
