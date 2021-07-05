#include <iostream>

using namespace std;

int base=998244353;

void xuli(){
    int n,k,a[200001],b[200001],level[200001],res=1,t;
    cin >> n >> k;
    for (int i=1; i<=n; i++) {
        cin >> a[i];
        level[i]=0;
    }
    for (int i=1; i<=k; i++) {
        cin >> t;
        level[t]=i;
    }
    for (int i=1; i<=n; i++){
        if (level[a[i]]==0) continue;
        int tmp=0;
        if (i>1 && level[a[i]]>level[a[i-1]]) tmp++;
        if (i<n && level[a[i]]>level[a[i+1]]) tmp++;
        res=(res*tmp) % base;
    }
    cout << res << endl;
}

int main(){
    int t;
    for (cin >> t; t>0; t--) xuli();
    return 0;
}
