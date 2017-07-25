/* Generated Code (IMPORT) */
/* Source File: oyap_completions.csv */
/* Source Path: C:/Users/TaoWa/Desktop */
/* Code generated on: 7/21/17, 9:56 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE 'C:/Users/TaoWa/Desktop/oyap_completions.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

/****************************************/
/*      remove duplicate		*/
/****************************************/
proc sort data= import
	  output = nodup
	  nodupkey;
     by appr_client;
run;

proc tabulate data=nodup missing;
	class registered_ta trade trade_name pp_status pp_status_date oyap_status 
		oyap_status_date school_board_name gender client_pref_lang edu_lvl 
		edu_lvl_grp client_identy lvl_completed oyap start_time end_time 
		months_to_complete months_to_comp_group ;
	var cur_age sb_id appr_client;
	where oyap_status ~= "ACT";
	where cur_age < 21 ;
	
	table (oyap all), (gender all);
	
	table (school_board_name all), (oyap all);
run;



/*****************************************************************************/
/** total number of individuals with an  OYAP "flag" by gender/region/trade **/
/*****************************************************************************/

proc tabulate data=nodup missing order=freq format=8.2;
	class registered_ta trade trade_name pp_status pp_status_date oyap_status 
		oyap_status_date school_board_name gender client_pref_lang edu_lvl 
		edu_lvl_grp client_identy lvl_completed oyap start_time end_time 
		months_to_complete months_to_comp_group ;
	var cur_age sb_id appr_client;
	
	/* filter of original data */
	where oyap_status ~= "ACT";
	
	table (trade all), ( oyap all)*(n*f=8. reppctn)/rts=10;
	
	/* gender & finished level 1 or not */
	table (gender all), ( oyap all)*(n*f=8. reppctn)/rts=10;
	
	/* school board & finished level 1 or not */
	table (school_board_name all), ( oyap all)*(n*f=8. reppctn)/rts=10;
	
	/* RTA & finished level 1 or not*/
	table (registered_ta all),(oyap all)*(n*f=8. reppctn)/rts=10;
	
	table (oyap_status all), (oyap all)*(n*f=8. reppctn)/rts=10;

run;


/*************************************************************/
/**		analysis on gender			**/
/*********************************************************/
proc tabulate data=nodup missing order=freq format=8.2;
	class registered_ta trade trade_name pp_status pp_status_date oyap_status 
		oyap_status_date school_board_name gender client_pref_lang edu_lvl 
		edu_lvl_grp client_identy lvl_completed oyap start_time end_time 
		months_to_comp_group months_to_complete;
	var cur_age sb_id appr_client ;
	
	where oyap_status ~= "ACT";
	
	/*table (gender all),(months_to_complete*mean*f=8.1);*/
	
	table (gender all),(n cur_age*mean*f=8.1);
	
	table (trade all), (gender all)*(n*f=8. rowpctn)/rts=8;
	
	table (registered_ta all),(gender all)*(n*f=8. reppctn)/rts=10;
	
	table (gender all), (trade all)*(n*f=8. rowpctn)/rts=8;

run;


/*****************************************************************/
/**			analysis on RTA				**/
/*****************************************************************/
proc tabulate data=nodup missing order=freq format=8.2;
	class registered_ta trade trade_name pp_status pp_status_date oyap_status 
		oyap_status_date school_board_name gender client_pref_lang edu_lvl 
		edu_lvl_grp client_identy lvl_completed oyap start_time end_time 
		months_to_comp_group months_to_complete;
	var cur_age sb_id appr_client ;
	
	where oyap_status ~= "ACT";
	
	/*table (gender all),(months_to_complete*mean*f=8.1);*/
	
	table (registered_ta  all),(n cur_age*mean*f=8.1);
	
	table (trade all), (registered_ta  all)*(n*f=8. rowpctn)/rts=8;
	
	table (registered_ta all),(gender all)*(n*f=8. reppctn)/rts=10;
	
	table (registered_ta  all), (trade all)*(n*f=8. rowpctn)/rts=8;
	
	table (registered_ta  all), (oyap all)*(n*f=8. rowpctn)/rts=8;

run;

