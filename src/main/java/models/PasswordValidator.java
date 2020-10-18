package models;

import javax.servlet.http.HttpServletRequest;

public class PasswordValidator {

    //Instead of JS validation these methods were implemented

    public String validateLoginForm(String login, String password) {
        if (!login.equals("") && !password.equals("")) {
            return "success";
        } else
            return "Fill the fields";
    }

    public String validateRegisterForm(String login, String fname, String lname, String password) {
        if (!login.equals("") && !password.equals("") && !fname.equals("") && !lname.equals("")) {
            return "success";
        } else {
            return "Fill the fields";
        }
    }

    public String showErrorMessage(String error) {
        if (error == null) {
            return "";
        } else if (error.equals("2")) {
            return "The password or login is incorrect";
        } else if (error.equals("1")){
            return "There is no enough data to login";
        }
        return "";
    }
}
