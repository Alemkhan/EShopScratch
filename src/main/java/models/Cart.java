package models;

import java.util.ArrayList;

public class Cart extends Product {

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
}
