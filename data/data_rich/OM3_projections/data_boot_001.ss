#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 15 09:56:00 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660571760 first rand#: 1.44837
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
-999 1 1 130661 0.05
1985 1 1 192382 0.05
1986 1 1 174192 0.05
1987 1 1 96282.4 0.05
1988 1 1 25687.4 0.05
1989 1 1 53379.1 0.05
1990 1 1 68361.8 0.05
1991 1 1 79868.4 0.05
1992 1 1 123644 0.05
1993 1 1 213071 0.05
1994 1 1 94051.5 0.05
1995 1 1 51020.3 0.05
1996 1 1 114170 0.05
1997 1 1 90761.1 0.05
1998 1 1 186985 0.05
1999 1 1 159079 0.05
2000 1 1 236448 0.05
2001 1 1 206768 0.05
2002 1 1 210713 0.05
2003 1 1 323022 0.05
2004 1 1 589364 0.05
2005 1 1 786949 0.05
2006 1 1 1.4848e+06 0.05
2007 1 1 813744 0.05
2008 1 1 434137 0.05
2009 1 1 499355 0.05
2010 1 1 467772 0.05
2011 1 1 416867 0.05
2012 1 1 737053 0.05
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
1990 10 2 3.03223e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.28826e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.31472e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.27806e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.24089e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.04159e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.50922e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.84798e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.42388e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.08299e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.38949e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.29209e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.1831e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.41303e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.6616e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 3.68399e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.77077e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 2.97595e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.6425e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.39409e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.05275e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.66031e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.49551e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.27285e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 455702 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 352851 0.1 #_orig_obs: 954308 survey2
1988 4 3 233484 0.1 #_orig_obs: 245537 survey2
1989 4 3 421006 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.17125e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 764874 0.1 #_orig_obs: 527308 survey2
1992 4 3 404295 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 532300 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 577584 0.1 #_orig_obs: 375877 survey2
1995 4 3 363545 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.13265e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.68331e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.25862e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 777327 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 717641 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 887591 0.1 #_orig_obs: 689461 survey2
2002 4 3 472484 0.1 #_orig_obs: 525909 survey2
2003 4 3 800847 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.62555e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.85285e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.12091e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.06894e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 646386 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.29116e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 2.01669e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.74942e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.4329e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  151 270 324 45 8 2 0
1986  1 1  0 0 1 -1 -1 800  32 287 395 72 12 1 1
1987  1 1  0 0 1 -1 -1 800  71 92 534 86 14 3 0
1988  1 1  0 0 1 -1 -1 800  109 237 251 178 22 3 0
1989  1 1  0 0 1 -1 -1 800  198 210 316 48 22 3 3
1990  1 1  0 0 1 -1 -1 800  372 245 145 32 6 0 0
1991  1 1  0 0 1 -1 -1 800  113 460 203 20 2 0 2
1992  1 1  0 0 1 -1 -1 800  41 220 504 34 1 0 0
1993  1 1  0 0 1 -1 -1 800  137 123 367 155 18 0 0
1994  1 1  0 0 1 -1 -1 800  174 335 184 91 14 2 0
1995  1 1  0 0 1 -1 -1 800  83 313 363 30 11 0 0
1996  1 1  0 0 1 -1 -1 800  322 122 295 56 3 1 1
1997  1 1  0 0 1 -1 -1 800  278 390 99 30 3 0 0
1998  1 1  0 0 1 -1 -1 800  92 345 343 17 3 0 0
1999  1 1  0 0 1 -1 -1 800  48 219 468 64 1 0 0
2000  1 1  0 0 1 -1 -1 800  111 206 341 137 5 0 0
2001  1 1  0 0 1 -1 -1 800  173 248 276 82 19 2 0
2002  1 1  0 0 1 -1 -1 800  60 395 294 42 8 1 0
2003  1 1  0 0 1 -1 -1 800  203 120 429 39 8 1 0
2004  1 1  0 0 1 -1 -1 800  400 288 77 31 4 0 0
2005  1 1  0 0 1 -1 -1 800  155 492 147 6 0 0 0
2006  1 1  0 0 1 -1 -1 800  108 267 408 17 0 0 0
2007  1 1  0 0 1 -1 -1 800  166 269 318 42 5 0 0
2008  1 1  0 0 1 -1 -1 800  66 334 343 49 8 0 0
2009  1 1  0 0 1 -1 -1 800  214 163 368 45 9 1 0
2010  1 1  0 0 1 -1 -1 800  268 372 108 47 5 0 0
2011  1 1  0 0 1 -1 -1 800  136 355 295 12 2 0 0
2012  1 1  0 0 1 -1 -1 800  124 279 344 52 1 0 0
1990  10 2  0 0 1 -1 -1 800  726 57 10 3 4 0 0
1991  10 2  0 0 1 -1 -1 800  523 252 25 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  387 245 151 17 0 0 0
1993  10 2  0 0 1 -1 -1 800  612 86 55 42 5 0 0
1994  10 2  0 0 1 -1 -1 800  583 161 32 14 10 0 0
1995  10 2  0 0 1 -1 -1 800  468 248 62 9 6 7 0
1996  10 2  0 0 1 -1 -1 800  749 31 15 5 0 0 0
1997  10 2  0 0 1 -1 -1 800  649 137 11 2 1 0 0
1998  10 2  0 0 1 -1 -1 800  539 207 51 2 1 0 0
1999  10 2  0 0 1 -1 -1 800  443 226 103 25 2 1 0
2000  10 2  0 0 1 -1 -1 800  570 127 57 34 12 0 0
2001  10 2  0 0 1 -1 -1 800  626 133 12 17 11 1 0
2002  10 2  0 0 1 -1 -1 800  395 322 55 17 7 4 0
2003  10 2  0 0 1 -1 -1 800  692 58 50 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  724 76 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  537 238 25 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  594 165 38 3 0 0 0
2007  10 2  0 0 1 -1 -1 800  607 148 32 11 2 0 0
2008  10 2  0 0 1 -1 -1 800  441 276 70 11 2 0 0
2009  10 2  0 0 1 -1 -1 800  702 56 35 4 1 2 0
2010  10 2  0 0 1 -1 -1 800  671 119 8 2 0 0 0
2011  10 2  0 0 1 -1 -1 800  601 168 25 6 0 0 0
2012  10 2  0 0 1 -1 -1 800  581 174 36 9 0 0 0
1985  4 3  0 0 1 -1 -1 800  634 116 35 8 7 0 0
1986  4 3  0 0 1 -1 -1 800  377 308 79 22 7 3 4
1987  4 3  0 0 1 -1 -1 800  551 100 102 31 10 3 3
1988  4 3  0 0 1 -1 -1 800  547 154 29 47 10 8 5
1989  4 3  0 0 1 -1 -1 800  693 72 19 4 8 2 2
1990  4 3  0 0 1 -1 -1 800  740 49 4 7 0 0 0
1991  4 3  0 0 1 -1 -1 800  550 228 21 1 0 0 0
1992  4 3  0 0 1 -1 -1 800  432 231 122 15 0 0 0
1993  4 3  0 0 1 -1 -1 800  651 61 50 32 6 0 0
1994  4 3  0 0 1 -1 -1 800  617 137 13 17 16 0 0
1995  4 3  0 0 1 -1 -1 800  479 237 65 10 2 7 0
1996  4 3  0 0 1 -1 -1 800  740 35 20 4 0 1 0
1997  4 3  0 0 1 -1 -1 800  688 99 7 6 0 0 0
1998  4 3  0 0 1 -1 -1 800  560 196 39 5 0 0 0
1999  4 3  0 0 1 -1 -1 800  539 176 65 18 2 0 0
2000  4 3  0 0 1 -1 -1 800  590 114 57 32 7 0 0
2001  4 3  0 0 1 -1 -1 800  657 87 33 13 10 0 0
2002  4 3  0 0 1 -1 -1 800  439 283 55 13 7 3 0
2003  4 3  0 0 1 -1 -1 800  709 48 35 3 1 1 3
2004  4 3  0 0 1 -1 -1 800  731 62 1 5 1 0 0
2005  4 3  0 0 1 -1 -1 800  582 200 18 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  596 148 52 4 0 0 0
2007  4 3  0 0 1 -1 -1 800  660 103 27 10 0 0 0
2008  4 3  0 0 1 -1 -1 800  477 268 40 10 5 0 0
2009  4 3  0 0 1 -1 -1 800  725 45 23 6 1 0 0
2010  4 3  0 0 1 -1 -1 800  697 88 5 10 0 0 0
2011  4 3  0 0 1 -1 -1 800  608 165 23 2 2 0 0
2012  4 3  0 0 1 -1 -1 800  588 143 59 10 0 0 0
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

