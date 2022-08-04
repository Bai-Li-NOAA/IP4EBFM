#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 04 14:42:57 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659638577 first rand#: 1.51974
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
-999 1 1 131055 0.05
1985 1 1 198018 0.05
1986 1 1 174070 0.05
1987 1 1 84314.1 0.05
1988 1 1 24324.8 0.05
1989 1 1 48732.5 0.05
1990 1 1 63369.4 0.05
1991 1 1 73487.4 0.05
1992 1 1 126637 0.05
1993 1 1 188353 0.05
1994 1 1 99341.1 0.05
1995 1 1 49678.6 0.05
1996 1 1 120621 0.05
1997 1 1 97871 0.05
1998 1 1 193388 0.05
1999 1 1 153838 0.05
2000 1 1 248496 0.05
2001 1 1 209911 0.05
2002 1 1 200126 0.05
2003 1 1 315867 0.05
2004 1 1 568222 0.05
2005 1 1 808947 0.05
2006 1 1 1.57522e+06 0.05
2007 1 1 852633 0.05
2008 1 1 430615 0.05
2009 1 1 465069 0.05
2010 1 1 438302 0.05
2011 1 1 426872 0.05
2012 1 1 701222 0.05
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
1990 10 2 3.19591e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.39618e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.19898e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.41389e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.42755e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.06555e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.64393e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.74816e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.61151e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.75997e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.33096e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.64475e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.26829e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.32713e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.51517e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.06844e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.8465e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.64942e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.75532e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.75611e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.62853e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.31241e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.14927e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.14809e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 392350 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 321120 0.1 #_orig_obs: 954308 survey2
1988 4 3 252004 0.1 #_orig_obs: 245537 survey2
1989 4 3 494377 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.12221e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 980447 0.1 #_orig_obs: 527308 survey2
1992 4 3 392140 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 652214 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 524369 0.1 #_orig_obs: 375877 survey2
1995 4 3 383001 0.1 #_orig_obs: 528242 survey2
1996 4 3 966408 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.58531e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.10126e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 972670 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 821048 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 931205 0.1 #_orig_obs: 689461 survey2
2002 4 3 442922 0.1 #_orig_obs: 525909 survey2
2003 4 3 874440 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.19236e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.56632e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.36563e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.12985e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 606771 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.24316e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.48127e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.84394e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.55603e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  167 247 307 73 5 1 0
1986  1 1  0 0 1 -1 -1 800  46 343 344 59 8 0 0
1987  1 1  0 0 1 -1 -1 800  71 110 522 82 14 1 0
1988  1 1  0 0 1 -1 -1 800  87 247 260 184 17 5 0
1989  1 1  0 0 1 -1 -1 800  198 199 317 61 23 1 1
1990  1 1  0 0 1 -1 -1 800  386 245 135 30 4 0 0
1991  1 1  0 0 1 -1 -1 800  129 457 193 15 5 1 0
1992  1 1  0 0 1 -1 -1 800  44 218 519 19 0 0 0
1993  1 1  0 0 1 -1 -1 800  135 104 428 129 4 0 0
1994  1 1  0 0 1 -1 -1 800  155 352 185 78 29 1 0
1995  1 1  0 0 1 -1 -1 800  74 302 373 37 10 4 0
1996  1 1  0 0 1 -1 -1 800  299 131 310 55 2 2 1
1997  1 1  0 0 1 -1 -1 800  248 402 110 35 5 0 0
1998  1 1  0 0 1 -1 -1 800  116 370 299 11 4 0 0
1999  1 1  0 0 1 -1 -1 800  73 226 440 60 1 0 0
2000  1 1  0 0 1 -1 -1 800  101 208 354 123 14 0 0
2001  1 1  0 0 1 -1 -1 800  181 269 261 67 20 1 1
2002  1 1  0 0 1 -1 -1 800  60 389 300 40 8 3 0
2003  1 1  0 0 1 -1 -1 800  195 118 416 61 10 0 0
2004  1 1  0 0 1 -1 -1 800  397 286 77 38 2 0 0
2005  1 1  0 0 1 -1 -1 800  154 506 135 5 0 0 0
2006  1 1  0 0 1 -1 -1 800  122 285 372 21 0 0 0
2007  1 1  0 0 1 -1 -1 800  160 301 291 47 1 0 0
2008  1 1  0 0 1 -1 -1 800  65 349 338 46 2 0 0
2009  1 1  0 0 1 -1 -1 800  218 147 386 42 5 2 0
2010  1 1  0 0 1 -1 -1 800  267 366 125 32 10 0 0
2011  1 1  0 0 1 -1 -1 800  156 339 287 12 6 0 0
2012  1 1  0 0 1 -1 -1 800  110 284 360 44 2 0 0
1990  10 2  0 0 1 -1 -1 800  721 67 9 2 1 0 0
1991  10 2  0 0 1 -1 -1 800  515 250 35 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  376 253 152 19 0 0 0
1993  10 2  0 0 1 -1 -1 800  632 78 56 32 2 0 0
1994  10 2  0 0 1 -1 -1 800  613 145 23 10 9 0 0
1995  10 2  0 0 1 -1 -1 800  473 225 73 18 6 5 0
1996  10 2  0 0 1 -1 -1 800  730 42 20 8 0 0 0
1997  10 2  0 0 1 -1 -1 800  679 109 8 3 1 0 0
1998  10 2  0 0 1 -1 -1 800  514 235 47 3 1 0 0
1999  10 2  0 0 1 -1 -1 800  476 206 92 23 2 1 0
2000  10 2  0 0 1 -1 -1 800  553 145 63 34 3 2 0
2001  10 2  0 0 1 -1 -1 800  629 118 27 14 8 4 0
2002  10 2  0 0 1 -1 -1 800  421 296 51 15 9 7 1
2003  10 2  0 0 1 -1 -1 800  686 60 54 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  738 62 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  530 256 14 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  598 158 40 4 0 0 0
2007  10 2  0 0 1 -1 -1 800  616 147 28 9 0 0 0
2008  10 2  0 0 1 -1 -1 800  443 274 61 16 4 2 0
2009  10 2  0 0 1 -1 -1 800  701 50 34 13 2 0 0
2010  10 2  0 0 1 -1 -1 800  670 115 9 6 0 0 0
2011  10 2  0 0 1 -1 -1 800  606 166 20 8 0 0 0
2012  10 2  0 0 1 -1 -1 800  568 194 30 8 0 0 0
1985  4 3  0 0 1 -1 -1 800  625 131 28 8 8 0 0
1986  4 3  0 0 1 -1 -1 800  389 292 81 21 12 3 2
1987  4 3  0 0 1 -1 -1 800  542 106 113 32 4 2 1
1988  4 3  0 0 1 -1 -1 800  537 158 45 43 11 3 3
1989  4 3  0 0 1 -1 -1 800  679 69 27 7 12 5 1
1990  4 3  0 0 1 -1 -1 800  734 54 7 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  537 239 21 3 0 0 0
1992  4 3  0 0 1 -1 -1 800  420 216 145 19 0 0 0
1993  4 3  0 0 1 -1 -1 800  662 64 51 20 3 0 0
1994  4 3  0 0 1 -1 -1 800  616 140 25 11 8 0 0
1995  4 3  0 0 1 -1 -1 800  532 200 45 11 8 4 0
1996  4 3  0 0 1 -1 -1 800  745 32 16 5 1 0 1
1997  4 3  0 0 1 -1 -1 800  672 124 1 3 0 0 0
1998  4 3  0 0 1 -1 -1 800  549 202 42 7 0 0 0
1999  4 3  0 0 1 -1 -1 800  489 187 101 23 0 0 0
2000  4 3  0 0 1 -1 -1 800  591 132 50 22 5 0 0
2001  4 3  0 0 1 -1 -1 800  661 99 22 9 9 0 0
2002  4 3  0 0 1 -1 -1 800  406 288 66 16 13 11 0
2003  4 3  0 0 1 -1 -1 800  705 47 33 11 2 0 2
2004  4 3  0 0 1 -1 -1 800  743 47 5 3 1 0 1
2005  4 3  0 0 1 -1 -1 800  559 225 9 4 3 0 0
2006  4 3  0 0 1 -1 -1 800  590 147 58 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  643 117 30 10 0 0 0
2008  4 3  0 0 1 -1 -1 800  478 267 43 5 7 0 0
2009  4 3  0 0 1 -1 -1 800  730 36 25 9 0 0 0
2010  4 3  0 0 1 -1 -1 800  682 103 8 6 1 0 0
2011  4 3  0 0 1 -1 -1 800  614 154 24 6 2 0 0
2012  4 3  0 0 1 -1 -1 800  601 163 28 8 0 0 0
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

