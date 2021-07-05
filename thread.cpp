#include <iostream>       // std::cout
#include <thread>         // std::thread, std::this_thread::sleep_for
#include <chrono>         // std::chrono::seconds

using namespace std;


void pause_thread(int n)
{
  //this_thread::sleep_for (chrono::seconds(n));
  for (int i=1; i<=2000; i++) cout << i << endl;
}

void go(int n){
    for (int i=1; i<=n; i++) cout << i << endl;
    t2.~thread();
}

thread t1 (pause_thread,1);
thread t2(go,1000);

int main()
{

  t2.join();
  t1.join();

  return 0;
}
