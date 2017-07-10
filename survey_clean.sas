/******************************************************/
/***          import CSV file                       ***/
/******************************************************/
%web_drop_table(WORK.survey);


FILENAME REFFILE'C:/Users/TaoWa/Desktop/2015_16_Apprenticeship_Data_mr.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.survey;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.survey; RUN;

%web_open_table(WORK.survey);

/*******************************************************************************/
/**		data summary,total 22 colleges,			    **/
/******************************************************************************/
proc tabulate data= survey missing ;
 class collcode prgcode trade advanced;
 var q13s q24s;
 tables collcode,advanced*(N );
 tables trade, advanced*(N );
 run;


proc tabulate data= survey_c  ;
 class collcode prgcode trade advanced;
 var q13s q24s q39s q49s;
 tables collcode,(q13s q24s q39s q49s)*(N );
 tables trade, (q13s q24s q39s q49s)*(N );
 run;

/***************************************************/
/**        dealing with straightline in dataset   **/
/**       missing value inside are not consider,  **/
/** but if any missing value exist,will be omited **/
/** from factor analysis, so straightline and missing values are not used inside   **/
/***************************************************/
data same_B same_C same_D same_E  survey_c;
set	 WORK.SURVEY;
	/*where q3s ^= .a;*/
	
     if range(of q3s,q4s ,q5s, q6s, q7s, q8s, q9s, q10s ,q11s ,q12s ,q13s ) = 0 then output same_B;
     else if range (of q14s, q15s, q16s ,q17s, q18s ,q19s, q20s ,q21s ,q22s ,q23s ,q24s ) =0 then output same_C;
     else if range (of q25s, q26s, q27s ,q28s, q29s, q30s, q31s, q32s, q33s, q34s, q35s, q36s, q37s ,q38s ,q39s  ) =0 then output same_D;
     else if range (of q40s, q41s, q42s ,q43s, q44s, q45s ,q46s ,q47s, q48s, q49s  ) =0 then output same_E;
     else output survey_c;
run;


/*******************************************************/
/**		factor analysis			      **/
/*******************************************************/

proc factor data= WORK.survey_c  nfactors=5 plots=all m=ml rotate=varimax;
	var q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  q50s q51s ;
	    /*pathdiagram fuzz=0.4 title='Directed Paths with Loading Greater than 0.4';*/
run;

/**************************************************************/
/* as q50,51 is outlier from rotate, delete and let factors=4 */
/**************************************************************/

proc factor data= WORK.survey_c out=b nfactors=4 plots=all  m=ml rotate=varimax;
	var q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  /*q50s q51s*/ ;
	    pathdiagram fuzz=0.4 title='Directed Paths with Loading Greater than 0.4';
run;

/***************************************************************************/
/** test only on section B+C to see whether same thing(larger sample size **/
/***************************************************************************/
proc factor data= WORK.survey_c out=b nfactors=2 plots=all m=ml rotate=varimax;
	var q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s /*q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s*/  /*q50s q51s*/ ;
	    pathdiagram fuzz=0.4;
run;

proc factor data= WORK.survey_c plots=all m=ml rotate=varimax;
	var q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s /*q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s*/  /*q50s q51s*/ ;
run;


/********************************************************************************/
/***          test whether q3i(cat) is related to q3s(cat)                    ***/
/**    test whether importanct question is association with satisfy questions  **/
/********************************************************************************/
proc freq data= WORK.SURVEY;
	table q3i*q3s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q4i*q4s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q13i*q13s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q15i*q15s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q17i*q17s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;


/******************************************************************************/
/**  test whther usage,important,satisfy question are related or not         **/
/**                     question 25-38, qestion 40-45			     **/
/**  		         	 correlation test on q25	     	     **/
/******************************************************************************/
proc freq data= WORK.SURVEY;
	table q25i*q25s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q25u*q25s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q25u*q25i/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q31i*q31s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

proc freq data= WORK.SURVEY;
	table q31u*q31s/ chisq measures
	plots=(freqplot(twoway = groupvertical scale=percent));
run;

/***************************************************************************************************/
/*** factor analysis after removing all the question professor want to remove( higer than 40%)  **/
/**************************************************************************************************/
proc factor data= WORK.survey_c out=b nfactors=4 plots=all m=ml rotate=varimax;
	var q3s /*q4s*/ /*q5s*/ /*q6s*/ /*q7s*/ q8s q9s q10s q11s /*q12s*/ q13s q14s q15s q16s q17s q18s q19s q20s q21s /*q22s*/
	    q23s q24s q25s q26s q27s q28s q29s q30s /*q31s*/ q32s q33s q34s q35s /*q36s*/ /*q37s*/ /*q38s*/ q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  /*q50s q51s*/ ;
run;

