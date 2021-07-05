#include <bits/stdc++.h>

using namespace std;

int a,b,x,y,n,mid,ok;

pair<int,int> f[1010][1010];

pair<int,int> cal(pair<int,int> k, int tmp){
    k.second +=tmp;
    if (k.second>=mid){
        k.first ++;
        k.second = 0;
    }
    return k;
}

int dp(){
    for (int i=0;i<=x;i++)
        for (int j=0;j<=y;j++) f[i][j]=make_pair(0,0);
    for (int i=0;i<=x;i++)
        for (int j=0;j<=y;j++){
            if (f[i][j].first==n) return 1;
            if (i<x) f[i+1][j]=max(f[i+1][j],cal(f[i][j],a));
            if (j<y) f[i][j+1]=max(f[i][j+1],cal(f[i][j],b));
        }
    return 0;
}

int solve(){
    int l,r,res;
    l=0;
    r=a*x+b*y;
    while (l<=r){
        mid = (l+r)/2;
        ok=1;
        if (dp()){
            l=mid+1;
            res=mid;
        }
        else r=mid-1;
    }
    return res;
}

int main(){
    cin >> x >> a >> y >> b >> n;
    cout << solve() << endl;
    cin >> x >> a >> y >> b >> n;
    cout << solve();
    return 0;
}


