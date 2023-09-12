public class Palindrome {
    /*
     * string palindrome --> missicissim
     */
    public static void main(String args[]){
        String s= args[0];
        String s1 = " ";
        int len,j;
        len=s.length();
        for(j=len-1;j>=0;j--){
            s1=s1+s.charAt(j);
        }
        if(s.equals(s1)){
            System.out.println("palindrome");
        }
        else{
            System.out.println("not");
        }
    }
}
