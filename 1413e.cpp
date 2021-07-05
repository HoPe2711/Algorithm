#include <iostream>
#include <cmath>

using namespace std;

long long f(long long a,long long b, long long c, long long x){
    return (a*x*x + b*x + c);
}

long long BF(long long a,long long b,long long c,int left,int right){
    long long tmp;
    while (left<=right){
        int mid=(left+right)/2;
        if (f(a,b,c,mid)>f(a,b,c,mid+1)) {
                tmp=f(a,b,c,mid);
                right=mid-1;
        }
        else left=mid+1;
    }
    return tmp;
}

int main(){
    int t;
    long long a,b,c,d;
    long long res;
    scanf("%d",&t);
    for (int test=1;test<=t;test++){
        scanf("%lld%lld%lld%lld",&a,&b,&c,&d);
        long long vt1 = a-b*c;
        if (vt1 > 0) res=-1;
        else {
            int tmp=c/d;
            res=BF(-d*b,-d*b+2*a,2*a,0,tmp)/2;
        }
        cout << res << endl;
    }
    return 0;
}

