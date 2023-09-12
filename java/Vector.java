import java.util.Enumeration;

public class Vector {
    public static void main(String args[]){
        Vector<String> v=new Vector<String>();
        v.add("rajinikanth");
        v.add("anu");
        v.add("ramya");
        Enumeration e;
        while(e.hasMoreElements()){
            System.out.println(e.nextElement());
        }
        
        
    }
}
