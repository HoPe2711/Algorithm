#include <bits/stdc++.h>

using namespace std;

int c[200001],d[200001];
int a[200001],b[200001];

void solve(){
    int n,res;
    cin >> n;
    for (int i=1; i<=n; i++) {
        cin >> a[i] >> b[i];
        c[i]=a[i];
        d[i]=b[i];
    }
    res=n;
    sort(c+1,c+n+1);
    sort(d+1,d+n+1);
    for (int i=1; i<=n; i++) {
        int tmp=upper_bound(c+1,c+n+1,b[i])-c;
        tmp=(n+1-tmp)+upper_bound(d+1,d+n+1,a[i]-1)-d-1;
        res=min(res,tmp);
    }
    cout << res << endl;
    return;
}

int main(){
    int t;
    for (cin >> t; t>0; t--) solve();
    return 0;
}
