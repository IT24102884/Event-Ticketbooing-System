package models;

public class Event {
   private String id;
   private String name;
   private String date;
   private String time;
   private String description;
   private String location;
   private String category;
   private int totalTickets;
   private String imagePath;
   private double price;

   public Event(String id, String name, String date, String time, String description, String location, String category, int seats, String imagePath, double price) {
       this.id = id;
       this.name = name;
       this.date = date;
       this.time = time;
       this.description = description;
       this.location = location;
       this.category = category;
       this.totalTickets = seats;
       this.imagePath = imagePath;
       this.price = price;
   }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public String getDescription() {
        return description;
    }

    public String getLocation() {
        return location;
    }

    public String getCategory() {
        return category;
    }

    public int getTotalTickets() {
        return totalTickets;
    }

    public String getImagePath() {
       return imagePath;
    }

    public double getPrice() {
       return price;
    }

    @Override
    public String toString() {
        return id + "//" + name + "//" + date + "//" + time + "//" + description + "//" +
                location + "//" + category + "//" + totalTickets + "//" + imagePath + "//" + price;
    }

}
