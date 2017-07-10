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


/*******************************70-82*********************/
proc freq data=WORK.SURVEY;
	tables q72 q73 q73_rev q73_coded q74 q75_1 q75_2 q75_3 q75_4 q75_5 q75_6 
	    q75_7 q75_8 q76 q77 q78 q79 q80 q81 q82a q82b  / plots=(freqplot cumfreqplot);
run;
/******************************************************/
/** Q: which section havee hight complete number?   **/
/******************************************************/

/******************************************************/
/**    missing data for q3s to q14s in survey        **/
/******************************************************/
ods noproctitle;

proc format ;
	value _nmissprint low-high="Non-missing";
run;

proc freq data=survey;
	title3 "Missing Data Frequencies";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q9s q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s  _nmissprint.;
	tables q9s q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s / missing nocum;
run;

proc freq data=survey noprint;
	table q9s * q3s * q4s * q5s * q6s * q7s * q8s *q9s* q10s* q11s* q12s* q13s / missing out=Work._MissingData_;
	format q9s q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s  _nmissprint.;
run;

proc print data=Work._MissingData_ noobs label;
	title3 "Missing Data Patterns across Variables";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q9s q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s _nmissprint.;
	label count="Frequency" percent="Percent";
run;

title3;

/*** Clean up ***/
proc delete data=Work._MissingData_;
run;

/******************************************************/
/**    missing data for q14s to q24s in survey        **/
/******************************************************/
ods noproctitle;

proc format ;
	value _nmissprint low-high="Non-missing";
run;

proc freq data=survey;
	title3 "Missing Data Frequencies";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q14s q15s q16s q17s q18s q19s q20s q21s q22s q23s q24s _nmissprint.;
	tables q14s q15s q16s q17s q18s q19s q20s q21s q22s q23s q24s / missing nocum;
run;

proc freq data=survey noprint;
	table q14s* q15s* q16s* q17s* q18s* q19s* q20s* q21s* q22s* q23s* q24s / missing out=Work._MissingData_;
	format q14s q15s q16s q17s q18s q19s q20s q21s q22s q23s q24s _nmissprint.;
run;

proc print data=Work._MissingData_ noobs label;
	title3 "Missing Data Patterns across Variables";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q14s q15s q16s q17s q18s q19s q20s q21s q22s q23s q24s _nmissprint.;
	label count="Frequency" percent="Percent";
run;

title3;

/*** Clean up ***/
proc delete data=Work._MissingData_;
run;


/******************************************************/
/**    missing data for q25s to q39s in survey        **/
/******************************************************/
ods noproctitle;

proc format ;
	value _nmissprint low-high="Non-missing";
run;

proc freq data=survey;
	title3 "Missing Data Frequencies";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s _nmissprint.;
	tables q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s / missing nocum;
run;

proc freq data=survey noprint;
	table q25s* q26s* q27s* q28s* q29s* q30s* q31s *q32s* q33s *q34s *q35s* q36s *q37s *q38s* q39s/ missing out=Work._MissingData_;
	format q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s _nmissprint.;
run;

proc print data=Work._MissingData_ noobs label;
	title3 "Missing Data Patterns across Variables";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s _nmissprint.;
	label count="Frequency" percent="Percent";
run;

title3;

/*** Clean up ***/
proc delete data=Work._MissingData_;
run;


/******************************************************/
/**    missing data for q40s to q49s in survey        **/
/******************************************************/
ods noproctitle;

proc format ;
	value _nmissprint low-high="Non-missing";
run;

proc freq data=survey;
	title3 "Missing Data Frequencies";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  _nmissprint.;
	tables q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  / missing nocum;
run;

proc freq data=survey noprint;
	table q40s* q41s* q42s *q43s* q44s *q45s* q46s* q47s *q48s* q49s/ missing out=Work._MissingData_;
	format q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  _nmissprint.;
run;

proc print data=Work._MissingData_ noobs label;
	title3 "Missing Data Patterns across Variables";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  _nmissprint.;
	label count="Frequency" percent="Percent";
run;

title3;

/*** Clean up ***/
proc delete data=Work._MissingData_;
run;


/*************************************************/
/* analysis on straightline + missing data set   */
/*************************************************/
ods noproctitle;
ods graphics / imagemap=on;

proc means data= WORK.SAME_B chartype mean std min max n range vardef=df;
	var  q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s;
run;

proc univariate data= WORK.SAME_C vardef=df noprint;
	var q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s;
	histogram q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s;
run;

proc means data= WORK.SAME_D chartype mean std min max n range vardef=df;
	var  q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s ;
run;

proc means data= WORK.SAME_E chartype mean std min max n range vardef=df;
	var  q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s;
run;


/*****************************************************/
/**              overall response number          ***/
/****************************************************/
ods noproctitle;
ods graphics / imagemap=on;

