#include <iostream>
#include <ctime>

using namespace std;

int a[1];

void gen(int &x){
    int tmp = rand() % 6 +1;
    x+=tmp;
    cout << ": " << tmp;
}

void gameplay(int status){
    int player = 0;
    while (true){
        cout << "Player" << player+1;
        gen(a[player]);
        if (a[player]>=100) {
            cout << " Win";
            break;
        }
        else cout << " Total: " << a[player] << endl;
        if (status == 0) player = (player + 1) % 2;
        else {
            if (a[0]<a[1]) player = 0;
            else player = 1;
        }
    }
}

int main(){
    int status;
    srand(time(0));
    cin >> status;
    gameplay(status);
    return 0;
}
