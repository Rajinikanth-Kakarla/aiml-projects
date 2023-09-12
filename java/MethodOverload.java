/*
 * If a class has multiple methods having same name but different in parameters, it is known as Method Overloading
 */
public class MethodOverload {
    static int add(int a, int b){
        return a+b;}
    static int add(int a, int b, int c){
        return a+b+c;}
    public static void main(String args[]){
        System.out.println(add(4,2));
        System.out.println(add(5,6,7));
    }
}
