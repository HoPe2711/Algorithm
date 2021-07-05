#include <bits/stdc++.h>

using namespace std;

int a[200000],n,vt[1000001],ss;
long long sum[200000],s,val[400001];

void build(int l, int r){
    if (l>r) return;
    int mid=vt[(a[r]+a[l])/2];
    ++ss;
    val[ss]=sum[r]-sum[l-1];
    if (mid==r) return;
    build(l,mid);
    build(mid+1,r);
}

int findd(){
    int l,r,mid;
    l=1;
    r=ss;
    while (l<=r){
        mid=(l+r)/2;
        if (val[mid]==s) return 1;
        if (val[mid]<s) l=mid+1;
        else r=mid-1;
    }
    return 0;
}

void solve(){
    int q,tmp,maxx=0;
    cin >> n >> q;
    ss=0;
    for (int i=1; i<=n; i++) {
        cin >> a[i];
        maxx =max(maxx,a[i]);
    }
    sort(a+1,a+n+1);
    a[n+1]=0;
    for (int i=1; i<=maxx; i++) vt[i]=0;
    for (int i=1; i<=n; i++)
        if (a[i]!=a[i+1]) vt[a[i]]=i;
    for (int i=1; i<=maxx; i++)
        if (vt[i]==0) vt[i]=vt[i-1];

    sum[0]=0;
    for (int i=1; i<=n; i++) sum[i]=sum[i-1]+a[i];

    build(1,n);
    sort(val+1,val+ss+1);
    for (int i=1; i<=q; i++){
        cin >> s;
        int tmp = findd();
        if (tmp==1) cout << "Yes";
        else cout << "No";
        cout << endl;
    }
    return;
}

int main(){
    int t;
    //freopen ("myfile.txt","r",stdin);
    for (cin >> t; t>0; t--) solve();
    return 0;
}
