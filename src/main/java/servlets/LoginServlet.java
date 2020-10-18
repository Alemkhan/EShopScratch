package servlets;

import models.FileManager;
import models.PasswordValidator;
import models.User;
import models.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

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

            User loginUser = new User(login, pass);
            UserManager userLogger = new UserManager(loginUser);

            if ((loginUser = userLogger.loginUser(file, loginUser.getLogin(), loginUser.getPassword(), userLogger.countLines(file))) != null) {
                System.out.println("USER LOGGED IN");

                //Setting Cookie for further exploitation
                Cookie cookieFName = new Cookie("Fname", loginUser.getFname());
                Cookie cookieLName = new Cookie("Lname", loginUser.getLname());

                //Setting cookies lifetime
                cookieFName.setMaxAge(60*30);
                cookieLName.setMaxAge(60*30);

                response.addCookie(cookieFName);
                response.addCookie(cookieLName);

                response.sendRedirect("JSPages/main-page.jsp");

            } else {

                response.sendRedirect("JSPages/index.jsp?error=2");

            }

        } else {

            response.sendRedirect("JSPages/index.jsp?error=1");

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
