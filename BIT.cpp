#include <bits/stdc++.h>

using namespace std;

const int base=1000000007;
int fen[400000],n,dd[400000],m,k;
long long c[300000][101];

void update(int p, int val){
    for(int i = p; i <= n; i += i & -i)
        fen[i] += val;
}
int sum(int p) {
    int ans = 0;
    for(int i = p; i; i -= i & -i)
        ans += fen[i];
    return ans;
}

void build(){
    c[1][0]=1;  c[1][1]=1;
    c[0][0]=1;
    for (int i=2; i<=200001; i++) c[i][0]=1;
    for (int i=2; i<=200001; i++)
        for (int j=1; j<=100; j++)
            if (j<=i) c[i][j]=(c[i-1][j-1]+c[i-1][j]) % base;
}

void solve(){
    long long res=0,tmp,tmp1;
    int a[300000];
    cin >> n >> m >> k;
    for (int i=1; i<=n; i++) {
        cin >> a[i];
        dd[a[i]]=0;
        update(a[i],1);
    }


    for (int i=1; i<=n; i++)
        if (dd[a[i]]==0) {
            int tg=max(0,a[i]-k-1);
            tmp1=sum(a[i])-sum(a[i]-1);
            tmp=sum(a[i]-1)-sum(tg);
            for (int j=1; j<=m; j++) res=((c[tmp1][j]*c[tmp][m-j])%base+res)%base;
            dd[a[i]]=1;
        }
    cout << res << endl;
    for (int i=1; i<=n; i++) {
        tmp=sum(a[i])-sum(a[i]-1);
        update(a[i],-tmp);
    }
    return;
}

int main(){
    int t;
    build();
    for (cin >> t; t>0; t--) solve();
    return 0;
}
