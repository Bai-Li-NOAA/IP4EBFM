#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 29 11:33:29 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661787209 first rand#: 0.190569
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
-999 1 1 121112 0.05
1985 1 1 199145 0.05
1986 1 1 181297 0.05
1987 1 1 87855.1 0.05
1988 1 1 26022.2 0.05
1989 1 1 57423.8 0.05
1990 1 1 62776.2 0.05
1991 1 1 80714.2 0.05
1992 1 1 126779 0.05
1993 1 1 198286 0.05
1994 1 1 81643.8 0.05
1995 1 1 47260.4 0.05
1996 1 1 132517 0.05
1997 1 1 117827 0.05
1998 1 1 178214 0.05
1999 1 1 163471 0.05
2000 1 1 211300 0.05
2001 1 1 214689 0.05
2002 1 1 206112 0.05
2003 1 1 341629 0.05
2004 1 1 570594 0.05
2005 1 1 777808 0.05
2006 1 1 1.67774e+06 0.05
2007 1 1 829647 0.05
2008 1 1 429286 0.05
2009 1 1 510911 0.05
2010 1 1 470991 0.05
2011 1 1 477528 0.05
2012 1 1 713922 0.05
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
1990 10 2 3.40396e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.78638e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.21642e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.51031e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.42711e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.1052e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.06355e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.71788e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.18158e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.13903e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 1.95979e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.30636e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.53675e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.00632e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.28618e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.56542e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.58697e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.52246e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 2.15073e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.67822e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.0431e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.75605e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.30742e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.17109e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 419775 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 312770 0.1 #_orig_obs: 954308 survey2
1988 4 3 249142 0.1 #_orig_obs: 245537 survey2
1989 4 3 410182 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.2326e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 870821 0.1 #_orig_obs: 527308 survey2
1992 4 3 399776 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 499943 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 542556 0.1 #_orig_obs: 375877 survey2
1995 4 3 374652 0.1 #_orig_obs: 528242 survey2
1996 4 3 982260 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.8978e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.08085e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 833786 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 873658 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 896291 0.1 #_orig_obs: 689461 survey2
2002 4 3 485157 0.1 #_orig_obs: 525909 survey2
2003 4 3 675635 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.27538e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.67384e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.35752e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.2931e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 716256 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.25353e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.54538e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 2.06347e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.57382e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  150 293 290 59 8 0 0
1986  1 1  0 0 1 -1 -1 800  54 317 372 50 5 2 0
1987  1 1  0 0 1 -1 -1 800  54 126 495 110 14 1 0
1988  1 1  0 0 1 -1 -1 800  111 219 236 209 23 2 0
1989  1 1  0 0 1 -1 -1 800  232 191 289 53 33 2 0
1990  1 1  0 0 1 -1 -1 800  377 241 134 45 3 0 0
1991  1 1  0 0 1 -1 -1 800  136 454 190 18 1 0 1
1992  1 1  0 0 1 -1 -1 800  42 219 500 38 1 0 0
1993  1 1  0 0 1 -1 -1 800  128 135 382 150 5 0 0
1994  1 1  0 0 1 -1 -1 800  183 327 168 92 30 0 0
1995  1 1  0 0 1 -1 -1 800  71 307 368 34 15 5 0
1996  1 1  0 0 1 -1 -1 800  331 133 273 54 5 2 2
1997  1 1  0 0 1 -1 -1 800  275 378 110 30 7 0 0
1998  1 1  0 0 1 -1 -1 800  114 367 311 5 3 0 0
1999  1 1  0 0 1 -1 -1 800  67 222 456 53 2 0 0
2000  1 1  0 0 1 -1 -1 800  102 198 355 138 7 0 0
2001  1 1  0 0 1 -1 -1 800  156 271 252 99 18 4 0
2002  1 1  0 0 1 -1 -1 800  65 368 309 52 4 2 0
2003  1 1  0 0 1 -1 -1 800  191 107 445 48 8 0 1
2004  1 1  0 0 1 -1 -1 800  417 273 68 37 5 0 0
2005  1 1  0 0 1 -1 -1 800  144 513 136 7 0 0 0
2006  1 1  0 0 1 -1 -1 800  125 266 391 18 0 0 0
2007  1 1  0 0 1 -1 -1 800  162 310 279 46 3 0 0
2008  1 1  0 0 1 -1 -1 800  50 378 298 63 11 0 0
2009  1 1  0 0 1 -1 -1 800  215 151 373 53 8 0 0
2010  1 1  0 0 1 -1 -1 800  249 364 143 38 6 0 0
2011  1 1  0 0 1 -1 -1 800  139 368 281 10 2 0 0
2012  1 1  0 0 1 -1 -1 800  114 292 365 26 3 0 0
1990  10 2  0 0 1 -1 -1 800  713 77 3 2 5 0 0
1991  10 2  0 0 1 -1 -1 800  495 275 30 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  394 266 134 6 0 0 0
1993  10 2  0 0 1 -1 -1 800  614 92 49 42 3 0 0
1994  10 2  0 0 1 -1 -1 800  622 123 29 15 11 0 0
1995  10 2  0 0 1 -1 -1 800  461 237 75 12 10 5 0
1996  10 2  0 0 1 -1 -1 800  722 45 25 8 0 0 0
1997  10 2  0 0 1 -1 -1 800  668 119 6 5 2 0 0
1998  10 2  0 0 1 -1 -1 800  523 222 47 1 6 1 0
1999  10 2  0 0 1 -1 -1 800  478 177 114 24 3 4 0
2000  10 2  0 0 1 -1 -1 800  573 128 57 29 11 2 0
2001  10 2  0 0 1 -1 -1 800  616 120 31 19 12 2 0
2002  10 2  0 0 1 -1 -1 800  376 326 58 21 13 4 2
2003  10 2  0 0 1 -1 -1 800  697 46 57 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  749 51 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  565 221 14 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  586 152 54 8 0 0 0
2007  10 2  0 0 1 -1 -1 800  630 133 29 6 2 0 0
2008  10 2  0 0 1 -1 -1 800  454 281 47 13 4 1 0
2009  10 2  0 0 1 -1 -1 800  713 55 23 5 3 1 0
2010  10 2  0 0 1 -1 -1 800  668 112 15 5 0 0 0
2011  10 2  0 0 1 -1 -1 800  608 165 21 6 0 0 0
2012  10 2  0 0 1 -1 -1 800  567 170 52 9 1 0 1
1985  4 3  0 0 1 -1 -1 800  606 127 47 12 8 0 0
1986  4 3  0 0 1 -1 -1 800  345 325 90 31 7 1 1
1987  4 3  0 0 1 -1 -1 800  545 98 111 29 9 4 4
1988  4 3  0 0 1 -1 -1 800  544 156 37 40 13 5 5
1989  4 3  0 0 1 -1 -1 800  699 63 21 10 5 0 2
1990  4 3  0 0 1 -1 -1 800  731 54 8 7 0 0 0
1991  4 3  0 0 1 -1 -1 800  559 212 23 6 0 0 0
1992  4 3  0 0 1 -1 -1 800  440 219 127 14 0 0 0
1993  4 3  0 0 1 -1 -1 800  666 59 47 24 4 0 0
1994  4 3  0 0 1 -1 -1 800  611 137 23 17 12 0 0
1995  4 3  0 0 1 -1 -1 800  543 195 46 7 4 5 0
1996  4 3  0 0 1 -1 -1 800  751 30 14 5 0 0 0
1997  4 3  0 0 1 -1 -1 800  694 95 7 4 0 0 0
1998  4 3  0 0 1 -1 -1 800  559 194 39 8 0 0 0
1999  4 3  0 0 1 -1 -1 800  517 181 82 20 0 0 0
2000  4 3  0 0 1 -1 -1 800  578 120 49 45 8 0 0
2001  4 3  0 0 1 -1 -1 800  645 108 31 9 7 0 0
2002  4 3  0 0 1 -1 -1 800  400 290 67 23 13 7 0
2003  4 3  0 0 1 -1 -1 800  714 40 39 3 4 0 0
2004  4 3  0 0 1 -1 -1 800  740 56 1 2 0 0 1
2005  4 3  0 0 1 -1 -1 800  574 206 18 1 1 0 0
2006  4 3  0 0 1 -1 -1 800  623 131 43 3 0 0 0
2007  4 3  0 0 1 -1 -1 800  643 119 26 12 0 0 0
2008  4 3  0 0 1 -1 -1 800  496 247 44 10 3 0 0
2009  4 3  0 0 1 -1 -1 800  709 47 34 6 2 2 0
2010  4 3  0 0 1 -1 -1 800  685 100 6 6 3 0 0
2011  4 3  0 0 1 -1 -1 800  618 150 30 1 1 0 0
2012  4 3  0 0 1 -1 -1 800  592 165 34 9 0 0 0
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

