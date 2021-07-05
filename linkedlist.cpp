#include <iostream>
using namespace std;

struct Node {
    const char* element;
    Node* next;

    Node(const char* e = NULL, Node* n = NULL)
    {
        element = e;
        next = n;
    }
};

struct SLinkedList{
    Node* head;
    long size;

    SLinkedList()
    {
        head = NULL;
        size = 0;
    }

    void addFirst(char* element)
    {
        Node* tmp = new Node;
        tmp->element = element;
        tmp->next = head;
        head = tmp;
    }

    void addLast(char* element)
    {
        Node* tmp = new Node;
        tmp->element = element;
        tmp->next = NULL;

    }

    void print()
    {
        for(Node* tmp = head; tmp != NULL; tmp = tmp->next)
        {
            cout << tmp->element << endl;
        }
    }
};

int main()
{
    SLinkedList list;
    list.addFirst("ChuBeDan");
    list.print();

    return 0;
}
