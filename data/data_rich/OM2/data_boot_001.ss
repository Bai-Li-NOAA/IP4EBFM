#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 09:32:00 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659533520 first rand#: -0.0654662
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
-999 1 1 112474 0.05
1985 1 1 183886 0.05
1986 1 1 170732 0.05
1987 1 1 95389.7 0.05
1988 1 1 24746.9 0.05
1989 1 1 51476.6 0.05
1990 1 1 68981.3 0.05
1991 1 1 77064.3 0.05
1992 1 1 131916 0.05
1993 1 1 196740 0.05
1994 1 1 95401.6 0.05
1995 1 1 48584.3 0.05
1996 1 1 115712 0.05
1997 1 1 95478.5 0.05
1998 1 1 184838 0.05
1999 1 1 152846 0.05
2000 1 1 224975 0.05
2001 1 1 232857 0.05
2002 1 1 228027 0.05
2003 1 1 319701 0.05
2004 1 1 565819 0.05
2005 1 1 772315 0.05
2006 1 1 1.50345e+06 0.05
2007 1 1 799914 0.05
2008 1 1 428174 0.05
2009 1 1 527237 0.05
2010 1 1 488752 0.05
2011 1 1 497910 0.05
2012 1 1 709738 0.05
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
1990 10 2 3.81461e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.29347e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.18802e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.22219e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.19957e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.04728e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.88216e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.90951e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.28077e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.4874e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.02079e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.48437e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.14148e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.29512e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.44586e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.38705e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.01207e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.12456e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.92568e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.82616e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.65558e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.69205e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.33804e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.09416e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 390540 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 370297 0.1 #_orig_obs: 954308 survey2
1988 4 3 279010 0.1 #_orig_obs: 245537 survey2
1989 4 3 419226 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.06391e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 790859 0.1 #_orig_obs: 527308 survey2
1992 4 3 525885 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 588432 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 563084 0.1 #_orig_obs: 375877 survey2
1995 4 3 398839 0.1 #_orig_obs: 528242 survey2
1996 4 3 988442 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.86204e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.16186e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 723931 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 889242 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 931805 0.1 #_orig_obs: 689461 survey2
2002 4 3 425335 0.1 #_orig_obs: 525909 survey2
2003 4 3 860962 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.29877e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.52607e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.2471e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.07416e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 764372 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.20218e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.94441e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.79094e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.56728e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  152 274 308 56 8 2 0
1986  1 1  0 0 1 -1 -1 800  34 326 362 68 8 2 0
1987  1 1  0 0 1 -1 -1 800  58 109 525 92 14 2 0
1988  1 1  0 0 1 -1 -1 800  100 209 250 206 31 4 0
1989  1 1  0 0 1 -1 -1 800  222 224 279 53 18 2 2
1990  1 1  0 0 1 -1 -1 800  360 269 136 31 4 0 0
1991  1 1  0 0 1 -1 -1 800  105 480 202 11 1 1 0
1992  1 1  0 0 1 -1 -1 800  39 205 511 43 2 0 0
1993  1 1  0 0 1 -1 -1 800  118 140 410 125 7 0 0
1994  1 1  0 0 1 -1 -1 800  171 317 196 86 27 3 0
1995  1 1  0 0 1 -1 -1 800  91 282 385 32 9 1 0
1996  1 1  0 0 1 -1 -1 800  314 126 305 48 4 0 3
1997  1 1  0 0 1 -1 -1 800  276 391 95 32 6 0 0
1998  1 1  0 0 1 -1 -1 800  118 353 316 11 2 0 0
1999  1 1  0 0 1 -1 -1 800  72 207 468 51 2 0 0
2000  1 1  0 0 1 -1 -1 800  111 204 367 107 11 0 0
2001  1 1  0 0 1 -1 -1 800  166 256 265 93 17 3 0
2002  1 1  0 0 1 -1 -1 800  60 370 314 42 12 2 0
2003  1 1  0 0 1 -1 -1 800  186 126 433 47 8 0 0
2004  1 1  0 0 1 -1 -1 800  377 307 82 31 3 0 0
2005  1 1  0 0 1 -1 -1 800  152 471 169 8 0 0 0
2006  1 1  0 0 1 -1 -1 800  117 244 420 19 0 0 0
2007  1 1  0 0 1 -1 -1 800  170 281 298 49 2 0 0
2008  1 1  0 0 1 -1 -1 800  58 371 326 41 4 0 0
2009  1 1  0 0 1 -1 -1 800  234 159 349 50 7 1 0
2010  1 1  0 0 1 -1 -1 800  280 349 125 41 5 0 0
2011  1 1  0 0 1 -1 -1 800  161 350 273 14 2 0 0
2012  1 1  0 0 1 -1 -1 800  128 285 342 43 2 0 0
1990  10 2  0 0 1 -1 -1 800  718 70 8 4 0 0 0
1991  10 2  0 0 1 -1 -1 800  499 271 30 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  385 254 142 19 0 0 0
1993  10 2  0 0 1 -1 -1 800  624 84 66 24 2 0 0
1994  10 2  0 0 1 -1 -1 800  603 157 18 13 9 0 0
1995  10 2  0 0 1 -1 -1 800  447 246 79 14 7 7 0
1996  10 2  0 0 1 -1 -1 800  732 44 14 10 0 0 0
1997  10 2  0 0 1 -1 -1 800  674 116 4 4 2 0 0
1998  10 2  0 0 1 -1 -1 800  513 239 43 3 2 0 0
1999  10 2  0 0 1 -1 -1 800  487 181 109 21 2 0 0
2000  10 2  0 0 1 -1 -1 800  564 139 68 23 6 0 0
2001  10 2  0 0 1 -1 -1 800  647 103 27 16 6 1 0
2002  10 2  0 0 1 -1 -1 800  393 330 58 10 5 2 2
2003  10 2  0 0 1 -1 -1 800  700 45 55 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  734 66 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  545 238 17 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  583 169 39 9 0 0 0
2007  10 2  0 0 1 -1 -1 800  643 136 15 4 2 0 0
2008  10 2  0 0 1 -1 -1 800  447 266 65 20 2 0 0
2009  10 2  0 0 1 -1 -1 800  707 57 32 4 0 0 0
2010  10 2  0 0 1 -1 -1 800  684 105 5 6 0 0 0
2011  10 2  0 0 1 -1 -1 800  604 154 40 2 0 0 0
2012  10 2  0 0 1 -1 -1 800  579 164 48 7 0 1 1
1985  4 3  0 0 1 -1 -1 800  617 126 44 9 4 0 0
1986  4 3  0 0 1 -1 -1 800  369 308 87 24 2 6 4
1987  4 3  0 0 1 -1 -1 800  498 131 118 32 18 0 3
1988  4 3  0 0 1 -1 -1 800  548 144 38 45 19 4 2
1989  4 3  0 0 1 -1 -1 800  672 72 28 6 14 4 4
1990  4 3  0 0 1 -1 -1 800  732 54 12 2 0 0 0
1991  4 3  0 0 1 -1 -1 800  561 225 11 3 0 0 0
1992  4 3  0 0 1 -1 -1 800  429 251 105 15 0 0 0
1993  4 3  0 0 1 -1 -1 800  654 65 50 24 7 0 0
1994  4 3  0 0 1 -1 -1 800  615 139 22 17 7 0 0
1995  4 3  0 0 1 -1 -1 800  524 202 52 5 7 10 0
1996  4 3  0 0 1 -1 -1 800  760 19 13 7 0 0 1
1997  4 3  0 0 1 -1 -1 800  697 89 7 7 0 0 0
1998  4 3  0 0 1 -1 -1 800  560 202 36 2 0 0 0
1999  4 3  0 0 1 -1 -1 800  527 174 84 13 2 0 0
2000  4 3  0 0 1 -1 -1 800  599 130 42 24 5 0 0
2001  4 3  0 0 1 -1 -1 800  664 91 24 14 7 0 0
2002  4 3  0 0 1 -1 -1 800  398 306 61 14 13 8 0
2003  4 3  0 0 1 -1 -1 800  698 48 41 9 2 1 1
2004  4 3  0 0 1 -1 -1 800  733 56 6 4 0 1 0
2005  4 3  0 0 1 -1 -1 800  567 210 23 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  588 147 60 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  639 124 29 8 0 0 0
2008  4 3  0 0 1 -1 -1 800  482 246 53 13 6 0 0
2009  4 3  0 0 1 -1 -1 800  710 49 31 8 1 1 0
2010  4 3  0 0 1 -1 -1 800  676 107 8 4 5 0 0
2011  4 3  0 0 1 -1 -1 800  637 130 31 1 1 0 0
2012  4 3  0 0 1 -1 -1 800  587 165 40 8 0 0 0
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

