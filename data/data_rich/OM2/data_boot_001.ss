#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Aug 05 13:24:18 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659720258 first rand#: 0.731702
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
-999 1 1 135769 0.05
1985 1 1 195903 0.05
1986 1 1 156908 0.05
1987 1 1 89991.3 0.05
1988 1 1 25950.7 0.05
1989 1 1 51101.7 0.05
1990 1 1 69955.6 0.05
1991 1 1 76700 0.05
1992 1 1 137981 0.05
1993 1 1 215378 0.05
1994 1 1 88388.1 0.05
1995 1 1 48963.6 0.05
1996 1 1 114751 0.05
1997 1 1 107463 0.05
1998 1 1 187120 0.05
1999 1 1 155167 0.05
2000 1 1 235080 0.05
2001 1 1 221459 0.05
2002 1 1 226778 0.05
2003 1 1 339191 0.05
2004 1 1 608697 0.05
2005 1 1 880596 0.05
2006 1 1 1.49908e+06 0.05
2007 1 1 801307 0.05
2008 1 1 418956 0.05
2009 1 1 517999 0.05
2010 1 1 467398 0.05
2011 1 1 453492 0.05
2012 1 1 745063 0.05
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
1990 10 2 3.39894e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.15255e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.07422e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.46671e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.40894e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.00908e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.86139e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.75419e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.25263e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.49361e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.05261e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.25454e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.18774e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.26327e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.66245e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.98312e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.39913e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.4413e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.95867e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.58502e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.2733e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 3.96987e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.59554e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.00001e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 502474 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 379910 0.1 #_orig_obs: 954308 survey2
1988 4 3 261098 0.1 #_orig_obs: 245537 survey2
1989 4 3 320726 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.06624e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 976119 0.1 #_orig_obs: 527308 survey2
1992 4 3 388623 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 594942 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 544570 0.1 #_orig_obs: 375877 survey2
1995 4 3 310041 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.05315e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.92328e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.0127e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 915203 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 848286 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 761565 0.1 #_orig_obs: 689461 survey2
2002 4 3 391652 0.1 #_orig_obs: 525909 survey2
2003 4 3 796632 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.19816e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.23253e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.50711e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.17148e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 627890 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.30813e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.63687e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 2.03774e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 2.02789e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  142 307 280 63 8 0 0
1986  1 1  0 0 1 -1 -1 800  46 300 384 60 9 1 0
1987  1 1  0 0 1 -1 -1 800  53 100 535 92 16 4 0
1988  1 1  0 0 1 -1 -1 800  94 229 259 194 20 4 0
1989  1 1  0 0 1 -1 -1 800  218 198 304 62 15 2 1
1990  1 1  0 0 1 -1 -1 800  352 273 139 31 5 0 0
1991  1 1  0 0 1 -1 -1 800  136 475 176 12 1 0 0
1992  1 1  0 0 1 -1 -1 800  38 231 507 21 3 0 0
1993  1 1  0 0 1 -1 -1 800  134 134 378 149 5 0 0
1994  1 1  0 0 1 -1 -1 800  172 347 189 66 24 2 0
1995  1 1  0 0 1 -1 -1 800  69 313 368 32 15 3 0
1996  1 1  0 0 1 -1 -1 800  307 134 283 72 4 0 0
1997  1 1  0 0 1 -1 -1 800  247 414 92 40 7 0 0
1998  1 1  0 0 1 -1 -1 800  104 371 312 9 4 0 0
1999  1 1  0 0 1 -1 -1 800  70 192 475 61 2 0 0
2000  1 1  0 0 1 -1 -1 800  103 189 375 128 5 0 0
2001  1 1  0 0 1 -1 -1 800  174 258 280 68 17 3 0
2002  1 1  0 0 1 -1 -1 800  59 376 308 45 7 5 0
2003  1 1  0 0 1 -1 -1 800  209 126 410 48 6 1 0
2004  1 1  0 0 1 -1 -1 800  418 254 79 45 4 0 0
2005  1 1  0 0 1 -1 -1 800  135 512 147 6 0 0 0
2006  1 1  0 0 1 -1 -1 800  124 290 362 24 0 0 0
2007  1 1  0 0 1 -1 -1 800  176 276 298 48 2 0 0
2008  1 1  0 0 1 -1 -1 800  67 361 312 53 7 0 0
2009  1 1  0 0 1 -1 -1 800  208 145 385 59 1 2 0
2010  1 1  0 0 1 -1 -1 800  260 354 134 48 4 0 0
2011  1 1  0 0 1 -1 -1 800  158 361 265 12 4 0 0
2012  1 1  0 0 1 -1 -1 800  128 271 354 44 3 0 0
1990  10 2  0 0 1 -1 -1 800  728 56 8 4 4 0 0
1991  10 2  0 0 1 -1 -1 800  516 252 32 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  355 286 140 19 0 0 0
1993  10 2  0 0 1 -1 -1 800  623 73 68 29 7 0 0
1994  10 2  0 0 1 -1 -1 800  588 165 16 15 16 0 0
1995  10 2  0 0 1 -1 -1 800  464 243 69 8 11 5 0
1996  10 2  0 0 1 -1 -1 800  710 50 31 9 0 0 0
1997  10 2  0 0 1 -1 -1 800  670 114 8 5 3 0 0
1998  10 2  0 0 1 -1 -1 800  526 216 51 5 0 1 1
1999  10 2  0 0 1 -1 -1 800  496 173 100 30 1 0 0
2000  10 2  0 0 1 -1 -1 800  550 142 63 38 7 0 0
2001  10 2  0 0 1 -1 -1 800  628 118 23 18 12 1 0
2002  10 2  0 0 1 -1 -1 800  376 337 57 18 9 3 0
2003  10 2  0 0 1 -1 -1 800  691 62 47 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  733 67 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  578 206 16 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  593 147 52 8 0 0 0
2007  10 2  0 0 1 -1 -1 800  626 133 31 9 1 0 0
2008  10 2  0 0 1 -1 -1 800  459 274 49 13 4 1 0
2009  10 2  0 0 1 -1 -1 800  707 50 35 5 1 2 0
2010  10 2  0 0 1 -1 -1 800  654 132 5 9 0 0 0
2011  10 2  0 0 1 -1 -1 800  593 169 32 6 0 0 0
2012  10 2  0 0 1 -1 -1 800  569 175 45 9 0 0 2
1985  4 3  0 0 1 -1 -1 800  624 128 30 13 5 0 0
1986  4 3  0 0 1 -1 -1 800  342 321 93 30 5 5 4
1987  4 3  0 0 1 -1 -1 800  498 129 118 35 9 7 4
1988  4 3  0 0 1 -1 -1 800  573 129 29 52 14 2 1
1989  4 3  0 0 1 -1 -1 800  671 86 21 8 7 5 2
1990  4 3  0 0 1 -1 -1 800  734 56 7 3 0 0 0
1991  4 3  0 0 1 -1 -1 800  552 216 27 5 0 0 0
1992  4 3  0 0 1 -1 -1 800  421 243 115 21 0 0 0
1993  4 3  0 0 1 -1 -1 800  648 75 39 34 4 0 0
1994  4 3  0 0 1 -1 -1 800  621 142 12 12 13 0 0
1995  4 3  0 0 1 -1 -1 800  494 219 64 6 11 6 0
1996  4 3  0 0 1 -1 -1 800  734 35 20 8 2 0 1
1997  4 3  0 0 1 -1 -1 800  681 107 8 4 0 0 0
1998  4 3  0 0 1 -1 -1 800  549 205 41 5 0 0 0
1999  4 3  0 0 1 -1 -1 800  529 168 81 20 2 0 0
2000  4 3  0 0 1 -1 -1 800  580 115 74 21 10 0 0
2001  4 3  0 0 1 -1 -1 800  643 113 17 21 4 2 0
2002  4 3  0 0 1 -1 -1 800  444 288 46 13 4 5 0
2003  4 3  0 0 1 -1 -1 800  721 32 36 7 1 2 1
2004  4 3  0 0 1 -1 -1 800  737 54 3 6 0 0 0
2005  4 3  0 0 1 -1 -1 800  583 202 13 1 0 1 0
2006  4 3  0 0 1 -1 -1 800  596 145 52 7 0 0 0
2007  4 3  0 0 1 -1 -1 800  674 90 28 8 0 0 0
2008  4 3  0 0 1 -1 -1 800  479 250 57 12 2 0 0
2009  4 3  0 0 1 -1 -1 800  695 59 36 9 0 1 0
2010  4 3  0 0 1 -1 -1 800  663 120 8 5 4 0 0
2011  4 3  0 0 1 -1 -1 800  613 149 33 0 5 0 0
2012  4 3  0 0 1 -1 -1 800  582 158 51 9 0 0 0
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

