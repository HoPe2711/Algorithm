#include <iostream>
#include <algorithm>

using namespace std;

bool ss(long long &a,long long &b){
    return (a>b);
}

int main(){
    int n,k;
    long long res;
    long long a[10000];
    cin >> n >> k;
    for (int i=1;i<=n;i++) cin >> a[i];
    sort(a+1,a+n+1,ss); //1 den n
    for (int i=1;i<=n;i++) cout << a[i];
    return 0;
}
