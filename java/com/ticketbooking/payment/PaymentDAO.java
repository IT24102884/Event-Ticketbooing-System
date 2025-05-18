package com.ticketbooking.payment;

import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.io.File;

public class PaymentDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/payments.txt";
    private static final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();

    // Create a new payment record
    public void createPayment(Payment payment) throws IOException {
        lock.writeLock().lock();
        BufferedWriter writer = null;
        try {
            // Create parent directories if they don't exist
            File file = new File(FILE_PATH);
            if (!file.exists()) {
                file.createNewFile();
            }
            
            writer = new BufferedWriter(new FileWriter(FILE_PATH, true));
            writer.write(payment.toString());
            writer.newLine();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            lock.writeLock().unlock();
        }
    }

    // Read all payments
    public List<Payment> getAllPayments() throws IOException {
        List<Payment> payments = new ArrayList<>();
        lock.readLock().lock();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                payments.add(parsePayment(line));
            }
        } finally {
            lock.readLock().unlock();
        }
        return payments;
    }

    // Get payments by user ID
    public List<Payment> getPaymentsByUserId(String userId) throws IOException {
        List<Payment> userPayments = new ArrayList<>();
        lock.readLock().lock();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                Payment payment = parsePayment(line);
                if (payment != null && payment.getUserId().toLowerCase().contains(userId.toLowerCase())) {
                    userPayments.add(payment);
                }
            }
        } finally {
            lock.readLock().unlock();
        }
        return userPayments;
    }

    // Update payment method
    public boolean updatePayment(String paymentId, String newPaymentMethod) throws IOException {
        List<Payment> payments = getAllPayments();
        boolean updated = false;
        
        lock.writeLock().lock();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Payment payment : payments) {
                if (payment.getPaymentId().equals(paymentId)) {
                    payment.setPaymentMethod(newPaymentMethod);
                    updated = true;
                }
                writer.write(payment.toString());
                writer.newLine();
            }
        } finally {
            lock.writeLock().unlock();
        }
        return updated;
    }

    // Delete payment
    public boolean deletePayment(String paymentId) throws IOException {
        List<Payment> payments = getAllPayments();
        boolean deleted = false;
        
        lock.writeLock().lock();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Payment payment : payments) {
                if (!payment.getPaymentId().equals(paymentId)) {
                    writer.write(payment.toString());
                    writer.newLine();
                } else {
                    deleted = true;
                }
            }
        } finally {
            lock.writeLock().unlock();
        }
        return deleted;
    }

    private Payment parsePayment(String line) {
        try {
            String[] parts = line.split("\\|");
            return new Payment(
                parts[0],                           // paymentId
                Double.parseDouble(parts[1]),       // amount
                parts[2],                           // paymentMethod
                parts[3],                           // userId
                LocalDateTime.parse(parts[4].trim().replace(' ', 'T')),  // paymentDate
                parts[5]                            // status
            );
        } catch (Exception e) {
            System.out.println("Error parsing payment line: " + line);
            e.printStackTrace();
            return null;
        }
    }
}
