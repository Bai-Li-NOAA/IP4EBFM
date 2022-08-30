#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:37:03 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661866623 first rand#: 1.06763
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
-999 1 1 131800 0.05
1985 1 1 203513 0.05
1986 1 1 170035 0.05
1987 1 1 90068.4 0.05
1988 1 1 24732.8 0.05
1989 1 1 53687.7 0.05
1990 1 1 66676.4 0.05
1991 1 1 73598.3 0.05
1992 1 1 126869 0.05
1993 1 1 184734 0.05
1994 1 1 94832.5 0.05
1995 1 1 48328.6 0.05
1996 1 1 122446 0.05
1997 1 1 111628 0.05
1998 1 1 194271 0.05
1999 1 1 150668 0.05
2000 1 1 219380 0.05
2001 1 1 208964 0.05
2002 1 1 207464 0.05
2003 1 1 346413 0.05
2004 1 1 562212 0.05
2005 1 1 782488 0.05
2006 1 1 1.50216e+06 0.05
2007 1 1 734380 0.05
2008 1 1 453356 0.05
2009 1 1 486293 0.05
2010 1 1 431718 0.05
2011 1 1 420565 0.05
2012 1 1 736652 0.05
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
1990 10 2 3.0933e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.46263e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.28514e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.4646e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.50736e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 913917 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.43109e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.29836e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 2.99496e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.09728e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.43832e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.20437e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.45504e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.17836e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.65089e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.91978e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.37779e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.45894e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.71404e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.47146e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.69489e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.01509e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 5.46744e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 955523 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 415853 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 314265 0.1 #_orig_obs: 954308 survey2
1988 4 3 214580 0.1 #_orig_obs: 245537 survey2
1989 4 3 410853 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.33512e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 834970 0.1 #_orig_obs: 527308 survey2
1992 4 3 378097 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 597687 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 564153 0.1 #_orig_obs: 375877 survey2
1995 4 3 339332 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.2055e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.65157e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.06077e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.00747e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 741519 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 806286 0.1 #_orig_obs: 689461 survey2
2002 4 3 448089 0.1 #_orig_obs: 525909 survey2
2003 4 3 879171 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.05734e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.62139e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.19498e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.46103e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 665151 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.27969e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.955e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.89674e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.6222e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  139 254 324 72 10 1 0
1986  1 1  0 0 1 -1 -1 800  36 346 355 58 5 0 0
1987  1 1  0 0 1 -1 -1 800  59 82 540 104 11 4 0
1988  1 1  0 0 1 -1 -1 800  116 206 260 194 20 4 0
1989  1 1  0 0 1 -1 -1 800  206 228 270 65 28 1 2
1990  1 1  0 0 1 -1 -1 800  364 250 143 35 8 0 0
1991  1 1  0 0 1 -1 -1 800  141 439 196 22 2 0 0
1992  1 1  0 0 1 -1 -1 800  44 218 502 35 1 0 0
1993  1 1  0 0 1 -1 -1 800  136 143 379 137 5 0 0
1994  1 1  0 0 1 -1 -1 800  157 338 187 92 24 2 0
1995  1 1  0 0 1 -1 -1 800  67 302 396 24 8 3 0
1996  1 1  0 0 1 -1 -1 800  271 149 309 67 2 1 1
1997  1 1  0 0 1 -1 -1 800  270 402 89 36 3 0 0
1998  1 1  0 0 1 -1 -1 800  104 415 271 4 6 0 0
1999  1 1  0 0 1 -1 -1 800  76 232 436 55 1 0 0
2000  1 1  0 0 1 -1 -1 800  91 194 369 130 16 0 0
2001  1 1  0 0 1 -1 -1 800  169 250 291 73 15 2 0
2002  1 1  0 0 1 -1 -1 800  54 391 273 69 9 4 0
2003  1 1  0 0 1 -1 -1 800  208 107 425 50 9 0 1
2004  1 1  0 0 1 -1 -1 800  395 274 76 51 4 0 0
2005  1 1  0 0 1 -1 -1 800  149 496 145 10 0 0 0
2006  1 1  0 0 1 -1 -1 800  109 242 427 22 0 0 0
2007  1 1  0 0 1 -1 -1 800  188 262 292 57 1 0 0
2008  1 1  0 0 1 -1 -1 800  60 350 325 56 9 0 0
2009  1 1  0 0 1 -1 -1 800  217 160 365 54 4 0 0
2010  1 1  0 0 1 -1 -1 800  273 360 117 47 3 0 0
2011  1 1  0 0 1 -1 -1 800  163 356 257 15 9 0 0
2012  1 1  0 0 1 -1 -1 800  119 290 349 38 4 0 0
1990  10 2  0 0 1 -1 -1 800  723 68 2 6 1 0 0
1991  10 2  0 0 1 -1 -1 800  529 252 19 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  356 275 148 21 0 0 0
1993  10 2  0 0 1 -1 -1 800  637 57 61 41 4 0 0
1994  10 2  0 0 1 -1 -1 800  607 150 13 20 10 0 0
1995  10 2  0 0 1 -1 -1 800  491 220 69 8 4 8 0
1996  10 2  0 0 1 -1 -1 800  721 49 23 7 0 0 0
1997  10 2  0 0 1 -1 -1 800  668 117 8 5 2 0 0
1998  10 2  0 0 1 -1 -1 800  538 215 42 3 0 0 2
1999  10 2  0 0 1 -1 -1 800  492 181 103 23 0 1 0
2000  10 2  0 0 1 -1 -1 800  539 135 77 39 9 1 0
2001  10 2  0 0 1 -1 -1 800  636 97 36 15 10 6 0
2002  10 2  0 0 1 -1 -1 800  384 323 65 15 7 4 2
2003  10 2  0 0 1 -1 -1 800  694 60 46 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  716 84 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  550 232 18 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  588 159 49 4 0 0 0
2007  10 2  0 0 1 -1 -1 800  633 132 28 6 1 0 0
2008  10 2  0 0 1 -1 -1 800  455 274 50 15 6 0 0
2009  10 2  0 0 1 -1 -1 800  685 69 35 7 3 1 0
2010  10 2  0 0 1 -1 -1 800  666 117 10 7 0 0 0
2011  10 2  0 0 1 -1 -1 800  576 190 30 4 0 0 0
2012  10 2  0 0 1 -1 -1 800  578 161 49 10 0 1 1
1985  4 3  0 0 1 -1 -1 800  630 121 31 6 12 0 0
1986  4 3  0 0 1 -1 -1 800  370 307 91 22 7 3 0
1987  4 3  0 0 1 -1 -1 800  519 121 113 36 5 4 2
1988  4 3  0 0 1 -1 -1 800  548 157 32 41 19 1 2
1989  4 3  0 0 1 -1 -1 800  687 72 21 4 11 3 2
1990  4 3  0 0 1 -1 -1 800  736 54 5 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  547 224 20 9 0 0 0
1992  4 3  0 0 1 -1 -1 800  435 228 124 13 0 0 0
1993  4 3  0 0 1 -1 -1 800  625 80 58 33 4 0 0
1994  4 3  0 0 1 -1 -1 800  617 154 17 5 7 0 0
1995  4 3  0 0 1 -1 -1 800  547 187 49 4 9 4 0
1996  4 3  0 0 1 -1 -1 800  743 32 17 8 0 0 0
1997  4 3  0 0 1 -1 -1 800  689 103 6 2 0 0 0
1998  4 3  0 0 1 -1 -1 800  547 213 37 3 0 0 0
1999  4 3  0 0 1 -1 -1 800  519 177 89 13 2 0 0
2000  4 3  0 0 1 -1 -1 800  599 109 55 28 9 0 0
2001  4 3  0 0 1 -1 -1 800  647 107 24 17 5 0 0
2002  4 3  0 0 1 -1 -1 800  442 296 48 11 2 1 0
2003  4 3  0 0 1 -1 -1 800  700 54 35 5 3 2 1
2004  4 3  0 0 1 -1 -1 800  747 47 3 2 1 0 0
2005  4 3  0 0 1 -1 -1 800  573 206 19 0 0 1 1
2006  4 3  0 0 1 -1 -1 800  596 159 42 3 0 0 0
2007  4 3  0 0 1 -1 -1 800  638 126 26 10 0 0 0
2008  4 3  0 0 1 -1 -1 800  457 262 57 14 10 0 0
2009  4 3  0 0 1 -1 -1 800  691 59 42 6 2 0 0
2010  4 3  0 0 1 -1 -1 800  687 102 6 5 0 0 0
2011  4 3  0 0 1 -1 -1 800  624 148 25 2 1 0 0
2012  4 3  0 0 1 -1 -1 800  582 170 38 10 0 0 0
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

