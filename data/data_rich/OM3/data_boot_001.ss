#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Sep 05 13:23:18 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662398598 first rand#: -0.0930053
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
-999 1 1 114883 0.05
1985 1 1 194426 0.05
1986 1 1 170430 0.05
1987 1 1 97450.3 0.05
1988 1 1 22747.8 0.05
1989 1 1 53094.8 0.05
1990 1 1 61901 0.05
1991 1 1 85673.6 0.05
1992 1 1 146423 0.05
1993 1 1 209025 0.05
1994 1 1 94304.9 0.05
1995 1 1 46697.1 0.05
1996 1 1 127788 0.05
1997 1 1 102422 0.05
1998 1 1 171447 0.05
1999 1 1 162533 0.05
2000 1 1 230941 0.05
2001 1 1 198041 0.05
2002 1 1 221120 0.05
2003 1 1 314281 0.05
2004 1 1 640426 0.05
2005 1 1 806078 0.05
2006 1 1 1.5831e+06 0.05
2007 1 1 821136 0.05
2008 1 1 427777 0.05
2009 1 1 503873 0.05
2010 1 1 450620 0.05
2011 1 1 450364 0.05
2012 1 1 649654 0.05
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
1990 10 2 3.21389e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.47279e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.13852e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.30195e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.68148e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 910328 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.08703e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.48472e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.55121e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.32304e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 1.90304e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.82047e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.20077e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.45025e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.40157e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.93626e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.73309e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.15313e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.88986e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.5634e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.98884e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.71007e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.35531e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.02376e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 455256 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 328143 0.1 #_orig_obs: 954308 survey2
1988 4 3 316927 0.1 #_orig_obs: 245537 survey2
1989 4 3 432572 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.25234e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 713421 0.1 #_orig_obs: 527308 survey2
1992 4 3 442477 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 583982 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 575428 0.1 #_orig_obs: 375877 survey2
1995 4 3 272890 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.07543e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.88061e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.08513e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 872348 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 702859 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 956001 0.1 #_orig_obs: 689461 survey2
2002 4 3 432914 0.1 #_orig_obs: 525909 survey2
2003 4 3 1.01131e+06 0.1 #_orig_obs: 634479 survey2
2004 4 3 1.99522e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.80648e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.34226e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.05798e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 642430 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.13333e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.95574e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.84046e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.60994e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  127 290 315 57 8 3 0
1986  1 1  0 0 1 -1 -1 800  39 317 366 63 13 2 0
1987  1 1  0 0 1 -1 -1 800  57 105 527 93 16 2 0
1988  1 1  0 0 1 -1 -1 800  81 223 278 187 25 6 0
1989  1 1  0 0 1 -1 -1 800  215 196 297 55 32 3 2
1990  1 1  0 0 1 -1 -1 800  370 247 149 30 4 0 0
1991  1 1  0 0 1 -1 -1 800  129 469 181 19 1 0 1
1992  1 1  0 0 1 -1 -1 800  43 255 480 18 4 0 0
1993  1 1  0 0 1 -1 -1 800  133 123 384 156 4 0 0
1994  1 1  0 0 1 -1 -1 800  166 353 192 71 18 0 0
1995  1 1  0 0 1 -1 -1 800  64 325 362 39 8 2 0
1996  1 1  0 0 1 -1 -1 800  290 139 310 56 4 1 0
1997  1 1  0 0 1 -1 -1 800  289 396 82 26 7 0 0
1998  1 1  0 0 1 -1 -1 800  92 363 334 7 4 0 0
1999  1 1  0 0 1 -1 -1 800  90 189 461 58 2 0 0
2000  1 1  0 0 1 -1 -1 800  94 202 377 117 10 0 0
2001  1 1  0 0 1 -1 -1 800  166 266 272 69 24 3 0
2002  1 1  0 0 1 -1 -1 800  71 364 299 53 10 3 0
2003  1 1  0 0 1 -1 -1 800  211 122 403 54 7 2 1
2004  1 1  0 0 1 -1 -1 800  429 247 79 42 3 0 0
2005  1 1  0 0 1 -1 -1 800  155 499 138 8 0 0 0
2006  1 1  0 0 1 -1 -1 800  125 275 375 25 0 0 0
2007  1 1  0 0 1 -1 -1 800  156 296 295 52 1 0 0
2008  1 1  0 0 1 -1 -1 800  81 346 333 35 5 0 0
2009  1 1  0 0 1 -1 -1 800  206 162 369 54 7 2 0
2010  1 1  0 0 1 -1 -1 800  257 379 112 50 2 0 0
2011  1 1  0 0 1 -1 -1 800  167 369 243 16 5 0 0
2012  1 1  0 0 1 -1 -1 800  114 295 348 40 3 0 0
1990  10 2  0 0 1 -1 -1 800  720 66 7 7 0 0 0
1991  10 2  0 0 1 -1 -1 800  513 254 33 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  405 258 117 20 0 0 0
1993  10 2  0 0 1 -1 -1 800  622 90 59 29 0 0 0
1994  10 2  0 0 1 -1 -1 800  597 159 16 15 13 0 0
1995  10 2  0 0 1 -1 -1 800  482 230 69 4 10 5 0
1996  10 2  0 0 1 -1 -1 800  733 49 15 3 0 0 0
1997  10 2  0 0 1 -1 -1 800  656 130 6 7 1 0 0
1998  10 2  0 0 1 -1 -1 800  516 226 53 4 1 0 0
1999  10 2  0 0 1 -1 -1 800  479 200 92 25 2 2 0
2000  10 2  0 0 1 -1 -1 800  534 153 67 39 6 1 0
2001  10 2  0 0 1 -1 -1 800  621 117 33 17 10 2 0
2002  10 2  0 0 1 -1 -1 800  390 318 64 17 7 4 0
2003  10 2  0 0 1 -1 -1 800  703 55 42 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  731 69 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  545 238 17 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  568 184 44 4 0 0 0
2007  10 2  0 0 1 -1 -1 800  639 130 24 6 1 0 0
2008  10 2  0 0 1 -1 -1 800  453 284 49 10 3 1 0
2009  10 2  0 0 1 -1 -1 800  698 52 40 7 2 1 0
2010  10 2  0 0 1 -1 -1 800  665 118 8 9 0 0 0
2011  10 2  0 0 1 -1 -1 800  595 163 36 6 0 0 0
2012  10 2  0 0 1 -1 -1 800  565 172 51 11 1 0 0
1985  4 3  0 0 1 -1 -1 800  621 134 31 8 6 0 0
1986  4 3  0 0 1 -1 -1 800  364 312 89 24 4 5 2
1987  4 3  0 0 1 -1 -1 800  532 102 112 33 15 4 2
1988  4 3  0 0 1 -1 -1 800  555 137 45 48 8 3 4
1989  4 3  0 0 1 -1 -1 800  695 55 30 9 8 1 2
1990  4 3  0 0 1 -1 -1 800  720 67 10 3 0 0 0
1991  4 3  0 0 1 -1 -1 800  534 243 20 3 0 0 0
1992  4 3  0 0 1 -1 -1 800  416 224 138 22 0 0 0
1993  4 3  0 0 1 -1 -1 800  672 61 38 25 4 0 0
1994  4 3  0 0 1 -1 -1 800  620 131 19 17 13 0 0
1995  4 3  0 0 1 -1 -1 800  544 187 54 7 7 1 0
1996  4 3  0 0 1 -1 -1 800  739 33 21 6 0 0 1
1997  4 3  0 0 1 -1 -1 800  668 117 8 7 0 0 0
1998  4 3  0 0 1 -1 -1 800  558 198 38 6 0 0 0
1999  4 3  0 0 1 -1 -1 800  534 164 79 21 2 0 0
2000  4 3  0 0 1 -1 -1 800  592 123 51 27 7 0 0
2001  4 3  0 0 1 -1 -1 800  657 107 26 4 4 1 1
2002  4 3  0 0 1 -1 -1 800  446 282 42 17 6 7 0
2003  4 3  0 0 1 -1 -1 800  725 38 25 6 3 1 2
2004  4 3  0 0 1 -1 -1 800  734 55 4 5 2 0 0
2005  4 3  0 0 1 -1 -1 800  572 205 22 0 1 0 0
2006  4 3  0 0 1 -1 -1 800  606 144 47 3 0 0 0
2007  4 3  0 0 1 -1 -1 800  622 133 33 12 0 0 0
2008  4 3  0 0 1 -1 -1 800  485 247 51 12 5 0 0
2009  4 3  0 0 1 -1 -1 800  716 33 45 3 3 0 0
2010  4 3  0 0 1 -1 -1 800  689 96 11 2 2 0 0
2011  4 3  0 0 1 -1 -1 800  620 154 25 1 0 0 0
2012  4 3  0 0 1 -1 -1 800  577 168 47 8 0 0 0
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

