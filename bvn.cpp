#include <iostream>

using namespace std;

int main(){
    int x,y;
    cin >> x >> y;
    switch (y){
        case 1:
            if (x>=20) cout << "Bao Binh";
            else cout << "Ma Ket";
            break;
        case 2:
            if (x>=19) cout << "Song Ngu";
            else cout << "Bao Binh";
            break;
        case 3:
            if (x>=21) cout << "Bach Duong";
            else cout << "Song Ngu";
            break;
        case 4:
            if (x>=20) cout << "Kim Nguu";
            else cout << "Bach Duong";
            break;
        case 5:
            if (x>=21) cout << "Song Tu";
            else cout << "Kim Nguu";
            break;
        case 6:
            if (x>=22) cout << "Cu Giai";
            else cout << "Song Tu";
            break;
        case 7:
            if (x>=23) cout << "Su Tu";
            else cout << "Cu Giai";
            break;
        case 8:
            if (x>=23) cout << "Xu Nu";
            else cout << "Su Tu";
            break;
        case 9:
            if (x>=23) cout << "Thien Binh";
            else cout << "Xu Nu";
            break;
        case 10:
            if (x>=24) cout << "Thien Yet";
            else cout << "Thien Binh";
            break;
        case 11:
            if (x>=23) cout << "Nhan Ma";
            else cout << "Thien Yet";
            break;
        case 12:
            if (x>=22) cout << "Ma Ket";
            else cout << "Nhan Ma";
            break;
    }
    return 0;
}
