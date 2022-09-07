#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Sep 07 08:12:51 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662552771 first rand#: 0.968377
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
-999 1 1 146138 0.05
1985 1 1 201963 0.05
1986 1 1 175591 0.05
1987 1 1 93136.8 0.05
1988 1 1 25548.2 0.05
1989 1 1 52373.4 0.05
1990 1 1 70494.2 0.05
1991 1 1 79265.9 0.05
1992 1 1 123571 0.05
1993 1 1 207709 0.05
1994 1 1 83689.6 0.05
1995 1 1 45309.4 0.05
1996 1 1 123403 0.05
1997 1 1 109420 0.05
1998 1 1 190655 0.05
1999 1 1 152916 0.05
2000 1 1 230684 0.05
2001 1 1 224918 0.05
2002 1 1 187399 0.05
2003 1 1 329185 0.05
2004 1 1 557011 0.05
2005 1 1 786430 0.05
2006 1 1 1.62265e+06 0.05
2007 1 1 885752 0.05
2008 1 1 439887 0.05
2009 1 1 538491 0.05
2010 1 1 459718 0.05
2011 1 1 471970 0.05
2012 1 1 690276 0.05
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
1990 10 2 3.54947e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.18107e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.41549e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.30088e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.62518e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.02115e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.71898e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.18332e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.93456e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.4988e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.20015e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.4506e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.34351e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.38132e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.70124e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.35194e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.47522e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.52285e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.79301e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.6656e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.16157e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 6.46874e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.95441e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.28066e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 432620 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 300821 0.1 #_orig_obs: 954308 survey2
1988 4 3 286956 0.1 #_orig_obs: 245537 survey2
1989 4 3 475398 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.18423e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 831637 0.1 #_orig_obs: 527308 survey2
1992 4 3 422775 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 538724 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 705206 0.1 #_orig_obs: 375877 survey2
1995 4 3 338610 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.21771e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.54745e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.352e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 775823 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 1.05e+06 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.02008e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 427388 0.1 #_orig_obs: 525909 survey2
2003 4 3 830886 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.28435e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.71865e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.55961e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.40914e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 648333 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.15493e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 2.02652e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 2.00642e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.52666e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  155 259 335 43 6 2 0
1986  1 1  0 0 1 -1 -1 800  46 313 378 53 9 0 1
1987  1 1  0 0 1 -1 -1 800  59 96 559 76 10 0 0
1988  1 1  0 0 1 -1 -1 800  103 212 270 192 19 4 0
1989  1 1  0 0 1 -1 -1 800  239 221 271 37 27 5 0
1990  1 1  0 0 1 -1 -1 800  357 270 132 33 8 0 0
1991  1 1  0 0 1 -1 -1 800  113 486 178 20 2 1 0
1992  1 1  0 0 1 -1 -1 800  48 220 500 31 1 0 0
1993  1 1  0 0 1 -1 -1 800  130 151 390 122 7 0 0
1994  1 1  0 0 1 -1 -1 800  157 330 206 81 25 1 0
1995  1 1  0 0 1 -1 -1 800  64 324 365 38 8 1 0
1996  1 1  0 0 1 -1 -1 800  297 149 287 60 6 1 0
1997  1 1  0 0 1 -1 -1 800  268 404 100 24 4 0 0
1998  1 1  0 0 1 -1 -1 800  112 353 316 18 1 0 0
1999  1 1  0 0 1 -1 -1 800  67 213 464 53 3 0 0
2000  1 1  0 0 1 -1 -1 800  91 196 366 134 13 0 0
2001  1 1  0 0 1 -1 -1 800  168 240 289 79 22 2 0
2002  1 1  0 0 1 -1 -1 800  50 371 312 52 8 7 0
2003  1 1  0 0 1 -1 -1 800  168 121 447 55 6 2 1
2004  1 1  0 0 1 -1 -1 800  407 266 74 46 7 0 0
2005  1 1  0 0 1 -1 -1 800  171 466 156 7 0 0 0
2006  1 1  0 0 1 -1 -1 800  119 263 401 17 0 0 0
2007  1 1  0 0 1 -1 -1 800  157 299 291 50 3 0 0
2008  1 1  0 0 1 -1 -1 800  70 374 310 43 3 0 0
2009  1 1  0 0 1 -1 -1 800  218 140 404 30 7 1 0
2010  1 1  0 0 1 -1 -1 800  249 357 146 47 1 0 0
2011  1 1  0 0 1 -1 -1 800  189 346 249 12 4 0 0
2012  1 1  0 0 1 -1 -1 800  135 283 333 48 1 0 0
1990  10 2  0 0 1 -1 -1 800  716 70 9 3 2 0 0
1991  10 2  0 0 1 -1 -1 800  533 236 31 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  377 259 145 19 0 0 0
1993  10 2  0 0 1 -1 -1 800  627 88 48 33 4 0 0
1994  10 2  0 0 1 -1 -1 800  601 158 22 9 10 0 0
1995  10 2  0 0 1 -1 -1 800  444 268 60 15 8 5 0
1996  10 2  0 0 1 -1 -1 800  718 47 26 9 0 0 0
1997  10 2  0 0 1 -1 -1 800  667 119 11 1 2 0 0
1998  10 2  0 0 1 -1 -1 800  507 242 40 6 2 3 0
1999  10 2  0 0 1 -1 -1 800  477 191 109 20 0 3 0
2000  10 2  0 0 1 -1 -1 800  548 133 68 42 9 0 0
2001  10 2  0 0 1 -1 -1 800  616 121 39 13 10 1 0
2002  10 2  0 0 1 -1 -1 800  388 316 70 12 7 6 1
2003  10 2  0 0 1 -1 -1 800  699 49 52 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  733 67 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  568 217 15 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  580 169 46 5 0 0 0
2007  10 2  0 0 1 -1 -1 800  613 150 29 6 2 0 0
2008  10 2  0 0 1 -1 -1 800  438 288 63 7 3 1 0
2009  10 2  0 0 1 -1 -1 800  702 53 38 5 2 0 0
2010  10 2  0 0 1 -1 -1 800  671 113 10 6 0 0 0
2011  10 2  0 0 1 -1 -1 800  600 168 27 5 0 0 0
2012  10 2  0 0 1 -1 -1 800  562 183 46 9 0 0 0
1985  4 3  0 0 1 -1 -1 800  634 122 31 9 4 0 0
1986  4 3  0 0 1 -1 -1 800  345 319 85 35 11 5 0
1987  4 3  0 0 1 -1 -1 800  554 102 103 27 7 5 2
1988  4 3  0 0 1 -1 -1 800  557 131 51 40 16 2 3
1989  4 3  0 0 1 -1 -1 800  679 75 22 10 8 5 1
1990  4 3  0 0 1 -1 -1 800  744 44 8 4 0 0 0
1991  4 3  0 0 1 -1 -1 800  530 242 20 8 0 0 0
1992  4 3  0 0 1 -1 -1 800  404 236 147 13 0 0 0
1993  4 3  0 0 1 -1 -1 800  662 64 44 29 1 0 0
1994  4 3  0 0 1 -1 -1 800  617 144 18 13 8 0 0
1995  4 3  0 0 1 -1 -1 800  505 224 56 7 3 5 0
1996  4 3  0 0 1 -1 -1 800  740 31 22 6 0 0 1
1997  4 3  0 0 1 -1 -1 800  683 112 5 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  557 196 43 4 0 0 0
1999  4 3  0 0 1 -1 -1 800  515 189 67 21 8 0 0
2000  4 3  0 0 1 -1 -1 800  599 116 50 27 8 0 0
2001  4 3  0 0 1 -1 -1 800  659 97 28 10 5 1 0
2002  4 3  0 0 1 -1 -1 800  417 306 48 13 9 7 0
2003  4 3  0 0 1 -1 -1 800  724 39 24 6 3 3 1
2004  4 3  0 0 1 -1 -1 800  734 58 6 1 1 0 0
2005  4 3  0 0 1 -1 -1 800  583 204 11 0 0 1 1
2006  4 3  0 0 1 -1 -1 800  606 144 48 2 0 0 0
2007  4 3  0 0 1 -1 -1 800  660 106 28 6 0 0 0
2008  4 3  0 0 1 -1 -1 800  471 271 44 11 3 0 0
2009  4 3  0 0 1 -1 -1 800  718 49 31 2 0 0 0
2010  4 3  0 0 1 -1 -1 800  677 106 11 4 2 0 0
2011  4 3  0 0 1 -1 -1 800  617 139 36 7 1 0 0
2012  4 3  0 0 1 -1 -1 800  584 161 47 8 0 0 0
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

