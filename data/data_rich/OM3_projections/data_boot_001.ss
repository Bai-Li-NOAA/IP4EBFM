#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Sep 05 13:26:18 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662398778 first rand#: -1.64236
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
-999 1 1 124014 0.05
1985 1 1 194162 0.05
1986 1 1 165927 0.05
1987 1 1 90797.7 0.05
1988 1 1 25085.5 0.05
1989 1 1 51895 0.05
1990 1 1 63091.3 0.05
1991 1 1 73850.9 0.05
1992 1 1 131083 0.05
1993 1 1 210425 0.05
1994 1 1 97407.8 0.05
1995 1 1 49175.8 0.05
1996 1 1 117473 0.05
1997 1 1 93775.7 0.05
1998 1 1 191862 0.05
1999 1 1 157503 0.05
2000 1 1 244801 0.05
2001 1 1 209954 0.05
2002 1 1 228329 0.05
2003 1 1 318163 0.05
2004 1 1 593967 0.05
2005 1 1 814253 0.05
2006 1 1 1.49434e+06 0.05
2007 1 1 919071 0.05
2008 1 1 438653 0.05
2009 1 1 510544 0.05
2010 1 1 478313 0.05
2011 1 1 428614 0.05
2012 1 1 694322 0.05
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
1990 10 2 3.25552e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.49327e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.31823e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.51848e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.57521e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 934647 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.29568e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.82334e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.60753e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.20013e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.28821e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.41629e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.0216e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.16272e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.60837e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.93537e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.85221e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.30073e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.8653e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.98347e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.70294e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.49838e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 5.62886e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.16985e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 445425 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 341447 0.1 #_orig_obs: 954308 survey2
1988 4 3 256405 0.1 #_orig_obs: 245537 survey2
1989 4 3 411369 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.01529e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 836548 0.1 #_orig_obs: 527308 survey2
1992 4 3 343857 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 485397 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 583587 0.1 #_orig_obs: 375877 survey2
1995 4 3 319563 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.11409e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.58091e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.37437e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 765691 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 721224 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 979169 0.1 #_orig_obs: 689461 survey2
2002 4 3 457119 0.1 #_orig_obs: 525909 survey2
2003 4 3 763230 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.30967e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.63365e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.216e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.33486e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 511961 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.24527e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.78363e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.90612e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.84906e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  129 278 330 53 7 3 0
1986  1 1  0 0 1 -1 -1 800  31 315 375 70 8 0 1
1987  1 1  0 0 1 -1 -1 800  57 117 503 103 16 4 0
1988  1 1  0 0 1 -1 -1 800  83 223 270 192 25 7 0
1989  1 1  0 0 1 -1 -1 800  216 202 292 45 41 2 2
1990  1 1  0 0 1 -1 -1 800  362 272 133 28 5 0 0
1991  1 1  0 0 1 -1 -1 800  128 450 194 23 3 2 0
1992  1 1  0 0 1 -1 -1 800  35 219 511 30 5 0 0
1993  1 1  0 0 1 -1 -1 800  111 131 410 140 8 0 0
1994  1 1  0 0 1 -1 -1 800  164 336 180 92 26 2 0
1995  1 1  0 0 1 -1 -1 800  70 293 390 29 14 4 0
1996  1 1  0 0 1 -1 -1 800  295 132 295 70 6 2 0
1997  1 1  0 0 1 -1 -1 800  279 405 87 27 2 0 0
1998  1 1  0 0 1 -1 -1 800  111 352 324 11 2 0 0
1999  1 1  0 0 1 -1 -1 800  72 216 441 69 2 0 0
2000  1 1  0 0 1 -1 -1 800  100 194 362 131 13 0 0
2001  1 1  0 0 1 -1 -1 800  169 252 272 87 18 2 0
2002  1 1  0 0 1 -1 -1 800  52 384 309 42 11 2 0
2003  1 1  0 0 1 -1 -1 800  200 121 426 46 5 2 0
2004  1 1  0 0 1 -1 -1 800  386 281 86 43 4 0 0
2005  1 1  0 0 1 -1 -1 800  143 500 155 2 0 0 0
2006  1 1  0 0 1 -1 -1 800  103 282 395 20 0 0 0
2007  1 1  0 0 1 -1 -1 800  185 318 265 29 3 0 0
2008  1 1  0 0 1 -1 -1 800  57 387 308 41 7 0 0
2009  1 1  0 0 1 -1 -1 800  217 159 377 45 2 0 0
2010  1 1  0 0 1 -1 -1 800  291 346 120 38 5 0 0
2011  1 1  0 0 1 -1 -1 800  163 352 269 10 6 0 0
2012  1 1  0 0 1 -1 -1 800  113 291 360 35 1 0 0
1990  10 2  0 0 1 -1 -1 800  707 79 10 1 3 0 0
1991  10 2  0 0 1 -1 -1 800  512 254 34 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  373 250 159 18 0 0 0
1993  10 2  0 0 1 -1 -1 800  641 70 54 30 5 0 0
1994  10 2  0 0 1 -1 -1 800  584 170 18 13 15 0 0
1995  10 2  0 0 1 -1 -1 800  478 233 65 10 10 4 0
1996  10 2  0 0 1 -1 -1 800  737 36 16 11 0 0 0
1997  10 2  0 0 1 -1 -1 800  670 124 3 2 1 0 0
1998  10 2  0 0 1 -1 -1 800  512 237 45 4 1 0 1
1999  10 2  0 0 1 -1 -1 800  485 205 84 24 0 2 0
2000  10 2  0 0 1 -1 -1 800  576 129 62 29 2 2 0
2001  10 2  0 0 1 -1 -1 800  634 112 32 9 10 3 0
2002  10 2  0 0 1 -1 -1 800  410 308 50 21 6 3 2
2003  10 2  0 0 1 -1 -1 800  697 47 56 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  729 71 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  584 195 21 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  566 179 51 4 0 0 0
2007  10 2  0 0 1 -1 -1 800  615 127 43 13 2 0 0
2008  10 2  0 0 1 -1 -1 800  456 268 59 14 3 0 0
2009  10 2  0 0 1 -1 -1 800  680 66 41 8 5 0 0
2010  10 2  0 0 1 -1 -1 800  682 105 6 7 0 0 0
2011  10 2  0 0 1 -1 -1 800  591 185 21 3 0 0 0
2012  10 2  0 0 1 -1 -1 800  575 164 48 11 1 1 0
1985  4 3  0 0 1 -1 -1 800  601 134 43 14 8 0 0
1986  4 3  0 0 1 -1 -1 800  338 330 88 29 11 3 1
1987  4 3  0 0 1 -1 -1 800  558 93 104 26 10 8 1
1988  4 3  0 0 1 -1 -1 800  548 148 40 44 16 2 2
1989  4 3  0 0 1 -1 -1 800  648 98 35 7 6 4 2
1990  4 3  0 0 1 -1 -1 800  735 52 5 8 0 0 0
1991  4 3  0 0 1 -1 -1 800  534 243 16 7 0 0 0
1992  4 3  0 0 1 -1 -1 800  425 238 120 17 0 0 0
1993  4 3  0 0 1 -1 -1 800  634 81 55 27 3 0 0
1994  4 3  0 0 1 -1 -1 800  621 143 22 9 5 0 0
1995  4 3  0 0 1 -1 -1 800  490 217 75 6 6 6 0
1996  4 3  0 0 1 -1 -1 800  750 24 19 4 0 0 3
1997  4 3  0 0 1 -1 -1 800  685 106 4 5 0 0 0
1998  4 3  0 0 1 -1 -1 800  545 217 31 7 0 0 0
1999  4 3  0 0 1 -1 -1 800  525 168 94 12 1 0 0
2000  4 3  0 0 1 -1 -1 800  588 117 62 28 5 0 0
2001  4 3  0 0 1 -1 -1 800  633 118 29 9 9 1 1
2002  4 3  0 0 1 -1 -1 800  424 296 54 17 4 5 0
2003  4 3  0 0 1 -1 -1 800  702 43 43 6 4 0 2
2004  4 3  0 0 1 -1 -1 800  753 44 0 3 0 0 0
2005  4 3  0 0 1 -1 -1 800  556 228 12 1 2 0 1
2006  4 3  0 0 1 -1 -1 800  583 156 56 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  642 120 25 13 0 0 0
2008  4 3  0 0 1 -1 -1 800  486 260 34 15 5 0 0
2009  4 3  0 0 1 -1 -1 800  705 58 27 9 0 1 0
2010  4 3  0 0 1 -1 -1 800  676 107 11 5 1 0 0
2011  4 3  0 0 1 -1 -1 800  598 170 28 3 1 0 0
2012  4 3  0 0 1 -1 -1 800  607 143 44 6 0 0 0
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

