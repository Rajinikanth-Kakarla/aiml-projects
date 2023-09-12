class fib1{
    /*
     * recursive --> r(n-1)+r(n-2)
     * non recursive --> a=b; b=c; c=a+b
     */
    int a,b,c;
    void nonrecursive(int n){
        a=0;
        b=1;
        c=a+b;
        System.out.println(a+" "+b);
        while(c<=n){
            System.out.println(c);
            a=b;
            b=c;
            c=a+b;
        }
    }
    int recursive(int n){
        if(n==0)
            return 0;
        if(n==1)
            return 1;
        else
            return recursive(n-1)+recursive(n-2);
    }
}
class fib {
    public static void main(String args[]){
        fib1 f = new fib1();
        int n = 10;
        f.nonrecursive(n);
        for(int i=0;i<=n;i++){
            System.out.println(f.recursive(i));
        }
    }    
}
