package models;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

    public boolean isSet(Cookie[] cookies) {
        for (Cookie cook: cookies) {
            if (cook.getName().equals("Fname")){
                return true;
            }
        }
        return false;
    }

    public void deleteCookies(Cookie[] cookies, HttpServletResponse response) {
        for (Cookie cook: cookies) {
            if (cook.getName().equals("Fname") || cook.getName().equals("Lname")){
                cook.setMaxAge(0);
                response.addCookie(cook);
            }
        }
    }
}
