class A{
    String name;
    int id;
    A(){
        System.out.println("default");
    }
    A(int x, String y){
        id=x;
        name=y;
        System.out.println("parameterized");
    }
}
public class ConstructorOverload {
    public static void main(String[] args){
        A a = new A();
        System.out.println(a.id+" "+a.name);
        A a1 = new A(624,"rajinikanth");
        System.out.println(a1.id+" "+a1.name);
    }
}
