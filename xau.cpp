#include <iostream>
#include <string.h>

using namespace std;

int main(){
    char st[10000];
    string s="";
    cin >> st;
    int n=strlen(st);
    for (int i=0;i<n;i++){
        s=s+st[i];
        cout << s << endl;
    }
    for (int i=n-1;i>=0;i--){
        cout << s << endl;
        s.erase(i,1);
    }
    return 0;
}
