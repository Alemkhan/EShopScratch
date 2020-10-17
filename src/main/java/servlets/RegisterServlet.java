package servlets;

import models.FileManager;
import models.PasswordValidator;
import models.User;
import models.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    static String ROOT_DIRECTORY;

    public void init() throws ServletException {
        super.init();
        ROOT_DIRECTORY = getServletContext().getInitParameter("root");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File file = new File(ROOT_DIRECTORY);
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String login = request.getParameter("login");
        String password = request.getParameter("pass");
        PasswordValidator pv = new PasswordValidator();
        if (pv.validateRegisterForm(login, fname, lname, password).equals("success")) {
            User myUser = new User(fname, lname, login, password);
            UserManager um = new UserManager(myUser);
            FileManager fm = new FileManager(file);
            try {
                int lines = um.countLines(file);
                um.registerUser(file, lines);
            } catch (FileNotFoundException e) {
                fm.checkAndCreateFileIfDNE();
                fm.readOrWriteInTxt();
                um.registerUser(file,um.countLines(file));
            } finally {
                response.sendRedirect("JSPages/index.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
