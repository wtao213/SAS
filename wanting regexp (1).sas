ods html close; ods html;
data _null_;
	file print;
	input Zip $10.;
    put zip $char10. +3 @;

	if prxmatch ("/\d{5}(-\d{4})?/", Zip) then put 'pass';
                                          else put 'fail';
datalines;
12345
32512-3214
12zz5
asdfg
08822
12345-asdf
;

/*---

1) I always use $char10. instead of $10. 
   $char10. preserves leading blanks
   $10. does not
   I want those exact positions, don't want SAS to jump around for me.
   Exert control.

2) Pay attention to blanks and boundaries.
   I like to remove trailing blanks using trimn() not trim().
   This affects regexp matching as blanks are significant even at end of string
   (visually we ignore it but it is there!!! trailing blanks causes many headaches)

3) I am testing explicitly for begin and end of string after I trim it.
   This is being very careful to test for exactly 5 (your code fails on 6)
   and exactly 5-4

4) You can see my coding style always uses arrays to eliminate code copy paste.
   I also use a trailing @ to hold the same print line.

5) r2, r3 are the two separate regexp
   r4 is simple combine of r2 and r3
   r5 is deeper combine

Your problem is ? tests for 1 or 0 times, and 0 times means regexp will accept failing the test!!!
This is not what you want.
 
---*/

data _null_;
    if _n_ = 1 then do;
        rexp1 = prxparse( "/\d{5}(-\d{4})?/" );
        rexp2 = prxparse( "/(^\d{5}$)/" );
        rexp3 = prxparse( "/(^\d{5}-\d{4}$)/" );
        rexp4 = prxparse( "/(^\d{5}$)|(^\d{5}-\d{4}$)/" );
        rexp5 = prxparse( "/^\d{5}($|-\d{4}$)/" );

        retain rexp: ;
        array rexp[*] rexp: ;
    end;

	file print;
	input zip $char15.;
    put zip $char15. @;

    do i = 1 to hbound(rexp);
    if prxmatch( rexp[i], trimn(zip) ) then put +4 "pass" +1 i 1. @;
                                       else put +4 "fail" +1 i 1. @;
    end;
    put;    /* release this line  */
datalines;
12345
32512-3214
12zz5
asdfg
08822
12345-asdf
123456
1234567
12345-1234
12345-12345
12345-123456
;


/*--- doesn't trim the string, explicitly consider possible blanks ---*/
data _null_;
    if _n_ = 1 then do;
        rexp1 = prxparse( "/\d{5}(-\d{4})?/" );
        rexp2 = prxparse( "/(^\d{5} *$)/" );
        rexp3 = prxparse( "/(^\d{5}-\d{4} *$)/" );
        rexp4 = prxparse( "/(^\d{5} *$)|(^\d{5}-\d{4} *$)/" );
        rexp5 = prxparse( "/^\d{5}( *$|-\d{4} *$)/" );

        retain rexp: ;
        array rexp[*] rexp: ;
    end;

	file print;
	input zip $char15.;
    put zip $char15. @;

    do i = 1 to hbound(rexp);
    if prxmatch( rexp[i], zip ) then put +4 "pass" +1 i 1. @;
                                else put +4 "fail" +1 i 1. @;
    end;
    put;    /* release this line  */
datalines;
12345
32512-3214
12zz5
asdfg
08822
12345-asdf
123456
1234567
12345-1234
12345-12345
12345-123456
;
