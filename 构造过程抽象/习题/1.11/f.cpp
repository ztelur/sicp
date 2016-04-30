
/**
 * c++的实现啊，先转换一下思想
 */

int a = 0;
int b = 1;
int c = 2
int f2(int n) {
		int i = 0;
		while(i!=n) {
			inter_f2(i,n);
			i++;
		} 
		return c;
}
int inter_f2(int i,int n) {
	if (i <3) return i;
	int res = c+ 2*b + 3*a;
	a = b;
	b = c;
	c = res;
	return res;
}
