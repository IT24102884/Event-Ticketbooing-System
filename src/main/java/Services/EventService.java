package Services;

import models.Event;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EventService {

    //file path
    public static final String filePath = "C:\\Users\\banum\\Desktop\\Event-Ticketbooing-System\\Event-Management\\src\\main\\resources\\data\\event.txt";

    //create event id
    public static String createEventID(){
        SimpleDateFormat sdf = new SimpleDateFormat("dHHmmss");
        return "P"+sdf.format(new Date());
    }

    //add new events to the file
    public static boolean addNewEvent(Event event) {
        try(BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(filePath,true))) {
            bufferedWriter.write(event.toString());
            bufferedWriter.newLine();
            return true;
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return false;
    }

    //display all events
    public static List<Event> displayAllEvents() {
        List<Event> events = new ArrayList<>();
        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))){
            String line;
            while((line = bufferedReader.readLine()) != null) {
                String[] eventData = line.split("//");
                if (eventData.length == 10) {
                    Event event = new Event(
                            eventData[0],
                            eventData[1],
                            eventData[2],
                            eventData[3],
                            eventData[4],
                            eventData[5],
                            eventData[6],
                            Integer.parseInt(eventData[7]),
                            eventData[8],
                            Double.parseDouble(eventData[9]));
                    events.add(event);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return events;
    }

    // get event details by id
    public static Event getProductById(String eventId) {
        List<Event> events = displayAllEvents();
        for (Event event : events) {
            if (event.getId().equals(eventId)) {
                return event;
            }
        }
        return null;
    }

    // update a select product
    public static void updateEvent(Event updatedEvent) {
        List<Event> events = displayAllEvents();
        try(PrintWriter writer = new PrintWriter(new FileWriter(filePath,false))) {
            for(Event event : events){
                if(event.getId().equals(updatedEvent.getId())){
                    writer.println(updatedEvent);
                }else{
                    writer.println(event);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
    }

    //delete a select product
    public static void deleteEvent(String eventId) {
        List<Event> events = displayAllEvents();
        try(PrintWriter writer = new PrintWriter(new FileWriter(filePath,false))) {
            for(Event event : events){
                if(!event.getId().equals(eventId)){
                    writer.println(event);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
    }
}
