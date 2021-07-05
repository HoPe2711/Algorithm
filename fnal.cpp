#include <iostream>

using namespace std;

struct So{
    int giaTri;
    So *tiep;
};

struct DaySo{
private:
    So* soDauTien;
public:
    void SapDat();
    void setsoDauTien(So * head){ soDauTien = head;}
    So* getHead(){return soDauTien;}
};

void DaySo::SapDat(){
    So* head = soDauTien;
    for (So* p = head; p!= NULL; p = p->tiep)
        for (So *q=p; q!=NULL; q=q->tiep)
    {
        if (p==q) continue;
        int u = p->giaTri;
        int v = q->giaTri;
        if (u%2 && v%2 ==0){
            p->giaTri = v;
            q->giaTri = u;
        }
    }
    So*p = head;
    for (p; p!= NULL; p=p->tiep){
        int u=p->giaTri;
        if (u%2) break;
        for(So*q=p;q!=NULL; q= q->tiep){
            if (p==q) continue;
            u=p->giaTri;
            int v=q->giaTri;
            if (v%2) break;
            if (u>v){
                p->giaTri=v;
                q->giaTri=u;
            }
        }
    }
    for(p; p != NULL; p = p->tiep)
    {
        int u = p->giaTri;
        for(So* q = p; q != NULL; q = q->tiep)
        {
            if(p == q) continue;
            u = p->giaTri;
            int v = q->giaTri;
            if(u > v)
            {
                p->giaTri = v;
                q->giaTri = u;
            }
        }
    }
}

So* insert_tail(So* head, int value){
    So *p = head;
    So *soMoi = new So();
    soMoi->tiep = NULL;
    soMoi->giaTri = value;

    if (head == NULL){
        head = soMoi;
        return head;
    }

    while (p->tiep != NULL) p= p->tiep;
    p->tiep = soMoi;
    return head;
}

void print(So*head){
    while (head!=NULL){
        cout << head->giaTri << " ";
        head = head->tiep;
    }
}

int main(){
    int x;
    cin >> x;
    So*head = new So();
    head->giaTri = x;
    head->tiep = NULL;

    while (cin >> x){
        if (x==0) break;
        So* tmp = insert_tail(head,x);
    }

    DaySo a;
    a.setsoDauTien(head);
    a.SapDat();
    print(a.getHead());

    return 0;
}
