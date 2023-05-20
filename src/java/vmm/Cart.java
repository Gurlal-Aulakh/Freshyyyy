
package vmm;


public class Cart {
    public int itemid,price,offerprice,qty,amount;
    public String itemname,photo;
    public Cart(int itemid,int price,int offerprice,int qty,int amount,String itemname,String photo)
    {
        this.itemid=itemid;
        this.price=price;
        this.offerprice=offerprice;
        this.qty=qty;
        this.amount=amount;
        this.itemname=itemname;
        this.photo=photo;
    }
    
}
