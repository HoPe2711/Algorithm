#include <bits/stdc++.h>

using namespace std;

int n;
int a[200001],b[200001];

int check(int x){
    long long tmp=0;
    for (int i=1; i<=n; i++)
        if  (a[i]>x) tmp+=b[i];
    if (tmp<=x) return 1;
    return 0;
}

void xuli(){
    int res,l,r,mid;
    cin >> n;
    for (int i=1; i<=n; i++) cin >> a[i];
    for (int i=1; i<=n; i++) cin >> b[i];
    l=1;
    r=1000000000;
    res=r;
    while (l<=r) {
        mid = (l+r)/2;
        if (check(mid)){
            res=min(res,mid);
            r=mid-1;
        }
        else l=mid+1;
    }
    cout << res << endl;
};

int main(){
    int t;
    for (cin >> t; t>0; t--) xuli();
    return 0;
}
