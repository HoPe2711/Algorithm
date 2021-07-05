#include <iostream>
#include <string.h>
#include <math.h>

using namespace std;

int n,a[100];

void stop(){
    cout << "no";
    exit(0);
}

void  kt(long long x){
    for (int i=2;i<=int(sqrt(x));i++){
            if (x%i==0) stop();
        }
}

void swapnumber(){
    long long res1=0;
    if (a[n]==0) stop;
    for (int i=1;i<=n;i++){
        int tg=a[i];
        if (a[i]==6) tg=9;
        if (a[i]==9) tg=6;
        res1=res1+tg*pow(10,i-1);
    }
    kt(res1);
}

int main(){
    long long res=0;
    string st;
    cin >> st;
    n=st.size();
    for (int i=0;i<n;i++) {
        a[i+1]=st[i]-'0';
        res=res+a[i+1]*pow(10,n-i-1);
        if (a[i+1]==3 || a[i+1]==4 || a[i+1]==7) stop();
    }
    kt(res);
    swapnumber();
    cout << "yes";
    return 0;
}
