package Services;

import Models.User;
import jakarta.servlet.http.HttpServlet;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserService extends HttpServlet {
    //file path
    public static final String filePath = "C:\\Users\\MAHEN\\OneDrive\\Desktop\\Event-Ticketbooking\\Data\\user.txt";

    public void saveUser(String username, String password, String email) {
        String role = "user";
        User user = new User(username, email, password, role);
        registerUser(user);
    }
    //register a user
    public static void registerUser(User user) {
        try(FileWriter fileWriter = new FileWriter(filePath,true)) {
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            bufferedWriter.write(user.getUsername()+","+ user.getEmail()+","+ user.getPassword()+","+ user.getRole());
            bufferedWriter.newLine();
            bufferedWriter.close();
        }catch (IOException e){
            e.getMessage();
        }
    }
    //check if there are exists same users
    public static boolean isUserExist(String email){
        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] user = line.split(",");
                if(user.length == 4 && user[1].equals(email)){
                    return true;
                }
            }
        }catch (IOException e){
            e.getMessage();
        }
        return false;
    }
    //login
    public static User loginUser(String username, String password){
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] user = line.split(",");
                if(user[0].equals(username) && user[2].equals(password)){
                    return new User(username, user[1],password,user[3]);
                }
            }
        }catch (IOException e){
            e.getMessage();
        }
        return null;
    }

    //delete user account (user side)
    public static boolean deleteUser(String email){

        List<String> users = new ArrayList<>();
        boolean isDeleted = false;

        try(FileReader fileReader = new FileReader(filePath)) {
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] user = line.split(",");
                if(user[1].equals(email)){
                    isDeleted = true;
                }else{
                    users.add(line);
                }
            }
        }catch (IOException e){
            e.getMessage();
            return false;
        }
        if(isDeleted){
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
                for (String user : users) {
                    writer.write(user);
                    writer.newLine();
                }
                return true;
            } catch (IOException e) {
                e.getMessage();
            }
        }
        return false;
    }

    //update user details (user side)
    public static boolean updateUser(String oldEmail, String newName, String newPassword, String role) {

        List<String> users = new ArrayList<>();
        boolean updated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] user = line.split(",");
                if (user[1].equals(oldEmail)) {
                    users.add(newName + "," + oldEmail + "," + newPassword + "," + role);
                    updated = true;
                } else {
                    users.add(line);
                }
            }
        } catch (IOException e) {
            e.getMessage();
            return false;
        }

        if (updated) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
                for (String user : users) {
                    writer.write(user);
                    writer.newLine();
                }
            } catch (IOException e) {
                e.getMessage();
                return false;
            }
        }
        return updated;
    }
}

