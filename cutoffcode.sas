DATA New_Predection_with_NewCutoff;
 Set Work.<your output file name>;
 /*IP_<your target>*/
 IF IP_isADmit GT 0.42
 /* pred_<your target> is new custom variable define by your */
    Then pred_isAdmit = 1;
    Else pred_isAdmit = 0;
 run;