proc factor data= WORK.survey_c plots=all m=ml rotate=varimax;
	var q3s /*q4s*/ /*q5s*/ /*q6s*/ /*q7s*/ q8s q9s q10s q11s /*q12s*/ q13s q14s q15s q16s q17s q18s q19s q20s q21s /*q22s*/
	    q23s q24s q25s q26s q27s q28s q29s q30s /*q31s*/ q32s q33s q34s q35s /*q36s*/ /*q37s*/ /*q38s*/ q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  /*q50s q51s*/ ;
run;

/******************************************************************/
/** change percentage after deleting question as professor want  **/
/** original model, model after deleting professor want          **/
/** overall question is dependent variable for each section      **/
/**            overall querstions: q13, q24, q39, q49            **/
/******************************************************************/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(diagnostics residuals 
		rstudentbypredicted observedbypredicted);
	model q13s= q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s /;
	run;
quit;

proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(diagnostics residuals 
		rstudentbypredicted observedbypredicted);
	model q13s= q3s /*q4s*/ /*q5s*/ /*q6s*/ /*q7s*/ q8s q9s q10s q11s /*q12s*//;
	run;
quit;
/*************************************************************************/
/***                    delete as stat suggest                        ***/
/************************************************************************/
proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(diagnostics residuals 
		rstudentbypredicted observedbypredicted);
	model q13s= q3s q4s q5s /*q6s q7s*/ q8s q9s q10s /*q11s*/ q12s /;
	run;
quit;

/****************************************************************/
/**                 test on q24                                **/
/****************************************************************/

ods noproctitle;
ods graphics / imagemap=on;

proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(observedbypredicted);
	model q24s= q14s q15s q16s q17s q18s q19s q20s q21s q22s q23s/;
	run;
quit;


proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=( observedbypredicted);
	model q24s= q14s q15s q16s q17s q18s q19s q20s q21s /*q22s*/ q23s/;
	run;
quit;
/*************************************************************************/
/***                    delete as stat suggest                        ***/
/************************************************************************/
proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=( observedbypredicted);
	model q24s= q14s q15s /*q16s*/ q17s q18s q19s q20s /*q21s q22s*/ q23s/;
	run;
quit;

/****************************************************************/
/**                 test on q39                                **/
/****************************************************************/

ods noproctitle;
ods graphics / imagemap=on;

proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(observedbypredicted);
	model q39s= q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s /;
	run;
quit;


proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=( observedbypredicted);
	model q39s= q25s q26s q27s q28s q29s q30s /*q31s*/ q32s q33s q34s q35s /*q36s*/ /*q37s*/ /*q38s*/ /;
	run;
quit;

/*************************************************/
/** q39 linear regression auto select	   ****/
/*************************************************/
ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=WORK.SURVEY_C outdesign(addinputvars)=Work.reg_design 
		plots=(criterionpanel);
	model q39s= q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s  / showpvalues selection=backward
    
   (select=bic);
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		fitplot observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot FitPlot ObservedByPredicted;
	model q39s=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;


/*************************************************************************/
/***                    delete as stat suggest                        ***/
/************************************************************************/
proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=( observedbypredicted);
	model q39s= q25s q26s q27s q28s q29s q30s q31s /*q32s*/ q33s q34s q35s /*q36s*/ q37s q38s /;
	run;
quit;

/****************************************************************/
/**                 test on q49                                **/
/****************************************************************/

ods noproctitle;
ods graphics / imagemap=on;

proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(observedbypredicted);
	model q49s=q40s q41s q42s q43s q44s q45s q46s q47s q48s   /;
	run;
quit;


proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=( observedbypredicted);
	model q49s= q40s q41s q42s q43s q44s q45s q46s q47s q48s   /;
	run;
quit;

/****************************************************************/
/**                 test on q50                               **/
/****************************************************************/

ods noproctitle;
ods graphics / imagemap=on;

proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(observedbypredicted);
	model q50s=q49s q39s q24s q13s /;
	run;
quit;



proc logistic data=WORK.SURVEY_C;
	model q50i =q49i q39i q24i q13i  / link=logit technique=fisher;
run;
/****************************************************************/
/**                 test on q51                               **/
/****************************************************************/

ods noproctitle;
ods graphics / imagemap=on;

proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=(observedbypredicted);
	model q51s=q49s q39s q24s q13s /;
	run;
quit;


proc logistic data=WORK.SURVEY_C;
	model q51i =q49i q39i q24i q13i  / link=logit technique=fisher;
run;

/*************************************************************************/
/***                    delete as stat suggest                        ***/
/************************************************************************/
proc reg data=WORK.SURVEY_C alpha=0.05 plots(only)=( observedbypredicted);
	model q49s= q40s q41s q42s q43s q44s q45s q46s q47s q48s/;
	run;
quit;
