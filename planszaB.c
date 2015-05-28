#include <stdio.h>
#include <stdlib.h>

#define MAX 8005
#define MOD 1000000103

int w[MAX][MAX], g[MAX][MAX], l[MAX][MAX], u[MAX][MAX];

int valid(int x){
	return x>=0;
}

void policz(int x, int y, int k){
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
	int i, j;
	w[0][0]=1;
	l[0][0]=g[0][0]=u[0][0]=0;
	for(i=0;i<n;i++)
		for(j=0;j<m;j++)
			policz(i, j, k);
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
