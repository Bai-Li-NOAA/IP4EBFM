#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:46:29 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661867189 first rand#: -0.0974786
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
-999 1 1 11053.1 0.05
1985 1 1 201481 0.05
1986 1 1 164508 0.05
1987 1 1 90794.5 0.05
1988 1 1 26215.6 0.05
1989 1 1 54041.7 0.05
1990 1 1 66425.9 0.05
1991 1 1 74383.5 0.05
1992 1 1 146874 0.05
1993 1 1 188330 0.05
1994 1 1 93659.1 0.05
1995 1 1 51761.1 0.05
1996 1 1 112989 0.05
1997 1 1 94592.4 0.05
1998 1 1 201678 0.05
1999 1 1 145926 0.05
2000 1 1 225058 0.05
2001 1 1 223844 0.05
2002 1 1 221197 0.05
2003 1 1 178969 0.05
2004 1 1 213566 0.05
2005 1 1 424366 0.05
2006 1 1 451458 0.05
2007 1 1 326609 0.05
2008 1 1 252455 0.05
2009 1 1 201171 0.05
2010 1 1 188992 0.05
2011 1 1 236539 0.05
2012 1 1 165528 0.05
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
1990 10 2 5.03197e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 3.39555e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 2.16865e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.68915e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.91135e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 964700 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.29492e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 6.41593e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 5.01376e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 3.52027e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 3.28635e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 3.61622e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.42256e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.3886e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.96314e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.20871e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.55283e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.77976e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.29384e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.69721e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 2.62252e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 1.68591e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 976059 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.07038e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 393260 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 288854 0.1 #_orig_obs: 954308 survey2
1988 4 3 210686 0.1 #_orig_obs: 245537 survey2
1989 4 3 458177 0.1 #_orig_obs: 165382 survey2
1990 4 3 2.02547e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.51448e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 586566 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 634369 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 576168 0.1 #_orig_obs: 375877 survey2
1995 4 3 252408 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.2515e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 2.47786e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.82122e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.51379e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 1.43728e+06 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.37215e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 428780 0.1 #_orig_obs: 525909 survey2
2003 4 3 775339 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.39316e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.88637e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.58093e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.1747e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 553579 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.00307e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.29919e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 611693 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 367334 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  110 175 217 181 57 60 0
1986  1 1  0 0 1 -1 -1 800  35 288 341 113 16 4 3
1987  1 1  0 0 1 -1 -1 800  77 106 497 117 3 0 0
1988  1 1  0 0 1 -1 -1 800  96 184 233 280 7 0 0
1989  1 1  0 0 1 -1 -1 800  311 152 243 73 21 0 0
1990  1 1  0 0 1 -1 -1 800  534 185 64 16 1 0 0
1991  1 1  0 0 1 -1 -1 800  186 474 125 15 0 0 0
1992  1 1  0 0 1 -1 -1 800  31 191 525 49 4 0 0
1993  1 1  0 0 1 -1 -1 800  101 90 380 222 7 0 0
1994  1 1  0 0 1 -1 -1 800  204 294 157 134 10 1 0
1995  1 1  0 0 1 -1 -1 800  77 270 386 62 5 0 0
1996  1 1  0 0 1 -1 -1 800  412 78 234 76 0 0 0
1997  1 1  0 0 1 -1 -1 800  419 298 64 18 1 0 0
1998  1 1  0 0 1 -1 -1 800  166 364 261 8 1 0 0
1999  1 1  0 0 1 -1 -1 800  92 213 403 92 0 0 0
2000  1 1  0 0 1 -1 -1 800  110 172 288 220 10 0 0
2001  1 1  0 0 1 -1 -1 800  201 218 258 114 7 2 0
2002  1 1  0 0 1 -1 -1 800  59 390 296 51 4 0 0
2003  1 1  0 0 1 -1 -1 800  294 99 371 36 0 0 0
2004  1 1  0 0 1 -1 -1 800  566 191 35 8 0 0 0
2005  1 1  0 0 1 -1 -1 800  198 498 103 1 0 0 0
2006  1 1  0 0 1 -1 -1 800  162 269 359 10 0 0 0
2007  1 1  0 0 1 -1 -1 800  233 285 253 29 0 0 0
2008  1 1  0 0 1 -1 -1 800  81 423 281 15 0 0 0
2009  1 1  0 0 1 -1 -1 800  338 127 315 20 0 0 0
2010  1 1  0 0 1 -1 -1 800  326 385 79 10 0 0 0
2011  1 1  0 0 1 -1 -1 800  150 368 276 6 0 0 0
2012  1 1  0 0 1 -1 -1 800  103 283 387 27 0 0 0
1990  10 2  0 0 1 -1 -1 800  751 47 1 1 0 0 0
1991  10 2  0 0 1 -1 -1 800  506 273 21 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  319 316 161 4 0 0 0
1993  10 2  0 0 1 -1 -1 800  612 98 80 10 0 0 0
1994  10 2  0 0 1 -1 -1 800  590 189 18 3 0 0 0
1995  10 2  0 0 1 -1 -1 800  401 309 90 0 0 0 0
1996  10 2  0 0 1 -1 -1 800  758 29 13 0 0 0 0
1997  10 2  0 0 1 -1 -1 800  663 130 5 2 0 0 0
1998  10 2  0 0 1 -1 -1 800  520 233 47 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  481 218 94 7 0 0 0
2000  10 2  0 0 1 -1 -1 800  562 165 62 9 2 0 0
2001  10 2  0 0 1 -1 -1 800  607 166 25 2 0 0 0
2002  10 2  0 0 1 -1 -1 800  321 438 40 1 0 0 0
2003  10 2  0 0 1 -1 -1 800  722 54 24 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  747 53 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  543 249 8 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  568 211 21 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  652 136 12 0 0 0 0
2008  10 2  0 0 1 -1 -1 800  407 381 12 0 0 0 0
2009  10 2  0 0 1 -1 -1 800  722 65 13 0 0 0 0
2010  10 2  0 0 1 -1 -1 800  651 146 3 0 0 0 0
2011  10 2  0 0 1 -1 -1 800  533 243 24 0 0 0 0
2012  10 2  0 0 1 -1 -1 800  505 247 48 0 0 0 0
1985  4 3  0 0 1 -1 -1 800  608 134 36 15 7 0 0
1986  4 3  0 0 1 -1 -1 800  325 375 85 13 2 0 0
1987  4 3  0 0 1 -1 -1 800  589 82 121 8 0 0 0
1988  4 3  0 0 1 -1 -1 800  548 190 35 27 0 0 0
1989  4 3  0 0 1 -1 -1 800  709 68 19 3 1 0 0
1990  4 3  0 0 1 -1 -1 800  753 43 3 1 0 0 0
1991  4 3  0 0 1 -1 -1 800  545 238 17 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  359 286 148 7 0 0 0
1993  4 3  0 0 1 -1 -1 800  622 86 73 19 0 0 0
1994  4 3  0 0 1 -1 -1 800  589 184 17 10 0 0 0
1995  4 3  0 0 1 -1 -1 800  442 271 83 4 0 0 0
1996  4 3  0 0 1 -1 -1 800  763 16 19 2 0 0 0
1997  4 3  0 0 1 -1 -1 800  672 125 3 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  583 187 29 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  530 181 83 6 0 0 0
2000  4 3  0 0 1 -1 -1 800  613 129 48 10 0 0 0
2001  4 3  0 0 1 -1 -1 800  613 151 32 4 0 0 0
2002  4 3  0 0 1 -1 -1 800  334 392 70 4 0 0 0
2003  4 3  0 0 1 -1 -1 800  712 43 44 1 0 0 0
2004  4 3  0 0 1 -1 -1 800  753 46 1 0 0 0 0
2005  4 3  0 0 1 -1 -1 800  558 233 9 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  583 170 46 1 0 0 0
2007  4 3  0 0 1 -1 -1 800  625 149 25 1 0 0 0
2008  4 3  0 0 1 -1 -1 800  412 337 51 0 0 0 0
2009  4 3  0 0 1 -1 -1 800  726 52 21 1 0 0 0
2010  4 3  0 0 1 -1 -1 800  629 164 7 0 0 0 0
2011  4 3  0 0 1 -1 -1 800  531 233 36 0 0 0 0
2012  4 3  0 0 1 -1 -1 800  510 210 80 0 0 0 0
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

