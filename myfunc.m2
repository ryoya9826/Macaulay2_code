comment = A -> (
		if 1==0 then A
);


badRes = I -> (
		f := gens I;
		L:= {};
		while f != 0 do
		(
			L = append(L,f);
			f =gens ker gens image f
		);
		append(L,f);
		chainComplex(L)
);

comment "by Madeline Brandt, https://math.berkeley.edu/~brandtm/talks/freeres.pdf";

fdef = (i,j,k,l,m,n) -> ( 
		f:= i*j*(i+j)*a-(i^2+i*j+j^2)*b+c; g:=  k*l*(k+l)*a-(k^2+k*l+l^2)*b+c; h:= n*m*(n+m)*a-(n^2+n*m+m^2)*b+c; 
		f*g*h
);

Calc = (i,j,k,l,m,n) -> ( 
		x=fdef (i,j,k,l,m,n); y=fdef(i,k,j,m,l,n); z=fdef(i,j,k,m,l,n); w=fdef(i,k,j,l,m,n); 
		I=ideal(x,y,z,w); 
		C=badRes I;
		M=C.dd_2 ;
		N=matrix{
			{coefficient(a,M_(0,0))*a+coefficient(a,M_(1,0))*b+coefficient(a,M_(2,0))*c+coefficient(a,M_(3,0))*d,coefficient(b,M_(0,0))*a+coefficient(b,M_(1,0))*b+coefficient(b,M_(2,0))*c+coefficient(b,M_(3,0))*d,coefficient(c,M_(0,0))*a+coefficient(c,M_(1,0))*b+coefficient(c,M_(2,0))*c+coefficient(c,M_(3,0))*d},
			{coefficient(a,M_(0,1))*a+coefficient(a,M_(1,1))*b+coefficient(a,M_(2,1))*c+coefficient(a,M_(3,1))*d,coefficient(b,M_(0,1))*a+coefficient(b,M_(1,1))*b+coefficient(b,M_(2,1))*c+coefficient(b,M_(3,1))*d,coefficient(c,M_(0,1))*a+coefficient(c,M_(1,1))*b+coefficient(c,M_(2,1))*c+coefficient(c,M_(3,1))*d},
			{coefficient(a,M_(0,2))*a+coefficient(a,M_(1,2))*b+coefficient(a,M_(2,2))*c+coefficient(a,M_(3,2))*d,coefficient(b,M_(0,2))*a+coefficient(b,M_(1,2))*b+coefficient(b,M_(2,2))*c+coefficient(b,M_(3,2))*d,coefficient(c,M_(0,2))*a+coefficient(c,M_(1,2))*b+coefficient(c,M_(2,2))*c+coefficient(c,M_(3,2))*d}
		};
		det N
);

S = QQ[a,b,c,d];

