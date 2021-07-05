#include <bits/stdc++.h>

using namespace std;

int c[200001],d[200001];
int a[200001],b[200001];

void solve(){
    int n,res=0;
    cin >> n;
    for (int i=1; i<=n; i++) {
        cin >> a[i] >> b[i];
        c[i]=a[i];
        d[i]=b[i];
    }
    sort(c+1,c+n+1);
    sort(d+1,d+n+1);
    for (int i=1; i<=n; i++) res=upper_bound(d+1,d+n+1,a[i])-1;
    cout << n-res << endl;
    return;
}

int main(){
    int t;
    for (cin >> t; t>0; t--) solve();
    return 0;
}
