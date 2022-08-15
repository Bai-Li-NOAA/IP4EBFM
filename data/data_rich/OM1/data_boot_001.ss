#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 15 09:30:49 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660570249 first rand#: 0.696977
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1.00001 #_spawn_month
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
-999 1 1 224240 0.05
1985 1 1 154425 0.05
1986 1 1 121883 0.05
1987 1 1 26307 0.05
1988 1 1 1949.47 0.05
1989 1 1 3166.74 0.05
1990 1 1 16927.9 0.05
1991 1 1 28679.7 0.05
1992 1 1 67927.3 0.05
1993 1 1 148248 0.05
1994 1 1 22610.8 0.05
1995 1 1 4696.41 0.05
1996 1 1 13117.5 0.05
1997 1 1 56424.6 0.05
1998 1 1 143959 0.05
1999 1 1 130544 0.05
2000 1 1 206877 0.05
2001 1 1 134700 0.05
2002 1 1 13361.9 0.05
2003 1 1 55866.1 0.05
2004 1 1 166610 0.05
2005 1 1 694955 0.05
2006 1 1 3.07267e+06 0.05
2007 1 1 2.0919e+06 0.05
2008 1 1 262767 0.05
2009 1 1 308048 0.05
2010 1 1 497585 0.05
2011 1 1 993540 0.05
2012 1 1 1.05258e+06 0.05
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
1990 10 2 3.01891e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.79476e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.70369e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.37223e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.08567e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.2105e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.72276e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 3.92779e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 4.29912e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.21612e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.39678e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.54422e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.87972e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.49404e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 6.38734e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 7.04586e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.60646e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 3.01542e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.66523e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.76699e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 4.96925e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 3.96955e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.53851e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 991897 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 387199 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 409077 0.1 #_orig_obs: 572537 survey2
1988 4 3 448756 0.1 #_orig_obs: 204010 survey2
1989 4 3 344799 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.29432e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.33903e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 480382 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 498457 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 360789 0.1 #_orig_obs: 418617 survey2
1995 4 3 429087 0.1 #_orig_obs: 310064 survey2
1996 4 3 714924 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.51762e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 2.65179e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.2486e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 993330 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 836908 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 551875 0.1 #_orig_obs: 577555 survey2
2003 4 3 740843 0.1 #_orig_obs: 821136 survey2
2004 4 3 3.00767e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.75534e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.60986e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.02329e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 470426 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 891991 0.1 #_orig_obs: 624374 survey2
2010 4 3 2.14686e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.49027e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 862307 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  396 240 129 66 13 5 3
1986  1 1  0 0 1 -1 -1 583  112 248 137 58 20 6 2
1987  1 1  0 0 1 -1 -1 762  294 94 216 119 30 7 2
1988  1 1  0 0 1 -1 -1 737  326 175 86 100 39 8 3
1989  1 1  0 0 1 -1 -1 692  212 218 155 33 54 16 4
1990  1 1  0 0 1 -1 -1 684  545 69 48 15 5 1 1
1991  1 1  0 0 1 -1 -1 777  436 284 29 20 5 2 1
1992  1 1  0 0 1 -1 -1 568  85 255 202 17 7 2 0
1993  1 1  0 0 1 -1 -1 548  154 64 203 113 7 5 2
1994  1 1  0 0 1 -1 -1 526  165 105 65 140 48 3 0
1995  1 1  0 0 1 -1 -1 500  228 116 72 27 44 10 3
1996  1 1  0 0 1 -1 -1 463  292 90 49 17 4 7 4
1997  1 1  0 0 1 -1 -1 454  324 87 29 8 3 0 3
1998  1 1  0 0 1 -1 -1 459  279 134 35 8 3 0 0
1999  1 1  0 0 1 -1 -1 428  153 171 81 18 4 1 0
2000  1 1  0 0 1 -1 -1 366  126 92 95 46 7 0 0
2001  1 1  0 0 1 -1 -1 501  220 105 75 79 20 2 0
2002  1 1  0 0 1 -1 -1 439  132 157 71 45 23 10 1
2003  1 1  0 0 1 -1 -1 402  217 56 81 32 12 3 1
2004  1 1  0 0 1 -1 -1 459  363 56 21 12 4 1 2
2005  1 1  0 0 1 -1 -1 394  214 138 31 4 7 0 0
2006  1 1  0 0 1 -1 -1 421  152 152 105 12 0 0 0
2007  1 1  0 0 1 -1 -1 532  189 158 131 48 6 0 0
2008  1 1  0 0 1 -1 -1 445  91 160 117 58 19 0 0
2009  1 1  0 0 1 -1 -1 402  234 39 75 40 14 0 0
2010  1 1  0 0 1 -1 -1 442  332 78 10 13 9 0 0
2011  1 1  0 0 1 -1 -1 434  170 196 60 4 4 0 0
2012  1 1  0 0 1 -1 -1 370  141 81 122 23 3 0 0
1990  10 2  0 0 1 -1 -1 118  109 9 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  24 14 2 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  32 59 29 2 0 0 0
1993  10 2  0 0 1 -1 -1 119  69 18 23 8 0 1 0
1994  10 2  0 0 1 -1 -1 53  22 31 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  175 57 23 3 3 0 0
1996  10 2  0 0 1 -1 -1 192  154 26 8 4 0 0 0
1997  10 2  0 0 1 -1 -1 110  89 21 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  127 45 4 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  238 192 57 8 0 0 0
2000  10 2  0 0 1 -1 -1 464  227 127 92 16 2 0 0
2001  10 2  0 0 1 -1 -1 268  168 50 36 10 4 0 0
2002  10 2  0 0 1 -1 -1 602  279 229 63 17 14 0 0
2003  10 2  0 0 1 -1 -1 56  36 10 8 1 0 1 0
2004  10 2  0 0 1 -1 -1 294  258 36 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  488 222 29 0 0 1 0
2006  10 2  0 0 1 -1 -1 335  189 102 42 2 0 0 0
2007  10 2  0 0 1 -1 -1 553  326 154 61 11 1 0 0
2008  10 2  0 0 1 -1 -1 344  119 151 57 17 0 0 0
2009  10 2  0 0 1 -1 -1 149  112 17 20 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  149 23 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  476 355 50 5 3 0 0
2012  10 2  0 0 1 -1 -1 464  248 109 94 13 0 0 0
1985  4 3  0 0 1 -1 -1 1000  745 189 50 9 6 1 0
1986  4 3  0 0 1 -1 -1 1000  454 390 101 34 15 6 0
1987  4 3  0 0 1 -1 -1 1000  729 104 118 31 12 3 3
1988  4 3  0 0 1 -1 -1 1000  754 163 24 44 6 6 3
1989  4 3  0 0 1 -1 -1 1000  666 220 78 12 15 4 5
1990  4 3  0 0 1 -1 -1 1000  935 34 20 11 0 0 0
1991  4 3  0 0 1 -1 -1 1000  729 253 4 9 3 1 1
1992  4 3  0 0 1 -1 -1 1000  398 410 179 9 4 0 0
1993  4 3  0 0 1 -1 -1 1000  638 118 172 72 0 0 0
1994  4 3  0 0 1 -1 -1 1000  658 203 50 61 28 0 0
1995  4 3  0 0 1 -1 -1 1000  778 138 53 13 13 5 0
1996  4 3  0 0 1 -1 -1 1000  842 117 23 9 3 4 2
1997  4 3  0 0 1 -1 -1 1000  889 90 12 9 0 0 0
1998  4 3  0 0 1 -1 -1 1000  782 189 24 5 0 0 0
1999  4 3  0 0 1 -1 -1 1000  614 286 86 11 3 0 0
2000  4 3  0 0 1 -1 -1 1000  623 232 108 34 3 0 0
2001  4 3  0 0 1 -1 -1 1000  771 130 51 32 11 3 2
2002  4 3  0 0 1 -1 -1 1000  582 300 63 32 18 5 0
2003  4 3  0 0 1 -1 -1 1000  829 93 55 11 8 3 1
2004  4 3  0 0 1 -1 -1 1000  911 72 10 5 0 2 0
2005  4 3  0 0 1 -1 -1 1000  762 206 26 2 4 0 0
2006  4 3  0 0 1 -1 -1 1000  670 239 83 8 0 0 0
2007  4 3  0 0 1 -1 -1 1000  665 227 84 24 0 0 0
2008  4 3  0 0 1 -1 -1 1000  498 334 115 43 10 0 0
2009  4 3  0 0 1 -1 -1 1000  854 64 48 21 11 2 0
2010  4 3  0 0 1 -1 -1 1000  897 103 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  622 326 46 3 3 0 0
2012  4 3  0 0 1 -1 -1 1000  649 203 132 16 0 0 0
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

