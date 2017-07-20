ods html close; ods html;

data quad;
    call streaminit( 888 );

    do i = 1 to 1000;
        x = 8 + rand('uniform') * 10;
        x2 = x**2;
        y = -500 + 2*x + 8*x2 + rand('normal', 0, 100) ;
        output;
    end;
run;

proc sgplot data=quad;
    scatter x=x y=y;
run;

*--- Regression ---;

proc reg data=quad;
    model y = x x2 / vif tol collin stb;
    output out=p1 p=p;
run; quit;

*--- Center X---;

proc stdize data=quad method=mean out=quads oprefix sprefix=s;
    var x;
run;

data quads;
    set quads;
    sx2 = sx**2;
run;

*--- Regression with centered data ---;

proc reg data=quads;
    model y=sx sx2 / vif tol collin stb;
    output out=p2 p=p;
run; quit;

proc compare base=p1 compare=p2 method=percent crit=0.0001;
run;
