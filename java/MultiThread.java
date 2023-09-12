//thread 1
class thread1 extends Thread{
    public void run(){
        //System.out.println("thread entered");
        //loop
        for(int i=0;i<=5;i++){
            System.out.println("[threading1]"+i);
        }
    }
}
//thread 2
class thread2 extends Thread{
    public void run(){
        //System.out.println("thread entered");
        //loop
        for(int i=0;i<=5;i++){
            System.out.println("[threading2]"+i);
        }
    }
}
public class MultiThread {
    public static void main(String args[]) {
        thread1 x=new thread1();
        thread2 y=new thread2();
        x.start();
        y.start();
        for(int i=0;i<=5;i++){
            System.out.println("[main threading]"+i);
        }
    }
}
