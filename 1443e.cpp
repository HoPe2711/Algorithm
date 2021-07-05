#include <bits/stdc++.h>

using namespace std;

int main(){
    vector<int> a;
    int n,m,x,l,r,q,qq;
    long long sum[200001], cost[200001],trans,tmp=0;
    cin >> n;
    sum[0]=0;
    m=max(n-14,1);
    for (int i=1; i<=n; i++) sum[i]=sum[i-1]+i;
    cost[n+1]=1;
    for (int i=n; i>=m; i--) cost[i]=cost[i+1]*(n-i+1);
    //cost[n+1]=0;
    for ( cin >> q; q>0; q--){
        cin >> qq;
        if (qq==1){
            cin >> l >> r;
            cout << sum[r]-sum[l-1] << endl;
        }
        else {
            cin >> x;
            tmp+=x;
            trans=tmp;
            for (int i=m; i<=n; i++) a.push_back(i);
            for (int i=m; i<=n; i++){
                int point=0;
                while (trans >= cost[i+1]){
                    trans -= cost[i+1];
                    point++;
                }
                sum[i]=sum[i-1]+a[point];
                a.erase(a.begin()+ point);
            }
        }
    }
    return 0;
}