/********************************************************/
/*   trade and shool board complete rate    */
/************************************************/
proc tabulate data=nodup missing order=freq format=10.2;
	class registered_ta trade trade_name pp_status pp_status_date oyap_status 
		oyap_status_date school_board_name gender client_pref_lang edu_lvl 
		edu_lvl_grp client_identy lvl_completed oyap start_time end_time 
		months_to_complete months_to_comp_group ;
	var cur_age sb_id appr_client;
	
	where oyap_status ~= "ACT";
	
	table (school_board_name all), ( oyap all)*(n*f=8. rowpctn)/rts=8;
	
	table (trade all), ( oyap all)*(n*f=8. rowpctn)/rts=8;
	
	table (oyap all), (trade all)*(n*f=8. rowpctn)/rts=8;
run;
	
/**************************************************/

ods graphics on / width=7in height=5in;
proc sgplot data=import;
	vbar gender/ group = oyap groupdisplay = cluster
	     datalabel categoryorder=respdesc;
	title " Total number of individuals with an OYAP flag by gender";
run;


ods graphics on / width=9in height=50in;
proc sgplot data=import ;
	hbar trade/ group = oyap groupdisplay = cluster
	datalabel categoryorder=respdesc;
	title " Total number of individuals with an OYAP flag by trade";
run;

ods graphics on / width=12in height=20in;
proc sgplot data=import ;
	hbar school_board_name / group = oyap groupdisplay = cluster;
	title " Total number of individuals with an OYAP flag by trade";
run;


ods graphics on / width=5in height=6in;

/**********************************************/
/* remove records with act in oyap status  */
/*******************************************/

/******************************************************************/
/**		summary of oyap data				  **/
/********************************************************************/
proc freq data=nodup order=freq;
	where oyap_status ~= "ACT";
	tables registered_ta trade pp_status oyap_status school_board_name cur_age 
		gender client_pref_lang edu_lvl edu_lvl_grp client_identy lvl_completed oyap 
		 / plots=(freqplot 
		);
run;


/**********************************************/
/* remove records with act in oyap status  */
/*******************************************/
proc freq data=nodup order=freq;
	where oyap_status ~= "ACT"; /* 93% of them didn't fifnish */
	tables  months_to_complete months_to_comp_group / plots=(freqplot 
		);
run;	

/*********************************************************/
/**    logistic regression on oyap finish level 1     **/
/********************************************************/
/*ods graphics/ imagemap = off;
proc logistic data = import plots(unpack) = all;
	class oyap trade gender months_to_comp_group;
	
	model oyap = cur_age trade gender months_to_comp_group /
	link=logit technique=fisher rsquare lackfit ctable stb expb corrb pcorr influence;
run;


/*****************************************************/
/** comparison with data finish level 1  **/
/*********************************************/
%web_drop_table(WORK.coml1);


FILENAME REFFILE 'C:/Users/TaoWa/Desktop/ExcelFile_2017-07-21T15_20_44.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.coml1;
	GETNAMES=YES;
	guessingrows= 40275;
RUN;

PROC CONTENTS DATA=WORK.coml1; RUN;


%web_open_table(WORK.coml1);

/*********************************************/
/* calculate the finish age for apprentice  **/
/*********************************************/

data new;
set coml1;
 /*input (start_time end_time) (date11. +1);
  age = ((end_time - start_time)/365.25);
 format start_time end_time date11.;
 datalines;*/
 age_finish = round((end_time - dob)/365.25, 1);
 
 run;
 
 
proc tabulate data=new missing order=freq format=8.2;
	class trade gender oyap months_to_comp_group;
	var cur_age ;
	
	/* filter of original data */
	where  oyap = ""   ; 
	
	table (trade gender all), ( oyap all)*(n*f=8. reppctn)/rts=10;

run;	
	
	
proc tabulate data=new missing order=freq format=8.2;
	class trade gender oyap months_to_comp_group;
	var cur_age ;
	
	/* filter of original data */
	where  oyap = "SP_OYAP"   ; 
	
	table (trade gender all), ( oyap all)*(n*f=8. reppctn)/rts=10;

run;	
	
	
/*************************************************/
/**           compare oyap with overall        	***/
/**************************************************/	
proc tabulate data=new missing  format=8.2;
	class trade gender oyap months_to_comp_group ;
	var cur_age age_finish months_to_complete;
	
	/* gender distribution for oyap or not */
	table (gender all), ( oyap all)*(n*f=8. reppctn)/rts=10;
	
	/* agerage age when apprentices finished level 1 */
	table (oyap all),(n age_finish*mean*f=8.1);
	
	table (oyap all),(n months_to_complete*mean*f=8.1);
	
	table (months_to_comp_group all), (oyap all)*(n*f=8. reppctn)/rts=10;
	
	table (oyap all),(months_to_comp_group all)*(n*f=8. reppctn)/rts=10;

run;
 
	
