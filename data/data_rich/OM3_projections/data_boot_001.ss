#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:40:22 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661866822 first rand#: 0.572532
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
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
-999 1 1 117508 0.05
1985 1 1 205636 0.05
1986 1 1 170456 0.05
1987 1 1 95177 0.05
1988 1 1 26564 0.05
1989 1 1 50126.4 0.05
1990 1 1 59925.1 0.05
1991 1 1 74667.4 0.05
1992 1 1 124000 0.05
1993 1 1 197993 0.05
1994 1 1 94614.4 0.05
1995 1 1 48557.9 0.05
1996 1 1 127606 0.05
1997 1 1 101385 0.05
1998 1 1 184908 0.05
1999 1 1 149023 0.05
2000 1 1 235491 0.05
2001 1 1 236365 0.05
2002 1 1 209571 0.05
2003 1 1 336717 0.05
2004 1 1 597728 0.05
2005 1 1 780313 0.05
2006 1 1 1.5647e+06 0.05
2007 1 1 817196 0.05
2008 1 1 429755 0.05
2009 1 1 520944 0.05
2010 1 1 466687 0.05
2011 1 1 400099 0.05
2012 1 1 611758 0.05
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
1990 10 2 3.37392e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.5732e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.30626e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.53674e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.35977e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 833190 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.02481e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.65148e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.05627e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.51116e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.09129e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.53275e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.31649e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.15208e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.09476e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.11297e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.26838e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.30647e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 2.10958e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 4.27898e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.90947e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.69225e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.92109e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.07651e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 442122 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 322997 0.1 #_orig_obs: 954308 survey2
1988 4 3 299199 0.1 #_orig_obs: 245537 survey2
1989 4 3 367626 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.10167e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 854613 0.1 #_orig_obs: 527308 survey2
1992 4 3 398675 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 518784 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 565193 0.1 #_orig_obs: 375877 survey2
1995 4 3 337147 0.1 #_orig_obs: 528242 survey2
1996 4 3 971416 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.65936e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.34884e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 795517 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 858831 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 967779 0.1 #_orig_obs: 689461 survey2
2002 4 3 368696 0.1 #_orig_obs: 525909 survey2
2003 4 3 963147 0.1 #_orig_obs: 634479 survey2
2004 4 3 1.97068e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.6511e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.21138e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.30825e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 643364 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.26461e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 2.05362e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.81634e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.58867e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  130 281 316 63 10 0 0
1986  1 1  0 0 1 -1 -1 800  40 310 364 75 11 0 0
1987  1 1  0 0 1 -1 -1 800  65 104 521 100 9 1 0
1988  1 1  0 0 1 -1 -1 800  95 230 271 181 21 2 0
1989  1 1  0 0 1 -1 -1 800  210 216 269 56 47 2 0
1990  1 1  0 0 1 -1 -1 800  369 250 138 38 5 0 0
1991  1 1  0 0 1 -1 -1 800  136 479 168 14 1 1 1
1992  1 1  0 0 1 -1 -1 800  44 222 509 23 2 0 0
1993  1 1  0 0 1 -1 -1 800  128 122 413 127 10 0 0
1994  1 1  0 0 1 -1 -1 800  148 334 216 82 20 0 0
1995  1 1  0 0 1 -1 -1 800  76 301 387 24 11 1 0
1996  1 1  0 0 1 -1 -1 800  319 126 301 49 2 2 1
1997  1 1  0 0 1 -1 -1 800  233 418 114 28 7 0 0
1998  1 1  0 0 1 -1 -1 800  104 367 307 16 6 0 0
1999  1 1  0 0 1 -1 -1 800  59 204 473 62 2 0 0
2000  1 1  0 0 1 -1 -1 800  104 201 364 117 14 0 0
2001  1 1  0 0 1 -1 -1 800  167 260 278 73 19 3 0
2002  1 1  0 0 1 -1 -1 800  65 381 301 35 16 2 0
2003  1 1  0 0 1 -1 -1 800  172 143 418 56 9 0 2
2004  1 1  0 0 1 -1 -1 800  403 261 91 38 7 0 0
2005  1 1  0 0 1 -1 -1 800  131 516 145 8 0 0 0
2006  1 1  0 0 1 -1 -1 800  110 267 401 22 0 0 0
2007  1 1  0 0 1 -1 -1 800  155 285 289 68 3 0 0
2008  1 1  0 0 1 -1 -1 800  67 369 325 30 9 0 0
2009  1 1  0 0 1 -1 -1 800  205 132 399 58 4 2 0
2010  1 1  0 0 1 -1 -1 800  256 374 124 40 6 0 0
2011  1 1  0 0 1 -1 -1 800  168 356 258 12 6 0 0
2012  1 1  0 0 1 -1 -1 800  111 266 367 52 4 0 0
1990  10 2  0 0 1 -1 -1 800  726 58 7 5 4 0 0
1991  10 2  0 0 1 -1 -1 800  522 236 42 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  377 251 148 24 0 0 0
1993  10 2  0 0 1 -1 -1 800  617 86 48 43 6 0 0
1994  10 2  0 0 1 -1 -1 800  579 179 19 12 11 0 0
1995  10 2  0 0 1 -1 -1 800  473 241 65 13 4 4 0
1996  10 2  0 0 1 -1 -1 800  741 32 18 9 0 0 0
1997  10 2  0 0 1 -1 -1 800  674 112 7 6 1 0 0
1998  10 2  0 0 1 -1 -1 800  533 212 44 6 3 0 2
1999  10 2  0 0 1 -1 -1 800  472 210 87 26 2 3 0
2000  10 2  0 0 1 -1 -1 800  573 140 43 35 8 1 0
2001  10 2  0 0 1 -1 -1 800  643 111 26 12 6 2 0
2002  10 2  0 0 1 -1 -1 800  394 311 66 15 9 4 1
2003  10 2  0 0 1 -1 -1 800  677 57 66 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  743 57 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  551 240 9 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  582 174 42 2 0 0 0
2007  10 2  0 0 1 -1 -1 800  627 137 30 5 1 0 0
2008  10 2  0 0 1 -1 -1 800  431 292 52 15 10 0 0
2009  10 2  0 0 1 -1 -1 800  713 48 31 4 1 3 0
2010  10 2  0 0 1 -1 -1 800  644 139 10 7 0 0 0
2011  10 2  0 0 1 -1 -1 800  573 185 39 3 0 0 0
2012  10 2  0 0 1 -1 -1 800  598 152 43 6 0 1 0
1985  4 3  0 0 1 -1 -1 800  636 112 39 12 1 0 0
1986  4 3  0 0 1 -1 -1 800  350 316 90 29 11 3 1
1987  4 3  0 0 1 -1 -1 800  544 96 112 30 12 4 2
1988  4 3  0 0 1 -1 -1 800  545 153 41 40 11 6 4
1989  4 3  0 0 1 -1 -1 800  684 81 18 8 7 1 1
1990  4 3  0 0 1 -1 -1 800  733 50 9 8 0 0 0
1991  4 3  0 0 1 -1 -1 800  539 222 32 7 0 0 0
1992  4 3  0 0 1 -1 -1 800  448 216 119 17 0 0 0
1993  4 3  0 0 1 -1 -1 800  645 75 58 18 4 0 0
1994  4 3  0 0 1 -1 -1 800  609 143 23 14 11 0 0
1995  4 3  0 0 1 -1 -1 800  512 216 58 6 4 4 0
1996  4 3  0 0 1 -1 -1 800  733 34 19 8 4 0 2
1997  4 3  0 0 1 -1 -1 800  684 106 6 4 0 0 0
1998  4 3  0 0 1 -1 -1 800  558 197 40 5 0 0 0
1999  4 3  0 0 1 -1 -1 800  513 188 84 14 1 0 0
2000  4 3  0 0 1 -1 -1 800  589 134 44 23 10 0 0
2001  4 3  0 0 1 -1 -1 800  639 111 32 13 4 1 0
2002  4 3  0 0 1 -1 -1 800  411 298 58 16 6 11 0
2003  4 3  0 0 1 -1 -1 800  701 49 33 11 5 1 0
2004  4 3  0 0 1 -1 -1 800  730 59 4 4 1 1 1
2005  4 3  0 0 1 -1 -1 800  582 205 13 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  593 144 59 4 0 0 0
2007  4 3  0 0 1 -1 -1 800  636 123 34 7 0 0 0
2008  4 3  0 0 1 -1 -1 800  488 232 54 20 6 0 0
2009  4 3  0 0 1 -1 -1 800  723 39 29 3 4 2 0
2010  4 3  0 0 1 -1 -1 800  697 92 4 6 1 0 0
2011  4 3  0 0 1 -1 -1 800  637 140 21 1 1 0 0
2012  4 3  0 0 1 -1 -1 800  597 146 53 4 0 0 0
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

