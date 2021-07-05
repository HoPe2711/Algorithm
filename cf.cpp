#include <bits/stdc++.h>

using namespace std;

void solve(){
    int x,y,z,pos;
    long long res=0,kq,minn=1000000001,minn2=1000000001;
    long long a[300001];
    cin >> x >> y >> z;
    for (int i=1; i<=x; i++) cin >> a[i];
    for (int i=1; i<=y; i++) cin >> a[x+i];
    for (int i=1; i<=z; i++) cin >> a[x+y+i];
    for (int i=1; i<=x+y+z; i++){
        res+=a[i];
        if (a[i]<minn) {
            pos=i;
            minn=a[i];
        }
    }
    for (int i=1; i<=x+y+z; i++)
        if (i!=pos) minn2=min(minn2,a[i]);
    kq=minn+minn2;
    if (x==1) kq=min(kq,a[1]);
    if (y==1) kq=min(kq,a[x+1]);
    if (z==1) kq=min(kq,a[x+y+1]);
    cout << res-2*kq;
}

int main(){
    solve();
    return 0;
}
