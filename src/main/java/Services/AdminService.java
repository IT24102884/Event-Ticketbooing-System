package Services;

import Models.Admin;
import jakarta.servlet.http.HttpServlet;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class AdminService extends HttpServlet {

    public static final String filepath = "C:\\Users\\MAHEN\\OneDrive\\Desktop\\Admin-Panel\\Data\\user.txt";

    public void saveAdmin(String username, String password, String email) {
        String role = "admin";
        Admin admin = new Admin(username, email, password, role);
        registerAdmin(admin);
    }

    public void registerAdmin(Admin admin) {
        try (FileWriter fileWriter = new FileWriter(filepath, true)) {
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            bufferedWriter.write(admin.getUsername() + "," + admin.getEmail() + "," + admin.getPassword() + "," + admin.getRole());
            bufferedWriter.newLine();
            bufferedWriter.close();
        } catch (IOException e) {
            e.getMessage();
        }
    }

    public boolean isAdminExist(String email) {
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(filepath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] admin = line.split(",");
                if (admin.length == 4 && admin[1].equals(email)) {
                    return true;
                }
            }
        } catch (IOException e) {
            System.out.println("there is no admin with this email");
        }
        return false;
    }

    public void EditAdmin(String currentEmail, String username, String password, String role) throws IOException {
        List<String> users = new ArrayList<>();
        boolean infoUpdated = false;

        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(filepath))) {
            String userInfo;
            while ((userInfo = bufferedReader.readLine()) != null) {
                String[] usersInfo = userInfo.split(",");
                if (usersInfo.length > 1 && usersInfo[1].equals(currentEmail)) {
                    users.add(username + "," + currentEmail + "," + password + "," + role);
                    infoUpdated = true;
                } else {
                    users.add(userInfo);
                }
            }
        }

        if (infoUpdated) {
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(filepath))) {
                for (String user : users) {
                    bw.write(user);
                    bw.newLine();
                }
            }
        }
    }

    public static List<String[]> getList(String role) {
        List<String[]> datas = new ArrayList<>();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(filepath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 4 && data[3].equals(role)) {
                    datas.add(data);
                }
            }
        } catch (IOException e) {
            e.getMessage();
        }
        return datas;
    }

    public void deleteAdmin(String email) {
        List<String> AdminsList = new ArrayList<>();
        List<String[]> NewList = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(filepath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if(data.length == 4 && !data[1].equals(email)) {
                    AdminsList.add(line);
                }
            }
        } catch (IOException e) {
            e.getMessage();
        }

        try(BufferedWriter bw = new BufferedWriter(new FileWriter(filepath))){
            for (String Admin : AdminsList) {
                bw.write(Admin);
                bw.newLine();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

}

