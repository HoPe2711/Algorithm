#include <iostream>
#include <stack>
#include <queue>

using namespace std;

int main(){
    int n,pre=-1,num=0,tmp,ok=0;
    stack<int> trade;
    priority_queue<int,vector<int>,greater<int>> check;
    int a[200001],state[200001],f[200001];
    char c;
    cin >> n;
    for (int i=1;i<=2*n;i++){
        cin >> c;
        if (c=='-') {
            cin >> a[i];
            state[i]=0;
            if (a[i]<pre || trade.empty()) {
                    cout << "NO";
                    return 0;
            }
            tmp=trade.top();
            trade.pop();
            f[tmp]=a[i];
            num--;
            pre=a[i];
        }
        else {
            state[i]=1;
            trade.push(i);
            num++;
            pre=-1;
        }
    }
    for (int i=1;i<=2*n;i++)
        if (state[i]==1) check.push(f[i]);
        else {
            tmp=check.top();
            check.pop();
            if (a[i]!=tmp) {
                cout << "NO";
                return 0;
            }
        }
    cout << "YES" << endl;
    for (int i=1;i<=2*n;i++)
        if (state[i]==1) cout << f[i] << " ";
    return 0;
}
