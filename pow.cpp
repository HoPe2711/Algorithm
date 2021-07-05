#include <iostream>

using namespace std;

int base=6971;

long long poww(long long a, long long x){
    if (x==1) return(a%base);
    if (x==0) return(1);
    long long tg;
    tg=poww(a,x/2);
    tg=(tg*tg)%base;
    if (x%2==0) return(tg);
    else return ((tg*a)%base);
}

int main(){
    int t;
    long long res,n,k;
    cin >> t;
    for (int i=1;i<=t;i++) {
        cin >> n >> k;
        res=poww(k-1,n);
        if (n%2==1) res=((res-k+1)%base+base)%base;
        else res=(res+k-1)%base;
        cout << res <<endl;
    }
    return 0;
}
