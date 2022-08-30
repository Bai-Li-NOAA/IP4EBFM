#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:49:26 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661867366 first rand#: 1.15679
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
-999 1 1 11428.7 0.05
1985 1 1 188903 0.05
1986 1 1 183074 0.05
1987 1 1 85472.4 0.05
1988 1 1 24998.3 0.05
1989 1 1 56093.1 0.05
1990 1 1 68889.9 0.05
1991 1 1 75561.2 0.05
1992 1 1 134290 0.05
1993 1 1 205139 0.05
1994 1 1 95464.5 0.05
1995 1 1 51392.2 0.05
1996 1 1 125283 0.05
1997 1 1 102282 0.05
1998 1 1 197359 0.05
1999 1 1 148576 0.05
2000 1 1 224233 0.05
2001 1 1 205315 0.05
2002 1 1 151054 0.05
2003 1 1 136309 0.05
2004 1 1 197448 0.05
2005 1 1 364981 0.05
2006 1 1 435758 0.05
2007 1 1 300473 0.05
2008 1 1 247601 0.05
2009 1 1 183242 0.05
2010 1 1 181964 0.05
2011 1 1 227421 0.05
2012 1 1 176943 0.05
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
1990 10 2 4.10973e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 3.60473e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 2.09874e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.80994e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.42265e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 952994 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.51427e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 6.32928e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.43892e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.98267e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.58635e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.09488e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 824432 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.1374e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.82405e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.32978e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 4.66902e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.88565e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.82532e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.70439e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 3.28831e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 2.08815e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 1.62323e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 941205 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 430069 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 309209 0.1 #_orig_obs: 954308 survey2
1988 4 3 205526 0.1 #_orig_obs: 245537 survey2
1989 4 3 483540 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.88527e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.3965e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 672059 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 672905 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 500239 0.1 #_orig_obs: 375877 survey2
1995 4 3 310470 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.03055e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 2.39361e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.44186e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.09055e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 863932 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 903063 0.1 #_orig_obs: 689461 survey2
2002 4 3 379558 0.1 #_orig_obs: 525909 survey2
2003 4 3 699445 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.62463e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.82894e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.40693e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.63995e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 625779 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.34221e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.40735e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 793462 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 519308 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  119 147 231 177 74 52 0
1986  1 1  0 0 1 -1 -1 800  49 266 346 122 14 3 0
1987  1 1  0 0 1 -1 -1 800  95 90 492 122 1 0 0
1988  1 1  0 0 1 -1 -1 800  101 173 198 316 12 0 0
1989  1 1  0 0 1 -1 -1 800  312 152 242 71 23 0 0
1990  1 1  0 0 1 -1 -1 800  555 154 59 32 0 0 0
1991  1 1  0 0 1 -1 -1 800  179 461 139 20 1 0 0
1992  1 1  0 0 1 -1 -1 800  45 212 478 63 2 0 0
1993  1 1  0 0 1 -1 -1 800  122 84 346 245 3 0 0
1994  1 1  0 0 1 -1 -1 800  224 270 153 143 10 0 0
1995  1 1  0 0 1 -1 -1 800  80 269 379 71 1 0 0
1996  1 1  0 0 1 -1 -1 800  455 59 214 70 2 0 0
1997  1 1  0 0 1 -1 -1 800  406 327 43 23 1 0 0
1998  1 1  0 0 1 -1 -1 800  164 355 274 7 0 0 0
1999  1 1  0 0 1 -1 -1 800  82 207 421 89 1 0 0
2000  1 1  0 0 1 -1 -1 800  137 115 313 223 12 0 0
2001  1 1  0 0 1 -1 -1 800  268 202 230 96 4 0 0
2002  1 1  0 0 1 -1 -1 800  91 452 231 26 0 0 0
2003  1 1  0 0 1 -1 -1 800  380 105 297 18 0 0 0
2004  1 1  0 0 1 -1 -1 800  541 206 37 16 0 0 0
2005  1 1  0 0 1 -1 -1 800  207 471 120 2 0 0 0
2006  1 1  0 0 1 -1 -1 800  167 259 368 6 0 0 0
2007  1 1  0 0 1 -1 -1 800  238 277 251 34 0 0 0
2008  1 1  0 0 1 -1 -1 800  89 408 277 25 1 0 0
2009  1 1  0 0 1 -1 -1 800  315 118 341 26 0 0 0
2010  1 1  0 0 1 -1 -1 800  340 346 88 26 0 0 0
2011  1 1  0 0 1 -1 -1 800  164 358 270 8 0 0 0
2012  1 1  0 0 1 -1 -1 800  116 305 345 34 0 0 0
1990  10 2  0 0 1 -1 -1 800  751 46 2 1 0 0 0
1991  10 2  0 0 1 -1 -1 800  520 260 20 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  319 306 169 6 0 0 0
1993  10 2  0 0 1 -1 -1 800  607 106 82 5 0 0 0
1994  10 2  0 0 1 -1 -1 800  584 196 19 1 0 0 0
1995  10 2  0 0 1 -1 -1 800  380 318 101 1 0 0 0
1996  10 2  0 0 1 -1 -1 800  758 30 12 0 0 0 0
1997  10 2  0 0 1 -1 -1 800  668 129 3 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  525 234 41 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  464 234 96 6 0 0 0
2000  10 2  0 0 1 -1 -1 800  574 161 60 5 0 0 0
2001  10 2  0 0 1 -1 -1 800  640 148 12 0 0 0 0
2002  10 2  0 0 1 -1 -1 800  325 438 36 1 0 0 0
2003  10 2  0 0 1 -1 -1 800  735 44 21 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  750 50 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  557 238 5 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  577 184 39 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  633 151 16 0 0 0 0
2008  10 2  0 0 1 -1 -1 800  424 341 35 0 0 0 0
2009  10 2  0 0 1 -1 -1 800  733 47 20 0 0 0 0
2010  10 2  0 0 1 -1 -1 800  647 150 3 0 0 0 0
2011  10 2  0 0 1 -1 -1 800  533 243 24 0 0 0 0
2012  10 2  0 0 1 -1 -1 800  514 244 42 0 0 0 0
1985  4 3  0 0 1 -1 -1 800  597 131 45 22 5 0 0
1986  4 3  0 0 1 -1 -1 800  324 375 89 10 2 0 0
1987  4 3  0 0 1 -1 -1 800  600 89 101 10 0 0 0
1988  4 3  0 0 1 -1 -1 800  545 174 50 31 0 0 0
1989  4 3  0 0 1 -1 -1 800  715 63 22 0 0 0 0
1990  4 3  0 0 1 -1 -1 800  762 35 3 0 0 0 0
1991  4 3  0 0 1 -1 -1 800  557 213 29 1 0 0 0
1992  4 3  0 0 1 -1 -1 800  367 286 139 8 0 0 0
1993  4 3  0 0 1 -1 -1 800  633 69 78 20 0 0 0
1994  4 3  0 0 1 -1 -1 800  630 138 26 6 0 0 0
1995  4 3  0 0 1 -1 -1 800  479 248 66 7 0 0 0
1996  4 3  0 0 1 -1 -1 800  748 34 15 3 0 0 0
1997  4 3  0 0 1 -1 -1 800  692 101 5 2 0 0 0
1998  4 3  0 0 1 -1 -1 800  558 210 31 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  508 185 96 11 0 0 0
2000  4 3  0 0 1 -1 -1 800  572 141 67 20 0 0 0
2001  4 3  0 0 1 -1 -1 800  642 125 28 5 0 0 0
2002  4 3  0 0 1 -1 -1 800  386 361 51 2 0 0 0
2003  4 3  0 0 1 -1 -1 800  738 30 31 1 0 0 0
2004  4 3  0 0 1 -1 -1 800  752 47 1 0 0 0 0
2005  4 3  0 0 1 -1 -1 800  573 212 15 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  580 169 51 0 0 0 0
2007  4 3  0 0 1 -1 -1 800  647 127 26 0 0 0 0
2008  4 3  0 0 1 -1 -1 800  414 336 50 0 0 0 0
2009  4 3  0 0 1 -1 -1 800  707 58 35 0 0 0 0
2010  4 3  0 0 1 -1 -1 800  651 136 12 1 0 0 0
2011  4 3  0 0 1 -1 -1 800  579 194 27 0 0 0 0
2012  4 3  0 0 1 -1 -1 800  505 214 79 2 0 0 0
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

