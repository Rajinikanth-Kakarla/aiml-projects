import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Array {
    public static void main(String args[]) {
        ArrayList<String> a=new ArrayList<>();
        a.add("rajinikanth");
        a.add("ramya");
        a.add("anuradha");
        Iterator itr=a.iterator();
        while(itr.hasNext()){
            System.out.println(itr.next());
        }
        };
    }
