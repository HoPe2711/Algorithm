#include <iostream>

using namespace std;

int main(){
    int t,n,m,a,b,pos[250001];
    int c[600][600];
    cin >> t;
    for (int k=1;k<=t;k++){
        cin >> n >> m;
        for (int i=1;i<=n;i++)
            for (int j=1;j<=m;j++){
                cin >> a;
                pos[a]=j;
            }
        for (int j=1;j<=m;j++)
            for (int i=1;i<=n;i++){
                cin >> b;
                c[i][pos[b]]=b;
            }
        for (int i=1;i<=n;i++){
            for (int j=1;j<=m;j++) cout << c[i][j] << " ";
            cout << endl;
        }
    }
    return 0;
}
