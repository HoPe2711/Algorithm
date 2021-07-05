#include <iostream>

using namespace std;

int f[101][1001],n;
int a[100],tmp;


int cal(int i, int x){
    if (x==0) return 1;
    if (i>tmp || x<0) return 0;
     if (f[i][x]!=0) return f[i][x];
    f[i][x]=cal(i+1,x)+cal(i+1,x-a[i]);
    return f[i][x];
}

int main(){
    int x;
    cin >> x >> n;
    for (int i=1; i<=x; i++){
        a[i]=1;
        for (int j=1; j<=n; j++) a[i]=a[i]*i;
        if (a[i]>=x) {
            tmp=i;
            break;
        }
    }
    cout << tmp;
    cout << cal(1,x);
    return 0;
}
