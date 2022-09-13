#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 13 10:49:00 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1663080540 first rand#: -0.405473
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
-999 1 1 215420 0.05
1985 1 1 150452 0.05
1986 1 1 121563 0.05
1987 1 1 27030.4 0.05
1988 1 1 2026.7 0.05
1989 1 1 3150.17 0.05
1990 1 1 17734.4 0.05
1991 1 1 28670.2 0.05
1992 1 1 65726.6 0.05
1993 1 1 149679 0.05
1994 1 1 24263.5 0.05
1995 1 1 4963.13 0.05
1996 1 1 13514.9 0.05
1997 1 1 60615 0.05
1998 1 1 146496 0.05
1999 1 1 128870 0.05
2000 1 1 216991 0.05
2001 1 1 135043 0.05
2002 1 1 12792.2 0.05
2003 1 1 56509.8 0.05
2004 1 1 175172 0.05
2005 1 1 661038 0.05
2006 1 1 3.44544e+06 0.05
2007 1 1 2.18839e+06 0.05
2008 1 1 240788 0.05
2009 1 1 337494 0.05
2010 1 1 487119 0.05
2011 1 1 973775 0.05
2012 1 1 1.14355e+06 0.05
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
1990 10 2 4.00545e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.58312e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.93646e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.50964e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.1045e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.05582e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 2.09322e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 3.33282e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 5.54252e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.41677e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 3.00294e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.85007e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.72736e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.22168e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 8.07284e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 6.84069e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.50002e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 2.62436e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.43874e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.11776e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 5.70304e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 3.52109e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.13172e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 983942 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 421545 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 425398 0.1 #_orig_obs: 572537 survey2
1988 4 3 437083 0.1 #_orig_obs: 204010 survey2
1989 4 3 335087 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.4258e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.05682e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 515981 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 401077 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 397384 0.1 #_orig_obs: 418617 survey2
1995 4 3 403774 0.1 #_orig_obs: 310064 survey2
1996 4 3 750364 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.5416e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.82967e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.26546e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 954137 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 957753 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 525031 0.1 #_orig_obs: 577555 survey2
2003 4 3 796920 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.28933e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.49666e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.6245e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.06982e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 434685 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 862515 0.1 #_orig_obs: 624374 survey2
2010 4 3 2.36133e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.36349e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 984864 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  397 229 129 67 25 4 1
1986  1 1  0 0 1 -1 -1 583  121 246 137 52 20 4 3
1987  1 1  0 0 1 -1 -1 762  296 109 227 93 24 12 1
1988  1 1  0 0 1 -1 -1 737  318 175 78 119 34 10 3
1989  1 1  0 0 1 -1 -1 692  239 212 127 52 42 15 5
1990  1 1  0 0 1 -1 -1 684  554 48 60 16 0 5 1
1991  1 1  0 0 1 -1 -1 777  430 283 33 16 9 2 4
1992  1 1  0 0 1 -1 -1 568  87 250 198 18 11 4 0
1993  1 1  0 0 1 -1 -1 548  148 80 206 102 7 4 1
1994  1 1  0 0 1 -1 -1 526  169 115 60 121 56 5 0
1995  1 1  0 0 1 -1 -1 500  244 114 65 31 31 15 0
1996  1 1  0 0 1 -1 -1 463  286 91 51 24 7 4 0
1997  1 1  0 0 1 -1 -1 454  327 77 34 14 1 0 1
1998  1 1  0 0 1 -1 -1 459  267 142 38 7 5 0 0
1999  1 1  0 0 1 -1 -1 428  172 147 85 18 5 1 0
2000  1 1  0 0 1 -1 -1 366  110 101 115 35 4 1 0
2001  1 1  0 0 1 -1 -1 501  214 106 75 78 27 1 0
2002  1 1  0 0 1 -1 -1 439  116 176 81 35 20 8 3
2003  1 1  0 0 1 -1 -1 402  204 76 78 22 12 8 2
2004  1 1  0 0 1 -1 -1 459  354 69 15 13 6 1 1
2005  1 1  0 0 1 -1 -1 394  218 141 24 3 8 0 0
2006  1 1  0 0 1 -1 -1 421  171 152 82 16 0 0 0
2007  1 1  0 0 1 -1 -1 532  212 164 107 44 5 0 0
2008  1 1  0 0 1 -1 -1 445  106 152 125 47 15 0 0
2009  1 1  0 0 1 -1 -1 402  243 50 55 38 16 0 0
2010  1 1  0 0 1 -1 -1 442  328 81 15 11 7 0 0
2011  1 1  0 0 1 -1 -1 434  158 209 51 9 7 0 0
2012  1 1  0 0 1 -1 -1 370  123 95 128 19 5 0 0
1990  10 2  0 0 1 -1 -1 118  110 8 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  27 13 0 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  24 62 32 3 1 0 0
1993  10 2  0 0 1 -1 -1 119  61 21 29 8 0 0 0
1994  10 2  0 0 1 -1 -1 53  32 21 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  171 56 19 11 4 0 0
1996  10 2  0 0 1 -1 -1 192  141 39 10 2 0 0 0
1997  10 2  0 0 1 -1 -1 110  94 16 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  128 41 7 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  243 188 52 12 0 0 0
2000  10 2  0 0 1 -1 -1 464  245 105 82 32 0 0 0
2001  10 2  0 0 1 -1 -1 268  170 53 30 12 3 0 0
2002  10 2  0 0 1 -1 -1 602  281 228 62 21 9 1 0
2003  10 2  0 0 1 -1 -1 56  46 6 4 0 0 0 0
2004  10 2  0 0 1 -1 -1 294  259 35 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  478 229 27 4 2 0 0
2006  10 2  0 0 1 -1 -1 335  196 106 24 9 0 0 0
2007  10 2  0 0 1 -1 -1 553  325 171 50 7 0 0 0
2008  10 2  0 0 1 -1 -1 344  108 143 69 24 0 0 0
2009  10 2  0 0 1 -1 -1 149  113 17 19 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  156 16 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  436 392 55 4 2 0 0
2012  10 2  0 0 1 -1 -1 464  255 118 83 8 0 0 0
1985  4 3  0 0 1 -1 -1 1000  731 196 58 11 2 2 0
1986  4 3  0 0 1 -1 -1 1000  462 376 110 39 8 5 0
1987  4 3  0 0 1 -1 -1 1000  739 115 107 25 11 2 1
1988  4 3  0 0 1 -1 -1 1000  743 187 22 36 10 2 0
1989  4 3  0 0 1 -1 -1 1000  632 252 75 21 15 3 2
1990  4 3  0 0 1 -1 -1 1000  936 42 16 6 0 0 0
1991  4 3  0 0 1 -1 -1 1000  763 222 10 2 1 1 1
1992  4 3  0 0 1 -1 -1 1000  405 421 158 8 5 3 0
1993  4 3  0 0 1 -1 -1 1000  641 115 162 82 0 0 0
1994  4 3  0 0 1 -1 -1 1000  694 183 40 55 28 0 0
1995  4 3  0 0 1 -1 -1 1000  757 165 47 10 15 6 0
1996  4 3  0 0 1 -1 -1 1000  840 115 28 13 1 2 1
1997  4 3  0 0 1 -1 -1 1000  873 105 17 5 0 0 0
1998  4 3  0 0 1 -1 -1 1000  795 169 28 8 0 0 0
1999  4 3  0 0 1 -1 -1 1000  610 309 65 14 2 0 0
2000  4 3  0 0 1 -1 -1 1000  622 210 121 37 6 1 3
2001  4 3  0 0 1 -1 -1 1000  776 136 50 28 8 2 0
2002  4 3  0 0 1 -1 -1 1000  589 296 68 28 12 7 0
2003  4 3  0 0 1 -1 -1 1000  815 91 70 14 6 4 0
2004  4 3  0 0 1 -1 -1 1000  917 62 9 8 2 0 2
2005  4 3  0 0 1 -1 -1 1000  783 197 16 1 2 1 0
2006  4 3  0 0 1 -1 -1 1000  676 235 76 11 0 2 0
2007  4 3  0 0 1 -1 -1 1000  642 241 87 30 0 0 0
2008  4 3  0 0 1 -1 -1 1000  503 327 121 41 8 0 0
2009  4 3  0 0 1 -1 -1 1000  855 71 42 25 5 2 0
2010  4 3  0 0 1 -1 -1 1000  898 102 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  620 341 34 1 4 0 0
2012  4 3  0 0 1 -1 -1 1000  652 217 112 19 0 0 0
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

