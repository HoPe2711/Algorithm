#include<bits/stdc++.h>
#define dd(x) cout<<#x<<" = "<<x<<" "
#define de(x) cout<<#x<<" = "<<x<<endl
#define sz(x) int(x.size())
#define All(x) x.begin(),x.end()
#define fi first
#define se second
#define mp make_pair
#define pb push_back
using namespace std;
typedef long long ll;
typedef long double ld;
typedef pair<int,int> P;
typedef priority_queue<int> pq;
const int maxn=3e5+10,mod=1e9+7,INF=0x3f3f3f3f;
int a[maxn];
ll f[maxn][3][2];
int main()
{
	int n;
	cin>>n;
	for (int i=1;i<=n;++i)
		scanf("%d",&a[i]);
	if (n==1){
		cout<<a[1];
		return 0;
	}
	memset(f,0xcf,sizeof(f));
	f[0][0][1]=0;
	for (int i=1;i<=n;++i){
		for (int j=0;j<3;++j){
			if (i&1){
				f[i][(j+1)%3][1]=max(f[i][(j+1)%3][1],f[i-1][j][1]+a[i]);
				f[i][(j+1)%3][0]=max(f[i][(j+1)%3][0],f[i-1][j][0]+a[i]);
				f[i][(j+2)%3][0]=max(f[i][(j+2)%3][0],max(f[i-1][j][0],f[i-1][j][1])-a[i]);
			}
			else{
				f[i][(j+2)%3][1]=max(f[i][(j+2)%3][1],f[i-1][j][1]-a[i]);
				f[i][(j+2)%3][0]=max(f[i][(j+2)%3][0],f[i-1][j][0]-a[i]);
				f[i][(j+1)%3][0]=max(f[i][(j+1)%3][0],max(f[i-1][j][0],f[i-1][j][1])+a[i]);
			}
		}
		//for (int j=0;j<3;++j)
			//dd(i),dd(j),dd(f[i][j][0]),de(f[i][j][1]);
	}
	for (int i=1;i<=n;++i){
		for (int j=0;j<3;++j) cout << f[i][j][0] << " " << f[i][j][1] << " ";
        cout << endl;
    }
	cout<<f[n][1][0];
	return 0;
}
