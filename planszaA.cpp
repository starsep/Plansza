#include <cstdio>
#include <vector>

const int MOD=1e9+103;

typedef std::vector<std::vector<int> > VV;

bool valid(int x){
	return x>=0;
}

void policz(int x, int y, int k, VV &w, VV &l, VV &g, VV &u){
	if(x+y==0)return;
	if(valid(x-1)){
		g[x][y]=(g[x-1][y]+w[x-1][y])%MOD;
		if(valid(x-k-1))
			g[x][y]=(g[x][y]-w[x-k-1][y]+MOD)%MOD;
	}
	if(valid(y-1)){
		l[x][y]=(l[x][y-1]+w[x][y-1])%MOD;
		if(valid(y-k-1))
			l[x][y]=(l[x][y]-w[x][y-k-1]+MOD)%MOD;
	}
	if(valid(x-1) && valid(y-1)){
		u[x][y]=(u[x-1][y-1]+w[x-1][y-1])%MOD;
		if(valid(x-k-1) && valid(y-k-1))
			u[x][y]=(u[x][y]-w[x-k-1][y-k-1]+MOD)%MOD;
	}
	w[x][y]=((l[x][y]+g[x][y])%MOD+u[x][y])%MOD;
}

int solve(int n, int m, int k){
	VV w(n), l(n), g(n), u(n);
	for(int i=0;i<n;i++){
		w[i].resize(m);
		l[i].resize(m);
		g[i].resize(m);
		u[i].resize(m);
	}
	w[0][0]=1;
	l[0][0]=g[0][0]=u[0][0]=0;
	for(int i=0;i<n;i++)
		for(int j=0;j<m;j++)
			policz(i, j, k, w, l, g, u);
	return w[n-1][m-1];
}

int main(){
	int t, n, m, k;
	scanf("%d",&t);
	while(t--){
		scanf("%d%d%d",&n,&m,&k);
		printf("%d\n",solve(n,m,k));
	}
	return 0;
}
