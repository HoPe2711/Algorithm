#include <iostream>

using namespace std;

int n;

void xuli(){
    long long x[100],y[100],res=0,res1=0,res2=0,tmp,c[100],p,p1,p2,p3,dem,dem1,dem2;
    c[0]=0;
    for (int i=1;i<=n;i++) {
        cin >> x[i] >> y[i];
        c[i]=i*(i-1)/2;
    }
    for (int i=1;i<=n;i++)
        for (int j=i+1;j<=n;j++){
            p=x[i]-x[j];
            p1=y[i]-y[j];
            dem=0; dem1=0; dem2=0;
            for (int k=1;k<=n;k++)
                if (k!=i && k!=j) {
                    p2=x[i]-x[k];
                    p3=y[i]-y[k];
                    tmp=p*p3-p2*p1;
                    if (tmp<0) dem++;
                    if (tmp>0) dem1++;
                    if (tmp==0) dem2++;
                }
          //  cout << dem << " " << dem1 << " " << dem2;
            res+=c[dem]+c[dem1];
            //cout << dem << dem1 << " ";
            res1+=(dem1+dem)*dem2;
            res2+=c[dem2];
    }
    cout << res/4-res1/3+res2/6 << endl;
}

int main(){
    int t;
    cin >> n;
    while (n!=0) {
        xuli();
        cin >> n;
    }
    return 0;
}
