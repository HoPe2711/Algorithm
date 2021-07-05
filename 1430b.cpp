#include <iostream>
#include <algorithm>

using namespace std;

int main(){
    int n,t,k, a[200000];
    long long res;
    cin >> t;
    for (int q=1;q<=t;q++){
        cin >> n >> k;
        res=0;
        for (int i=1;i<=n;i++) cin >> a[i];
        sort (a+1,a+n+1);
        for (int i=n;i>=max(n-k,0);i--) res+=a[i];
        cout << res << endl;
    }
    return 0;
}
