proc princomp data=  WORK.DEV_VAR
       out=dev_pca_score outstat=dev_pca_stat
       plots(only)=(scree
                    pattern(ncomp=5)
score(ellipse ncomp=5));
run;
proc means data=dev_pca_score n mean std var; 
run;
proc print data=dev_pca_stat; run;
*--- Use PCA result on dataset ---;
proc score data= _TEMP0.NEW1 score=dev_pca_stat 
out=dev_pca_score_from_stat;
run;

