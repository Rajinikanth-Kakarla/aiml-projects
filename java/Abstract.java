abstract class Bank{
    abstract int getRateofIntrest();
}
class SBI extends Bank{
    int getRateofIntrest(){
        return 7;
    }
}
class PNB extends Bank{
    int getRateofIntrest(){
        return 8;
    }
}
public class Abstract {
    public static void main(String args[]){
        Bank b;
        b= new SBI();
        System.out.println(b.getRateofIntrest()+"%");
        b= new PNB();
        System.out.println(b.getRateofIntrest()+"%");
    }
}
