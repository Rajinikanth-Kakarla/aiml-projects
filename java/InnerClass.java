class A{
    int a=10;
    void display(){
        B b = new B();
        b.show();
    }

class B{
    int b=20;
    void show(){
        System.out.println("b value is"+b);
      
        System.out.println("a value is"+a);
    }
}}
public class InnerClass {
    //innerclassMain
    public static void main(String args[]){
        
        A c=new A();
        c.display();
    }
}
