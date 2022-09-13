#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 13 11:19:50 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1663082390 first rand#: -0.0206901
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
-999 1 1 120300 0.05
1985 1 1 177458 0.05
1986 1 1 178801 0.05
1987 1 1 97521.1 0.05
1988 1 1 26166.4 0.05
1989 1 1 49239.7 0.05
1990 1 1 69107.3 0.05
1991 1 1 74666.5 0.05
1992 1 1 122412 0.05
1993 1 1 184420 0.05
1994 1 1 94182.7 0.05
1995 1 1 49876.4 0.05
1996 1 1 130161 0.05
1997 1 1 99125.1 0.05
1998 1 1 190717 0.05
1999 1 1 164579 0.05
2000 1 1 223803 0.05
2001 1 1 227917 0.05
2002 1 1 204542 0.05
2003 1 1 342302 0.05
2004 1 1 565611 0.05
2005 1 1 768002 0.05
2006 1 1 1.63435e+06 0.05
2007 1 1 901330 0.05
2008 1 1 438402 0.05
2009 1 1 513723 0.05
2010 1 1 448388 0.05
2011 1 1 407345 0.05
2012 1 1 674067 0.05
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
1990 10 2 3.5118e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.48747e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.23832e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.57372e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.82835e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 955774 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.09351e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.75379e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.01801e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.19767e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.06281e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.09469e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.31546e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.18574e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.13613e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.45836e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.28671e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 4.00897e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 2.00695e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.57019e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.3963e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.53765e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.88475e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.05059e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 397295 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 343987 0.1 #_orig_obs: 954308 survey2
1988 4 3 260174 0.1 #_orig_obs: 245537 survey2
1989 4 3 481358 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.04079e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 827534 0.1 #_orig_obs: 527308 survey2
1992 4 3 415385 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 547070 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 527265 0.1 #_orig_obs: 375877 survey2
1995 4 3 351257 0.1 #_orig_obs: 528242 survey2
1996 4 3 873789 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.81074e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.47705e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 746822 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 744572 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.00586e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 493365 0.1 #_orig_obs: 525909 survey2
2003 4 3 867831 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.09949e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.59717e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.18494e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.16949e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 806814 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.51695e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.95401e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.59368e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.56577e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  130 295 305 59 10 1 0
1986  1 1  0 0 1 -1 -1 800  45 285 380 82 6 2 0
1987  1 1  0 0 1 -1 -1 800  63 87 517 109 22 2 0
1988  1 1  0 0 1 -1 -1 800  83 231 271 185 24 6 0
1989  1 1  0 0 1 -1 -1 800  210 209 296 43 34 8 0
1990  1 1  0 0 1 -1 -1 800  366 259 147 24 4 0 0
1991  1 1  0 0 1 -1 -1 800  132 471 181 16 0 0 0
1992  1 1  0 0 1 -1 -1 800  34 224 513 28 1 0 0
1993  1 1  0 0 1 -1 -1 800  130 141 384 139 6 0 0
1994  1 1  0 0 1 -1 -1 800  149 344 195 82 29 1 0
1995  1 1  0 0 1 -1 -1 800  78 306 369 32 8 7 0
1996  1 1  0 0 1 -1 -1 800  310 134 289 56 8 2 1
1997  1 1  0 0 1 -1 -1 800  271 389 104 31 5 0 0
1998  1 1  0 0 1 -1 -1 800  109 369 309 9 4 0 0
1999  1 1  0 0 1 -1 -1 800  68 207 453 69 3 0 0
2000  1 1  0 0 1 -1 -1 800  106 187 389 111 7 0 0
2001  1 1  0 0 1 -1 -1 800  180 243 275 81 18 3 0
2002  1 1  0 0 1 -1 -1 800  53 371 321 47 8 0 0
2003  1 1  0 0 1 -1 -1 800  192 107 423 63 13 2 0
2004  1 1  0 0 1 -1 -1 800  421 256 82 30 11 0 0
2005  1 1  0 0 1 -1 -1 800  143 505 146 6 0 0 0
2006  1 1  0 0 1 -1 -1 800  108 284 394 14 0 0 0
2007  1 1  0 0 1 -1 -1 800  155 303 297 43 2 0 0
2008  1 1  0 0 1 -1 -1 800  71 362 317 45 5 0 0
2009  1 1  0 0 1 -1 -1 800  236 155 360 43 6 0 0
2010  1 1  0 0 1 -1 -1 800  263 372 128 32 5 0 0
2011  1 1  0 0 1 -1 -1 800  165 338 287 5 5 0 0
2012  1 1  0 0 1 -1 -1 800  128 283 349 38 2 0 0
1990  10 2  0 0 1 -1 -1 800  739 45 12 3 1 0 0
1991  10 2  0 0 1 -1 -1 800  506 263 31 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  379 252 144 25 0 0 0
1993  10 2  0 0 1 -1 -1 800  625 81 52 32 10 0 0
1994  10 2  0 0 1 -1 -1 800  580 168 23 14 15 0 0
1995  10 2  0 0 1 -1 -1 800  457 250 70 14 4 5 0
1996  10 2  0 0 1 -1 -1 800  733 42 18 7 0 0 0
1997  10 2  0 0 1 -1 -1 800  683 101 8 6 2 0 0
1998  10 2  0 0 1 -1 -1 800  509 231 55 0 4 0 1
1999  10 2  0 0 1 -1 -1 800  502 178 96 21 2 1 0
2000  10 2  0 0 1 -1 -1 800  552 143 71 29 5 0 0
2001  10 2  0 0 1 -1 -1 800  620 122 34 16 6 2 0
2002  10 2  0 0 1 -1 -1 800  393 310 73 13 8 1 2
2003  10 2  0 0 1 -1 -1 800  704 50 46 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  730 70 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  553 217 30 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  608 138 46 8 0 0 0
2007  10 2  0 0 1 -1 -1 800  619 150 24 5 2 0 0
2008  10 2  0 0 1 -1 -1 800  468 268 49 11 3 1 0
2009  10 2  0 0 1 -1 -1 800  717 41 35 7 0 0 0
2010  10 2  0 0 1 -1 -1 800  669 111 10 10 0 0 0
2011  10 2  0 0 1 -1 -1 800  574 193 30 3 0 0 0
2012  10 2  0 0 1 -1 -1 800  573 169 51 6 1 0 0
1985  4 3  0 0 1 -1 -1 800  613 133 43 7 4 0 0
1986  4 3  0 0 1 -1 -1 800  391 295 70 26 15 2 1
1987  4 3  0 0 1 -1 -1 800  559 96 103 29 11 1 1
1988  4 3  0 0 1 -1 -1 800  539 168 24 37 21 8 3
1989  4 3  0 0 1 -1 -1 800  697 62 26 2 8 3 2
1990  4 3  0 0 1 -1 -1 800  739 50 6 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  559 214 21 6 0 0 0
1992  4 3  0 0 1 -1 -1 800  445 225 114 16 0 0 0
1993  4 3  0 0 1 -1 -1 800  643 72 56 28 1 0 0
1994  4 3  0 0 1 -1 -1 800  635 124 20 10 11 0 0
1995  4 3  0 0 1 -1 -1 800  513 217 43 13 7 7 0
1996  4 3  0 0 1 -1 -1 800  754 25 18 2 0 1 0
1997  4 3  0 0 1 -1 -1 800  679 116 2 3 0 0 0
1998  4 3  0 0 1 -1 -1 800  549 195 48 8 0 0 0
1999  4 3  0 0 1 -1 -1 800  536 174 76 12 2 0 0
2000  4 3  0 0 1 -1 -1 800  574 116 72 33 5 0 0
2001  4 3  0 0 1 -1 -1 800  639 118 19 12 10 2 0
2002  4 3  0 0 1 -1 -1 800  420 302 57 10 4 7 0
2003  4 3  0 0 1 -1 -1 800  707 46 28 12 3 3 1
2004  4 3  0 0 1 -1 -1 800  723 64 8 4 0 1 0
2005  4 3  0 0 1 -1 -1 800  563 216 13 4 2 1 1
2006  4 3  0 0 1 -1 -1 800  591 150 57 2 0 0 0
2007  4 3  0 0 1 -1 -1 800  640 118 35 7 0 0 0
2008  4 3  0 0 1 -1 -1 800  468 250 69 12 1 0 0
2009  4 3  0 0 1 -1 -1 800  710 51 32 4 2 1 0
2010  4 3  0 0 1 -1 -1 800  700 91 5 3 1 0 0
2011  4 3  0 0 1 -1 -1 800  621 151 25 0 3 0 0
2012  4 3  0 0 1 -1 -1 800  599 141 46 14 0 0 0
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

