#include <iostream>

using namespace std;

int top;
int st[100000];

int push(int i){
    top++;
    st[top]=i;
    return 0;
}

int main(){
    int n;
    int a[100000];
    cin >> n;
    for (int i=1;i<=n;i++){
        cin >> a[i];
        while ((top>0) && (a[i]>=a[st[top]])) top--;
        if (top>0) cout << st[top] << " ";
        else cout << "- ";
        push(i);
    }
    return 0;
}
