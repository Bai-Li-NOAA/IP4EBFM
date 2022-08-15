#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 15 09:57:25 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660571845 first rand#: 1.9868
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
-999 1 1 69453.7 0.05
1985 1 1 201363 0.05
1986 1 1 174924 0.05
1987 1 1 91961.8 0.05
1988 1 1 25042.9 0.05
1989 1 1 52952.9 0.05
1990 1 1 63526.2 0.05
1991 1 1 79025.1 0.05
1992 1 1 123256 0.05
1993 1 1 208772 0.05
1994 1 1 91038.6 0.05
1995 1 1 52009.7 0.05
1996 1 1 114180 0.05
1997 1 1 95823.9 0.05
1998 1 1 194102 0.05
1999 1 1 163232 0.05
2000 1 1 238391 0.05
2001 1 1 212407 0.05
2002 1 1 200583 0.05
2003 1 1 347567 0.05
2004 1 1 621263 0.05
2005 1 1 828998 0.05
2006 1 1 1.53031e+06 0.05
2007 1 1 828122 0.05
2008 1 1 470073 0.05
2009 1 1 541019 0.05
2010 1 1 476361 0.05
2011 1 1 396542 0.05
2012 1 1 663992 0.05
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
1990 10 2 2.81922e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.43862e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.34871e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.43485e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.26507e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 949422 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.47631e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 3.95842e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.20326e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.38748e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.22283e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.5127e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.21147e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.29363e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.35444e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 6.11043e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.43736e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 4.12276e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.92188e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.53849e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.98317e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 3.96985e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.57219e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 989101 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 374186 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 310109 0.1 #_orig_obs: 954308 survey2
1988 4 3 280955 0.1 #_orig_obs: 245537 survey2
1989 4 3 490203 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.03148e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 842066 0.1 #_orig_obs: 527308 survey2
1992 4 3 334111 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 527997 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 503010 0.1 #_orig_obs: 375877 survey2
1995 4 3 344374 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.07175e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.79622e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.04049e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 735255 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 811935 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 869060 0.1 #_orig_obs: 689461 survey2
2002 4 3 396097 0.1 #_orig_obs: 525909 survey2
2003 4 3 1.06267e+06 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.69399e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 2.30309e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.43253e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 984291 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 692319 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.45928e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.69933e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.87593e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.19066e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  123 278 310 75 14 0 0
1986  1 1  0 0 1 -1 -1 800  45 309 373 59 12 2 0
1987  1 1  0 0 1 -1 -1 800  57 98 526 104 7 8 0
1988  1 1  0 0 1 -1 -1 800  104 233 247 187 26 3 0
1989  1 1  0 0 1 -1 -1 800  198 213 289 66 29 4 1
1990  1 1  0 0 1 -1 -1 800  363 250 154 27 6 0 0
1991  1 1  0 0 1 -1 -1 800  114 483 188 13 2 0 0
1992  1 1  0 0 1 -1 -1 800  41 218 501 37 3 0 0
1993  1 1  0 0 1 -1 -1 800  124 123 412 137 4 0 0
1994  1 1  0 0 1 -1 -1 800  156 334 213 68 27 2 0
1995  1 1  0 0 1 -1 -1 800  90 311 350 30 16 3 0
1996  1 1  0 0 1 -1 -1 800  298 120 311 66 4 0 1
1997  1 1  0 0 1 -1 -1 800  261 409 94 32 4 0 0
1998  1 1  0 0 1 -1 -1 800  92 398 299 10 1 0 0
1999  1 1  0 0 1 -1 -1 800  72 203 466 59 0 0 0
2000  1 1  0 0 1 -1 -1 800  106 204 340 141 9 0 0
2001  1 1  0 0 1 -1 -1 800  193 255 264 70 16 2 0
2002  1 1  0 0 1 -1 -1 800  53 400 290 43 12 2 0
2003  1 1  0 0 1 -1 -1 800  203 131 415 44 6 1 0
2004  1 1  0 0 1 -1 -1 800  433 286 56 21 4 0 0
2005  1 1  0 0 1 -1 -1 800  147 505 148 0 0 0 0
2006  1 1  0 0 1 -1 -1 800  109 280 401 10 0 0 0
2007  1 1  0 0 1 -1 -1 800  144 298 313 44 1 0 0
2008  1 1  0 0 1 -1 -1 800  59 359 343 31 8 0 0
2009  1 1  0 0 1 -1 -1 800  232 145 368 51 4 0 0
2010  1 1  0 0 1 -1 -1 800  271 386 102 38 3 0 0
2011  1 1  0 0 1 -1 -1 800  178 333 276 9 4 0 0
2012  1 1  0 0 1 -1 -1 800  106 291 369 33 1 0 0
1990  10 2  0 0 1 -1 -1 800  722 66 8 2 2 0 0
1991  10 2  0 0 1 -1 -1 800  487 281 32 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  357 289 137 17 0 0 0
1993  10 2  0 0 1 -1 -1 800  606 96 60 29 9 0 0
1994  10 2  0 0 1 -1 -1 800  598 157 16 22 7 0 0
1995  10 2  0 0 1 -1 -1 800  460 244 72 8 10 6 0
1996  10 2  0 0 1 -1 -1 800  738 39 11 12 0 0 0
1997  10 2  0 0 1 -1 -1 800  655 129 9 5 2 0 0
1998  10 2  0 0 1 -1 -1 800  534 224 40 2 0 0 0
1999  10 2  0 0 1 -1 -1 800  464 204 116 14 2 0 0
2000  10 2  0 0 1 -1 -1 800  550 146 58 39 6 1 0
2001  10 2  0 0 1 -1 -1 800  614 131 31 14 7 3 0
2002  10 2  0 0 1 -1 -1 800  381 322 64 17 9 7 0
2003  10 2  0 0 1 -1 -1 800  698 52 50 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  738 62 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  568 218 14 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  597 155 46 2 0 0 0
2007  10 2  0 0 1 -1 -1 800  623 144 28 5 0 0 0
2008  10 2  0 0 1 -1 -1 800  456 290 48 3 3 0 0
2009  10 2  0 0 1 -1 -1 800  698 60 36 6 0 0 0
2010  10 2  0 0 1 -1 -1 800  667 122 7 4 0 0 0
2011  10 2  0 0 1 -1 -1 800  580 196 21 3 0 0 0
2012  10 2  0 0 1 -1 -1 800  568 180 41 7 2 2 0
1985  4 3  0 0 1 -1 -1 800  606 145 38 8 3 0 0
1986  4 3  0 0 1 -1 -1 800  363 309 93 22 10 1 2
1987  4 3  0 0 1 -1 -1 800  541 103 113 29 7 5 2
1988  4 3  0 0 1 -1 -1 800  565 134 39 49 5 3 5
1989  4 3  0 0 1 -1 -1 800  691 75 19 4 7 2 2
1990  4 3  0 0 1 -1 -1 800  736 51 8 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  556 224 15 5 0 0 0
1992  4 3  0 0 1 -1 -1 800  414 229 141 16 0 0 0
1993  4 3  0 0 1 -1 -1 800  649 60 51 37 3 0 0
1994  4 3  0 0 1 -1 -1 800  619 141 17 8 15 0 0
1995  4 3  0 0 1 -1 -1 800  500 214 63 13 6 4 0
1996  4 3  0 0 1 -1 -1 800  750 33 14 3 0 0 0
1997  4 3  0 0 1 -1 -1 800  685 102 7 6 0 0 0
1998  4 3  0 0 1 -1 -1 800  579 171 47 3 0 0 0
1999  4 3  0 0 1 -1 -1 800  523 175 87 12 3 0 0
2000  4 3  0 0 1 -1 -1 800  600 115 52 27 6 0 0
2001  4 3  0 0 1 -1 -1 800  664 98 23 9 2 4 0
2002  4 3  0 0 1 -1 -1 800  436 289 53 9 7 6 0
2003  4 3  0 0 1 -1 -1 800  718 41 34 5 1 0 1
2004  4 3  0 0 1 -1 -1 800  765 32 2 0 1 0 0
2005  4 3  0 0 1 -1 -1 800  587 200 12 1 0 0 0
2006  4 3  0 0 1 -1 -1 800  570 174 51 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  631 126 33 10 0 0 0
2008  4 3  0 0 1 -1 -1 800  473 259 51 11 6 0 0
2009  4 3  0 0 1 -1 -1 800  713 47 33 7 0 0 0
2010  4 3  0 0 1 -1 -1 800  692 95 5 4 4 0 0
2011  4 3  0 0 1 -1 -1 800  617 148 33 1 1 0 0
2012  4 3  0 0 1 -1 -1 800  608 139 44 9 0 0 0
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

