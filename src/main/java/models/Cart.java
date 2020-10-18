package models;

import java.util.ArrayList;
//Cart class that is included in session as a list of products client want to buy
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
