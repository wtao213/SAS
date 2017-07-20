filename data 'C:\Users\sophia\Desktop\vote.dat';
libname  v    '.';

data v.vote;
    label   Vote     = '% of votes captured'
            Win      = 'Indicator of Vote >= 40%'
            Age      = 'Average age of voters'
            Saving   = 'Average Savings'
            Income   = 'Average Income'
            Poverty  = '% in poverty'
            Veteran  = '% veterans'
            Female   = '% female'
            Nurshome = '% living in nursing home'
            Density  = 'Population Density'
            Crime    = 'Crime rate'
        ;

    length state $ 2;

    infile data;
    
    input county $  1-24
          vote      40-45
          age       47-51
          saving    55-60
          income    63-68
          poverty   72-76
          veteran   80-84
          female    88-93                          
          density   96-102
          nurshome  106-110
          crime     117-119
      ;
    
    win      = ( vote >= 40 );
    state    = scan( county, -1 );
run;
