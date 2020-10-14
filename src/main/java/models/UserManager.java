package models;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

public class UserManager {

    private User user;

    public UserManager(User user) {
        this.user = user;
    }

    public void registerUser(File file) throws IOException {
        RandomAccessFile newUser = new RandomAccessFile(file+"\\logins.txt", "rw");
        newUser.writeBytes("Login:"+user.getLogin()+"\r\n");
        newUser.writeBytes("Password:"+user.getPassword()+"\r\n");
        newUser.writeBytes("First Name:"+user.getFname()+"\r\n");
        newUser.writeBytes("Last Name:"+user.getLname());
        newUser.writeBytes("\r\n");
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
