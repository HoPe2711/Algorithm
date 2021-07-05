#include <iostream>

using namespace std;

int n,m,countt,countt1;
int res[20000],res1[20000],kq[20000],kq1[20000],a[101][101];

void trans(){
    for (int i=1; i<=n-2; i++){
        for (int j=1; j<m; j++)
            if (a[i][j]==1) {
                countt++;
                a[i][j]=0; a[i+1][j]=1-a[i+1][j]; a[i][j+1]=1-a[i][j+1];
                res[countt]=i; res1[countt]=j;
            }
        if (a[i][m]==1){
            countt ++;
            res[countt]=i; res1[countt]=m;
            a[i][m]=0; a[i+1][m-1]=1-a[i+1][m-1]; a[i+1][m]=1-a[i+1][m];
        }
    }
}

void gan(int x, int y){
    countt1++;
    a[x][y]=1-a[x][y];
    kq[countt1]=x; kq1[countt1]=y;
}

void get3(int i, int j){
    if (a[i][j]==1) gan(i,j);
    if (a[i+1][j]==1) gan(i+1,j);
    if (a[i][j+1]==1) gan(i,j+1);
    if (a[i+1][j+1]==1) gan(i+1,j+1);
}

void get2(int i, int j){
    if (a[i][j]==1){
        gan(i,j);
        if (a[i+1][j]==0) gan(i+1,j);
        if (a[i][j+1]==0) gan(i,j+1);
        if (a[i+1][j+1]==0) gan(i+1,j+1);
    }
    else {
        gan(i,j);
        if (a[i+1][j]==0) {
            gan(i+1,j);
            gan(i+1,j+1);
        }
        else if (a[i][j+1]==0) {
            gan(i,j+1);
            gan(i+1,j+1);
        } else if (a[i+1][j+1]==0) {
            gan(i+1,j);
            gan(i+1,j+1);
        }
    }
    get3(i,j);
}

void get1(int i, int j){
    if (a[i+1][j+1]==1) {
        gan(i+1,j+1);
        gan(i+1,j);
        gan(i,j+1);
    }
    else {
        gan(i,j);
        gan(i+1,j);
        gan(i,j+1);
    }
    get2(i,j);
}

void get4(int i,int j){
    gan(i+1,j+1);
    gan(i+1,j);
    gan(i,j+1);
    get1(i,j);
}

void check(int i,int j){
    int tmp=a[i][j]+a[i+1][j]+a[i][j+1]+a[i+1][j+1];
    if (tmp==3) get3(i,j);
    if (tmp==2) get2(i,j);
    if (tmp==1) get1(i,j);
    if (tmp==4) get4(i,j);
}

void trans1(int i){
    if (m%2==0) for (int j=1; j<m; j+=2) check(i,j);
    else {
        if (a[i][1]==1){
            gan(i,1);
            if (a[i+1][1]==1) {
                gan(i+1,1);
                gan(i,2);
            }
            else {
                gan(i+1,2);
                gan(i,2);
            }
        }
        else if (a[i+1][1]==1)  {
                gan(i+1,1);
                gan(i+1,2);
                gan(i,2);
            }
        for (int j=2; j<m; j+=2) check(i,j);
    }
}

void solve(){
    int x,y;
    countt=0; countt1=0;
    string st;
    cin >> n >> m;
    for (int i=1; i<=n; i++){
        cin >> st;
        for (int j=1; j<=m; j++) a[i][j]=(int) st[j-1]-'0';
    }

    trans();

    trans1(n-1);

    cout << countt+countt1/3 << endl;
    for (int i=1; i<=countt; i++){
        x=res[i];  y=res1[i];
        if (y!=m)   cout << x+1 << " " << y << " " << x << " " << y << " " << x << " " << y+1 << endl;
        else cout << x << " " << y << " " << x+1 << " " << y << " " << x+1 << " " << y-1 << endl;
    }

    for (int i=1;i<=countt1;i++) {
        cout << kq[i] << " " << kq1[i];
        if (i%3==0) cout << endl;
        else cout << " ";
    }
}

int main(){
    int t;
    for (cin >> t; t>0; t--) solve();
    return 0;
}
