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

int main(){
    int t,n,k;
    long long minn[200000];
    long long res,sum;
    cin >> t;
    minn[0]=0;
    res=0;
    for (int j=1;j<=t;j++){
       cin >> n >> k;
       sum=0;
       for (int i=1;i<=n;i++){
            sum=sum+readInt();
            minn[i]=min(minn[i-1],sum);
            if (i==k) res=sum;
            else if (i>k) res=max(res,sum-minn[i-k]);
       }
       cout << res << endl;
    }
    return 0;
}

