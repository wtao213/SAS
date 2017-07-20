
/*To stack two datasets vertically (more observations)*/

data stacked;

    set a(in=in1) b(in=in2) c(in=in3) ..... repeat as many as necessary ... ;

    if in1 then grp = 'A';

    else if in2 then grp = 'B';

    else if in3 then grp = 'C';

   /* ... repeat as many as necessary ...*/

run;


/*To split a dataset into pieces:*/

data a b c ... repeat as many as necessary ...;

    set big;

    if condition1 then output a;

    else if condition2 then output b;

    else if condition3 then output c;

    /*... repeat as many as necessary ...

   each condition is some valid comparison, e.g., grp = 'A' or amount >= 0 ... etc.*/
run;