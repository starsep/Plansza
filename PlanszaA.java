import java.util.Scanner;

public class PlanszaA {
	
	public static final int MOD=1000000103;
	
	public static boolean valid(int x){
		return x>=0;
	}
	
	public static void policz(int x, int y, int k, int[][] w, int[][] l, int[][] g, int[][] u)
	{
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
	
	public static int solve(int n, int m, int k){
		int[][] w = new int[n][];
		int[][] l = new int[n][];
		int[][] g = new int[n][];
		int[][] u = new int[n][];
		
		for(int i=0;i<n;i++){
			w[i] = new int[m];
			l[i] = new int[m];
			g[i] = new int[m];
			u[i] = new int[m];
		}
		w[0][0]=1;
		l[0][0]=g[0][0]=u[0][0]=0;
		for(int i=0;i<n;i++)
			for(int j=0;j<m;j++)
				policz(i, j, k, w, l, g, u);
		return w[n-1][m-1];
	}
	
	public static void main(String[] args){
		int t, n, m, k;
		Scanner in = new Scanner(System.in);
		t = in.nextInt();
		for(int i=0;i<t;i++){
			n = in.nextInt();
			m = in.nextInt();
			k = in.nextInt();
			System.out.println(solve(n, m, k));
		}
	}
}
