#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 18 16:01:52 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660852912 first rand#: -0.96628
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
-999 1 1 241380 0.05
1985 1 1 149538 0.05
1986 1 1 127281 0.05
1987 1 1 28028.1 0.05
1988 1 1 1961.24 0.05
1989 1 1 3207.36 0.05
1990 1 1 17260.9 0.05
1991 1 1 28547.8 0.05
1992 1 1 67441.6 0.05
1993 1 1 145147 0.05
1994 1 1 23376.8 0.05
1995 1 1 4472.04 0.05
1996 1 1 14485.5 0.05
1997 1 1 57950.7 0.05
1998 1 1 142897 0.05
1999 1 1 122966 0.05
2000 1 1 214858 0.05
2001 1 1 141790 0.05
2002 1 1 13402.5 0.05
2003 1 1 56272.1 0.05
2004 1 1 159247 0.05
2005 1 1 618315 0.05
2006 1 1 3.38884e+06 0.05
2007 1 1 1.91471e+06 0.05
2008 1 1 237665 0.05
2009 1 1 357646 0.05
2010 1 1 526382 0.05
2011 1 1 940358 0.05
2012 1 1 981274 0.05
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
1990 10 2 4.01878e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.78278e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.87813e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.22426e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.04362e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 986186 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.83036e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 4.24092e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 4.49662e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 4.1529e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.5426e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.48184e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.63353e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.48867e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 7.41952e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 7.39143e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 5.75857e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 2.94314e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.47885e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.00972e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 5.41888e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 4.3226e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.68456e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 1.15326e+06 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 435315 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 399647 0.1 #_orig_obs: 572537 survey2
1988 4 3 448638 0.1 #_orig_obs: 204010 survey2
1989 4 3 279523 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.48055e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.15564e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 491658 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 439652 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 423135 0.1 #_orig_obs: 418617 survey2
1995 4 3 411378 0.1 #_orig_obs: 310064 survey2
1996 4 3 677520 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.44701e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.86667e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.42887e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 849989 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 726275 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 594391 0.1 #_orig_obs: 577555 survey2
2003 4 3 847758 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.70085e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.51289e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.50286e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.11747e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 470213 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 779616 0.1 #_orig_obs: 624374 survey2
2010 4 3 1.92055e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.37969e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 963840 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  389 220 153 67 17 3 3
1986  1 1  0 0 1 -1 -1 583  116 227 161 52 19 3 5
1987  1 1  0 0 1 -1 -1 762  281 124 233 82 32 7 3
1988  1 1  0 0 1 -1 -1 737  317 178 76 119 38 6 3
1989  1 1  0 0 1 -1 -1 692  257 196 156 36 32 10 5
1990  1 1  0 0 1 -1 -1 684  528 52 57 29 5 7 6
1991  1 1  0 0 1 -1 -1 777  412 307 22 27 3 3 3
1992  1 1  0 0 1 -1 -1 568  90 245 206 16 8 3 0
1993  1 1  0 0 1 -1 -1 548  165 83 186 105 5 4 0
1994  1 1  0 0 1 -1 -1 526  194 111 64 109 45 3 0
1995  1 1  0 0 1 -1 -1 500  237 99 82 34 35 13 0
1996  1 1  0 0 1 -1 -1 463  282 100 44 25 4 6 2
1997  1 1  0 0 1 -1 -1 454  320 86 25 14 5 0 4
1998  1 1  0 0 1 -1 -1 459  273 123 47 10 6 0 0
1999  1 1  0 0 1 -1 -1 428  156 162 87 22 1 0 0
2000  1 1  0 0 1 -1 -1 366  109 90 104 56 6 1 0
2001  1 1  0 0 1 -1 -1 501  220 104 86 69 20 2 0
2002  1 1  0 0 1 -1 -1 439  127 153 69 54 28 7 1
2003  1 1  0 0 1 -1 -1 402  214 57 93 20 13 3 2
2004  1 1  0 0 1 -1 -1 459  354 67 13 16 4 4 1
2005  1 1  0 0 1 -1 -1 394  193 166 27 6 2 0 0
2006  1 1  0 0 1 -1 -1 421  161 142 102 16 0 0 0
2007  1 1  0 0 1 -1 -1 532  206 154 121 41 10 0 0
2008  1 1  0 0 1 -1 -1 445  91 151 128 49 26 0 0
2009  1 1  0 0 1 -1 -1 402  241 46 64 40 11 0 0
2010  1 1  0 0 1 -1 -1 442  325 82 15 13 7 0 0
2011  1 1  0 0 1 -1 -1 434  169 195 60 5 5 0 0
2012  1 1  0 0 1 -1 -1 370  126 95 119 25 5 0 0
1990  10 2  0 0 1 -1 -1 118  107 11 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  27 12 1 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  31 58 29 3 1 0 0
1993  10 2  0 0 1 -1 -1 119  59 15 33 11 1 0 0
1994  10 2  0 0 1 -1 -1 53  31 22 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  175 58 22 3 3 0 0
1996  10 2  0 0 1 -1 -1 192  147 34 6 5 0 0 0
1997  10 2  0 0 1 -1 -1 110  87 23 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  114 55 7 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  250 176 60 9 0 0 0
2000  10 2  0 0 1 -1 -1 464  232 122 90 17 3 0 0
2001  10 2  0 0 1 -1 -1 268  174 47 30 12 5 0 0
2002  10 2  0 0 1 -1 -1 602  279 238 46 25 12 2 0
2003  10 2  0 0 1 -1 -1 56  48 3 4 1 0 0 0
2004  10 2  0 0 1 -1 -1 294  258 36 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  477 232 22 8 1 0 0
2006  10 2  0 0 1 -1 -1 335  178 113 42 2 0 0 0
2007  10 2  0 0 1 -1 -1 553  329 136 69 18 1 0 0
2008  10 2  0 0 1 -1 -1 344  130 143 55 16 0 0 0
2009  10 2  0 0 1 -1 -1 149  116 16 17 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  154 18 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  455 376 51 4 3 0 0
2012  10 2  0 0 1 -1 -1 464  255 125 70 14 0 0 0
1985  4 3  0 0 1 -1 -1 1000  718 209 51 15 5 2 0
1986  4 3  0 0 1 -1 -1 1000  436 395 108 42 14 5 0
1987  4 3  0 0 1 -1 -1 1000  741 105 115 27 6 2 4
1988  4 3  0 0 1 -1 -1 1000  748 173 22 46 7 3 1
1989  4 3  0 0 1 -1 -1 1000  673 226 67 12 16 6 0
1990  4 3  0 0 1 -1 -1 1000  922 46 22 10 0 0 0
1991  4 3  0 0 1 -1 -1 1000  751 228 13 6 2 0 0
1992  4 3  0 0 1 -1 -1 1000  384 448 154 8 5 1 0
1993  4 3  0 0 1 -1 -1 1000  671 109 147 73 0 0 0
1994  4 3  0 0 1 -1 -1 1000  659 209 43 52 37 0 0
1995  4 3  0 0 1 -1 -1 1000  745 154 57 14 19 11 0
1996  4 3  0 0 1 -1 -1 1000  839 116 29 8 3 5 0
1997  4 3  0 0 1 -1 -1 1000  889 85 18 8 0 0 0
1998  4 3  0 0 1 -1 -1 1000  806 168 20 6 0 0 0
1999  4 3  0 0 1 -1 -1 1000  611 305 69 13 2 0 0
2000  4 3  0 0 1 -1 -1 1000  625 228 105 40 2 0 0
2001  4 3  0 0 1 -1 -1 1000  767 146 48 27 10 2 0
2002  4 3  0 0 1 -1 -1 1000  592 285 73 21 19 10 0
2003  4 3  0 0 1 -1 -1 1000  835 87 56 11 7 2 2
2004  4 3  0 0 1 -1 -1 1000  914 68 9 4 2 3 0
2005  4 3  0 0 1 -1 -1 1000  751 227 16 4 2 0 0
2006  4 3  0 0 1 -1 -1 1000  650 259 86 5 0 0 0
2007  4 3  0 0 1 -1 -1 1000  658 236 72 34 0 0 0
2008  4 3  0 0 1 -1 -1 1000  483 333 134 37 13 0 0
2009  4 3  0 0 1 -1 -1 1000  845 76 50 21 7 1 0
2010  4 3  0 0 1 -1 -1 1000  903 97 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  589 359 42 5 5 0 0
2012  4 3  0 0 1 -1 -1 1000  661 208 111 20 0 0 0
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

