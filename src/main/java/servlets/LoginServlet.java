package servlets;

import models.FileManager;
import models.PasswordValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Field;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    static String ROOT_DIRECTORY;

    public void init() throws ServletException {
        super.init();
        ROOT_DIRECTORY = getServletContext().getInitParameter("root");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //File creation
        File file = new File(ROOT_DIRECTORY);
        FileManager fm = new FileManager(file);
        fm.checkAndCreateFileIfDNE();
        fm.readOrWriteInTxt();

        //Validation
        String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        PasswordValidator pv = new PasswordValidator();
        if(pv.validateLoginForm(login, pass).equals("success")) {
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
