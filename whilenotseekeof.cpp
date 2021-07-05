#include <iostream>

using namespace std;

int main(){
    while (true){
        int n=0;
        char ch;
        ch=getchar();
        if (ch == EOF) break;
        n=ch-'0';
        while (true){
            ch=getchar();
            if (ch < '0' || ch > '9') break;
            n=n*10+ch-'0';
        }
        n=n%8;
        if (n==6) n=4;
        if (n==7) n=3;
        if (n==0) n=2;
        cout << n << endl;
    }
    return 0;
}
