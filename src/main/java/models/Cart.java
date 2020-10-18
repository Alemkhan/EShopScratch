package models;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class Cart extends Product implements Payable{

    private ArrayList<Product> productList;

    public Cart() {
        this.productList = new ArrayList<>();
    }

    public void addProduct(Product product) {
        productList.add(product);
    }

    public ArrayList<Product> getProductList() {
        return productList;
    }

    public void setProductList(ArrayList<Product> productList) {
        this.productList = productList;
    }

    @Override
    public int showPayment() {
        return productList.stream().mapToInt(x -> (int) x.getPrice()).sum();
    }
}