proc means data= survey chartype mean std min max n range vardef=df;
	var q3i q4i q5i q6i q7i q8i q9i q10i q11i q12i q13i q3s q4s q5s q6s 
		q7s q8s q9s q10s q11s q12s q13s q14i q15i q16i q17i q18i q19i q20i q21i q22i 
		q23i q24i q14s q15s q16s q17s q18s q19s q20s q21s q22s q23s q24s q25u q26u 
		q27u q28u q29u q30u q31u q32u q33u q34u q35u q36u q37u q38u q25i q26i q27i 
		q28i q29i q30i q31i q32i q33i q34i q35i q36i q37i q38i q39i q25s q26s q27s 
		q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s q40u q41u q42u 
		q43u q44u q45u q40i q41i q42i q43i q44i q45i q46i q47i q48i q49i q40s q41s 
		q42s q43s q44s q45s q46s q47s q48s q49s ;
run;

proc factor data= survey out=b nfactors=5 plots=all m=ml rotate=varimax;
	var q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  q50s q51s ;
run;

/*********************************************************/
/** overall missing value check    ***/
/*************************************/
ods noproctitle;

proc format ;
	value _nmissprint low-high="Non-missing";
run;

proc freq data=survey;
	title3 "Missing Data Frequencies";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  q50s q51s _nmissprint.;
	tables q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  q50s q51s/ missing nocum;
run;

proc freq data=survey noprint;
	table q3s* q4s* q5s* q6s* q7s* q8s* q9s* q10s* q11s* q12s *q13s* q14s* q15s *q16s *q17s *q18s* q19s* q20s *q21s* q22s*
	    q23s* q24s *q25s* q26s* q27s* q28s* q29s* q30s* q31s *q32s* q33s *q34s *q35s* q36s *q37s *q38s* q39s *
	    q40s* q41s* q42s *q43s* q44s *q45s* q46s* q47s *q48s* q49s*  q50s* q51s/ missing out=Work._MissingData_;
	format q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  q50s q51s _nmissprint.;
run;

proc print data=Work._MissingData_ noobs label;
	title3 "Missing Data Patterns across Variables";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format q3s q4s q5s q6s q7s q8s q9s q10s q11s q12s q13s q14s q15s q16s q17s q18s q19s q20s q21s q22s
	    q23s q24s q25s q26s q27s q28s q29s q30s q31s q32s q33s q34s q35s q36s q37s q38s q39s 
	    q40s q41s q42s q43s q44s q45s q46s q47s q48s q49s  q50s q51s _nmissprint.;
	label count="Frequency" percent="Percent";
run;

title3;

/*** Clean up ***/
proc delete data=Work._MissingData_;
run;



/**************************************************/
/** delete obs when at leat one value is missing **/
/**************************************************/

data nomiss_data;                    
set survey;   
if cmiss(of q3s,q4s ,q5s, q6s, q7s, q8s, q9s, q10s ,q11s ,q12s ,q13s, 
	q14s, q15s, q16s ,q17s, q18s ,q19s, q20s ,q21s ,q22s ,q23s ,q24s,
	 q25s, q26s, q27s ,q28s, q29s, q30s, q31s, q32s, q33s, q34s, q35s, q36s, q37s ,q38s ,q39s ,
	 q40s, q41s, q42s ,q43s, q44s, q45s ,q46s ,q47s, q48s, q49s   ) then delete;
run;

data nsame_B nsame_C nsame_D nsame_E  nsurvey_c;
set	 nomiss_data;
	/*where q3s ^= .a;*/
	
     if range(of q3s,q4s ,q5s, q6s, q7s, q8s, q9s, q10s ,q11s ,q12s ,q13s ) = 0 then output nsame_B;
     else if range (of q14s, q15s, q16s ,q17s, q18s ,q19s, q20s ,q21s ,q22s ,q23s ,q24s ) =0 then output nsame_C;
     else if range (of q25s, q26s, q27s ,q28s, q29s, q30s, q31s, q32s, q33s, q34s, q35s, q36s, q37s ,q38s ,q39s  ) =0 then output nsame_D;
     else if range (of q40s, q41s, q42s ,q43s, q44s, q45s ,q46s ,q47s, q48s, q49s  ) =0 then output nsame_E;
     else output nsurvey_c;
run;


data nsame_B nsame_C nsame_D nsame_E  nsurvey_c;
set	 nomiss_data;
	/*where q3s ^= .a;*/
	
     /*if range(of q3s,q4s ,q5s, q6s, q7s, q8s, q9s, q10s ,q11s ,q12s ,q13s ) = 0 then output nsame_B;
     else if range (of q14s, q15s, q16s ,q17s, q18s ,q19s, q20s ,q21s ,q22s ,q23s ,q24s ) =0 then output nsame_C;
     else if range (of q25s, q26s, q27s ,q28s, q29s, q30s, q31s, q32s, q33s, q34s, q35s, q36s, q37s ,q38s ,q39s  ) =0 then output nsame_D;
     else*/ if range (of q40s, q41s, q42s ,q43s, q44s, q45s ,q46s ,q47s, q48s, q49s  ) =0 then output nsame_E;
     else output nsurvey_c;
run;