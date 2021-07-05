#include <bits/stdc++.h>
#define maxn int(1e5 + 5)
#define INF 1000000000000000001LL

using namespace std;

int n, m, a[maxn];

void Enter()
{
    scanf("%d%d", &n, &m);
    for(int i = 1; i <= n; ++i)scanf("%d", &a[i]);
}

int64_t s[maxn];
int x[maxn];

void Solve()
{
    for(int i = 1; i <= n; ++i)a[i] = (a[i] % m + m) % m;
    sort(a + 1, a + n + 1);
    s[0] = 0;
    for(int i = 1; i <= n; ++i)s[i] = s[i - 1] + a[i];
    for(int i = 1; i <= n; ++i)x[i] = a[i];
    int n1 = unique(x + 1, x + n + 1) - x - 1;
    int64_t ds = INF;
    for(int i = 1; i <= n1; ++i)
    {
        int u = upper_bound(a + 1, a + n + 1, x[i]) - a - 1;
        int64_t val = ((int64_t)u * x[i] - s[u]) + ((int64_t)(n - u) * (x[i] + m) - (s[n] - s[u]));
        ds = min(ds, val);
    }
    printf("%I64d", ds);
}

int main()
{
    Enter();
    Solve();
}
