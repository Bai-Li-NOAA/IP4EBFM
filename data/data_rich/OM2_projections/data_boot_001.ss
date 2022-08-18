#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 18 16:37:28 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660855048 first rand#: -0.779391
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
-999 1 1 74504.4 0.05
1985 1 1 184794 0.05
1986 1 1 177759 0.05
1987 1 1 94468.5 0.05
1988 1 1 24613.7 0.05
1989 1 1 51313.4 0.05
1990 1 1 64492.1 0.05
1991 1 1 75420.1 0.05
1992 1 1 124109 0.05
1993 1 1 198182 0.05
1994 1 1 102140 0.05
1995 1 1 50847 0.05
1996 1 1 117095 0.05
1997 1 1 107952 0.05
1998 1 1 190273 0.05
1999 1 1 145793 0.05
2000 1 1 243290 0.05
2001 1 1 206455 0.05
2002 1 1 209051 0.05
2003 1 1 325828 0.05
2004 1 1 578479 0.05
2005 1 1 835510 0.05
2006 1 1 1.42585e+06 0.05
2007 1 1 881944 0.05
2008 1 1 425562 0.05
2009 1 1 521187 0.05
2010 1 1 482625 0.05
2011 1 1 461488 0.05
2012 1 1 677901 0.05
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
1990 10 2 3.05263e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.17658e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.09389e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.4979e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.45194e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 792424 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.30389e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 3.96897e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.16871e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.30406e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.26163e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.55834e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.39115e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.26292e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 8.22907e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.60324e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.86365e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.80504e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.83016e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.92983e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.86184e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.74844e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.98486e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 866082 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 337500 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 297317 0.1 #_orig_obs: 954308 survey2
1988 4 3 267261 0.1 #_orig_obs: 245537 survey2
1989 4 3 338258 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.05374e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 729131 0.1 #_orig_obs: 527308 survey2
1992 4 3 412479 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 497478 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 464239 0.1 #_orig_obs: 375877 survey2
1995 4 3 368194 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.25419e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.33592e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.23943e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 811440 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 784383 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.0105e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 569585 0.1 #_orig_obs: 525909 survey2
2003 4 3 1.1378e+06 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.87176e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.69227e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.43133e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.24846e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 670704 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.46706e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.63003e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.77659e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.46013e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  123 290 295 82 8 2 0
1986  1 1  0 0 1 -1 -1 800  34 292 398 68 6 2 0
1987  1 1  0 0 1 -1 -1 800  59 107 523 97 12 2 0
1988  1 1  0 0 1 -1 -1 800  81 203 272 218 19 7 0
1989  1 1  0 0 1 -1 -1 800  237 180 283 70 28 2 0
1990  1 1  0 0 1 -1 -1 800  383 228 154 30 5 0 0
1991  1 1  0 0 1 -1 -1 800  137 438 204 16 5 0 0
1992  1 1  0 0 1 -1 -1 800  41 203 508 46 2 0 0
1993  1 1  0 0 1 -1 -1 800  110 147 388 147 8 0 0
1994  1 1  0 0 1 -1 -1 800  153 341 176 99 26 5 0
1995  1 1  0 0 1 -1 -1 800  71 297 384 36 8 4 0
1996  1 1  0 0 1 -1 -1 800  295 112 314 76 1 1 1
1997  1 1  0 0 1 -1 -1 800  274 383 100 36 7 0 0
1998  1 1  0 0 1 -1 -1 800  102 356 323 12 7 0 0
1999  1 1  0 0 1 -1 -1 800  71 216 457 53 3 0 0
2000  1 1  0 0 1 -1 -1 800  95 203 359 130 13 0 0
2001  1 1  0 0 1 -1 -1 800  186 250 267 80 14 3 0
2002  1 1  0 0 1 -1 -1 800  67 390 294 36 12 1 0
2003  1 1  0 0 1 -1 -1 800  220 137 395 40 6 1 1
2004  1 1  0 0 1 -1 -1 800  437 281 50 28 4 0 0
2005  1 1  0 0 1 -1 -1 800  159 518 119 4 0 0 0
2006  1 1  0 0 1 -1 -1 800  100 295 392 13 0 0 0
2007  1 1  0 0 1 -1 -1 800  159 301 293 45 2 0 0
2008  1 1  0 0 1 -1 -1 800  58 377 330 33 2 0 0
2009  1 1  0 0 1 -1 -1 800  227 163 359 48 3 0 0
2010  1 1  0 0 1 -1 -1 800  260 375 128 34 3 0 0
2011  1 1  0 0 1 -1 -1 800  145 386 260 6 3 0 0
2012  1 1  0 0 1 -1 -1 800  126 299 335 37 3 0 0
1990  10 2  0 0 1 -1 -1 800  733 52 9 4 2 0 0
1991  10 2  0 0 1 -1 -1 800  510 267 23 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  392 235 148 25 0 0 0
1993  10 2  0 0 1 -1 -1 800  619 78 64 33 6 0 0
1994  10 2  0 0 1 -1 -1 800  586 173 17 12 12 0 0
1995  10 2  0 0 1 -1 -1 800  449 236 92 11 6 6 0
1996  10 2  0 0 1 -1 -1 800  720 46 19 15 0 0 0
1997  10 2  0 0 1 -1 -1 800  651 130 7 7 5 0 0
1998  10 2  0 0 1 -1 -1 800  513 238 40 7 2 0 0
1999  10 2  0 0 1 -1 -1 800  481 190 103 25 1 0 0
2000  10 2  0 0 1 -1 -1 800  567 144 51 32 6 0 0
2001  10 2  0 0 1 -1 -1 800  632 113 34 10 8 3 0
2002  10 2  0 0 1 -1 -1 800  385 326 61 14 6 7 1
2003  10 2  0 0 1 -1 -1 800  696 58 46 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  746 54 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  562 229 9 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  551 185 62 2 0 0 0
2007  10 2  0 0 1 -1 -1 800  617 149 28 5 1 0 0
2008  10 2  0 0 1 -1 -1 800  454 288 46 10 2 0 0
2009  10 2  0 0 1 -1 -1 800  692 66 32 7 0 3 0
2010  10 2  0 0 1 -1 -1 800  671 124 1 4 0 0 0
2011  10 2  0 0 1 -1 -1 800  606 176 15 3 0 0 0
2012  10 2  0 0 1 -1 -1 800  551 188 52 6 1 2 0
1985  4 3  0 0 1 -1 -1 800  598 141 41 13 7 0 0
1986  4 3  0 0 1 -1 -1 800  379 296 71 34 15 4 1
1987  4 3  0 0 1 -1 -1 800  507 117 110 43 15 4 4
1988  4 3  0 0 1 -1 -1 800  558 127 32 50 13 14 6
1989  4 3  0 0 1 -1 -1 800  695 65 16 6 10 7 1
1990  4 3  0 0 1 -1 -1 800  728 55 7 10 0 0 0
1991  4 3  0 0 1 -1 -1 800  558 214 22 6 0 0 0
1992  4 3  0 0 1 -1 -1 800  435 236 115 14 0 0 0
1993  4 3  0 0 1 -1 -1 800  664 62 44 27 3 0 0
1994  4 3  0 0 1 -1 -1 800  625 132 21 11 11 0 0
1995  4 3  0 0 1 -1 -1 800  493 221 70 9 1 6 0
1996  4 3  0 0 1 -1 -1 800  720 48 24 7 1 0 0
1997  4 3  0 0 1 -1 -1 800  676 107 7 10 0 0 0
1998  4 3  0 0 1 -1 -1 800  554 205 40 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  516 172 93 18 1 0 0
2000  4 3  0 0 1 -1 -1 800  573 125 59 35 8 0 0
2001  4 3  0 0 1 -1 -1 800  661 105 21 6 6 1 0
2002  4 3  0 0 1 -1 -1 800  427 295 57 12 4 5 0
2003  4 3  0 0 1 -1 -1 800  715 47 27 7 3 0 1
2004  4 3  0 0 1 -1 -1 800  749 43 3 5 0 0 0
2005  4 3  0 0 1 -1 -1 800  584 205 11 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  580 162 53 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  636 135 23 6 0 0 0
2008  4 3  0 0 1 -1 -1 800  486 241 56 14 3 0 0
2009  4 3  0 0 1 -1 -1 800  713 53 31 3 0 0 0
2010  4 3  0 0 1 -1 -1 800  668 119 7 5 1 0 0
2011  4 3  0 0 1 -1 -1 800  601 167 28 2 2 0 0
2012  4 3  0 0 1 -1 -1 800  592 171 32 5 0 0 0
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

