#include <iostream>

using namespace std;

int main(){
    int t,n,a;
    int b[200];
    cin >> t;
    for (int i=1;i<=t;i++){
        cin >> n;
        for (int j=1;j<=n;j++){
            cin >> a;
            if (j%2==1) b[j+1]=a;
            else b[j-1]=-a;
        }
        for (int j=1;j<=n;j++) cout << b[j] << " ";
        cout << endl;
    }
    return 0;
}