#include <iostream>
#include <cmath>

using namespace std;

int n;
long long tg;
long long tmp[1000];

long long poww(int x){
    return (long long )x*x*x*x*x;
}

int check(long long x){
    int l,r,mid;
    l=1;
    r=n;
    while (l<=r){
        mid=(l+r)/2;
        if (tmp[mid]==x) return mid;
        else if (tmp[mid]>x) r=mid-1;
        else l=mid+1;
    }
    return 0;
}

int main(){
    int e=0;
    cin >> n;
    for (int i=1; i<=n; i++) tmp[i]=poww(i);
    for (int a=1; a<n; a++)
        for (int b=a+1; b<n; b++)
            for (int c=b+1; c<n; c++)
                for (int d=c+1; d<n; d++){
                        tg=poww(a)+poww(b)+poww(c)+poww(d);
                        e=check(tg);
                        if (e!=0)   cout << a << "^" << 5 << " + "
                                         << b << "^" << 5 << " + "
                                         << c << "^" << 5 << " + "
                                         << d << "^" << 5 << " = "
                                         << e << "^" << 5 << endl;
            }
    return 0;
}
