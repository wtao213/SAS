***data bball;
 ** set sashelp.baseball;
 ** if  name in ('Boggs, Wade', 'Mattingly, Don')      then delete;
**run;
data  N1LPGA2008;
 set     _TEMP0.LPGA2008;
 if  _n_ in (10,49,90,120,130,150,154)      then delete;
 **LogWin2 = LogWin**2;
run; 