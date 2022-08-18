#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 18 16:28:50 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660854530 first rand#: 0.265167
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
-999 1 1 120186 0.05
1985 1 1 201151 0.05
1986 1 1 179618 0.05
1987 1 1 87526.7 0.05
1988 1 1 24434.6 0.05
1989 1 1 55907.6 0.05
1990 1 1 60666.3 0.05
1991 1 1 79082.4 0.05
1992 1 1 140797 0.05
1993 1 1 206224 0.05
1994 1 1 92355.2 0.05
1995 1 1 52246.1 0.05
1996 1 1 118007 0.05
1997 1 1 102436 0.05
1998 1 1 184727 0.05
1999 1 1 148989 0.05
2000 1 1 242840 0.05
2001 1 1 212426 0.05
2002 1 1 207531 0.05
2003 1 1 323834 0.05
2004 1 1 560161 0.05
2005 1 1 744232 0.05
2006 1 1 1.40774e+06 0.05
2007 1 1 846549 0.05
2008 1 1 439255 0.05
2009 1 1 496928 0.05
2010 1 1 460838 0.05
2011 1 1 415463 0.05
2012 1 1 716964 0.05
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
1990 10 2 2.9724e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.19694e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.18828e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.4661e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.67722e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 962617 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.09082e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.48436e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.1333e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.21955e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.25858e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.44181e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.22373e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.96727e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.56131e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.02778e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 2.85537e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.07121e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 2.11277e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.39008e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.5113e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.90859e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.53669e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 871055 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 501020 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 290936 0.1 #_orig_obs: 954308 survey2
1988 4 3 217202 0.1 #_orig_obs: 245537 survey2
1989 4 3 439904 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.18278e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 825401 0.1 #_orig_obs: 527308 survey2
1992 4 3 458574 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 489638 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 629396 0.1 #_orig_obs: 375877 survey2
1995 4 3 319001 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.21365e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.82312e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.17707e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.00404e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 680252 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 867977 0.1 #_orig_obs: 689461 survey2
2002 4 3 431593 0.1 #_orig_obs: 525909 survey2
2003 4 3 792277 0.1 #_orig_obs: 634479 survey2
2004 4 3 1.93354e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.69463e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.28593e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.06866e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 708372 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.34397e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 2.147e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.89718e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.65229e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  124 258 341 67 8 2 0
1986  1 1  0 0 1 -1 -1 800  35 326 365 65 7 2 0
1987  1 1  0 0 1 -1 -1 800  69 109 516 90 14 2 0
1988  1 1  0 0 1 -1 -1 800  95 248 251 175 26 5 0
1989  1 1  0 0 1 -1 -1 800  233 191 284 60 23 7 2
1990  1 1  0 0 1 -1 -1 800  374 247 138 31 10 0 0
1991  1 1  0 0 1 -1 -1 800  135 448 198 14 2 1 2
1992  1 1  0 0 1 -1 -1 800  41 236 490 31 2 0 0
1993  1 1  0 0 1 -1 -1 800  120 121 399 153 7 0 0
1994  1 1  0 0 1 -1 -1 800  158 358 187 75 22 0 0
1995  1 1  0 0 1 -1 -1 800  68 311 363 41 12 5 0
1996  1 1  0 0 1 -1 -1 800  295 116 317 65 4 1 2
1997  1 1  0 0 1 -1 -1 800  268 407 97 27 1 0 0
1998  1 1  0 0 1 -1 -1 800  110 358 320 10 2 0 0
1999  1 1  0 0 1 -1 -1 800  73 223 443 57 4 0 0
2000  1 1  0 0 1 -1 -1 800  117 186 366 116 15 0 0
2001  1 1  0 0 1 -1 -1 800  162 260 267 86 24 1 0
2002  1 1  0 0 1 -1 -1 800  57 375 299 47 15 7 0
2003  1 1  0 0 1 -1 -1 800  202 141 390 58 7 1 1
2004  1 1  0 0 1 -1 -1 800  397 279 83 34 7 0 0
2005  1 1  0 0 1 -1 -1 800  150 498 141 11 0 0 0
2006  1 1  0 0 1 -1 -1 800  112 276 387 25 0 0 0
2007  1 1  0 0 1 -1 -1 800  130 308 314 48 0 0 0
2008  1 1  0 0 1 -1 -1 800  73 382 293 46 6 0 0
2009  1 1  0 0 1 -1 -1 800  237 154 351 52 5 1 0
2010  1 1  0 0 1 -1 -1 800  254 386 116 40 4 0 0
2011  1 1  0 0 1 -1 -1 800  166 355 268 7 4 0 0
2012  1 1  0 0 1 -1 -1 800  121 253 394 32 0 0 0
1990  10 2  0 0 1 -1 -1 800  714 69 10 4 3 0 0
1991  10 2  0 0 1 -1 -1 800  499 269 32 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  394 257 132 17 0 0 0
1993  10 2  0 0 1 -1 -1 800  627 80 52 35 6 0 0
1994  10 2  0 0 1 -1 -1 800  587 162 32 10 9 0 0
1995  10 2  0 0 1 -1 -1 800  474 237 75 5 4 5 0
1996  10 2  0 0 1 -1 -1 800  729 38 22 11 0 0 0
1997  10 2  0 0 1 -1 -1 800  658 128 8 4 2 0 0
1998  10 2  0 0 1 -1 -1 800  530 224 43 2 0 1 0
1999  10 2  0 0 1 -1 -1 800  472 206 94 22 4 2 0
2000  10 2  0 0 1 -1 -1 800  581 120 53 36 9 1 0
2001  10 2  0 0 1 -1 -1 800  638 100 26 20 13 3 0
2002  10 2  0 0 1 -1 -1 800  377 322 62 26 9 3 1
2003  10 2  0 0 1 -1 -1 800  694 51 55 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  724 76 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  541 240 19 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  568 173 54 5 0 0 0
2007  10 2  0 0 1 -1 -1 800  640 126 24 7 3 0 0
2008  10 2  0 0 1 -1 -1 800  435 292 54 13 5 1 0
2009  10 2  0 0 1 -1 -1 800  697 61 25 16 0 1 0
2010  10 2  0 0 1 -1 -1 800  662 118 12 8 0 0 0
2011  10 2  0 0 1 -1 -1 800  598 170 30 2 0 0 0
2012  10 2  0 0 1 -1 -1 800  578 157 52 8 1 3 1
1985  4 3  0 0 1 -1 -1 800  620 129 35 9 7 0 0
1986  4 3  0 0 1 -1 -1 800  346 335 83 31 2 1 2
1987  4 3  0 0 1 -1 -1 800  538 113 113 27 5 2 2
1988  4 3  0 0 1 -1 -1 800  570 134 38 39 10 3 6
1989  4 3  0 0 1 -1 -1 800  676 83 19 7 11 3 1
1990  4 3  0 0 1 -1 -1 800  732 58 7 3 0 0 0
1991  4 3  0 0 1 -1 -1 800  572 210 15 3 0 0 0
1992  4 3  0 0 1 -1 -1 800  434 233 121 12 0 0 0
1993  4 3  0 0 1 -1 -1 800  648 72 50 27 3 0 0
1994  4 3  0 0 1 -1 -1 800  612 137 23 11 17 0 0
1995  4 3  0 0 1 -1 -1 800  490 242 46 11 6 5 0
1996  4 3  0 0 1 -1 -1 800  754 29 12 5 0 0 0
1997  4 3  0 0 1 -1 -1 800  691 94 7 8 0 0 0
1998  4 3  0 0 1 -1 -1 800  539 211 43 7 0 0 0
1999  4 3  0 0 1 -1 -1 800  519 192 63 21 5 0 0
2000  4 3  0 0 1 -1 -1 800  571 138 64 21 6 0 0
2001  4 3  0 0 1 -1 -1 800  660 103 21 9 7 0 0
2002  4 3  0 0 1 -1 -1 800  424 296 57 11 4 8 0
2003  4 3  0 0 1 -1 -1 800  702 43 42 11 1 0 1
2004  4 3  0 0 1 -1 -1 800  748 43 5 3 1 0 0
2005  4 3  0 0 1 -1 -1 800  561 221 15 0 2 1 0
2006  4 3  0 0 1 -1 -1 800  596 150 49 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  637 119 31 13 0 0 0
2008  4 3  0 0 1 -1 -1 800  481 256 49 10 4 0 0
2009  4 3  0 0 1 -1 -1 800  711 60 26 2 1 0 0
2010  4 3  0 0 1 -1 -1 800  678 107 9 5 1 0 0
2011  4 3  0 0 1 -1 -1 800  597 163 36 1 3 0 0
2012  4 3  0 0 1 -1 -1 800  603 148 38 11 0 0 0
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

