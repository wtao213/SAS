/*****************************************************/
/**		apprentice data summary		    **/
/*****************************************************/
ods noproctitle;
ods graphics / imagemap=on;

proc means data= survey chartype mean std min max n range vardef=df;
	var q70 q71 q72 q73 q73_rev q73_coded q74 q75_1 q75_2 q75_3 q75_4 q75_5 q75_6 
		q75_7 q75_8 q76 q77 q78 q79 q80 q81 q82a q82b  ;
run;	

proc univariate data= survey vardef=df noprint;
	var q70 q71 q72 q73 q73_rev q73_coded q74 q75_1 q75_2 q75_3 q75_4 q75_5 q75_6 
	    q75_7 q75_8 q76 q77 q78 q79 q80 q81 q82a q82b  ;
	histogram q70 q71 q72 q73 q73_rev q73_coded q74 q75_1 q75_2 q75_3 q75_4 q75_5 q75_6 
		q75_7 q75_8 q76 q77 q78 q79 q80 q81 q82a q82b  ;
run;


proc means data= survey_c chartype mean std min max n range vardef=df;
	var /*q70 q71 q72 q73 q73_rev q73_coded q74 q75_1 q75_2 q75_3 q75_4 q75_5 q75_6 
		q75_7 q75_8 q76 q77*/ q78 q79 q80 q81 q82a q82b 
		q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  ;
run;

proc univariate data= survey_c vardef=df noprint;
	var /*q70 q71 q72 q73 q73_rev q73_coded q74 q75_1 q75_2 q75_3 q75_4 q75_5 q75_6 
	    q75_7 q75_8 q76 q77*/ q78 q79 q80 q81 q82a q82b 
	    q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s ;
	histogram /*q70 q71 q72 q73 q73_rev q73_coded q74 q75_1 q75_2 q75_3 q75_4 q75_5 q75_6 
		q75_7 q75_8 q76 q77*/ q78 q79 q80 q81 q82a q82b
		q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s ;
run;

/***********************************************************/
/**		summary for importance answers	 	 **/
/***********************************************************/
ods noproctitle;
ods graphics / imagemap=on;
proc means data= survey chartype mean std min max n range vardef=df;
	var q3i q4i q5i q6i q7i q8i q9i q10i q11i q12i q13i 
		q14i q15i q16i q17i q18i q19i q20i q21i q22i q23i q24i 
		q25i q26i q27i q28i q29i q30i q31i q32i q33i q34i q35i q36i q37i q38i q39i
		q40i q41i q42i q43i q44i q45i q46i q47i q48i q49i ;
run;

proc univariate data= survey vardef=df noprint;
	var q3i q4i q5i q6i q7i q8i q9i q10i q11i q12i q13i 
		q14i q15i q16i q17i q18i q19i q20i q21i q22i q23i q24i 
		q25i q26i q27i q28i q29i q30i q31i q32i q33i q34i q35i q36i q37i q38i q39i
		q40i q41i q42i q43i q44i q45i q46i q47i q48i q49i ;
	histogram q3i q4i q5i q6i q7i q8i q9i q10i q11i q12i q13i 
		q14i q15i q16i q17i q18i q19i q20i q21i q22i q23i q24i 
		q25i q26i q27i q28i q29i q30i q31i q32i q33i q34i q35i q36i q37i q38i q39i
		q40i q41i q42i q43i q44i q45i q46i q47i q48i q49i ;
run; 

proc freq data=WORK.SURVEY;
	tables q3i q4i q5i q6i q7i q8i q9i q10i q11i q12i q13i 
		q14i q15i q16i q17i q18i q19i q20i q21i q22i q23i q24i 
		q25i q26i q27i q28i q29i q30i q31i q32i q33i q34i q35i q36i q37i q38i q39i
		q40i q41i q42i q43i q44i q45i q46i q47i q48i q49i   / missing plots=(freqplot cumfreqplot);
run;

/***********************************************************/
/**                frequency table	               	**/
/***********************************************************/

proc freq data=WORK.SURVEY;
	tables q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  / missing plots=(freqplot cumfreqplot);
run;


/******************************************************/
/**       test on q31:international                  **/
/******************************************************/
ods noproctitle;
ods graphics / imagemap=on;

