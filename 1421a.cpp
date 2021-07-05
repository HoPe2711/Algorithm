#include <iostream>

using namespace std;

int main(){
    int t,a,b;
    cin >> t;
    for(int i=1;i<=t;i++){
        cin >> a >> b;
        int tg=a & b;
        int tg1=a ^ tg;
        int tg2=b^tg;
        cout << tg1+tg2 << endl;
    }
    return 0;
}
