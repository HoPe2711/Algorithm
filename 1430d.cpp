#include <iostream>
#include <queue>
#include <string>

using namespace std;

int main(){
    int t,n;
    queue<int> q;
    string st;
    cin >> t;
    for (int j=1;j<=t;j++){
        cin >> n >> st;
        int cur = 0,res=0,del=0;
        for (int i=1;i<n;i++){
            if (st[i]!=st[i-1]) cur ++;
            else q.push(cur);
        }
        for (int i=0;i<=n;i++){
            if (q.empty()) break;
            q.pop();
            del++;
            res++;
            while ((!q.empty()) && (q.front()==i)) {
                del++;
                q.pop();
            }
            del++;
        }
        res+=(n-del+1)/2;
        cout << res << endl;
    }
    return 0;
}
