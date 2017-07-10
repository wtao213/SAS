/************************************************/
/**	 frequency test		**/
/*******************************************/
%web_drop_table(WORK.survey);


FILENAME REFFILE'C:/Users/TaoWa/Desktop/2015_16_Appruis.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.surveyuis;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.surveyuis; RUN;

%web_open_table(WORK.surveyuis);

/**************************************/
/**	 frequency test		**/
/*********************************/

%MACRO freq;
%Let iterations = 49;
%Do a = 3 %to &iterations;
proc freq data= WORK.SURVEYUIS ;
	table qi&a*qs&a/ chisq measures;
	run;
%end;

%Let ite = 45;
%Do b = 25 %to &iterations;
proc freq data= WORK.SURVEYUIS ;
	
	table qu&b*qi&b/ chisq measures;
	table qu&b*qs&b/ chisq measures;
	run;
%end;
%mend freq;

%freq;

/**********************************/
/** summary total    **/
/*****************************/















