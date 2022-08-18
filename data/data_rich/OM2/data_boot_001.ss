#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 18 16:34:36 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660854876 first rand#: 0.812888
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
-999 1 1 74488.1 0.05
1985 1 1 208653 0.05
1986 1 1 170087 0.05
1987 1 1 84401 0.05
1988 1 1 26341.9 0.05
1989 1 1 49993.5 0.05
1990 1 1 66061.3 0.05
1991 1 1 72890.6 0.05
1992 1 1 131795 0.05
1993 1 1 205565 0.05
1994 1 1 86418.2 0.05
1995 1 1 49698.9 0.05
1996 1 1 129102 0.05
1997 1 1 104908 0.05
1998 1 1 176110 0.05
1999 1 1 150105 0.05
2000 1 1 208407 0.05
2001 1 1 218198 0.05
2002 1 1 229409 0.05
2003 1 1 310586 0.05
2004 1 1 588805 0.05
2005 1 1 832261 0.05
2006 1 1 1.44988e+06 0.05
2007 1 1 922299 0.05
2008 1 1 458192 0.05
2009 1 1 499593 0.05
2010 1 1 438287 0.05
2011 1 1 405895 0.05
2012 1 1 688873 0.05
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
1990 10 2 2.64294e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.09969e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 975063 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.25658e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.56734e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 910192 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.63378e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.20535e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.58799e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.04728e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.32991e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.81424e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.43442e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.70171e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.21796e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.54963e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 4.52322e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.50039e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.69175e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.44095e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.8002e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.70397e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.8827e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 998485 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 405848 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 276025 0.1 #_orig_obs: 954308 survey2
1988 4 3 206428 0.1 #_orig_obs: 245537 survey2
1989 4 3 429863 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.16499e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 969241 0.1 #_orig_obs: 527308 survey2
1992 4 3 357083 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 548109 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 554444 0.1 #_orig_obs: 375877 survey2
1995 4 3 346620 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.01322e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.88218e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.34522e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 901263 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 778232 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.15489e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 516838 0.1 #_orig_obs: 525909 survey2
2003 4 3 1.01256e+06 0.1 #_orig_obs: 634479 survey2
2004 4 3 3.33907e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 2.04805e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.58126e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.33389e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 677547 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.27417e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.69699e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.91149e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.26561e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  150 253 319 67 8 3 0
1986  1 1  0 0 1 -1 -1 800  40 305 375 66 9 4 1
1987  1 1  0 0 1 -1 -1 800  62 112 519 94 12 1 0
1988  1 1  0 0 1 -1 -1 800  91 228 262 191 22 6 0
1989  1 1  0 0 1 -1 -1 800  200 191 314 59 32 3 1
1990  1 1  0 0 1 -1 -1 800  365 266 129 36 4 0 0
1991  1 1  0 0 1 -1 -1 800  119 471 197 12 1 0 0
1992  1 1  0 0 1 -1 -1 800  36 194 536 31 3 0 0
1993  1 1  0 0 1 -1 -1 800  130 123 392 144 11 0 0
1994  1 1  0 0 1 -1 -1 800  158 349 173 95 24 1 0
1995  1 1  0 0 1 -1 -1 800  64 287 395 41 11 2 0
1996  1 1  0 0 1 -1 -1 800  320 136 270 66 5 2 1
1997  1 1  0 0 1 -1 -1 800  285 373 100 36 6 0 0
1998  1 1  0 0 1 -1 -1 800  102 368 313 16 1 0 0
1999  1 1  0 0 1 -1 -1 800  66 208 467 59 0 0 0
2000  1 1  0 0 1 -1 -1 800  93 187 375 124 21 0 0
2001  1 1  0 0 1 -1 -1 800  158 255 275 95 15 2 0
2002  1 1  0 0 1 -1 -1 800  50 385 314 39 9 3 0
2003  1 1  0 0 1 -1 -1 800  224 116 413 38 7 1 1
2004  1 1  0 0 1 -1 -1 800  449 255 64 30 2 0 0
2005  1 1  0 0 1 -1 -1 800  150 510 139 1 0 0 0
2006  1 1  0 0 1 -1 -1 800  105 307 373 15 0 0 0
2007  1 1  0 0 1 -1 -1 800  158 323 297 22 0 0 0
2008  1 1  0 0 1 -1 -1 800  62 369 325 36 8 0 0
2009  1 1  0 0 1 -1 -1 800  243 166 342 46 3 0 0
2010  1 1  0 0 1 -1 -1 800  252 375 123 44 6 0 0
2011  1 1  0 0 1 -1 -1 800  160 376 253 9 2 0 0
2012  1 1  0 0 1 -1 -1 800  129 283 357 30 1 0 0
1990  10 2  0 0 1 -1 -1 800  712 69 11 4 4 0 0
1991  10 2  0 0 1 -1 -1 800  477 281 42 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  363 279 142 16 0 0 0
1993  10 2  0 0 1 -1 -1 800  629 75 51 41 4 0 0
1994  10 2  0 0 1 -1 -1 800  613 133 20 18 16 0 0
1995  10 2  0 0 1 -1 -1 800  477 231 69 11 8 4 0
1996  10 2  0 0 1 -1 -1 800  732 25 29 14 0 0 0
1997  10 2  0 0 1 -1 -1 800  657 125 11 6 1 0 0
1998  10 2  0 0 1 -1 -1 800  510 242 42 3 2 0 1
1999  10 2  0 0 1 -1 -1 800  477 210 88 23 1 1 0
2000  10 2  0 0 1 -1 -1 800  524 169 60 34 12 1 0
2001  10 2  0 0 1 -1 -1 800  648 101 32 11 8 0 0
2002  10 2  0 0 1 -1 -1 800  377 341 53 18 6 4 1
2003  10 2  0 0 1 -1 -1 800  723 43 34 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  733 67 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  563 221 16 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  564 188 44 4 0 0 0
2007  10 2  0 0 1 -1 -1 800  601 170 23 5 1 0 0
2008  10 2  0 0 1 -1 -1 800  452 280 57 7 3 1 0
2009  10 2  0 0 1 -1 -1 800  706 61 26 4 3 0 0
2010  10 2  0 0 1 -1 -1 800  679 113 4 4 0 0 0
2011  10 2  0 0 1 -1 -1 800  589 194 15 2 0 0 0
2012  10 2  0 0 1 -1 -1 800  576 158 53 12 1 0 0
1985  4 3  0 0 1 -1 -1 800  615 124 43 11 7 0 0
1986  4 3  0 0 1 -1 -1 800  372 316 69 29 6 3 5
1987  4 3  0 0 1 -1 -1 800  523 100 123 32 18 4 0
1988  4 3  0 0 1 -1 -1 800  545 149 39 47 16 1 3
1989  4 3  0 0 1 -1 -1 800  683 87 17 6 4 2 1
1990  4 3  0 0 1 -1 -1 800  720 67 5 8 0 0 0
1991  4 3  0 0 1 -1 -1 800  572 198 25 5 0 0 0
1992  4 3  0 0 1 -1 -1 800  432 237 116 15 0 0 0
1993  4 3  0 0 1 -1 -1 800  642 70 52 28 8 0 0
1994  4 3  0 0 1 -1 -1 800  643 134 14 6 3 0 0
1995  4 3  0 0 1 -1 -1 800  528 208 53 4 5 2 0
1996  4 3  0 0 1 -1 -1 800  744 34 15 4 1 1 1
1997  4 3  0 0 1 -1 -1 800  692 97 1 10 0 0 0
1998  4 3  0 0 1 -1 -1 800  554 199 41 6 0 0 0
1999  4 3  0 0 1 -1 -1 800  527 174 77 20 2 0 0
2000  4 3  0 0 1 -1 -1 800  600 126 48 17 9 0 0
2001  4 3  0 0 1 -1 -1 800  665 97 19 11 6 2 0
2002  4 3  0 0 1 -1 -1 800  406 303 60 13 11 7 0
2003  4 3  0 0 1 -1 -1 800  718 39 35 4 1 2 1
2004  4 3  0 0 1 -1 -1 800  741 50 4 5 0 0 0
2005  4 3  0 0 1 -1 -1 800  571 219 6 1 2 1 0
2006  4 3  0 0 1 -1 -1 800  581 165 52 2 0 0 0
2007  4 3  0 0 1 -1 -1 800  625 136 27 12 0 0 0
2008  4 3  0 0 1 -1 -1 800  466 264 57 11 2 0 0
2009  4 3  0 0 1 -1 -1 800  721 52 27 0 0 0 0
2010  4 3  0 0 1 -1 -1 800  674 109 13 4 0 0 0
2011  4 3  0 0 1 -1 -1 800  633 141 24 0 2 0 0
2012  4 3  0 0 1 -1 -1 800  611 141 39 9 0 0 0
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

