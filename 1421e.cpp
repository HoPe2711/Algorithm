#include <iostream>
#include <math.h>

using namespace std;

int readInt () {
	bool minus = false;
	int result = 0;
	char ch;
	ch = getchar();
	while (true) {
		if (ch == '-') break;
		if (ch >= '0' && ch <= '9') break;
		ch = getchar();
	}
	if (ch == '-') minus = true; else result = ch-'0';
	while (true) {
		ch = getchar();
		if (ch < '0' || ch > '9') break;
		result = result*10 + (ch - '0');
	}
	if (minus)
		return -result;
	else
		return result;
}

long long getmax(long long &a,long long b){
    if (a<b) a=b;
    return a;
}

int main(){
    int n;
    long long f[200001][3][2];
    int a[200001];
    n=readInt();
    for (int i=1;i<=n;i++) a[i]=readInt();
    for (int i=0;i<=n;i++)
        for (int j=0;j<=2;j++)
            for (int k=0;k<=1;k++) f[i][j][k]=-1000000000000;
    f[0][0][0]=0;
    if (n==1) {
        cout << a[1];
        return 0;
    }
    for (int i=1;i<=n;i++)
        for (int j=0;j<=2;j++){
            if (i%2==1) {
                getmax(f[i][(j+1)%3][0],f[i-1][j][0]+a[i]);
                getmax(f[i][(j+1)%3][1],f[i-1][j][1]+a[i]);
                getmax(f[i][(j+2)%3][1],max(f[i-1][j][0]-a[i],f[i-1][j][1]-a[i]));
            }
            else {
                getmax(f[i][(j+2)%3][0],f[i-1][j][0]-a[i]);
                getmax(f[i][(j+2)%3][1],f[i-1][j][1]-a[i]);
                getmax(f[i][(j+1)%3][1],max(f[i-1][j][0]+a[i],f[i-1][j][1]+a[i]));
            }
        }
    cout << f[n][1][1];
    return 0;
}

// ton tai m+n%3=1 va cach xep + - + - + - ko dung
