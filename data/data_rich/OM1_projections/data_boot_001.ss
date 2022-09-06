#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Sep 05 12:52:02 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662396722 first rand#: 0.511157
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
-999 1 1 122781 0.05
1985 1 1 614070 0.05
1986 1 1 305238 0.05
1987 1 1 420972 0.05
1988 1 1 434959 0.05
1989 1 1 491434 0.05
1990 1 1 497151 0.05
1991 1 1 406270 0.05
1992 1 1 319921 0.05
1993 1 1 272313 0.05
1994 1 1 222713 0.05
1995 1 1 332529 0.05
1996 1 1 249332 0.05
1997 1 1 386879 0.05
1998 1 1 410567 0.05
1999 1 1 290236 0.05
2000 1 1 182298 0.05
2001 1 1 273437 0.05
2002 1 1 245187 0.05
2003 1 1 250295 0.05
2004 1 1 213007 0.05
2005 1 1 224655 0.05
2006 1 1 261935 0.05
2007 1 1 214108 0.05
2008 1 1 165861 0.05
2009 1 1 181338 0.05
2010 1 1 266048 0.05
2011 1 1 216384 0.05
2012 1 1 172791 0.05
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
1990 10 2 1.67682e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 707924 0.75 #_orig_obs: 457211 survey1
1992 10 2 899372 0.76 #_orig_obs: 654267 survey1
1993 10 2 1.01999e+06 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 4.20043e+06 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 1.20917e+06 0.74 #_orig_obs: 765889 survey1
1996 10 2 1.92967e+06 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 855697 0.59 #_orig_obs: 798920 survey1
1998 10 2 913696 0.88 #_orig_obs: 467336 survey1
1999 10 2 810337 0.61 #_orig_obs: 762429 survey1
2000 10 2 619095 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 2.60394e+06 0.83 #_orig_obs: 181093 survey1
2002 10 2 786495 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 556899 0.68 #_orig_obs: 433759 survey1
2004 10 2 1.00975e+06 0.73 #_orig_obs: 655693 survey1
2005 10 2 765128 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 793639 0.67 #_orig_obs: 848202 survey1
2007 10 2 369858 0.59 #_orig_obs: 853227 survey1
2008 10 2 850466 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 1.55174e+06 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 556132 0.8 #_orig_obs: 704446 survey1
2011 10 2 304242 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 374581 0.59 #_orig_obs: 472946 survey1
1985 4 3 6.01687e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 8.18738e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 1.29272e+06 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 1.32892e+06 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 3.92743e+06 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 1.47451e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 943797 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 995973 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 623681 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 681785 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 1.24407e+06 1.13 #_orig_obs: 489338 survey2
1996 4 3 1.35481e+07 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 295588 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 786854 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 1.5668e+06 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 2.22003e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 4.48688e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 1.72423e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.22297e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 1.90033e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 4.07433e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 1.85215e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 2.77934e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 1.79126e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 1.66109e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 3.04558e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 1.32734e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 1.13843e+06 0.44 #_orig_obs: 2.47554e+06 survey2
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
50 # maximum size in the population (lower edge of last bin) 
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
1985  1 1  0 0 1 -1 -1 800  58 252 355 112 17 3 3
1986  1 1  0 0 1 -1 -1 800  41 237 430 68 19 5 0
1987  1 1  0 0 1 -1 -1 800  57 202 420 96 16 2 7
1988  1 1  0 0 1 -1 -1 800  106 258 323 86 24 0 3
1989  1 1  0 0 1 -1 -1 800  58 352 328 47 13 2 0
1990  1 1  0 0 1 -1 -1 800  48 242 454 45 10 1 0
1991  1 1  0 0 1 -1 -1 800  39 229 429 89 11 3 0
1992  1 1  0 0 1 -1 -1 800  54 161 440 121 19 2 3
1993  1 1  0 0 1 -1 -1 800  62 263 336 118 17 4 0
1994  1 1  0 0 1 -1 -1 800  68 228 406 67 26 5 0
1995  1 1  0 0 1 -1 -1 800  76 251 374 83 10 6 0
1996  1 1  0 0 1 -1 -1 800  52 265 380 73 19 11 0
1997  1 1  0 0 1 -1 -1 800  54 242 406 79 17 2 0
1998  1 1  0 0 1 -1 -1 800  38 241 413 88 17 3 0
1999  1 1  0 0 1 -1 -1 800  54 187 436 96 21 6 0
2000  1 1  0 0 1 -1 -1 800  61 239 362 114 17 7 0
2001  1 1  0 0 1 -1 -1 800  61 274 345 90 23 3 4
2002  1 1  0 0 1 -1 -1 800  70 238 405 67 14 4 2
2003  1 1  0 0 1 -1 -1 800  46 219 429 89 17 0 0
2004  1 1  0 0 1 -1 -1 800  62 224 390 101 16 7 0
2005  1 1  0 0 1 -1 -1 800  43 283 364 94 12 4 0
2006  1 1  0 0 1 -1 -1 800  57 194 438 91 16 4 0
2007  1 1  0 0 1 -1 -1 800  67 214 372 124 15 8 0
2008  1 1  0 0 1 -1 -1 800  69 214 424 71 19 3 0
2009  1 1  0 0 1 -1 -1 800  64 214 396 100 25 1 0
2010  1 1  0 0 1 -1 -1 800  53 225 399 102 18 3 0
2011  1 1  0 0 1 -1 -1 800  33 197 436 102 26 6 0
2012  1 1  0 0 1 -1 -1 800  40 181 420 124 26 6 3
1990  10 2  0 0 1 -1 -1 800  614 151 32 2 1 0 0
1991  10 2  0 0 1 -1 -1 800  536 193 56 12 3 0 0
1992  10 2  0 0 1 -1 -1 800  619 134 33 11 3 0 0
1993  10 2  0 0 1 -1 -1 800  598 150 35 13 4 0 0
1994  10 2  0 0 1 -1 -1 800  641 131 24 4 0 0 0
1995  10 2  0 0 1 -1 -1 800  634 137 21 3 3 1 1
1996  10 2  0 0 1 -1 -1 800  623 149 21 2 4 1 0
1997  10 2  0 0 1 -1 -1 800  623 130 36 11 0 0 0
1998  10 2  0 0 1 -1 -1 800  584 180 25 10 0 1 0
1999  10 2  0 0 1 -1 -1 800  640 117 32 10 0 1 0
2000  10 2  0 0 1 -1 -1 800  667 105 24 3 1 0 0
2001  10 2  0 0 1 -1 -1 800  647 119 24 9 1 0 0
2002  10 2  0 0 1 -1 -1 800  621 138 34 5 2 0 0
2003  10 2  0 0 1 -1 -1 800  614 146 32 5 1 2 0
2004  10 2  0 0 1 -1 -1 800  645 114 31 6 4 0 0
2005  10 2  0 0 1 -1 -1 800  552 192 45 9 2 0 0
2006  10 2  0 0 1 -1 -1 800  628 122 37 10 3 0 0
2007  10 2  0 0 1 -1 -1 800  596 150 39 13 2 0 0
2008  10 2  0 0 1 -1 -1 800  619 136 28 11 6 0 0
2009  10 2  0 0 1 -1 -1 800  591 168 29 8 1 3 0
2010  10 2  0 0 1 -1 -1 800  596 151 40 7 3 3 0
2011  10 2  0 0 1 -1 -1 800  579 165 38 15 1 2 0
2012  10 2  0 0 1 -1 -1 800  581 144 50 19 4 2 0
1985  4 3  0 0 1 -1 -1 800  642 119 25 14 0 0 0
1986  4 3  0 0 1 -1 -1 800  612 150 34 4 0 0 0
1987  4 3  0 0 1 -1 -1 800  638 119 33 7 1 2 0
1988  4 3  0 0 1 -1 -1 800  697 83 17 2 1 0 0
1989  4 3  0 0 1 -1 -1 800  627 155 15 2 1 0 0
1990  4 3  0 0 1 -1 -1 800  607 161 27 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  568 169 47 16 0 0 0
1992  4 3  0 0 1 -1 -1 800  628 115 42 9 6 0 0
1993  4 3  0 0 1 -1 -1 800  620 135 37 5 3 0 0
1994  4 3  0 0 1 -1 -1 800  657 103 31 9 0 0 0
1995  4 3  0 0 1 -1 -1 800  658 113 26 2 0 1 0
1996  4 3  0 0 1 -1 -1 800  625 140 30 2 3 0 0
1997  4 3  0 0 1 -1 -1 800  621 140 34 1 4 0 0
1998  4 3  0 0 1 -1 -1 800  592 159 36 10 3 0 0
1999  4 3  0 0 1 -1 -1 800  631 122 38 6 3 0 0
2000  4 3  0 0 1 -1 -1 800  645 123 21 9 1 1 0
2001  4 3  0 0 1 -1 -1 800  643 123 29 5 0 0 0
2002  4 3  0 0 1 -1 -1 800  646 126 19 9 0 0 0
2003  4 3  0 0 1 -1 -1 800  627 133 25 15 0 0 0
2004  4 3  0 0 1 -1 -1 800  646 117 29 7 1 0 0
2005  4 3  0 0 1 -1 -1 800  601 160 29 8 2 0 0
2006  4 3  0 0 1 -1 -1 800  632 119 38 9 1 1 0
2007  4 3  0 0 1 -1 -1 800  631 129 30 9 0 1 0
2008  4 3  0 0 1 -1 -1 800  647 111 34 7 0 1 0
2009  4 3  0 0 1 -1 -1 800  608 157 27 4 4 0 0
2010  4 3  0 0 1 -1 -1 800  622 137 34 2 5 0 0
2011  4 3  0 0 1 -1 -1 800  612 135 35 13 5 0 0
2012  4 3  0 0 1 -1 -1 800  612 132 42 12 1 1 0
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

