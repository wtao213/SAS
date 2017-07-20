proc glmselect data= WORK.N1LPGA2008 outdesign(addinputvars)=reg_designa5;
    model Winnings = Rounds GreenReg AvgPutts /*SandSavePct*/
                   / showpvalues selection=backward(select = bic)hierarchy=single;
run;
%put GLSIND is [&_GLSIND];
proc reg data=reg_designa5 plots(maxpoints=none label)=
(diagnostics(unpack) residuals rstudentbypredicted dffits dfbetas observedbypredicted);
 model Winnings = &_GLSIND / influence r collin tol vif stb;
run;
quit;