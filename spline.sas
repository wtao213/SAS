data curve;
	do x= -3 to 17 by 0.1;
	output;
	end;
	
call streaminit(456);
do i= 1 to 400;
	x=rand('uniform')*14;
	y= 1 +1*x + 0.8*x**0.8*sin(x-1)+ rand('normal',0,0.5);
	output;
	end;
	
	drop i;
	run;
	
proc sort data=curve;
	by x;
run;

proc sgplot;
	scatter y=y x=x;
	xaxis display=(nolabel); yaxis display=(nolabel);
run;


/*%let x_k1 = 3.5;
%let x_k2 = 5.5;
%let x_k3 = 9;
%let x_k4 = 11.75;
data linear_spline;
	set curve(keep=y x);
	x_i1 = (x > &x_k1);
x_k1 = max( x - &x_k1, 0 );
x_i2 = (x > &x_k2);
x_k2 = max( x - &x_k2, 0 );
x_i3 = (x > &x_k3);
x_k3 = max( x - &x_k3, 0 );
x_i4 = (x > &x_k4);
x_k4 = max( x - &x_k4, 0 );
run;
proc reg data=linear_spline;
steps: model y= x x_k1 x_k2 x_k3 x_k4;
output out=pred p=yhat;
run;

proc sgplot data=pred;
 series x=x y=yhat;
 scatter x=x y=y;
 run;
 */

%let x_k1 = 3.5;
%let x_k2 = 5.5;
%let x_k3 = 9;
%let x_k4 = 11.75;
data linear_spline;
	set curve(keep=y x);
	
x_k1 = (x>&x_k1)*(x-&x_k1)**2;

x_k2 = (x>&x_k2)*(x-&x_k2)**2;

x_k3 =(x>&x_k3)*(x-&x_k3)**2;

x_k4 = (x>&x_k4)*(x-&x_k4)**2;
run;
proc reg data=linear_spline;
steps: model y= x /*x_k1*/ x_k2 /* x_k3*/ x_k4;
output out=pred p=yhat;
run;

proc sgplot data=pred;
 series x=x y=yhat;
 scatter x=x y=y;
 run;