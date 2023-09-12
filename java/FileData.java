import java.io.*;
public class FileData {
    public static void main(String args[]) {
        String file=args[0];
        File f=new File(file);
        System.out.println(f.getName());
        System.out.println(f.getParent());
        System.out.println(f.getPath());
        System.out.println(f.getAbsolutePath());
        System.out.println(f.exists());
        if(f.exists()){
            System.out.println(f.length());
            System.out.println(f.canRead());
            System.out.println(f.canWrite());
            System.out.println(f.isDirectory());
            System.out.println(f.canExecute());
        }

    }
}
