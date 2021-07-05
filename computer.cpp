#include <iostream>

using namespace std;

int a,b,x,y,n,mid;

int dp(int i,int x1, int y1, int val){
    if (i==n) return 0;
    int tg=1;
    if (val>=mid) tg=dp(i+1,x,y,0);
    if (x1<x) dp(i,x1+1,y1,val+a);
    if (y1<y) dp(i,x1,y1+1,val+b);
    return tg;
}

int solve(){
    int l,r,res;
    l=0;
    r=2000000;
    while (l<=r){
        mid = (l+r)/2;
        if (dp(0,0,0,0)==0){
            l=mid+1;
            res=mid;
        }
        else r=mid-1;
    }
    return res;
}

int main(){
    cin >> x >> a >> y >> b >> n;
    cout << solve();
    return 0;
}
