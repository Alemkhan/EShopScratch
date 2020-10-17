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

    public void registerUser(File file, int linesToSkip) throws IOException {
        RandomAccessFile newUser = new RandomAccessFile(file+"\\logins.txt", "rw");
        for (int i = 0; i < linesToSkip; i++) {
            newUser.readLine();
        }
        newUser.writeBytes("Login:"+user.getLogin()+"\r\n");
        newUser.writeBytes("Password:"+user.getPassword()+"\r\n");
        newUser.writeBytes("First Name:"+user.getFname()+"\r\n");
        newUser.writeBytes("Last Name:"+user.getLname());
        newUser.writeBytes("\r\n");
        newUser.writeBytes("\r\n");
        newUser.close();
    }

    public boolean loginUser(File file, String login, String password, int lines) {
        try {
            RandomAccessFile loginUser = new RandomAccessFile(file+"\\logins.txt", "rw");
            for (int i = 0; i < lines-2; i+=4) {
                String userLogin = loginUser.readLine().substring(6);
                String userPassword = loginUser.readLine().substring(9);
                if (login.equals(userLogin) && password.equals(userPassword)) {
                    System.out.println("OK");
                    loginUser.close();
                    return true;
                } else if (login.equals(userLogin) && !password.equals(userPassword)) {
                    System.out.println("GG");
                    loginUser.close();
                    return false;
                } else {
                    for (int j = 0; j < 3; j++) {
                        loginUser.readLine();
                    }
                    System.out.println("NOT OK");
                }
            }
            loginUser.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int countLines(File file) {
        try {
            int ln = 1;
            RandomAccessFile check = new RandomAccessFile(file+"\\logins.txt", "rw");
            for (int i = 0; check.readLine() != null; i++) {
                ln++;
            }
            System.out.println("Lines counted" + ln);
            check.close();
            return ln;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
