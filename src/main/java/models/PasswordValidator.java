package models;

public class PasswordValidator {

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
}
