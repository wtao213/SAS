proc fastclus data=cp out=cluster17 outstat= clua7 
	maxclusters=6
	L=2 maxiter=50; 
run;
 
/*--- PCA analysis storing result ---;
proc princomp data=_TEMP0.DEV1 out=dev_pca_score
 outstat=dev_pca_stat plots=all;
 run;*/
 
proc means data=cluster17 n mean std var; 
run;
proc print data=clua7; run;
/*--- Use PCA result on dataset ---;
proc score data=new1 score=dev_pca_score 
out=dev_pca_score_from_stat; run;
*--- Proof of result is correct ---;
proc compare base=dev_pca_score compare=dev_pca_score_from_stat
run;