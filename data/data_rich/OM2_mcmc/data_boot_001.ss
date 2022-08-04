#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 11:47:35 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659541655 first rand#: 1.03011
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
-999 1 1 285530 0.05
1985 1 1 184364 0.05
1986 1 1 176235 0.05
1987 1 1 96785.5 0.05
1988 1 1 25910.9 0.05
1989 1 1 54039.2 0.05
1990 1 1 62259.1 0.05
1991 1 1 73738.1 0.05
1992 1 1 132298 0.05
1993 1 1 200671 0.05
1994 1 1 83671.4 0.05
1995 1 1 45846.1 0.05
1996 1 1 114207 0.05
1997 1 1 103367 0.05
1998 1 1 191920 0.05
1999 1 1 157786 0.05
2000 1 1 256943 0.05
2001 1 1 228912 0.05
2002 1 1 216113 0.05
2003 1 1 304907 0.05
2004 1 1 577232 0.05
2005 1 1 816253 0.05
2006 1 1 1.5176e+06 0.05
2007 1 1 912071 0.05
2008 1 1 433653 0.05
2009 1 1 478966 0.05
2010 1 1 470292 0.05
2011 1 1 415624 0.05
2012 1 1 659480 0.05
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
1990 10 2 304.091 0.1 #_orig_obs: 544208 survey1
1991 10 2 273.458 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 262.722 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 223.953 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 292.693 0.1 #_orig_obs: 974412 survey1
1995 10 2 310.92 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 277.503 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 285.648 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 291.618 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 301.686 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 261.837 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 278.112 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 255.737 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 252.565 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 236.386 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 212.837 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 124.247 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 139.739 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 159.1 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 210.42 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 178.596 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 207.21 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 189.041 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1602 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 1386.9 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 1362.38 0.1 #_orig_obs: 954308 survey2
1988 4 3 1148.91 0.1 #_orig_obs: 245537 survey2
1989 4 3 1545.55 0.1 #_orig_obs: 165382 survey2
1990 4 3 1274.27 0.1 #_orig_obs: 140452 survey2
1991 4 3 1427.17 0.1 #_orig_obs: 527308 survey2
1992 4 3 1236.77 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 1347.09 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 1411.55 0.1 #_orig_obs: 375877 survey2
1995 4 3 1212.52 0.1 #_orig_obs: 528242 survey2
1996 4 3 1611.92 0.1 #_orig_obs: 581896 survey2
1997 4 3 1147.56 0.1 #_orig_obs: 407766 survey2
1998 4 3 1132.99 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1181.77 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 1256.02 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1243.3 0.1 #_orig_obs: 689461 survey2
2002 4 3 1482.08 0.1 #_orig_obs: 525909 survey2
2003 4 3 1370.27 0.1 #_orig_obs: 634479 survey2
2004 4 3 1164.51 0.1 #_orig_obs: 201645 survey2
2005 4 3 1203.12 0.1 #_orig_obs: 901519 survey2
2006 4 3 917.173 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 837.187 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 883.088 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 963.121 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 849.731 0.1 #_orig_obs: 552500 survey2
2011 4 3 767.725 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 916.578 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  405 312 75 6 2 0 0
1986  1 1  0 0 1 -1 -1 800  365 351 74 7 2 1 0
1987  1 1  0 0 1 -1 -1 800  382 344 67 5 1 1 0
1988  1 1  0 0 1 -1 -1 800  396 340 54 9 1 0 0
1989  1 1  0 0 1 -1 -1 800  388 330 64 15 2 0 1
1990  1 1  0 0 1 -1 -1 800  377 343 62 14 4 0 0
1991  1 1  0 0 1 -1 -1 800  383 337 67 9 3 1 0
1992  1 1  0 0 1 -1 -1 800  403 322 63 8 4 0 0
1993  1 1  0 0 1 -1 -1 800  405 334 56 5 0 0 0
1994  1 1  0 0 1 -1 -1 800  403 328 57 12 0 0 0
1995  1 1  0 0 1 -1 -1 800  393 323 74 6 3 1 0
1996  1 1  0 0 1 -1 -1 800  411 318 62 8 1 0 0
1997  1 1  0 0 1 -1 -1 800  383 344 57 11 5 0 0
1998  1 1  0 0 1 -1 -1 800  392 330 67 5 6 0 0
1999  1 1  0 0 1 -1 -1 800  384 320 73 21 2 0 0
2000  1 1  0 0 1 -1 -1 800  388 346 59 6 1 0 0
2001  1 1  0 0 1 -1 -1 800  391 329 63 12 4 0 1
2002  1 1  0 0 1 -1 -1 800  410 313 63 12 2 0 0
2003  1 1  0 0 1 -1 -1 800  397 329 58 13 2 0 1
2004  1 1  0 0 1 -1 -1 800  396 327 58 18 1 0 0
2005  1 1  0 0 1 -1 -1 800  450 288 46 16 0 0 0
2006  1 1  0 0 1 -1 -1 800  465 276 46 13 0 0 0
2007  1 1  0 0 1 -1 -1 800  480 280 34 5 1 0 0
2008  1 1  0 0 1 -1 -1 800  416 342 38 3 1 0 0
2009  1 1  0 0 1 -1 -1 800  415 307 68 9 0 1 0
2010  1 1  0 0 1 -1 -1 800  448 298 45 9 0 0 0
2011  1 1  0 0 1 -1 -1 800  441 306 43 8 2 0 0
2012  1 1  0 0 1 -1 -1 800  402 349 42 7 0 0 0
1990  10 2  0 0 1 -1 -1 800  61 650 89 0 0 0 0
1991  10 2  0 0 1 -1 -1 800  66 650 84 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  43 666 90 1 0 0 0
1993  10 2  0 0 1 -1 -1 800  52 647 99 1 1 0 0
1994  10 2  0 0 1 -1 -1 800  52 646 101 1 0 0 0
1995  10 2  0 0 1 -1 -1 800  57 645 96 2 0 0 0
1996  10 2  0 0 1 -1 -1 800  61 632 105 2 0 0 0
1997  10 2  0 0 1 -1 -1 800  54 645 100 1 0 0 0
1998  10 2  0 0 1 -1 -1 800  73 636 91 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  51 613 132 4 0 0 0
2000  10 2  0 0 1 -1 -1 800  55 647 96 2 0 0 0
2001  10 2  0 0 1 -1 -1 800  57 640 102 1 0 0 0
2002  10 2  0 0 1 -1 -1 800  69 648 83 0 0 0 0
2003  10 2  0 0 1 -1 -1 800  71 651 78 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  82 718 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  79 637 84 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  112 601 87 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  101 629 70 0 0 0 0
2008  10 2  0 0 1 -1 -1 800  73 670 57 0 0 0 0
2009  10 2  0 0 1 -1 -1 800  71 648 78 3 0 0 0
2010  10 2  0 0 1 -1 -1 800  82 637 80 1 0 0 0
2011  10 2  0 0 1 -1 -1 800  74 646 79 1 0 0 0
2012  10 2  0 0 1 -1 -1 800  86 648 65 1 0 0 0
1985  4 3  0 0 1 -1 -1 800  87 630 81 2 0 0 0
1986  4 3  0 0 1 -1 -1 800  71 645 84 0 0 0 0
1987  4 3  0 0 1 -1 -1 800  66 631 100 3 0 0 0
1988  4 3  0 0 1 -1 -1 800  67 646 87 0 0 0 0
1989  4 3  0 0 1 -1 -1 800  86 629 84 1 0 0 0
1990  4 3  0 0 1 -1 -1 800  79 629 90 2 0 0 0
1991  4 3  0 0 1 -1 -1 800  82 641 77 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  70 638 92 0 0 0 0
1993  4 3  0 0 1 -1 -1 800  79 633 87 1 0 0 0
1994  4 3  0 0 1 -1 -1 800  71 636 93 0 0 0 0
1995  4 3  0 0 1 -1 -1 800  72 640 86 2 0 0 0
1996  4 3  0 0 1 -1 -1 800  83 637 78 2 0 0 0
1997  4 3  0 0 1 -1 -1 800  79 648 73 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  81 627 91 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  82 638 80 0 0 0 0
2000  4 3  0 0 1 -1 -1 800  74 630 95 1 0 0 0
2001  4 3  0 0 1 -1 -1 800  82 642 75 1 0 0 0
2002  4 3  0 0 1 -1 -1 800  86 617 97 0 0 0 0
2003  4 3  0 0 1 -1 -1 800  93 616 90 1 0 0 0
2004  4 3  0 0 1 -1 -1 800  88 629 81 2 0 0 0
2005  4 3  0 0 1 -1 -1 800  74 636 88 2 0 0 0
2006  4 3  0 0 1 -1 -1 800  85 663 51 1 0 0 0
2007  4 3  0 0 1 -1 -1 800  83 682 35 0 0 0 0
2008  4 3  0 0 1 -1 -1 800  99 663 38 0 0 0 0
2009  4 3  0 0 1 -1 -1 800  87 652 61 0 0 0 0
2010  4 3  0 0 1 -1 -1 800  90 647 60 3 0 0 0
2011  4 3  0 0 1 -1 -1 800  84 641 73 2 0 0 0
2012  4 3  0 0 1 -1 -1 800  91 628 81 0 0 0 0
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

