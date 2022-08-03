#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 09:20:44 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659532844 first rand#: -0.768109
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
-999 1 1 219580 0.05
1985 1 1 149987 0.05
1986 1 1 133093 0.05
1987 1 1 28348.6 0.05
1988 1 1 1988.68 0.05
1989 1 1 3518.51 0.05
1990 1 1 18974.5 0.05
1991 1 1 30236.4 0.05
1992 1 1 68732.4 0.05
1993 1 1 143216 0.05
1994 1 1 23706.6 0.05
1995 1 1 4963.22 0.05
1996 1 1 14174.7 0.05
1997 1 1 54535.4 0.05
1998 1 1 144010 0.05
1999 1 1 151916 0.05
2000 1 1 199356 0.05
2001 1 1 132211 0.05
2002 1 1 12294.3 0.05
2003 1 1 54379.7 0.05
2004 1 1 187259 0.05
2005 1 1 661184 0.05
2006 1 1 3.03699e+06 0.05
2007 1 1 2.0321e+06 0.05
2008 1 1 252992 0.05
2009 1 1 314894 0.05
2010 1 1 554118 0.05
2011 1 1 919785 0.05
2012 1 1 1.14834e+06 0.05
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
1990 10 2 3.52985e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.7245e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.80395e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.30701e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 987167 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.1054e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.7151e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 3.51381e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 5.07932e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.69279e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.83932e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.22219e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.83089e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.46565e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 5.82488e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 8.10447e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.69888e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 2.47888e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.61954e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.5776e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 5.3612e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 3.4901e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 3.16538e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 840124 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 478088 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 373831 0.1 #_orig_obs: 572537 survey2
1988 4 3 491416 0.1 #_orig_obs: 204010 survey2
1989 4 3 309482 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.32522e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.25881e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 571801 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 415837 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 372963 0.1 #_orig_obs: 418617 survey2
1995 4 3 401166 0.1 #_orig_obs: 310064 survey2
1996 4 3 729582 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.70631e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.97695e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.16627e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 796470 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 1.05385e+06 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 614267 0.1 #_orig_obs: 577555 survey2
2003 4 3 914549 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.9707e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.4508e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.4664e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.02967e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 453928 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 802132 0.1 #_orig_obs: 624374 survey2
2010 4 3 1.87826e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.07642e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 845558 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  395 233 124 61 28 7 4
1986  1 1  0 0 1 -1 -1 583  120 231 152 58 16 5 1
1987  1 1  0 0 1 -1 -1 762  303 93 227 98 23 11 7
1988  1 1  0 0 1 -1 -1 737  307 188 85 106 36 6 9
1989  1 1  0 0 1 -1 -1 692  238 232 118 45 45 7 7
1990  1 1  0 0 1 -1 -1 684  550 50 46 27 3 8 0
1991  1 1  0 0 1 -1 -1 777  411 301 31 21 8 2 3
1992  1 1  0 0 1 -1 -1 568  96 247 194 17 9 5 0
1993  1 1  0 0 1 -1 -1 548  186 61 169 124 6 2 0
1994  1 1  0 0 1 -1 -1 526  178 120 46 120 60 2 0
1995  1 1  0 0 1 -1 -1 500  250 100 69 24 47 9 1
1996  1 1  0 0 1 -1 -1 463  308 85 35 20 4 8 3
1997  1 1  0 0 1 -1 -1 454  325 77 37 6 2 3 4
1998  1 1  0 0 1 -1 -1 459  258 141 44 14 2 0 0
1999  1 1  0 0 1 -1 -1 428  144 165 91 23 4 1 0
2000  1 1  0 0 1 -1 -1 366  101 99 115 44 4 3 0
2001  1 1  0 0 1 -1 -1 501  229 99 85 65 16 4 3
2002  1 1  0 0 1 -1 -1 439  122 156 73 48 31 7 2
2003  1 1  0 0 1 -1 -1 402  215 54 92 26 13 1 1
2004  1 1  0 0 1 -1 -1 459  367 51 19 15 5 2 0
2005  1 1  0 0 1 -1 -1 394  210 154 20 6 4 0 0
2006  1 1  0 0 1 -1 -1 421  150 152 105 14 0 0 0
2007  1 1  0 0 1 -1 -1 532  190 178 118 44 2 0 0
2008  1 1  0 0 1 -1 -1 445  87 149 132 58 19 0 0
2009  1 1  0 0 1 -1 -1 402  243 38 80 29 12 0 0
2010  1 1  0 0 1 -1 -1 442  310 91 16 15 10 0 0
2011  1 1  0 0 1 -1 -1 434  161 203 53 8 9 0 0
2012  1 1  0 0 1 -1 -1 370  139 90 117 20 4 0 0
1990  10 2  0 0 1 -1 -1 118  107 11 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  24 15 1 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  35 62 22 2 1 0 0
1993  10 2  0 0 1 -1 -1 119  55 18 42 4 0 0 0
1994  10 2  0 0 1 -1 -1 53  32 21 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  176 54 24 4 3 0 0
1996  10 2  0 0 1 -1 -1 192  147 35 6 4 0 0 0
1997  10 2  0 0 1 -1 -1 110  93 17 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  124 43 9 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  253 174 59 9 0 0 0
2000  10 2  0 0 1 -1 -1 464  251 115 82 14 2 0 0
2001  10 2  0 0 1 -1 -1 268  168 57 24 17 2 0 0
2002  10 2  0 0 1 -1 -1 602  270 227 74 18 10 3 0
2003  10 2  0 0 1 -1 -1 56  39 10 5 1 0 1 0
2004  10 2  0 0 1 -1 -1 294  260 34 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  472 246 17 3 1 1 0
2006  10 2  0 0 1 -1 -1 335  186 103 43 3 0 0 0
2007  10 2  0 0 1 -1 -1 553  302 151 72 27 1 0 0
2008  10 2  0 0 1 -1 -1 344  118 143 63 20 0 0 0
2009  10 2  0 0 1 -1 -1 149  116 13 20 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  150 22 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  474 363 49 0 0 3 0
2012  10 2  0 0 1 -1 -1 464  256 125 74 9 0 0 0
1985  4 3  0 0 1 -1 -1 1000  757 178 41 17 5 2 0
1986  4 3  0 0 1 -1 -1 1000  462 399 92 32 8 7 0
1987  4 3  0 0 1 -1 -1 1000  695 123 125 43 7 4 3
1988  4 3  0 0 1 -1 -1 1000  768 150 31 36 12 2 1
1989  4 3  0 0 1 -1 -1 1000  657 238 71 13 14 4 3
1990  4 3  0 0 1 -1 -1 1000  933 46 16 5 0 0 0
1991  4 3  0 0 1 -1 -1 1000  740 233 14 9 3 0 1
1992  4 3  0 0 1 -1 -1 1000  389 436 161 8 3 3 0
1993  4 3  0 0 1 -1 -1 1000  643 127 164 66 0 0 0
1994  4 3  0 0 1 -1 -1 1000  666 182 50 72 30 0 0
1995  4 3  0 0 1 -1 -1 1000  761 152 55 14 13 5 0
1996  4 3  0 0 1 -1 -1 1000  863 107 18 4 4 3 1
1997  4 3  0 0 1 -1 -1 1000  890 89 16 5 0 0 0
1998  4 3  0 0 1 -1 -1 1000  793 183 23 1 0 0 0
1999  4 3  0 0 1 -1 -1 1000  632 267 85 14 2 0 0
2000  4 3  0 0 1 -1 -1 1000  646 195 130 26 3 0 0
2001  4 3  0 0 1 -1 -1 1000  747 147 63 28 14 1 0
2002  4 3  0 0 1 -1 -1 1000  598 285 69 27 15 6 0
2003  4 3  0 0 1 -1 -1 1000  836 86 54 15 3 5 1
2004  4 3  0 0 1 -1 -1 1000  926 56 8 9 0 0 1
2005  4 3  0 0 1 -1 -1 1000  736 232 24 5 2 0 1
2006  4 3  0 0 1 -1 -1 1000  658 247 84 5 3 3 0
2007  4 3  0 0 1 -1 -1 1000  675 211 94 20 0 0 0
2008  4 3  0 0 1 -1 -1 1000  503 322 119 49 7 0 0
2009  4 3  0 0 1 -1 -1 1000  855 61 53 22 5 4 0
2010  4 3  0 0 1 -1 -1 1000  903 97 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  622 344 29 2 3 0 0
2012  4 3  0 0 1 -1 -1 1000  661 200 127 12 0 0 0
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

