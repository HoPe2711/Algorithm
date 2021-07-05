#include <bits/stdc++.h>

using namespace std;

vector < pair <int,int> > value;

int dd[100001],a[7];
int n;

void cal(){
    int left=0,s=0,res=2000000000;
    for (int i=0;i<value.size();i++){
        int b=value[i].second;
        if (dd[b]==0) s++;
        dd[b]++;
        if (s==n) {
            while (dd[value[left].second]>1) {
                dd[value[left].second]--;
                left++;
            }
            res=min(res,value[i].first-value[left].first);
        }
    }

    cout << res;
}

int main(){
    int x;
    for (int i=1;i<=6;i++) cin >> a[i];
    cin >> n;
    for (int i=1;i<=n;i++) {
        cin >> x;
        for (int j=1;j<=6;j++) value.push_back({x-a[j],i});
    }

    sort(value.begin(),value.end());

    //for (int i=0;i<value.size();i++) cout << value[i].first << " " << value[i].second << endl;

    cal();

    return 0;
}
