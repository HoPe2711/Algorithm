#include <bits/stdc++.h>

using namespace std;

int n,maxleft[200001],maxright[200001],val[1000000],a[200000];

int get(int node, int l, int r, int u, int v){
    if (u>r || v<l || l>r) return 1000000001;
    int mid=(l+r)/2;
    if (u<=l && r<=v) return val[node];
    else return min(get(2*node,l,mid,u,v),get(2*node+1,mid+1,r,u,v));
}

void update(int node, int l, int r, int i, int x){
    if (l>r || l>i || r<i) return;
    if (l!=r){
        int mid=(l+r)/2;
        update (node*2,l,mid,i,x);
        update (node*2+1,mid+1,r,i,x);
        val[node]=min(val[node*2],val[node*2+1]);
    }
    else val[node]=x;
}

int bs(int i, int x){
    int l,r,mid;
    l=i+1;
    r=n;
    while (l<=r){
        mid=(l+r)/2;
        if (maxright[mid]>x) l=mid+1;
            else if (maxright[mid]<x) r=mid-1;
                else {
                    int ok=get(1,1,n,i,mid-1);
                    if (ok>x) l=mid+1;
                        else if (ok<x) r=mid-1;
                            else {
                                    cout << "YES" << endl;
                                    cout << i-1 << " " << mid-i << " " << n-mid+1 << endl;
                                    return 1;
                            }
                }
    }
    return 0;
}

void solve(){

    cin >> n;

    for (int i=0; i<=4*n; i++) val[i]=1000000001;

    maxleft[0]=0;
    for (int i=1; i<=n; i++) {
        cin >> a[i];
        maxleft[i]=max(maxleft[i-1],a[i]);
        update(1,1,n,i,a[i]);
    }
    maxright[n+1]=0;
    for (int i=n; i>0; i--) maxright[i]=max(maxright[i+1],a[i]);

    for (int i=1; i<n-1; i++){
        int tmp=bs(i+1,maxleft[i]);
        if (tmp==1) return;
    }
    cout << "NO" << endl;
}

int main(){
    int t;
    for (cin >> t; t>0; t--) solve();
    return 0;
}