proc means data= survey chartype mean std min max n range vardef=df;
	var q4s q6s q7s q31s q37s q38s ;
run;	

proc univariate data= survey vardef=df noprint;
	var q4s q6s q7s q31s q37s q38s ;
	histogram q4s q6s q7s q31s q37s q38s ;
run;

/******************************************************************/
/* separate original data set to international/non-international **/
/******************************************************************/

data inter noninter mis78;
set	 WORK.SURVEY;
	/*where q3s ^= .a;*/
	
     if 	q78 = 1 then output inter;
     else if    q78 = 2 then output noninter;
     else 		     output mis78;
run;

/***************************************************************/
/***     graph for answering in q31 under different types     **/
/***************************************************************/
proc tabulate data= survey  missing format=8.2;
 class collcode prgcode trade advanced q78 q79 q31s  q13s q24s q39s q49s;
 var q3s q25s ;
 
 table (q78='student type' all) ,( q31s='international service' all)*(N* f=8. reppctn)
 	/rts=10 box='whole percentage' ;
 
 table (q79='co-op' all),(q13s='section B' all)*(N* f=8. reppctn)
 	/rts=10;
 	
 table (q79='co-op' all),(q24s='section C' all)*(N* f=8. reppctn)
 	/rts=10;
 
 table (q79='co-op' all),(q39s='section D' all)*(N* f=8. reppctn)
 	/rts=10;
 
 table (q79='co-op' all),(q49s='section E' all)*(N* f=8. reppctn)
 	/rts=10;
 
 run;

/****************************************************************/
/**           table under row percentage for international       	**/
/*********************************************************/
proc tabulate data= survey  missing format=10.2;
 class collcode prgcode trade advanced q78 q79 q31s  q13s q24s q39s q49s;
 var q3s q25s ;
 
 table (q78='q78:student type' all),(q31s='q31:international service' all)*(N* f=8. rowpctn)
 	/rts=8;
 
 run;

/****************************************************************/
/**           table under row percentage for co-op       	**/
/*********************************************************/
proc tabulate data= survey  missing format=10.2;
 class collcode prgcode trade advanced q78 q79 q31s  q13s q24s q39s q49s;
 var q3s q25s ;
 
 table (q79='co-op' all),(q13s='section B:q13s' all)*(N* f=8. rowpctn)
 	/rts=8;
 	
 table (q79='co-op' all),(q24s='section C:q24s' all)*(N* f=8. rowpctn)
 	/rts=8;
 
 table (q79='co-op' all),(q39s='section D:q39s' all)*(N* f=8. rowpctn)
 	/rts=8;
 
 table (q79='co-op' all),(q49s='section E:q49s' all)*(N* f=8. rowpctn)
 	/rts=8;
 
 run;
/***********************************************************/
/**      overall question 39 in logistic regression      ***/
/***********************************************************/
ods noproctitle;
ods graphics / imagemap=on;


proc logistic data=survey_c plots(unpack)=all descending;
	model  q39s=q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s/
	link=logit technique=fisher  
	rsquare lackfit ctable stb expb corrb pcorr influence(stdres);
run;

/***********************************************************/
/**  logistic regression after delete as stat suggest     **/
/***********************************************************/
ods noproctitle;
ods graphics / imagemap=on;


proc logistic data=survey_c plots(unpack)=all descending;
	model  q39s=q25s /*q26s q27s*/ q28s /*q29s*/ q30s q31s q32s /*q33s*/ q34s q35s q36s /*q37s*/ q38s/
	link=logit technique=fisher  
	rsquare lackfit ctable stb expb corrb pcorr influence(stdres);
	
run;

/************************************************************/
/**        logistic regression on q25i with q25s         **/
/**********************************************************/
ods noproctitle;
ods graphics / imagemap=on;


proc logistic data=survey_c plots(unpack)=all;
	model  q25i=q25s/
	link=logit technique=fisher  
	rsquare lackfit ctable stb expb corrb pcorr influence(stdres);
run;

proc logistic data=survey_c plots(unpack)=all;
	model  q25i=q25s/
	link=logit technique=fisher  
	rsquare lackfit ctable stb expb corrb pcorr influence(stdres);
run;


