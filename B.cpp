#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

vector <int> a;

void print(){
    for (int i=a.size()-1;i>=0;i--) cout << a[i];
    cout << endl;
}

vector<int> update(){
    int nho=0,tg;
    vector<int> b;
    for (int i=0;i<a.size();i++){
        tg=a[i]+a[a.size()-i-1]+nho;
        if (tg>=10) {
            tg-=10;
            nho=1;
        }
        else nho=0;
        b.push_back(tg);
    }
    if (nho>0) b.push_back(1);
    return b;
}

int check(){
    int dem=0;
    vector<int> b=a;
    for (int i=0;i<b.size()-1;i++){
        int k=(2*b[i])%7;
        if (b[i+1]<k && i!=b.size()-2) {
                b[i+2]--;
                b[i+1]=b[i+1]+10-k;
        }
        else b[i+1]-=k;
    }
    //cout << b.size() << endl;
    //for (int i=0;i<b.size()-1;i++) cout << b[i];
    //cout << endl;
    if (b[b.size()-1]%7==0) return 0;
    return 1;
}

int main(){
    int t;
    long long n;
    cin >> t;
    for (int i=1;i<=t;i++){
        cin >> n;
        a.clear();
        if (n==7) {
            cout << 7 << endl;
            continue;
        }
        while (n<10) n=2*n;
        while (n>0){
            a.push_back(n%10);
            n/=10;
        }
        int ok=0;
        for (int j=1;j<=1000;j++) {
            if (check()==0) {
                print();
                ok=1;
                break;
            }
            a=update();
        }
        if (ok==0) cout << -1 << endl;
    }
    return 0;
}
