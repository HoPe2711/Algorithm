#include <iostream>

using namespace std;

int a[30001];

void xuli(){
    int n,ok=0,cost=0;
    cin >> n;
    for (int i=1; i<=n; i++) {
        cin >> a[i];
        if (i>1){
            if (a[i]<cost) ok=1;
            if (a[i]>a[i-1]) cost += a[i]-a[i-1];
        }
    }
    if (ok==1) cout << "NO" << endl;
    else cout << "YES" << endl;
}

int main(){
    int test;
    for (cin >> test; test>0; test--) xuli();
    return 0;
}
