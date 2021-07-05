#include <iostream>

using namespace std;

int main(){
    int t,n;
    cin >> t;
    for (int q=1;q<=t;q++){
        cin >> n;
        cout << 2 << endl;
        if (n==2) cout << 1 << " " << 2 << endl;
        else {
            cout << n << " " << n-2 << endl;
            cout  << n-1 << " " << n-1 << endl;
            if (n>3) {
                int a=n-1;
                int b=a-2;
                while (b!=0){
                    cout << a << " " << b << endl;
                    a--; b--;
                }
            }
        }
    }
    return 0;
}
