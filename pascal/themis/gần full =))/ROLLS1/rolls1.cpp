#include <iostream>
#include <map>
using namespace std;

int N, M;
int A[100005];
map<int, int> Mp;

int f(int i, int j) {
	if (i <= j) return j - i;
	return (M - i) + j;
}

int main() {
	ios_base::sync_with_stdio(false); cin.tie(0);
	cin >> N >> M;
	for (int i = 1; i <= N; ++i) { cin >> A[i]; A[i] = (A[i] % M + M) % M; ++Mp[A[i]]; }
	long long sum = 0, ans = 0;
	for (int i = 1; i <= N; ++i) sum += f(A[i], 0);
	ans = sum;
	int last = 0;
	for (auto p: Mp) {
		if (p.first == 0) continue;
		sum += 1LL * N * (p.first - last) - 1LL * M * p.second;
		ans = min(ans, sum);
		last = p.first;
	}
	cout << ans << endl;
}