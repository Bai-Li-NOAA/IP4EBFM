#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Dec 06 13:43:57 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1670352237 first rand#: -1.48092
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1.0001 #_spawn_month
-1 #_Ngenders: 1, 2, -1  (use -1 for 1 sex setup with SSB multiplied by female_frac parameter)
7 #_Nages=accumulator age, first age is always age 0
1 #_Nareas
3 #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=predator(M2) 
#_sample_timing: -1 for fishing fleet to use season-long catch-at-age for observations, or 1 to use observation month;  (always 1 for surveys)
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type fishery_timing area catch_units need_catch_mult fleetname
 1 -1 1 1 0 fleet1  # 1
 3 1 1 2 0 survey1  # 2
 3 1 1 2 0 survey2  # 3
#Bycatch_fleet_input_goes_next
#a:  fleet index
#b:  1=include dead bycatch in total dead catch for F0.1 and MSY optimizations and forecast ABC; 2=omit from total catch for these purposes (but still include the mortality)
#c:  1=Fmult scales with other fleets; 2=bycatch F constant at input value; 3=bycatch F from range of years
#d:  F or first year of range
#e:  last year of range
#f:  not used
# a   b   c   d   e   f 
#_catch_biomass(mtons):_columns_are_fisheries,year,season
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 112727 0.05
1985 1 1 13599.7 0.05
1986 1 1 13259.7 0.05
1987 1 1 7007.78 0.05
1988 1 1 1798.19 0.05
1989 1 1 3381.62 0.05
1990 1 1 77739 0.05
1991 1 1 130530 0.05
1992 1 1 251388 0.05
1993 1 1 465403 0.05
1994 1 1 242035 0.05
1995 1 1 162421 0.05
1996 1 1 428186 0.05
1997 1 1 378615 0.05
1998 1 1 1.01306e+06 0.05
1999 1 1 691700 0.05
2000 1 1 484568 0.05
2001 1 1 316694 0.05
2002 1 1 316679 0.05
2003 1 1 166147 0.05
2004 1 1 167917 0.05
2005 1 1 137612 0.05
2006 1 1 196779 0.05
2007 1 1 106347 0.05
2008 1 1 150549 0.05
2009 1 1 166217 0.05
2010 1 1 148016 0.05
2011 1 1 232600 0.05
2012 1 1 406681 0.05
-9999 0 0 0 0
#
 #_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; 30=spawnbio; 31=recdev; 32=spawnbio*recdev; 33=recruitment; 34=depletion(&see Qsetup); 35=parm_dev(&see Qsetup)
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
1 1 0 0 # fleet1
2 0 0 0 # survey1
3 0 0 0 # survey2
#_year month index obs err
1990 10 2 602539 0.1 #_orig_obs: 559970 survey1
1991 10 2 2.44615e+06 0.1 #_orig_obs: 4.1271e+06 survey1
1992 10 2 6.97719e+06 0.1 #_orig_obs: 7.13121e+06 survey1
1993 10 2 2.25922e+06 0.1 #_orig_obs: 1.66483e+06 survey1
1994 10 2 868818 0.1 #_orig_obs: 613678 survey1
1995 10 2 1.40013e+06 0.1 #_orig_obs: 1.43796e+06 survey1
1996 10 2 1.10528e+06 0.1 #_orig_obs: 845940 survey1
1997 10 2 741398 0.1 #_orig_obs: 770676 survey1
1998 10 2 2.33773e+06 0.1 #_orig_obs: 5.12954e+06 survey1
1999 10 2 2.18048e+06 0.1 #_orig_obs: 1.39835e+06 survey1
2000 10 2 483016 0.1 #_orig_obs: 494764 survey1
2001 10 2 203277 0.1 #_orig_obs: 377871 survey1
2002 10 2 247318 0.1 #_orig_obs: 325152 survey1
2003 10 2 94866.1 0.1 #_orig_obs: 58372.8 survey1
2004 10 2 42287.8 0.1 #_orig_obs: 37164.9 survey1
2005 10 2 195440 0.1 #_orig_obs: 162458 survey1
2006 10 2 138032 0.1 #_orig_obs: 169167 survey1
2007 10 2 184277 0.1 #_orig_obs: 183701 survey1
2008 10 2 564738 0.1 #_orig_obs: 744596 survey1
2009 10 2 433660 0.1 #_orig_obs: 276588 survey1
2010 10 2 276636 0.1 #_orig_obs: 354944 survey1
2011 10 2 1.15491e+06 0.1 #_orig_obs: 2.18964e+06 survey1
2012 10 2 1.54068e+06 0.1 #_orig_obs: 1.09137e+06 survey1
1985 4 3 776251 0.1 #_orig_obs: 1.90597e+06 survey2
1986 4 3 842366 0.1 #_orig_obs: 2.21911e+06 survey2
1987 4 3 869403 0.1 #_orig_obs: 1.05381e+06 survey2
1988 4 3 280001 0.1 #_orig_obs: 192092 survey2
1989 4 3 186488 0.1 #_orig_obs: 179548 survey2
1990 4 3 152120 0.1 #_orig_obs: 129115 survey2
1991 4 3 662361 0.1 #_orig_obs: 328697 survey2
1992 4 3 1.36712e+06 0.1 #_orig_obs: 2.00105e+06 survey2
1993 4 3 775770 0.1 #_orig_obs: 1.03349e+06 survey2
1994 4 3 295857 0.1 #_orig_obs: 250591 survey2
1995 4 3 375126 0.1 #_orig_obs: 515878 survey2
1996 4 3 285349 0.1 #_orig_obs: 419123 survey2
1997 4 3 334744 0.1 #_orig_obs: 211584 survey2
1998 4 3 789686 0.1 #_orig_obs: 852235 survey2
1999 4 3 644978 0.1 #_orig_obs: 1.03369e+06 survey2
2000 4 3 226428 0.1 #_orig_obs: 333299 survey2
2001 4 3 104879 0.1 #_orig_obs: 100039 survey2
2002 4 3 155445 0.1 #_orig_obs: 179415 survey2
2003 4 3 52416 0.1 #_orig_obs: 72751 survey2
2004 4 3 27767.5 0.1 #_orig_obs: 8396.46 survey2
2005 4 3 69127.7 0.1 #_orig_obs: 29003.8 survey2
2006 4 3 91590.2 0.1 #_orig_obs: 95924.2 survey2
2007 4 3 72713 0.1 #_orig_obs: 43712.8 survey2
2008 4 3 166982 0.1 #_orig_obs: 132667 survey2
2009 4 3 146545 0.1 #_orig_obs: 174806 survey2
2010 4 3 106315 0.1 #_orig_obs: 63441.7 survey2
2011 4 3 374274 0.1 #_orig_obs: 289129 survey2
2012 4 3 499400 0.1 #_orig_obs: 706797 survey2
-9999 1 1 1 1 # terminator for survey observations 
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note: only enter units and errtype for fleets with discard 
# note: discard data is the total for an entire season, so input of month here must be to a month in that season
#_Fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0 #_use meanbodysize_data (0/1)
#_COND_0 #_DF_for_meanbodysize_T-distribution_like
# note:  type=1 for mean length; type=2 for mean body weight 
#_yr month fleet part type obs stderr
#  -9999 0 0 0 0 0 0 # terminator for mean body size data 
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
1 # binwidth for population size comp 
1 # minimum size in the population (lower edge of first bin and size at age 0.00) 
60 # maximum size in the population (lower edge of last bin) 
0 # use length composition data (0/1)
# see manual for format of length composition data 
#
7 #_N_age_bins
 1 2 3 4 5 6 7
