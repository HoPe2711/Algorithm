
long double f(long double a,long double b, long double c, long double x){
    return (a*x*x + b*x + c);
}


long double ternarysearch(long double a,long double b,long double c,double left, double right){
    int n=100;
    for (int i=0;i<n;i++){
        double x1=left + (right - left) / 3.0;
        double x2=right - (right - left) / 3.0;

        if (f(a,b,c,x1)>f(a,b,c,x2)) right=x2;
        else left=x1;
    }
    return f(a,b,c,left);
}
