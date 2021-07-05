#include <iostream>
#include <math.h>

using namespace std;

void solve(){
    long long x,y;
    long long c[6];
    long long res;
    cin >> x >> y;
    for (int i=1;i<=6;i++) cin >> c[i];
    if ((x==0) && (y==0)) {
        cout << 0 << endl;
        return;
    }
    if (x>=0)
        if (y>=x) res = min(min(c[6]*x+c[2]*y,c[1]*x+c[2]*(y-x)),c[1]*y+c[3]*(y-x));
        else if (y<=0) res = min(min(c[6]*x-c[5]*y,c[1]*x+c[5]*(x-y)),-c[4]*y+c[6]*(x-y));
        else res=min(min(c[2]*y+c[6]*x,c[1]*y+c[6]*(x-y)),c[1]*x+c[5]*(x-y));
    if (x<0)
        if (y<=x) res = min(min(-c[3]*x-c[5]*y,-c[4]*x+c[5]*(x-y)),-c[4]*y+c[6]*(x-y));
        else if (y>=0) res = min(min(c[2]*y-c[3]*x,-c[4]*x+c[2]*(y-x)),c[1]*y+c[3]*(y-x));
        else res = min(min(-c[5]*y-c[3]*x,-c[4]*x+c[2]*(y-x)),-c[4]*y+c[3]*(y-x));
    cout << res << endl;
    return;
}

int main(){
    int t;
    cin >> t;
    for (int i=1;i<=t;i++) solve();
    return 0;
}
