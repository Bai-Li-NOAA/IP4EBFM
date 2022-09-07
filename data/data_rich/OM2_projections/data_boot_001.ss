#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Sep 07 08:21:20 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662553280 first rand#: -0.00335296
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
-999 1 1 132673 0.05
1985 1 1 202882 0.05
1986 1 1 171663 0.05
1987 1 1 92081.4 0.05
1988 1 1 24660.3 0.05
1989 1 1 47276.2 0.05
1990 1 1 66694.1 0.05
1991 1 1 81203.5 0.05
1992 1 1 138403 0.05
1993 1 1 205394 0.05
1994 1 1 95502.4 0.05
1995 1 1 50515.9 0.05
1996 1 1 124250 0.05
1997 1 1 84973.2 0.05
1998 1 1 212130 0.05
1999 1 1 149433 0.05
2000 1 1 233408 0.05
2001 1 1 219639 0.05
2002 1 1 208859 0.05
2003 1 1 363028 0.05
2004 1 1 579146 0.05
2005 1 1 807196 0.05
2006 1 1 1.50072e+06 0.05
2007 1 1 790912 0.05
2008 1 1 469931 0.05
2009 1 1 526447 0.05
2010 1 1 459710 0.05
2011 1 1 413175 0.05
2012 1 1 636750 0.05
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
1990 10 2 3.4759e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.38582e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.05783e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.22571e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.47076e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.04441e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.70558e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 3.92747e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.31876e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.23318e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.3394e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.87919e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.29446e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.23356e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.36327e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 3.84324e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.34716e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.50549e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.88224e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 4.05763e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.54038e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.26716e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.48489e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.13433e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 472913 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 337395 0.1 #_orig_obs: 954308 survey2
1988 4 3 254995 0.1 #_orig_obs: 245537 survey2
1989 4 3 487868 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.32654e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 768343 0.1 #_orig_obs: 527308 survey2
1992 4 3 413457 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 509916 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 508157 0.1 #_orig_obs: 375877 survey2
1995 4 3 342522 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.26585e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.79239e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.40234e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 959205 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 728382 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.01562e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 446161 0.1 #_orig_obs: 525909 survey2
2003 4 3 852396 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.01472e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.51544e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.41918e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.22446e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 635067 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.41061e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.85784e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.74076e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.35801e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  143 281 312 53 9 2 0
1986  1 1  0 0 1 -1 -1 800  25 325 374 72 4 0 0
1987  1 1  0 0 1 -1 -1 800  63 116 524 82 15 0 0
1988  1 1  0 0 1 -1 -1 800  80 224 263 204 21 8 0
1989  1 1  0 0 1 -1 -1 800  206 216 298 47 28 3 2
1990  1 1  0 0 1 -1 -1 800  360 255 140 35 10 0 0
1991  1 1  0 0 1 -1 -1 800  129 465 188 15 2 0 1
1992  1 1  0 0 1 -1 -1 800  51 208 506 33 2 0 0
1993  1 1  0 0 1 -1 -1 800  132 130 393 135 10 0 0
1994  1 1  0 0 1 -1 -1 800  152 339 199 81 27 2 0
1995  1 1  0 0 1 -1 -1 800  83 302 367 31 9 8 0
1996  1 1  0 0 1 -1 -1 800  304 131 301 57 3 2 2
1997  1 1  0 0 1 -1 -1 800  281 372 111 31 5 0 0
1998  1 1  0 0 1 -1 -1 800  123 351 310 10 6 0 0
1999  1 1  0 0 1 -1 -1 800  59 237 447 56 1 0 0
2000  1 1  0 0 1 -1 -1 800  91 225 354 116 14 0 0
2001  1 1  0 0 1 -1 -1 800  185 230 288 74 23 0 0
2002  1 1  0 0 1 -1 -1 800  64 354 297 60 15 10 0
2003  1 1  0 0 1 -1 -1 800  178 130 432 48 9 3 0
2004  1 1  0 0 1 -1 -1 800  430 263 62 39 6 0 0
2005  1 1  0 0 1 -1 -1 800  153 493 150 4 0 0 0
2006  1 1  0 0 1 -1 -1 800  116 255 417 12 0 0 0
2007  1 1  0 0 1 -1 -1 800  177 275 297 50 1 0 0
2008  1 1  0 0 1 -1 -1 800  76 321 349 47 7 0 0
2009  1 1  0 0 1 -1 -1 800  224 142 377 48 9 0 0
2010  1 1  0 0 1 -1 -1 800  236 379 127 51 7 0 0
2011  1 1  0 0 1 -1 -1 800  171 349 268 9 3 0 0
2012  1 1  0 0 1 -1 -1 800  114 313 341 32 0 0 0
1990  10 2  0 0 1 -1 -1 800  726 57 13 3 1 0 0
1991  10 2  0 0 1 -1 -1 800  530 237 33 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  374 274 136 16 0 0 0
1993  10 2  0 0 1 -1 -1 800  625 82 53 37 3 0 0
1994  10 2  0 0 1 -1 -1 800  588 168 18 16 10 0 0
1995  10 2  0 0 1 -1 -1 800  444 257 75 10 10 4 0
1996  10 2  0 0 1 -1 -1 800  726 46 24 4 0 0 0
1997  10 2  0 0 1 -1 -1 800  669 123 5 1 2 0 0
1998  10 2  0 0 1 -1 -1 800  523 218 54 4 1 0 0
1999  10 2  0 0 1 -1 -1 800  456 199 117 23 3 2 0
2000  10 2  0 0 1 -1 -1 800  559 145 45 42 8 1 0
2001  10 2  0 0 1 -1 -1 800  637 109 29 9 13 3 0
2002  10 2  0 0 1 -1 -1 800  364 352 54 8 14 8 0
2003  10 2  0 0 1 -1 -1 800  701 52 47 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  733 67 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  554 231 15 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  586 149 59 6 0 0 0
2007  10 2  0 0 1 -1 -1 800  623 131 35 8 3 0 0
2008  10 2  0 0 1 -1 -1 800  458 284 48 5 5 0 0
2009  10 2  0 0 1 -1 -1 800  692 64 39 5 0 0 0
2010  10 2  0 0 1 -1 -1 800  649 133 11 7 0 0 0
2011  10 2  0 0 1 -1 -1 800  594 172 29 5 0 0 0
2012  10 2  0 0 1 -1 -1 800  572 164 47 16 1 0 0
1985  4 3  0 0 1 -1 -1 800  635 114 41 8 2 0 0
1986  4 3  0 0 1 -1 -1 800  390 304 77 17 6 3 3
1987  4 3  0 0 1 -1 -1 800  557 86 106 37 9 2 3
1988  4 3  0 0 1 -1 -1 800  554 143 35 47 10 5 6
1989  4 3  0 0 1 -1 -1 800  695 69 19 3 10 3 1
1990  4 3  0 0 1 -1 -1 800  736 57 5 2 0 0 0
1991  4 3  0 0 1 -1 -1 800  547 232 20 1 0 0 0
1992  4 3  0 0 1 -1 -1 800  428 228 122 22 0 0 0
1993  4 3  0 0 1 -1 -1 800  649 71 49 27 4 0 0
1994  4 3  0 0 1 -1 -1 800  645 118 21 10 6 0 0
1995  4 3  0 0 1 -1 -1 800  504 213 63 6 10 4 0
1996  4 3  0 0 1 -1 -1 800  746 31 14 6 2 1 0
1997  4 3  0 0 1 -1 -1 800  680 112 6 2 0 0 0
1998  4 3  0 0 1 -1 -1 800  543 205 45 7 0 0 0
1999  4 3  0 0 1 -1 -1 800  523 170 79 24 4 0 0
2000  4 3  0 0 1 -1 -1 800  582 135 46 32 5 0 0
2001  4 3  0 0 1 -1 -1 800  644 99 32 18 7 0 0
2002  4 3  0 0 1 -1 -1 800  406 328 47 14 1 4 0
2003  4 3  0 0 1 -1 -1 800  719 40 35 3 2 0 1
2004  4 3  0 0 1 -1 -1 800  747 45 6 2 0 0 0
2005  4 3  0 0 1 -1 -1 800  548 237 14 1 0 0 0
2006  4 3  0 0 1 -1 -1 800  607 133 58 2 0 0 0
2007  4 3  0 0 1 -1 -1 800  643 113 35 9 0 0 0
2008  4 3  0 0 1 -1 -1 800  492 245 54 5 4 0 0
2009  4 3  0 0 1 -1 -1 800  713 48 33 4 2 0 0
2010  4 3  0 0 1 -1 -1 800  693 88 7 9 3 0 0
2011  4 3  0 0 1 -1 -1 800  611 165 22 1 1 0 0
2012  4 3  0 0 1 -1 -1 800  607 139 45 9 0 0 0
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

