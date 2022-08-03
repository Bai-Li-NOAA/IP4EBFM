#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 09:34:49 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659533689 first rand#: -0.260477
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
-999 1 1 134133 0.05
1985 1 1 192817 0.05
1986 1 1 169161 0.05
1987 1 1 92645.1 0.05
1988 1 1 26080.3 0.05
1989 1 1 53231.6 0.05
1990 1 1 63009.5 0.05
1991 1 1 70739.9 0.05
1992 1 1 138115 0.05
1993 1 1 204902 0.05
1994 1 1 91489.7 0.05
1995 1 1 45646.8 0.05
1996 1 1 124439 0.05
1997 1 1 106914 0.05
1998 1 1 196780 0.05
1999 1 1 167451 0.05
2000 1 1 243482 0.05
2001 1 1 220312 0.05
2002 1 1 224232 0.05
2003 1 1 306463 0.05
2004 1 1 581465 0.05
2005 1 1 794054 0.05
2006 1 1 1.64923e+06 0.05
2007 1 1 831897 0.05
2008 1 1 435537 0.05
2009 1 1 531910 0.05
2010 1 1 455706 0.05
2011 1 1 421076 0.05
2012 1 1 692232 0.05
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
1990 10 2 3.05135e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.30724e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.27266e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.47314e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.55523e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 940467 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.8632e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.9718e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 2.9369e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.08483e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.04771e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.64181e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.18301e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.21979e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.75337e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.49151e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 4.06576e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.44856e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.84223e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.5138e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.50976e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.31835e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.69476e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 954546 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 481094 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 356249 0.1 #_orig_obs: 954308 survey2
1988 4 3 249455 0.1 #_orig_obs: 245537 survey2
1989 4 3 448450 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.04436e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 992685 0.1 #_orig_obs: 527308 survey2
1992 4 3 475862 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 627170 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 496307 0.1 #_orig_obs: 375877 survey2
1995 4 3 303952 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.28068e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.73661e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.11232e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 780387 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 666905 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.11999e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 371627 0.1 #_orig_obs: 525909 survey2
2003 4 3 933153 0.1 #_orig_obs: 634479 survey2
2004 4 3 1.92842e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.79626e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.32446e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.45678e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 691276 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.4629e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 2.01745e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.99243e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.45791e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  147 277 312 56 7 1 0
1986  1 1  0 0 1 -1 -1 800  38 302 372 81 4 3 0
1987  1 1  0 0 1 -1 -1 800  66 109 527 88 7 3 0
1988  1 1  0 0 1 -1 -1 800  115 230 255 175 24 1 0
1989  1 1  0 0 1 -1 -1 800  203 215 311 49 16 6 0
1990  1 1  0 0 1 -1 -1 800  340 259 164 33 4 0 0
1991  1 1  0 0 1 -1 -1 800  128 455 186 28 3 0 0
1992  1 1  0 0 1 -1 -1 800  39 236 485 35 5 0 0
1993  1 1  0 0 1 -1 -1 800  109 134 388 165 4 0 0
1994  1 1  0 0 1 -1 -1 800  155 357 185 81 18 4 0
1995  1 1  0 0 1 -1 -1 800  82 308 361 37 8 4 0
1996  1 1  0 0 1 -1 -1 800  295 127 301 72 2 3 0
1997  1 1  0 0 1 -1 -1 800  277 382 100 35 6 0 0
1998  1 1  0 0 1 -1 -1 800  109 361 316 8 6 0 0
1999  1 1  0 0 1 -1 -1 800  74 230 450 44 2 0 0
2000  1 1  0 0 1 -1 -1 800  107 204 358 117 14 0 0
2001  1 1  0 0 1 -1 -1 800  172 243 262 96 22 5 0
2002  1 1  0 0 1 -1 -1 800  49 394 291 53 11 2 0
2003  1 1  0 0 1 -1 -1 800  190 144 398 59 8 0 1
2004  1 1  0 0 1 -1 -1 800  424 272 62 38 4 0 0
2005  1 1  0 0 1 -1 -1 800  150 489 154 7 0 0 0
2006  1 1  0 0 1 -1 -1 800  122 257 407 14 0 0 0
2007  1 1  0 0 1 -1 -1 800  166 283 288 63 0 0 0
2008  1 1  0 0 1 -1 -1 800  68 378 305 39 10 0 0
2009  1 1  0 0 1 -1 -1 800  190 151 404 48 6 1 0
2010  1 1  0 0 1 -1 -1 800  259 366 124 46 5 0 0
2011  1 1  0 0 1 -1 -1 800  140 330 308 17 5 0 0
2012  1 1  0 0 1 -1 -1 800  129 289 341 38 3 0 0
1990  10 2  0 0 1 -1 -1 800  728 54 8 5 5 0 0
1991  10 2  0 0 1 -1 -1 800  522 254 24 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  393 248 141 18 0 0 0
1993  10 2  0 0 1 -1 -1 800  617 86 60 32 5 0 0
1994  10 2  0 0 1 -1 -1 800  600 150 15 22 13 0 0
1995  10 2  0 0 1 -1 -1 800  445 259 77 7 10 2 0
1996  10 2  0 0 1 -1 -1 800  732 33 23 12 0 0 0
1997  10 2  0 0 1 -1 -1 800  670 117 6 6 1 0 0
1998  10 2  0 0 1 -1 -1 800  508 238 44 4 5 0 1
1999  10 2  0 0 1 -1 -1 800  489 178 108 24 0 1 0
2000  10 2  0 0 1 -1 -1 800  542 143 71 41 3 0 0
2001  10 2  0 0 1 -1 -1 800  639 106 27 17 10 1 0
2002  10 2  0 0 1 -1 -1 800  394 308 66 20 7 4 1
2003  10 2  0 0 1 -1 -1 800  699 49 52 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  731 69 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  558 230 12 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  589 151 54 6 0 0 0
2007  10 2  0 0 1 -1 -1 800  628 140 23 8 1 0 0
2008  10 2  0 0 1 -1 -1 800  449 285 48 15 1 2 0
2009  10 2  0 0 1 -1 -1 800  700 59 33 5 3 0 0
2010  10 2  0 0 1 -1 -1 800  679 109 7 5 0 0 0
2011  10 2  0 0 1 -1 -1 800  611 162 23 4 0 0 0
2012  10 2  0 0 1 -1 -1 800  565 166 54 13 1 1 0
1985  4 3  0 0 1 -1 -1 800  614 136 36 8 6 0 0
1986  4 3  0 0 1 -1 -1 800  368 306 94 19 7 4 2
1987  4 3  0 0 1 -1 -1 800  522 102 116 45 8 3 4
1988  4 3  0 0 1 -1 -1 800  586 144 24 34 8 2 2
1989  4 3  0 0 1 -1 -1 800  677 84 23 6 6 1 3
1990  4 3  0 0 1 -1 -1 800  733 51 9 7 0 0 0
1991  4 3  0 0 1 -1 -1 800  530 243 27 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  415 239 133 13 0 0 0
1993  4 3  0 0 1 -1 -1 800  650 68 50 29 3 0 0
1994  4 3  0 0 1 -1 -1 800  627 126 23 17 7 0 0
1995  4 3  0 0 1 -1 -1 800  532 197 55 6 5 5 0
1996  4 3  0 0 1 -1 -1 800  742 35 15 7 1 0 0
1997  4 3  0 0 1 -1 -1 800  693 96 5 6 0 0 0
1998  4 3  0 0 1 -1 -1 800  558 209 32 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  516 179 88 17 0 0 0
2000  4 3  0 0 1 -1 -1 800  573 130 63 25 9 0 0
2001  4 3  0 0 1 -1 -1 800  653 109 18 14 2 4 0
2002  4 3  0 0 1 -1 -1 800  395 303 62 25 10 5 0
2003  4 3  0 0 1 -1 -1 800  712 48 34 6 0 0 0
2004  4 3  0 0 1 -1 -1 800  734 57 0 5 3 1 0
2005  4 3  0 0 1 -1 -1 800  558 232 10 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  588 149 57 6 0 0 0
2007  4 3  0 0 1 -1 -1 800  650 113 30 7 0 0 0
2008  4 3  0 0 1 -1 -1 800  465 265 52 13 5 0 0
2009  4 3  0 0 1 -1 -1 800  702 62 29 4 1 2 0
2010  4 3  0 0 1 -1 -1 800  696 88 5 6 5 0 0
2011  4 3  0 0 1 -1 -1 800  619 159 21 0 1 0 0
2012  4 3  0 0 1 -1 -1 800  593 156 37 14 0 0 0
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

