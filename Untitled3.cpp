#include <iostream>

using namespace std;

long long poww(int x){
    return (long long) x*x*x;
}

int main(){
    int n,tmp;
    long long res;
    cin >> n;
    tmp=n;
    for (int i=1; i<=n; i++)
    if (poww(i)>=n){
        tmp=i;
        break;
    }
    for (int i=1; i<tmp; i++)
        for (int j=i+1; j<tmp; j++)
            for (int k=j+1; k<tmp; k++)
                for (int l=k+1; l<tmp; l++){
                    res=poww(i)+poww(l);
                    if (res<=n && res==poww(j)+poww(k)) cout << res << " ";
                }
    return 0;
}
