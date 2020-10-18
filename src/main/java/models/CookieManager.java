package models;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

    //Check of cookie existence
    public boolean isSet(Cookie[] cookies) {
        for (Cookie cook: cookies) {
            if (cook.getName().equals("Fname")){
                return true;
            }
        }
        return false;
    }

    //Logout component
    public void deleteCookies(Cookie[] cookies, HttpServletResponse response) {
        for (Cookie cook: cookies) {
            if (cook.getName().equals("Fname") || cook.getName().equals("Lname")){
                cook.setMaxAge(0);
                response.addCookie(cook);
            }
        }
    }
}
