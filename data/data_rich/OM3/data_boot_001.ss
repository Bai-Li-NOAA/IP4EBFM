#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 15 09:52:58 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660571578 first rand#: -0.584562
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
-999 1 1 128736 0.05
1985 1 1 192604 0.05
1986 1 1 174961 0.05
1987 1 1 90165.7 0.05
1988 1 1 24962.5 0.05
1989 1 1 55327.6 0.05
1990 1 1 62344.8 0.05
1991 1 1 79231.8 0.05
1992 1 1 130651 0.05
1993 1 1 208474 0.05
1994 1 1 90272.6 0.05
1995 1 1 52630 0.05
1996 1 1 128568 0.05
1997 1 1 102335 0.05
1998 1 1 214971 0.05
1999 1 1 142926 0.05
2000 1 1 237553 0.05
2001 1 1 218245 0.05
2002 1 1 207593 0.05
2003 1 1 318989 0.05
2004 1 1 512874 0.05
2005 1 1 756051 0.05
2006 1 1 1.60111e+06 0.05
2007 1 1 822326 0.05
2008 1 1 455683 0.05
2009 1 1 549497 0.05
2010 1 1 461321 0.05
2011 1 1 415012 0.05
2012 1 1 626350 0.05
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
1990 10 2 3.44353e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.841e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.21208e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.45128e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.49231e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.13745e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.74567e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.16613e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.1587e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 1.84343e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.32438e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 1.97041e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.10179e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.04273e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.67881e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.24684e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.66631e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.61593e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.71021e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.641e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 6.42009e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.85582e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.74909e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 952466 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 384665 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 305942 0.1 #_orig_obs: 954308 survey2
1988 4 3 278139 0.1 #_orig_obs: 245537 survey2
1989 4 3 429863 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.15417e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 695845 0.1 #_orig_obs: 527308 survey2
1992 4 3 381410 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 517000 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 685572 0.1 #_orig_obs: 375877 survey2
1995 4 3 372212 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.23696e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.55599e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.17013e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 772677 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 848991 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 818356 0.1 #_orig_obs: 689461 survey2
2002 4 3 467513 0.1 #_orig_obs: 525909 survey2
2003 4 3 964583 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.22533e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.4278e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.38628e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.07113e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 739531 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.31411e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.93163e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.56281e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.3113e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  142 309 284 60 4 1 0
1986  1 1  0 0 1 -1 -1 800  45 324 357 64 10 0 0
1987  1 1  0 0 1 -1 -1 800  60 87 538 103 11 1 0
1988  1 1  0 0 1 -1 -1 800  94 248 242 184 27 5 0
1989  1 1  0 0 1 -1 -1 800  237 201 287 52 19 3 1
1990  1 1  0 0 1 -1 -1 800  329 260 175 26 10 0 0
1991  1 1  0 0 1 -1 -1 800  109 468 201 18 3 1 0
1992  1 1  0 0 1 -1 -1 800  39 232 494 34 1 0 0
1993  1 1  0 0 1 -1 -1 800  126 134 389 144 7 0 0
1994  1 1  0 0 1 -1 -1 800  168 338 186 85 21 2 0
1995  1 1  0 0 1 -1 -1 800  82 324 362 23 7 2 0
1996  1 1  0 0 1 -1 -1 800  295 148 291 61 3 2 0
1997  1 1  0 0 1 -1 -1 800  262 403 93 36 6 0 0
1998  1 1  0 0 1 -1 -1 800  119 358 310 12 1 0 0
1999  1 1  0 0 1 -1 -1 800  66 202 480 51 1 0 0
2000  1 1  0 0 1 -1 -1 800  85 196 389 114 16 0 0
2001  1 1  0 0 1 -1 -1 800  175 269 278 57 17 4 0
2002  1 1  0 0 1 -1 -1 800  79 363 292 56 8 2 0
2003  1 1  0 0 1 -1 -1 800  191 126 426 51 4 1 1
2004  1 1  0 0 1 -1 -1 800  406 287 65 39 3 0 0
2005  1 1  0 0 1 -1 -1 800  141 489 162 8 0 0 0
2006  1 1  0 0 1 -1 -1 800  126 260 397 17 0 0 0
2007  1 1  0 0 1 -1 -1 800  160 292 296 49 3 0 0
2008  1 1  0 0 1 -1 -1 800  72 354 322 42 10 0 0
2009  1 1  0 0 1 -1 -1 800  241 139 367 47 5 1 0
2010  1 1  0 0 1 -1 -1 800  250 361 135 48 6 0 0
2011  1 1  0 0 1 -1 -1 800  148 363 273 11 5 0 0
2012  1 1  0 0 1 -1 -1 800  109 307 340 42 2 0 0
1990  10 2  0 0 1 -1 -1 800  718 65 9 3 5 0 0
1991  10 2  0 0 1 -1 -1 800  527 240 33 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  378 259 150 13 0 0 0
1993  10 2  0 0 1 -1 -1 800  615 93 47 41 4 0 0
1994  10 2  0 0 1 -1 -1 800  594 159 19 17 11 0 0
1995  10 2  0 0 1 -1 -1 800  460 268 56 12 2 2 0
1996  10 2  0 0 1 -1 -1 800  737 37 22 4 0 0 0
1997  10 2  0 0 1 -1 -1 800  651 136 8 3 2 0 0
1998  10 2  0 0 1 -1 -1 800  513 235 43 6 1 2 0
1999  10 2  0 0 1 -1 -1 800  472 202 115 9 1 1 0
2000  10 2  0 0 1 -1 -1 800  562 131 74 27 4 2 0
2001  10 2  0 0 1 -1 -1 800  632 108 30 19 11 0 0
2002  10 2  0 0 1 -1 -1 800  387 325 62 17 5 4 0
2003  10 2  0 0 1 -1 -1 800  693 49 58 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  717 83 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  550 238 12 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  591 161 43 5 0 0 0
2007  10 2  0 0 1 -1 -1 800  624 137 30 8 1 0 0
2008  10 2  0 0 1 -1 -1 800  425 293 63 13 4 2 0
2009  10 2  0 0 1 -1 -1 800  708 53 26 8 2 3 0
2010  10 2  0 0 1 -1 -1 800  688 100 3 9 0 0 0
2011  10 2  0 0 1 -1 -1 800  587 177 31 5 0 0 0
2012  10 2  0 0 1 -1 -1 800  575 166 48 9 0 2 0
1985  4 3  0 0 1 -1 -1 800  622 124 30 13 11 0 0
1986  4 3  0 0 1 -1 -1 800  352 323 92 24 7 1 1
1987  4 3  0 0 1 -1 -1 800  518 111 117 36 12 4 2
1988  4 3  0 0 1 -1 -1 800  562 138 42 42 9 5 2
1989  4 3  0 0 1 -1 -1 800  682 73 22 7 12 2 2
1990  4 3  0 0 1 -1 -1 800  731 57 7 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  566 210 21 3 0 0 0
1992  4 3  0 0 1 -1 -1 800  419 249 117 15 0 0 0
1993  4 3  0 0 1 -1 -1 800  661 66 41 29 3 0 0
1994  4 3  0 0 1 -1 -1 800  626 138 17 10 9 0 0
1995  4 3  0 0 1 -1 -1 800  496 225 67 4 5 3 0
1996  4 3  0 0 1 -1 -1 800  728 40 20 9 1 0 2
1997  4 3  0 0 1 -1 -1 800  695 98 3 4 0 0 0
1998  4 3  0 0 1 -1 -1 800  549 198 50 3 0 0 0
1999  4 3  0 0 1 -1 -1 800  503 166 110 21 0 0 0
2000  4 3  0 0 1 -1 -1 800  604 116 45 27 8 0 0
2001  4 3  0 0 1 -1 -1 800  659 94 24 17 6 0 0
2002  4 3  0 0 1 -1 -1 800  446 278 58 12 4 2 0
2003  4 3  0 0 1 -1 -1 800  702 52 35 2 6 0 3
2004  4 3  0 0 1 -1 -1 800  734 56 2 6 1 1 0
2005  4 3  0 0 1 -1 -1 800  593 190 15 0 2 0 0
2006  4 3  0 0 1 -1 -1 800  598 143 51 8 0 0 0
2007  4 3  0 0 1 -1 -1 800  627 126 37 10 0 0 0
2008  4 3  0 0 1 -1 -1 800  480 256 54 6 4 0 0
2009  4 3  0 0 1 -1 -1 800  705 58 29 7 0 1 0
2010  4 3  0 0 1 -1 -1 800  680 104 15 0 1 0 0
2011  4 3  0 0 1 -1 -1 800  608 158 31 0 3 0 0
2012  4 3  0 0 1 -1 -1 800  576 163 54 7 0 0 0
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

