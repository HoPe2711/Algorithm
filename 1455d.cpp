#include <bits/stdc++.h>

using namespace std;

void solve(){
    int res=0,tmp,n,x,a[1000],tg;
    cin >> n >> x;
    a[0]=0; a[n+1]=1000;
    tmp=n+1;
    for (int i=1; i<=n; i++) cin >> a[i];
    for (int i=1; i<=n; i++){
        if (a[i]<a[i-1]) {
            cout << -1 << endl;
            return;
        }
        if (a[i]>x) {
            tmp=i;
            break;
        }
    }
    while (tmp<=n){
        int ok=0;
        for (int i=tmp+1; i<=n; i++)
            if (a[i]<a[i-1]) ok=1;
        if (ok==0) break;
        res++;
        tg=x;
        x=a[tmp];
        a[tmp]=tg;
        while (a[tmp]<=x) {
            tmp++;
            if (a[tmp]<a[tmp-1]){
                cout << -1 << endl;
                return;
            }
        }
    }
    cout << res << endl;
}

int main(){
    int t;
    for (cin >> t; t--; t>0) solve();
    return 0;
}
