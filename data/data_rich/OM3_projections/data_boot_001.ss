#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 29 11:36:26 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661787386 first rand#: 0.228848
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
-999 1 1 118069 0.05
1985 1 1 195318 0.05
1986 1 1 171508 0.05
1987 1 1 100361 0.05
1988 1 1 26731.7 0.05
1989 1 1 55644.1 0.05
1990 1 1 68888.6 0.05
1991 1 1 72336.7 0.05
1992 1 1 126404 0.05
1993 1 1 206272 0.05
1994 1 1 83325.5 0.05
1995 1 1 48798.3 0.05
1996 1 1 123604 0.05
1997 1 1 112916 0.05
1998 1 1 191935 0.05
1999 1 1 163444 0.05
2000 1 1 232130 0.05
2001 1 1 229667 0.05
2002 1 1 214110 0.05
2003 1 1 352798 0.05
2004 1 1 584030 0.05
2005 1 1 822356 0.05
2006 1 1 1.37623e+06 0.05
2007 1 1 839852 0.05
2008 1 1 395734 0.05
2009 1 1 512750 0.05
2010 1 1 488937 0.05
2011 1 1 430018 0.05
2012 1 1 706077 0.05
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
1990 10 2 3.10793e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.48978e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.24302e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.67219e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.24683e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.07185e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.82837e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.66125e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.61646e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.64213e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 1.94399e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.20504e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.19363e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.05289e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.62221e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.32118e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.30845e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.55134e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.99109e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.3004e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.6125e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.90111e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.66769e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 956452 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 432376 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 291079 0.1 #_orig_obs: 954308 survey2
1988 4 3 240487 0.1 #_orig_obs: 245537 survey2
1989 4 3 457010 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.13114e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.09811e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 456225 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 552424 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 592921 0.1 #_orig_obs: 375877 survey2
1995 4 3 365292 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.05236e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.82506e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.20307e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 768987 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 672719 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.07061e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 395500 0.1 #_orig_obs: 525909 survey2
2003 4 3 791784 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.23783e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.7203e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.2747e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.26238e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 649336 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.46314e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.69382e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.71746e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.98952e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  130 278 326 56 8 2 0
1986  1 1  0 0 1 -1 -1 800  29 322 375 64 8 1 1
1987  1 1  0 0 1 -1 -1 800  72 101 539 75 12 1 0
1988  1 1  0 0 1 -1 -1 800  87 234 245 202 32 0 0
1989  1 1  0 0 1 -1 -1 800  222 205 297 54 16 4 2
1990  1 1  0 0 1 -1 -1 800  358 255 145 29 13 0 0
1991  1 1  0 0 1 -1 -1 800  119 466 193 19 3 0 0
1992  1 1  0 0 1 -1 -1 800  44 203 520 29 4 0 0
1993  1 1  0 0 1 -1 -1 800  129 132 395 132 12 0 0
1994  1 1  0 0 1 -1 -1 800  169 343 187 77 23 1 0
1995  1 1  0 0 1 -1 -1 800  85 273 396 33 11 2 0
1996  1 1  0 0 1 -1 -1 800  309 120 306 57 5 3 0
1997  1 1  0 0 1 -1 -1 800  300 378 81 38 3 0 0
1998  1 1  0 0 1 -1 -1 800  96 374 313 12 5 0 0
1999  1 1  0 0 1 -1 -1 800  77 219 450 52 2 0 0
2000  1 1  0 0 1 -1 -1 800  104 199 366 125 6 0 0
2001  1 1  0 0 1 -1 -1 800  183 234 272 83 26 2 0
2002  1 1  0 0 1 -1 -1 800  54 353 336 44 8 5 0
2003  1 1  0 0 1 -1 -1 800  200 131 413 47 8 1 0
2004  1 1  0 0 1 -1 -1 800  411 268 84 34 3 0 0
2005  1 1  0 0 1 -1 -1 800  168 478 140 14 0 0 0
2006  1 1  0 0 1 -1 -1 800  128 272 381 19 0 0 0
2007  1 1  0 0 1 -1 -1 800  155 307 289 48 1 0 0
2008  1 1  0 0 1 -1 -1 800  57 374 317 44 8 0 0
2009  1 1  0 0 1 -1 -1 800  221 147 388 39 4 1 0
2010  1 1  0 0 1 -1 -1 800  261 357 136 44 2 0 0
2011  1 1  0 0 1 -1 -1 800  166 373 245 13 3 0 0
2012  1 1  0 0 1 -1 -1 800  105 317 352 25 1 0 0
1990  10 2  0 0 1 -1 -1 800  720 65 12 2 1 0 0
1991  10 2  0 0 1 -1 -1 800  531 237 32 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  373 261 141 25 0 0 0
1993  10 2  0 0 1 -1 -1 800  648 70 44 33 5 0 0
1994  10 2  0 0 1 -1 -1 800  596 155 25 15 9 0 0
1995  10 2  0 0 1 -1 -1 800  471 250 62 4 7 6 0
1996  10 2  0 0 1 -1 -1 800  726 41 19 14 0 0 0
1997  10 2  0 0 1 -1 -1 800  651 137 6 5 1 0 0
1998  10 2  0 0 1 -1 -1 800  517 232 45 4 1 0 1
1999  10 2  0 0 1 -1 -1 800  474 215 91 15 1 4 0
2000  10 2  0 0 1 -1 -1 800  556 147 65 24 6 2 0
2001  10 2  0 0 1 -1 -1 800  626 115 30 19 6 4 0
2002  10 2  0 0 1 -1 -1 800  354 346 76 9 12 1 2
2003  10 2  0 0 1 -1 -1 800  702 59 39 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  727 73 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  549 227 24 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  564 180 52 4 0 0 0
2007  10 2  0 0 1 -1 -1 800  655 113 23 7 2 0 0
2008  10 2  0 0 1 -1 -1 800  446 289 53 8 4 0 0
2009  10 2  0 0 1 -1 -1 800  700 57 30 8 5 0 0
2010  10 2  0 0 1 -1 -1 800  667 118 10 5 0 0 0
2011  10 2  0 0 1 -1 -1 800  587 166 40 7 0 0 0
2012  10 2  0 0 1 -1 -1 800  582 161 51 5 1 0 0
1985  4 3  0 0 1 -1 -1 800  605 130 44 16 5 0 0
1986  4 3  0 0 1 -1 -1 800  366 315 83 23 7 5 1
1987  4 3  0 0 1 -1 -1 800  526 108 128 28 7 2 1
1988  4 3  0 0 1 -1 -1 800  555 140 33 48 15 8 1
1989  4 3  0 0 1 -1 -1 800  708 49 18 10 11 1 3
1990  4 3  0 0 1 -1 -1 800  726 63 5 6 0 0 0
1991  4 3  0 0 1 -1 -1 800  545 218 32 5 0 0 0
1992  4 3  0 0 1 -1 -1 800  437 241 111 11 0 0 0
1993  4 3  0 0 1 -1 -1 800  655 69 58 17 1 0 0
1994  4 3  0 0 1 -1 -1 800  620 139 18 13 10 0 0
1995  4 3  0 0 1 -1 -1 800  504 210 65 4 11 6 0
1996  4 3  0 0 1 -1 -1 800  754 29 11 5 0 1 0
1997  4 3  0 0 1 -1 -1 800  696 93 6 5 0 0 0
1998  4 3  0 0 1 -1 -1 800  569 191 38 2 0 0 0
1999  4 3  0 0 1 -1 -1 800  518 191 75 16 0 0 0
2000  4 3  0 0 1 -1 -1 800  609 112 51 24 4 0 0
2001  4 3  0 0 1 -1 -1 800  662 94 28 7 7 1 1
2002  4 3  0 0 1 -1 -1 800  447 282 47 12 8 4 0
2003  4 3  0 0 1 -1 -1 800  709 50 30 5 3 2 1
2004  4 3  0 0 1 -1 -1 800  735 52 10 2 1 0 0
2005  4 3  0 0 1 -1 -1 800  614 178 8 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  605 152 43 0 0 0 0
2007  4 3  0 0 1 -1 -1 800  644 122 25 9 0 0 0
2008  4 3  0 0 1 -1 -1 800  462 259 65 8 6 0 0
2009  4 3  0 0 1 -1 -1 800  722 43 31 3 1 0 0
2010  4 3  0 0 1 -1 -1 800  685 102 12 1 0 0 0
2011  4 3  0 0 1 -1 -1 800  622 142 35 1 0 0 0
2012  4 3  0 0 1 -1 -1 800  608 145 43 4 0 0 0
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

