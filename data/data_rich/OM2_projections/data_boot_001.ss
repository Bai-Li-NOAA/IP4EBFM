#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 13 11:28:41 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1663082921 first rand#: -0.810111
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
-999 1 1 11950.2 0.05
1985 1 1 206595 0.05
1986 1 1 171344 0.05
1987 1 1 93350.8 0.05
1988 1 1 25444.5 0.05
1989 1 1 49753 0.05
1990 1 1 71707.1 0.05
1991 1 1 82840.3 0.05
1992 1 1 135438 0.05
1993 1 1 197779 0.05
1994 1 1 98887.7 0.05
1995 1 1 48312.8 0.05
1996 1 1 124286 0.05
1997 1 1 110881 0.05
1998 1 1 190616 0.05
1999 1 1 142547 0.05
2000 1 1 229619 0.05
2001 1 1 219104 0.05
2002 1 1 169507 0.05
2003 1 1 137607 0.05
2004 1 1 201870 0.05
2005 1 1 381619 0.05
2006 1 1 456189 0.05
2007 1 1 335456 0.05
2008 1 1 250168 0.05
2009 1 1 196074 0.05
2010 1 1 182865 0.05
2011 1 1 237135 0.05
2012 1 1 184634 0.05
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
1990 10 2 4.58262e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 4.34192e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.62012e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 2.03115e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.44087e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 984954 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.28558e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 5.56007e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.03613e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 3.02127e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.18569e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.48585e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.13453e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.34723e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.40424e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.32059e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 4.62705e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.40599e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.59874e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.64053e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 3.72063e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 2.47718e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 1.14805e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.20748e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 367843 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 306798 0.1 #_orig_obs: 954308 survey2
1988 4 3 172833 0.1 #_orig_obs: 245537 survey2
1989 4 3 435237 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.92834e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.37291e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 581069 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 584421 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 661469 0.1 #_orig_obs: 375877 survey2
1995 4 3 281103 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.28468e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.82339e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.69416e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.0361e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 731896 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 844178 0.1 #_orig_obs: 689461 survey2
2002 4 3 418697 0.1 #_orig_obs: 525909 survey2
2003 4 3 850561 0.1 #_orig_obs: 634479 survey2
2004 4 3 3.08358e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 2.25295e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.59396e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.28612e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 573456 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.22427e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.2049e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 821489 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 579205 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  128 136 226 180 69 61 0
1986  1 1  0 0 1 -1 -1 800  41 293 340 108 16 2 0
1987  1 1  0 0 1 -1 -1 800  99 111 475 115 0 0 0
1988  1 1  0 0 1 -1 -1 800  92 183 195 324 6 0 0
1989  1 1  0 0 1 -1 -1 800  344 142 223 67 24 0 0
1990  1 1  0 0 1 -1 -1 800  528 165 83 23 1 0 0
1991  1 1  0 0 1 -1 -1 800  200 425 157 18 0 0 0
1992  1 1  0 0 1 -1 -1 800  46 198 483 71 2 0 0
1993  1 1  0 0 1 -1 -1 800  98 89 365 245 3 0 0
1994  1 1  0 0 1 -1 -1 800  192 275 167 160 6 0 0
1995  1 1  0 0 1 -1 -1 800  91 262 372 70 5 0 0
1996  1 1  0 0 1 -1 -1 800  408 84 209 97 2 0 0
1997  1 1  0 0 1 -1 -1 800  367 330 62 41 0 0 0
1998  1 1  0 0 1 -1 -1 800  157 361 272 10 0 0 0
1999  1 1  0 0 1 -1 -1 800  79 188 439 94 0 0 0
2000  1 1  0 0 1 -1 -1 800  101 151 328 209 11 0 0
2001  1 1  0 0 1 -1 -1 800  273 227 229 64 7 0 0
2002  1 1  0 0 1 -1 -1 800  78 429 270 22 1 0 0
2003  1 1  0 0 1 -1 -1 800  358 87 337 18 0 0 0
2004  1 1  0 0 1 -1 -1 800  556 200 32 12 0 0 0
2005  1 1  0 0 1 -1 -1 800  212 492 94 2 0 0 0
2006  1 1  0 0 1 -1 -1 800  164 248 383 5 0 0 0
2007  1 1  0 0 1 -1 -1 800  251 255 257 37 0 0 0
2008  1 1  0 0 1 -1 -1 800  92 398 280 30 0 0 0
2009  1 1  0 0 1 -1 -1 800  314 125 342 19 0 0 0
2010  1 1  0 0 1 -1 -1 800  335 345 93 27 0 0 0
2011  1 1  0 0 1 -1 -1 800  164 368 261 7 0 0 0
2012  1 1  0 0 1 -1 -1 800  113 290 372 25 0 0 0
1990  10 2  0 0 1 -1 -1 800  754 44 2 0 0 0 0
1991  10 2  0 0 1 -1 -1 800  503 284 13 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  301 313 181 5 0 0 0
1993  10 2  0 0 1 -1 -1 800  623 101 70 6 0 0 0
1994  10 2  0 0 1 -1 -1 800  569 209 19 3 0 0 0
1995  10 2  0 0 1 -1 -1 800  393 302 104 1 0 0 0
1996  10 2  0 0 1 -1 -1 800  753 32 15 0 0 0 0
1997  10 2  0 0 1 -1 -1 800  691 102 7 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  517 249 34 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  434 252 109 5 0 0 0
2000  10 2  0 0 1 -1 -1 800  565 157 71 7 0 0 0
2001  10 2  0 0 1 -1 -1 800  634 148 18 0 0 0 0
2002  10 2  0 0 1 -1 -1 800  334 429 37 0 0 0 0
2003  10 2  0 0 1 -1 -1 800  745 36 19 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  741 59 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  525 265 10 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  587 187 26 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  617 164 19 0 0 0 0
2008  10 2  0 0 1 -1 -1 800  394 367 39 0 0 0 0
2009  10 2  0 0 1 -1 -1 800  706 79 15 0 0 0 0
2010  10 2  0 0 1 -1 -1 800  617 178 5 0 0 0 0
2011  10 2  0 0 1 -1 -1 800  542 240 18 0 0 0 0
2012  10 2  0 0 1 -1 -1 800  518 230 52 0 0 0 0
1985  4 3  0 0 1 -1 -1 800  612 131 34 15 8 0 0
1986  4 3  0 0 1 -1 -1 800  355 348 82 15 0 0 0
1987  4 3  0 0 1 -1 -1 800  574 110 106 10 0 0 0
1988  4 3  0 0 1 -1 -1 800  570 167 37 25 1 0 0
1989  4 3  0 0 1 -1 -1 800  711 60 26 3 0 0 0
1990  4 3  0 0 1 -1 -1 800  751 45 3 1 0 0 0
1991  4 3  0 0 1 -1 -1 800  560 223 17 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  361 274 157 8 0 0 0
1993  4 3  0 0 1 -1 -1 800  629 92 52 27 0 0 0
1994  4 3  0 0 1 -1 -1 800  623 150 17 9 1 0 0
1995  4 3  0 0 1 -1 -1 800  458 239 95 8 0 0 0
1996  4 3  0 0 1 -1 -1 800  767 19 10 4 0 0 0
1997  4 3  0 0 1 -1 -1 800  688 107 3 2 0 0 0
1998  4 3  0 0 1 -1 -1 800  531 239 29 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  486 215 92 7 0 0 0
2000  4 3  0 0 1 -1 -1 800  576 138 70 16 0 0 0
2001  4 3  0 0 1 -1 -1 800  650 118 30 2 0 0 0
2002  4 3  0 0 1 -1 -1 800  364 396 38 2 0 0 0
2003  4 3  0 0 1 -1 -1 800  734 32 33 1 0 0 0
2004  4 3  0 0 1 -1 -1 800  759 38 3 0 0 0 0
2005  4 3  0 0 1 -1 -1 800  554 235 11 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  600 150 50 0 0 0 0
2007  4 3  0 0 1 -1 -1 800  638 128 33 1 0 0 0
2008  4 3  0 0 1 -1 -1 800  415 329 53 3 0 0 0
2009  4 3  0 0 1 -1 -1 800  720 51 29 0 0 0 0
2010  4 3  0 0 1 -1 -1 800  669 123 8 0 0 0 0
2011  4 3  0 0 1 -1 -1 800  549 222 29 0 0 0 0
2012  4 3  0 0 1 -1 -1 800  514 211 73 2 0 0 0
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

