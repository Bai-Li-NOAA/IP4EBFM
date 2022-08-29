#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 23 11:16:40 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661267800 first rand#: 1.81814
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
-999 1 1 123994 0.05
1985 1 1 196033 0.05
1986 1 1 174238 0.05
1987 1 1 85323.9 0.05
1988 1 1 26337 0.05
1989 1 1 50260.4 0.05
1990 1 1 63191.5 0.05
1991 1 1 77572.7 0.05
1992 1 1 139647 0.05
1993 1 1 188118 0.05
1994 1 1 100729 0.05
1995 1 1 49084.4 0.05
1996 1 1 122411 0.05
1997 1 1 113169 0.05
1998 1 1 194175 0.05
1999 1 1 157926 0.05
2000 1 1 237439 0.05
2001 1 1 213533 0.05
2002 1 1 213238 0.05
2003 1 1 337970 0.05
2004 1 1 600671 0.05
2005 1 1 793616 0.05
2006 1 1 1.53383e+06 0.05
2007 1 1 899009 0.05
2008 1 1 442396 0.05
2009 1 1 508323 0.05
2010 1 1 478575 0.05
2011 1 1 464713 0.05
2012 1 1 737362 0.05
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
1990 10 2 3.7333e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.4658e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.24795e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.59094e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.52249e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.06151e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.47044e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.81666e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.6683e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.08587e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.10683e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.69256e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.49835e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.18157e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 6.09247e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.18662e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.32912e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.82933e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.85614e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 4.20126e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.40637e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.54974e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.04038e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.18442e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 462550 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 304898 0.1 #_orig_obs: 954308 survey2
1988 4 3 233556 0.1 #_orig_obs: 245537 survey2
1989 4 3 408406 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.21328e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 817009 0.1 #_orig_obs: 527308 survey2
1992 4 3 414322 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 602220 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 580063 0.1 #_orig_obs: 375877 survey2
1995 4 3 390487 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.37034e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.74046e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.28008e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 916612 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 811883 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 951906 0.1 #_orig_obs: 689461 survey2
2002 4 3 342209 0.1 #_orig_obs: 525909 survey2
2003 4 3 824146 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.64036e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.54919e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.45035e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.16018e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 757507 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.12629e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 2.00238e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.93535e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.71062e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  126 280 323 55 11 5 0
1986  1 1  0 0 1 -1 -1 800  38 305 384 61 10 1 1
1987  1 1  0 0 1 -1 -1 800  62 115 512 97 12 2 0
1988  1 1  0 0 1 -1 -1 800  117 222 231 194 32 4 0
1989  1 1  0 0 1 -1 -1 800  206 179 317 64 30 4 0
1990  1 1  0 0 1 -1 -1 800  371 236 154 31 8 0 0
1991  1 1  0 0 1 -1 -1 800  141 446 191 19 3 0 0
1992  1 1  0 0 1 -1 -1 800  43 224 486 42 5 0 0
1993  1 1  0 0 1 -1 -1 800  122 124 383 158 13 0 0
1994  1 1  0 0 1 -1 -1 800  162 326 200 91 20 1 0
1995  1 1  0 0 1 -1 -1 800  82 303 365 33 11 6 0
1996  1 1  0 0 1 -1 -1 800  306 143 290 53 6 1 1
1997  1 1  0 0 1 -1 -1 800  274 399 94 31 2 0 0
1998  1 1  0 0 1 -1 -1 800  113 367 310 8 2 0 0
1999  1 1  0 0 1 -1 -1 800  83 227 429 60 1 0 0
2000  1 1  0 0 1 -1 -1 800  105 192 372 118 13 0 0
2001  1 1  0 0 1 -1 -1 800  142 264 286 84 21 2 1
2002  1 1  0 0 1 -1 -1 800  51 364 318 52 11 4 0
2003  1 1  0 0 1 -1 -1 800  219 108 405 56 7 4 1
2004  1 1  0 0 1 -1 -1 800  408 272 79 37 4 0 0
2005  1 1  0 0 1 -1 -1 800  135 513 147 5 0 0 0
2006  1 1  0 0 1 -1 -1 800  107 283 393 17 0 0 0
2007  1 1  0 0 1 -1 -1 800  163 285 311 38 3 0 0
2008  1 1  0 0 1 -1 -1 800  82 368 309 37 4 0 0
2009  1 1  0 0 1 -1 -1 800  209 167 372 45 5 2 0
2010  1 1  0 0 1 -1 -1 800  240 392 124 35 9 0 0
2011  1 1  0 0 1 -1 -1 800  171 339 276 13 1 0 0
2012  1 1  0 0 1 -1 -1 800  121 294 339 39 7 0 0
1990  10 2  0 0 1 -1 -1 800  715 67 9 4 5 0 0
1991  10 2  0 0 1 -1 -1 800  537 238 25 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  400 236 139 25 0 0 0
1993  10 2  0 0 1 -1 -1 800  635 85 47 29 4 0 0
1994  10 2  0 0 1 -1 -1 800  606 150 15 16 13 0 0
1995  10 2  0 0 1 -1 -1 800  461 259 65 3 8 4 0
1996  10 2  0 0 1 -1 -1 800  745 23 22 10 0 0 0
1997  10 2  0 0 1 -1 -1 800  648 134 10 6 2 0 0
1998  10 2  0 0 1 -1 -1 800  505 241 46 4 2 1 1
1999  10 2  0 0 1 -1 -1 800  480 205 95 17 1 2 0
2000  10 2  0 0 1 -1 -1 800  551 150 49 45 5 0 0
2001  10 2  0 0 1 -1 -1 800  624 126 30 8 9 3 0
2002  10 2  0 0 1 -1 -1 800  386 323 63 13 10 3 2
2003  10 2  0 0 1 -1 -1 800  694 49 57 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  736 64 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  564 217 19 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  577 165 53 5 0 0 0
2007  10 2  0 0 1 -1 -1 800  631 138 25 5 1 0 0
2008  10 2  0 0 1 -1 -1 800  456 293 39 10 2 0 0
2009  10 2  0 0 1 -1 -1 800  696 67 29 6 1 1 0
2010  10 2  0 0 1 -1 -1 800  693 96 5 6 0 0 0
2011  10 2  0 0 1 -1 -1 800  604 165 24 7 0 0 0
2012  10 2  0 0 1 -1 -1 800  561 165 61 11 1 1 0
1985  4 3  0 0 1 -1 -1 800  628 114 41 14 3 0 0
1986  4 3  0 0 1 -1 -1 800  351 321 88 26 8 5 1
1987  4 3  0 0 1 -1 -1 800  533 103 119 31 9 2 3
1988  4 3  0 0 1 -1 -1 800  553 155 39 41 8 1 3
1989  4 3  0 0 1 -1 -1 800  666 79 27 10 11 5 2
1990  4 3  0 0 1 -1 -1 800  730 58 7 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  555 219 19 7 0 0 0
1992  4 3  0 0 1 -1 -1 800  408 246 130 16 0 0 0
1993  4 3  0 0 1 -1 -1 800  659 61 48 26 6 0 0
1994  4 3  0 0 1 -1 -1 800  611 138 32 8 11 0 0
1995  4 3  0 0 1 -1 -1 800  490 245 43 10 8 4 0
1996  4 3  0 0 1 -1 -1 800  746 31 15 5 1 1 1
1997  4 3  0 0 1 -1 -1 800  681 111 4 4 0 0 0
1998  4 3  0 0 1 -1 -1 800  566 194 39 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  522 174 77 26 1 0 0
2000  4 3  0 0 1 -1 -1 800  581 134 58 19 8 0 0
2001  4 3  0 0 1 -1 -1 800  648 107 28 12 3 1 1
2002  4 3  0 0 1 -1 -1 800  444 269 60 17 5 5 0
2003  4 3  0 0 1 -1 -1 800  703 45 40 5 4 2 1
2004  4 3  0 0 1 -1 -1 800  741 50 3 4 1 0 1
2005  4 3  0 0 1 -1 -1 800  591 192 15 1 1 0 0
2006  4 3  0 0 1 -1 -1 800  597 140 55 8 0 0 0
2007  4 3  0 0 1 -1 -1 800  629 127 32 12 0 0 0
2008  4 3  0 0 1 -1 -1 800  470 263 45 14 8 0 0
2009  4 3  0 0 1 -1 -1 800  703 58 30 8 1 0 0
2010  4 3  0 0 1 -1 -1 800  687 100 12 1 0 0 0
2011  4 3  0 0 1 -1 -1 800  609 150 37 1 3 0 0
2012  4 3  0 0 1 -1 -1 800  603 145 41 11 0 0 0
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

