proc logistic data= WORK.PENALTY(obs=500) simple plots(only)=(roc); model death(event='1') = defendant victim serious serious2 culp
           / rsquare lackfit ctable stb expb corrb pcorr;
     output out=scores predicted=_prob;
run;
 proc sort data= WORK.SCORES;
     by descending _prob;
run;
/*---generate KS statistic and non-industry practicee graph---*/
proc npar1way data= WORK.SCORES ks plots(only)=(edfPlot);
 class death ; /* target */
var _prob; /* probability */
run;