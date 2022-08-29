#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 29 11:09:53 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661785793 first rand#: 0.948985
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
-999 1 1 225953 0.05
1985 1 1 140616 0.05
1986 1 1 148651 0.05
1987 1 1 29581.8 0.05
1988 1 1 2170.49 0.05
1989 1 1 3112.66 0.05
1990 1 1 17493 0.05
1991 1 1 28086.6 0.05
1992 1 1 63441.5 0.05
1993 1 1 140874 0.05
1994 1 1 23269.1 0.05
1995 1 1 4443.31 0.05
1996 1 1 14389.6 0.05
1997 1 1 52876.5 0.05
1998 1 1 158024 0.05
1999 1 1 135855 0.05
2000 1 1 198527 0.05
2001 1 1 146364 0.05
2002 1 1 13513 0.05
2003 1 1 61209.7 0.05
2004 1 1 160749 0.05
2005 1 1 654675 0.05
2006 1 1 2.91832e+06 0.05
2007 1 1 2.02906e+06 0.05
2008 1 1 254408 0.05
2009 1 1 309091 0.05
2010 1 1 526828 0.05
2011 1 1 936539 0.05
2012 1 1 943536 0.05
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
1990 10 2 3.53707e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.57828e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.63458e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.60861e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 975034 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.15787e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.61805e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 3.9874e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 5.35614e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.95882e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.67226e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.7321e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 2.02763e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.56457e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 5.7341e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 7.76879e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.42594e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 2.50496e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.54058e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.51303e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 6.29084e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 3.9358e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 3.09501e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 1.09139e+06 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 438027 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 451589 0.1 #_orig_obs: 572537 survey2
1988 4 3 365756 0.1 #_orig_obs: 204010 survey2
1989 4 3 359724 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.40521e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.53005e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 565687 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 434911 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 339604 0.1 #_orig_obs: 418617 survey2
1995 4 3 370711 0.1 #_orig_obs: 310064 survey2
1996 4 3 722147 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.18942e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.78544e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.14415e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 741891 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 854253 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 577468 0.1 #_orig_obs: 577555 survey2
2003 4 3 749877 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.72427e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.65983e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.46312e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.1567e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 460626 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 863624 0.1 #_orig_obs: 624374 survey2
2010 4 3 2.04226e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.35031e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 972597 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  381 225 159 60 20 4 3
1986  1 1  0 0 1 -1 -1 583  125 222 158 55 18 5 0
1987  1 1  0 0 1 -1 -1 762  283 111 238 91 27 9 3
1988  1 1  0 0 1 -1 -1 737  305 183 70 117 45 12 5
1989  1 1  0 0 1 -1 -1 692  245 213 129 47 39 8 11
1990  1 1  0 0 1 -1 -1 684  539 58 53 18 6 7 3
1991  1 1  0 0 1 -1 -1 777  404 308 37 21 3 1 3
1992  1 1  0 0 1 -1 -1 568  92 248 194 24 6 4 0
1993  1 1  0 0 1 -1 -1 548  165 71 197 102 4 6 3
1994  1 1  0 0 1 -1 -1 526  180 113 70 113 46 4 0
1995  1 1  0 0 1 -1 -1 500  229 92 86 35 31 26 1
1996  1 1  0 0 1 -1 -1 463  273 106 45 22 3 12 2
1997  1 1  0 0 1 -1 -1 454  330 85 29 5 4 1 0
1998  1 1  0 0 1 -1 -1 459  256 148 40 12 3 0 0
1999  1 1  0 0 1 -1 -1 428  144 173 88 17 5 1 0
2000  1 1  0 0 1 -1 -1 366  116 88 117 39 6 0 0
2001  1 1  0 0 1 -1 -1 501  207 98 88 79 24 4 1
2002  1 1  0 0 1 -1 -1 439  140 155 73 41 19 9 2
2003  1 1  0 0 1 -1 -1 402  214 50 91 26 11 7 3
2004  1 1  0 0 1 -1 -1 459  353 64 15 18 6 3 0
2005  1 1  0 0 1 -1 -1 394  178 183 23 4 6 0 0
2006  1 1  0 0 1 -1 -1 421  166 132 109 14 0 0 0
2007  1 1  0 0 1 -1 -1 532  192 170 115 48 7 0 0
2008  1 1  0 0 1 -1 -1 445  80 157 141 52 15 0 0
2009  1 1  0 0 1 -1 -1 402  238 39 72 39 14 0 0
2010  1 1  0 0 1 -1 -1 442  321 74 18 18 11 0 0
2011  1 1  0 0 1 -1 -1 434  164 222 39 6 3 0 0
2012  1 1  0 0 1 -1 -1 370  112 112 124 21 1 0 0
1990  10 2  0 0 1 -1 -1 118  108 10 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  27 12 1 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  33 59 28 2 0 0 0
1993  10 2  0 0 1 -1 -1 119  58 18 32 10 1 0 0
1994  10 2  0 0 1 -1 -1 53  36 17 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  174 53 25 5 4 0 0
1996  10 2  0 0 1 -1 -1 192  158 22 11 1 0 0 0
1997  10 2  0 0 1 -1 -1 110  87 23 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  127 44 5 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  241 187 56 11 0 0 0
2000  10 2  0 0 1 -1 -1 464  255 114 76 17 2 0 0
2001  10 2  0 0 1 -1 -1 268  176 48 24 17 3 0 0
2002  10 2  0 0 1 -1 -1 602  274 232 63 25 6 2 0
2003  10 2  0 0 1 -1 -1 56  48 5 3 0 0 0 0
2004  10 2  0 0 1 -1 -1 294  253 41 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  463 244 29 2 2 0 0
2006  10 2  0 0 1 -1 -1 335  193 103 33 6 0 0 0
2007  10 2  0 0 1 -1 -1 553  315 159 66 10 3 0 0
2008  10 2  0 0 1 -1 -1 344  136 125 64 19 0 0 0
2009  10 2  0 0 1 -1 -1 149  123 11 15 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  145 27 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  427 406 54 1 1 0 0
2012  10 2  0 0 1 -1 -1 464  259 112 89 4 0 0 0
1985  4 3  0 0 1 -1 -1 1000  755 169 59 11 3 3 0
1986  4 3  0 0 1 -1 -1 1000  446 369 127 40 12 6 0
1987  4 3  0 0 1 -1 -1 1000  731 116 108 28 13 1 3
1988  4 3  0 0 1 -1 -1 1000  739 170 36 36 11 6 2
1989  4 3  0 0 1 -1 -1 1000  657 241 60 14 21 6 1
1990  4 3  0 0 1 -1 -1 1000  935 42 14 9 0 0 0
1991  4 3  0 0 1 -1 -1 1000  757 228 5 4 5 1 0
1992  4 3  0 0 1 -1 -1 1000  377 423 184 8 2 6 0
1993  4 3  0 0 1 -1 -1 1000  660 113 163 64 0 0 0
1994  4 3  0 0 1 -1 -1 1000  673 192 45 67 23 0 0
1995  4 3  0 0 1 -1 -1 1000  763 151 47 10 17 12 0
1996  4 3  0 0 1 -1 -1 1000  842 118 27 7 4 2 0
1997  4 3  0 0 1 -1 -1 1000  898 80 15 7 0 0 0
1998  4 3  0 0 1 -1 -1 1000  796 178 22 4 0 0 0
1999  4 3  0 0 1 -1 -1 1000  623 299 70 3 5 0 0
2000  4 3  0 0 1 -1 -1 1000  623 215 123 32 7 0 0
2001  4 3  0 0 1 -1 -1 1000  767 130 52 37 12 1 1
2002  4 3  0 0 1 -1 -1 1000  581 307 62 30 13 7 0
2003  4 3  0 0 1 -1 -1 1000  819 98 62 10 6 4 1
2004  4 3  0 0 1 -1 -1 1000  931 55 9 4 0 1 0
2005  4 3  0 0 1 -1 -1 1000  760 209 29 0 1 0 1
2006  4 3  0 0 1 -1 -1 1000  664 246 82 7 0 1 0
2007  4 3  0 0 1 -1 -1 1000  665 209 99 27 0 0 0
2008  4 3  0 0 1 -1 -1 1000  483 336 131 38 12 0 0
2009  4 3  0 0 1 -1 -1 1000  859 59 56 17 5 4 0
2010  4 3  0 0 1 -1 -1 1000  912 88 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  657 307 33 1 2 0 0
2012  4 3  0 0 1 -1 -1 1000  678 199 112 11 0 0 0
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

