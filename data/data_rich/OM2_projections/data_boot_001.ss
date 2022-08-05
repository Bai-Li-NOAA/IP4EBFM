#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Aug 05 13:30:49 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659720649 first rand#: 0.433864
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
-999 1 1 135273 0.05
1985 1 1 192469 0.05
1986 1 1 180951 0.05
1987 1 1 101107 0.05
1988 1 1 25736.3 0.05
1989 1 1 51971.2 0.05
1990 1 1 69518.7 0.05
1991 1 1 77915.6 0.05
1992 1 1 133252 0.05
1993 1 1 208986 0.05
1994 1 1 92236.2 0.05
1995 1 1 47122.1 0.05
1996 1 1 125389 0.05
1997 1 1 101875 0.05
1998 1 1 188110 0.05
1999 1 1 162684 0.05
2000 1 1 223566 0.05
2001 1 1 193165 0.05
2002 1 1 202695 0.05
2003 1 1 349178 0.05
2004 1 1 559775 0.05
2005 1 1 784844 0.05
2006 1 1 1.50549e+06 0.05
2007 1 1 793996 0.05
2008 1 1 423834 0.05
2009 1 1 478822 0.05
2010 1 1 451828 0.05
2011 1 1 422876 0.05
2012 1 1 665665 0.05
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
1990 10 2 3.04475e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.15652e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.32818e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.35422e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.34543e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 908497 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.94348e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.90841e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.19148e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.20723e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.28657e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.42296e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.35673e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.30723e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.56828e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.35711e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.52864e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 4.30189e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.87108e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.83174e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 6.33068e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.51214e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.86475e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 916705 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 450835 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 315485 0.1 #_orig_obs: 954308 survey2
1988 4 3 254913 0.1 #_orig_obs: 245537 survey2
1989 4 3 414352 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.17339e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 835736 0.1 #_orig_obs: 527308 survey2
1992 4 3 418713 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 550657 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 590956 0.1 #_orig_obs: 375877 survey2
1995 4 3 352555 0.1 #_orig_obs: 528242 survey2
1996 4 3 907118 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.75371e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.24431e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 685413 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 842138 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 763456 0.1 #_orig_obs: 689461 survey2
2002 4 3 403262 0.1 #_orig_obs: 525909 survey2
2003 4 3 746727 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.41131e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.74939e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.23001e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.14275e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 735783 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.35218e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 2.17051e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 2.00851e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.42536e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  137 260 321 73 8 1 0
1986  1 1  0 0 1 -1 -1 800  33 316 376 64 10 0 1
1987  1 1  0 0 1 -1 -1 800  59 106 510 111 8 6 0
1988  1 1  0 0 1 -1 -1 800  93 230 259 191 21 6 0
1989  1 1  0 0 1 -1 -1 800  203 215 289 59 32 1 1
1990  1 1  0 0 1 -1 -1 800  350 255 153 35 7 0 0
1991  1 1  0 0 1 -1 -1 800  107 497 181 14 1 0 0
1992  1 1  0 0 1 -1 -1 800  45 232 489 32 2 0 0
1993  1 1  0 0 1 -1 -1 800  153 129 374 137 7 0 0
1994  1 1  0 0 1 -1 -1 800  174 336 183 70 35 2 0
1995  1 1  0 0 1 -1 -1 800  83 309 363 25 12 8 0
1996  1 1  0 0 1 -1 -1 800  324 129 293 47 4 3 0
1997  1 1  0 0 1 -1 -1 800  235 429 93 34 9 0 0
1998  1 1  0 0 1 -1 -1 800  110 371 303 13 3 0 0
1999  1 1  0 0 1 -1 -1 800  68 252 422 55 3 0 0
2000  1 1  0 0 1 -1 -1 800  81 219 373 116 11 0 0
2001  1 1  0 0 1 -1 -1 800  180 240 258 96 25 1 0
2002  1 1  0 0 1 -1 -1 800  56 368 316 49 9 2 0
2003  1 1  0 0 1 -1 -1 800  197 118 432 47 5 1 0
2004  1 1  0 0 1 -1 -1 800  424 256 72 43 5 0 0
2005  1 1  0 0 1 -1 -1 800  146 500 143 11 0 0 0
2006  1 1  0 0 1 -1 -1 800  111 273 404 12 0 0 0
2007  1 1  0 0 1 -1 -1 800  158 295 304 42 1 0 0
2008  1 1  0 0 1 -1 -1 800  59 375 324 36 6 0 0
2009  1 1  0 0 1 -1 -1 800  228 159 358 46 6 3 0
2010  1 1  0 0 1 -1 -1 800  279 368 108 37 8 0 0
2011  1 1  0 0 1 -1 -1 800  150 368 270 10 2 0 0
2012  1 1  0 0 1 -1 -1 800  112 293 349 45 1 0 0
1990  10 2  0 0 1 -1 -1 800  724 61 6 5 4 0 0
1991  10 2  0 0 1 -1 -1 800  521 250 29 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  384 248 149 19 0 0 0
1993  10 2  0 0 1 -1 -1 800  626 74 61 36 3 0 0
1994  10 2  0 0 1 -1 -1 800  601 141 25 21 12 0 0
1995  10 2  0 0 1 -1 -1 800  467 249 70 7 4 3 0
1996  10 2  0 0 1 -1 -1 800  733 38 20 9 0 0 0
1997  10 2  0 0 1 -1 -1 800  679 113 6 2 0 0 0
1998  10 2  0 0 1 -1 -1 800  522 220 53 3 1 0 1
1999  10 2  0 0 1 -1 -1 800  491 190 90 26 1 2 0
2000  10 2  0 0 1 -1 -1 800  552 138 71 33 5 1 0
2001  10 2  0 0 1 -1 -1 800  624 112 36 20 8 0 0
2002  10 2  0 0 1 -1 -1 800  392 316 64 17 8 2 1
2003  10 2  0 0 1 -1 -1 800  693 52 55 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  720 80 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  550 236 14 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  597 157 40 6 0 0 0
2007  10 2  0 0 1 -1 -1 800  633 132 28 5 2 0 0
2008  10 2  0 0 1 -1 -1 800  434 298 53 5 8 2 0
2009  10 2  0 0 1 -1 -1 800  692 62 33 9 3 1 0
2010  10 2  0 0 1 -1 -1 800  639 140 15 6 0 0 0
2011  10 2  0 0 1 -1 -1 800  589 172 35 4 0 0 0
2012  10 2  0 0 1 -1 -1 800  566 173 49 9 2 0 1
1985  4 3  0 0 1 -1 -1 800  600 145 37 14 4 0 0
1986  4 3  0 0 1 -1 -1 800  365 317 83 22 8 4 1
1987  4 3  0 0 1 -1 -1 800  530 110 105 40 10 4 1
1988  4 3  0 0 1 -1 -1 800  558 143 46 42 6 4 1
1989  4 3  0 0 1 -1 -1 800  674 73 25 11 9 6 2
1990  4 3  0 0 1 -1 -1 800  754 36 7 3 0 0 0
1991  4 3  0 0 1 -1 -1 800  546 223 24 7 0 0 0
1992  4 3  0 0 1 -1 -1 800  421 230 132 17 0 0 0
1993  4 3  0 0 1 -1 -1 800  631 76 53 39 1 0 0
1994  4 3  0 0 1 -1 -1 800  621 144 19 11 5 0 0
1995  4 3  0 0 1 -1 -1 800  500 219 65 6 3 7 0
1996  4 3  0 0 1 -1 -1 800  739 33 19 5 2 1 1
1997  4 3  0 0 1 -1 -1 800  701 87 6 6 0 0 0
1998  4 3  0 0 1 -1 -1 800  550 210 39 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  539 160 83 17 1 0 0
2000  4 3  0 0 1 -1 -1 800  598 118 56 21 7 0 0
2001  4 3  0 0 1 -1 -1 800  656 97 21 15 9 2 0
2002  4 3  0 0 1 -1 -1 800  419 290 66 16 5 4 0
2003  4 3  0 0 1 -1 -1 800  706 46 35 9 3 0 1
2004  4 3  0 0 1 -1 -1 800  744 48 4 2 1 1 0
2005  4 3  0 0 1 -1 -1 800  590 200 7 2 0 1 0
2006  4 3  0 0 1 -1 -1 800  598 151 46 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  639 116 39 6 0 0 0
2008  4 3  0 0 1 -1 -1 800  468 262 55 12 3 0 0
2009  4 3  0 0 1 -1 -1 800  718 50 30 1 1 0 0
2010  4 3  0 0 1 -1 -1 800  678 109 5 6 2 0 0
2011  4 3  0 0 1 -1 -1 800  632 144 22 1 1 0 0
2012  4 3  0 0 1 -1 -1 800  577 147 65 11 0 0 0
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

