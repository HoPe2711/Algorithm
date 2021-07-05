#include <iostream>
#include <math.h>

using namespace std;

int dd[1000000];

int main(){
    int n; int res=0;
    cin >> n;
    for (int i=2;i<=int(sqrt(n));i++){
        int j=i*i;
        while (j<=n){
            dd[j]=1;
            j+=i;
        }
    }
    for (int i=2;i<n;i++)
        if (dd[i]==0) res++;
    cout << res;
    return 0;
}
