#include <bits/stdc++.h>

using namespace std;

int main(){
    int n,poww,tmp,a[100001],dd[100],sum[100001],res=200000;
    cin >> n;
    poww=0; tmp=1; sum[0]=0;
    for (int i=1; i<=n; i++) {
        cin >> a[i];
        sum[i]=sum[i-1] ^ a[i];
        while (a[i]>=tmp) {
            poww++;
            tmp*=2;
        }
        dd[poww-1]++;
    }
    for (int i=1; i<=poww; i++)
    if (dd[i-1]>2) {
        cout << 1;
        return 0;
    }

    for (int l=1; l<=n-1; l++)
        for (int r=l+1; r<=n; r++)
            for (int mid=l; mid<=r-1; mid++)
                if ((sum[mid]^sum[l-1])>(sum[mid]^sum[r])) {
                    res=min(res,r-l-1);
                }
    if (res!=200000) cout << res;
    else cout << -1;
    return 0;
}
