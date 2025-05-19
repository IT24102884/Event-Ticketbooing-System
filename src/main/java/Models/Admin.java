package Models;

//inherit from the user
public class Admin extends User {

    public Admin(String username, String email, String password, String role) {
        super(username, email, password, role);
    }
}
