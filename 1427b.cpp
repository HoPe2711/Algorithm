#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int main (){
    int t,n,k;
    int lose[100000];
    string st;
    cin >> t;
    for (int test=1;test <= t;test++){
            cin >> n >> k >> st;
            int streak = 0, dem = 0, cur = 0,res=0;
            for (int i=0;i<n;i++){
                if (st[i]=='W') res++;
                if ((st[i]=='W') && (cur >0 || i==0)){
                    streak ++ ;
                    if (res!=1){
                        dem ++;
                        lose[dem]=cur;
                    }
                    cur = 0;
                }
                if (st[i]=='L') cur ++;
            }
            if (k>=n-res){
                cout << 2*n-1 << endl;
                continue;
            }
            if (k==0){
                cout << 2*res-streak << endl;
                continue;
            }
            if (res==0){
                cout << 2*k-1 << endl;
                continue;
            }
            //cout << dem << streak;
            sort (lose+1,lose+dem+1);
            for (int i=1;i<=dem;i++){
                if (k<=lose[i]) {
                    if (k==lose[i]) streak--;
                    res+=k;
                    k-=lose[i];
                    cout << 2*res-streak << endl;
                    break;
                }
                res+=lose[i];
                k-=lose[i];
                streak--;
            }
            if (k>0)
            {
                res+=k;
                cout << 2*res-streak << endl;
            }
    }
    return 0;
}
