import java.util.ArrayList;

public class multicatch {
    public static void main(String args[]){
    try {
        ArrayList<String> b=new ArrayList<String>();
        int a=10/0;
    } catch (ArithmeticException e) {
        System.out.println("arithmetic");
        System.out.println(e);
    }
    catch (ArrayIndexOutOfBoundsException e) {
        System.out.println("arrayindexoutofbound");
        System.out.println(e);
    }
     catch (Exception e) {
        System.out.println("execption");
        System.out.println(e);
    }
}
}