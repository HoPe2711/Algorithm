#include <iostream>

using namespace std;

int main(){
    int t,n,k;
    cin >> t;
    for (int i=1;i<=t;i++){
        cin >> n >> k;
        int s=0,res=n;
        for (int j=1;j<=n;j++) {
            s+=j;
            if (s>k) {
                res=j-1;
                break;
            }
        }
        cout << res << endl;
    }
    return 0;
}
