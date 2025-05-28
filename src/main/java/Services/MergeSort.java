package Services;

import models.Event;

import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter; // Import DateTimeFormatter for parsing date strings

public class MergeSort {

    public static List<Event> sortByDate(List<Event> events) {
        return mergeSort(events);
    }

    private static List<Event> mergeSort(List<Event> events) {
        if (events.size() <= 1) {
            return events;
        }

        int mid = events.size() / 2;
        List<Event> left = new ArrayList<>(events.subList(0, mid));
        List<Event> right = new ArrayList<>(events.subList(mid, events.size()));

        left = mergeSort(left);
        right = mergeSort(right);

        return merge(left, right);
    }

    private static List<Event> merge(List<Event> left, List<Event> right) {
        List<Event> result = new ArrayList<>();
        int i = 0, j = 0;


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // <--- CHANGE THIS IF YOUR FORMAT IS DIFFERENT!

        while (i < left.size() && j < right.size()) {
            Event leftEvent = left.get(i);
            Event rightEvent = right.get(j);

            // Parse the date strings into LocalDate objects using the defined formatter
            LocalDate leftDate = LocalDate.parse(leftEvent.getDate(), formatter);
            LocalDate rightDate = LocalDate.parse(rightEvent.getDate(), formatter);

            // Compare LocalDate objects, which correctly handles chronological order
            // This sorts in ASCENDING order (oldest date first)
            if (leftDate.compareTo(rightDate) <= 0) {
                result.add(leftEvent);
                i++;
            } else {
                result.add(rightEvent);
                j++;
            }


        }

        // Add any remaining elements from the left list
        result.addAll(left.subList(i, left.size()));
        // Add any remaining elements from the right list
        result.addAll(right.subList(j, right.size()));
        return result;
    }
}