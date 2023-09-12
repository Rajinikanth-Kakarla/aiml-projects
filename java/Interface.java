public class Interface implements Animal{
public void eat(){
    System.out.println("animal eats banana");
}
public void evolve(){
    System.out.println("animal evolved to man");
}
public static void main(String args[]){
    Interface ape=new Interface();
    ape.eat();
    ape.evolve();
}
}