1 #_N_ageerror_definitions
 -1 -1 -1 -1 -1 -1 -1 -1
 0 0 0 0 0 0 0 0
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_ParmSelect:  parm number for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-07 1 0 0 0 0.001 #_fleet:1_fleet1
0 1e-07 1 0 0 0 0.001 #_fleet:2_survey1
0 1e-07 1 0 0 0 0.001 #_fleet:3_survey2
1 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
1985  1 1  0 0 1 -1 -1 800  116 291 312 68 12 1 0
1986  1 1  0 0 1 -1 -1 800  28 328 364 68 9 3 0
1987  1 1  0 0 1 -1 -1 800  34 95 543 111 15 2 0
1988  1 1  0 0 1 -1 -1 800  49 212 243 252 38 1 5
1989  1 1  0 0 1 -1 -1 800  282 125 270 69 44 7 3
1990  1 1  0 0 1 -1 -1 800  466 242 65 21 2 4 0
1991  1 1  0 0 1 -1 -1 800  79 574 141 4 2 0 0
1992  1 1  0 0 1 -1 -1 800  23 187 561 29 0 0 0
1993  1 1  0 0 1 -1 -1 800  92 118 370 213 7 0 0
1994  1 1  0 0 1 -1 -1 800  178 353 166 61 42 0 0
1995  1 1  0 0 1 -1 -1 800  55 384 327 22 9 3 0
1996  1 1  0 0 1 -1 -1 800  359 116 283 37 5 0 0
1997  1 1  0 0 1 -1 -1 800  219 516 47 18 0 0 0
1998  1 1  0 0 1 -1 -1 800  62 417 316 5 0 0 0
1999  1 1  0 0 1 -1 -1 800  54 232 470 43 1 0 0
2000  1 1  0 0 1 -1 -1 800  229 209 280 72 10 0 0
2001  1 1  0 0 1 -1 -1 800  141 513 122 14 10 0 0
2002  1 1  0 0 1 -1 -1 800  50 419 324 5 2 0 0
2003  1 1  0 0 1 -1 -1 800  303 154 319 24 0 0 0
2004  1 1  0 0 1 -1 -1 800  361 399 36 2 1 0 1
2005  1 1  0 0 1 -1 -1 800  109 570 121 0 0 0 0
2006  1 1  0 0 1 -1 -1 800  296 215 282 7 0 0 0
2007  1 1  0 0 1 -1 -1 800  202 489 101 8 0 0 0
2008  1 1  0 0 1 -1 -1 800  45 420 326 9 0 0 0
2009  1 1  0 0 1 -1 -1 800  384 114 265 36 1 0 0
2010  1 1  0 0 1 -1 -1 800  272 455 50 20 3 0 0
2011  1 1  0 0 1 -1 -1 800  110 434 248 8 0 0 0
2012  1 1  0 0 1 -1 -1 800  118 229 408 45 0 0 0
1990  10 2  0 0 1 -1 -1 800  34 206 463 96 1 0 0
1991  10 2  0 0 1 -1 -1 800  4 197 589 10 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 26 757 17 0 0 0
1993  10 2  0 0 1 -1 -1 800  3 21 604 172 0 0 0
1994  10 2  0 0 1 -1 -1 800  6 129 538 123 4 0 0
1995  10 2  0 0 1 -1 -1 800  0 79 696 25 0 0 0
1996  10 2  0 0 1 -1 -1 800  10 42 678 70 0 0 0
1997  10 2  0 0 1 -1 -1 800  25 379 339 57 0 0 0
1998  10 2  0 0 1 -1 -1 800  6 136 650 8 0 0 0
1999  10 2  0 0 1 -1 -1 800  3 42 718 37 0 0 0
2000  10 2  0 0 1 -1 -1 800  10 70 608 111 1 0 0
2001  10 2  0 0 1 -1 -1 800  14 333 415 38 0 0 0
2002  10 2  0 0 1 -1 -1 800  3 171 618 8 0 0 0
2003  10 2  0 0 1 -1 -1 800  26 85 651 38 0 0 0
2004  10 2  0 0 1 -1 -1 800  69 558 156 17 0 0 0
2005  10 2  0 0 1 -1 -1 800  6 315 477 2 0 0 0
2006  10 2  0 0 1 -1 -1 800  15 103 673 9 0 0 0
2007  10 2  0 0 1 -1 -1 800  13 262 504 21 0 0 0
2008  10 2  0 0 1 -1 -1 800  0 115 674 11 0 0 0
2009  10 2  0 0 1 -1 -1 800  10 25 719 46 0 0 0
2010  10 2  0 0 1 -1 -1 800  23 383 349 45 0 0 0
2011  10 2  0 0 1 -1 -1 800  2 107 685 6 0 0 0
2012  10 2  0 0 1 -1 -1 800  5 49 707 39 0 0 0
1985  4 3  0 0 1 -1 -1 800  0 109 606 85 0 0 0
1986  4 3  0 0 1 -1 -1 800  0 101 613 86 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 29 665 106 0 0 0
1988  4 3  0 0 1 -1 -1 800  0 62 441 296 1 0 0
1989  4 3  0 0 1 -1 -1 800  0 52 636 110 2 0 0
1990  4 3  0 0 1 -1 -1 800  1 350 359 90 0 0 0
1991  4 3  0 0 1 -1 -1 800  0 331 458 11 0 0 0
1992  4 3  0 0 1 -1 -1 800  0 54 719 27 0 0 0
1993  4 3  0 0 1 -1 -1 800  0 43 524 233 0 0 0
1994  4 3  0 0 1 -1 -1 800  1 194 460 142 3 0 0
1995  4 3  0 0 1 -1 -1 800  0 142 634 24 0 0 0
1996  4 3  0 0 1 -1 -1 800  0 47 684 69 0 0 0
1997  4 3  0 0 1 -1 -1 800  0 481 264 55 0 0 0
1998  4 3  0 0 1 -1 -1 800  0 155 637 8 0 0 0
1999  4 3  0 0 1 -1 -1 800  0 75 679 46 0 0 0
2000  4 3  0 0 1 -1 -1 800  0 87 595 118 0 0 0
2001  4 3  0 0 1 -1 -1 800  0 332 437 30 1 0 0
2002  4 3  0 0 1 -1 -1 800  0 165 629 6 0 0 0
2003  4 3  0 0 1 -1 -1 800  0 71 691 38 0 0 0
2004  4 3  0 0 1 -1 -1 800  0 550 238 12 0 0 0
2005  4 3  0 0 1 -1 -1 800  0 359 441 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  0 82 701 17 0 0 0
2007  4 3  0 0 1 -1 -1 800  1 401 376 22 0 0 0
2008  4 3  0 0 1 -1 -1 800  0 159 629 12 0 0 0
2009  4 3  0 0 1 -1 -1 800  0 59 690 51 0 0 0
2010  4 3  0 0 1 -1 -1 800  0 487 260 53 0 0 0
2011  4 3  0 0 1 -1 -1 800  0 184 608 8 0 0 0
2012  4 3  0 0 1 -1 -1 800  0 83 671 46 0 0 0
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
0 #_Use_MeanSize-at-Age_obs (0/1)
#
0 #_N_environ_variables
# -2 in yr will subtract mean for that env_var; -1 will subtract mean and divide by stddev (e.g. Z-score)
#Yr Variable Value
#
0 # N sizefreq methods to read 
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
 # Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
 # feature not yet implemented
#
999

