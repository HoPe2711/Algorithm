#include <iostream>

using namespace std;

int main(){
    int t,n;
    cin >> t;
    for (int i=1;i<=t;i++){
        cin >> n;
        int ok=0;
        for (int j=0;j<=142;j++){
            int tmp=n-j*7;
            if (tmp<0) break;
            for (int k=0;k<=tmp/5;k++){
                int tmp1=tmp-k*5;
                if (tmp1<0) break;
                if (tmp1%3==0) {
                    cout << tmp1/3 << " " << k << " " << j << endl;
                    ok=1;
                    break;
                }
            }
            if (ok==1) break;
        }
        if (ok==0) cout << -1 << endl;
    }
    return 0;
}
