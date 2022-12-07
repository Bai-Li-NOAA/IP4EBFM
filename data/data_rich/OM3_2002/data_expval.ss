#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Dec 07 11:57:26 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2002 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1.0001 #_spawn_month
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
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 140496 0.05
1985 1 1 13603.9 0.05
1986 1 1 12608.1 0.05
1987 1 1 6965.11 0.05
1988 1 1 1875.42 0.05
1989 1 1 3547.84 0.05
1990 1 1 75299.6 0.05
1991 1 1 117945 0.05
1992 1 1 268179 0.05
1993 1 1 458765 0.05
1994 1 1 229069 0.05
1995 1 1 149976 0.05
1996 1 1 392681 0.05
1997 1 1 359263 0.05
1998 1 1 936239 0.05
1999 1 1 661922 0.05
2000 1 1 465788 0.05
2001 1 1 321698 0.05
2002 1 1 313599 0.05
-9999 0 0 0 0
#
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
1990 10 2 611684 0.1 #_orig_obs: 559970 survey1
1991 10 2 2.43507e+06 0.1 #_orig_obs: 4.1271e+06 survey1
1992 10 2 6.94113e+06 0.1 #_orig_obs: 7.13121e+06 survey1
1993 10 2 2.32229e+06 0.1 #_orig_obs: 1.66483e+06 survey1
1994 10 2 842543 0.1 #_orig_obs: 613678 survey1
1995 10 2 1.46819e+06 0.1 #_orig_obs: 1.43796e+06 survey1
1996 10 2 985318 0.1 #_orig_obs: 845940 survey1
1997 10 2 763482 0.1 #_orig_obs: 770676 survey1
1998 10 2 2.17607e+06 0.1 #_orig_obs: 5.12954e+06 survey1
1999 10 2 1.95345e+06 0.1 #_orig_obs: 1.39835e+06 survey1
2000 10 2 520821 0.1 #_orig_obs: 494764 survey1
2001 10 2 273677 0.1 #_orig_obs: 377871 survey1
2002 10 2 508426 0.1 #_orig_obs: 325152 survey1
1985 4 3 1.12287e+06 0.1 #_orig_obs: 1.90597e+06 survey2
1986 4 3 1.15416e+06 0.1 #_orig_obs: 2.21911e+06 survey2
1987 4 3 1.0418e+06 0.1 #_orig_obs: 1.05381e+06 survey2
1988 4 3 344861 0.1 #_orig_obs: 192092 survey2
1989 4 3 209315 0.1 #_orig_obs: 179548 survey2
1990 4 3 178533 0.1 #_orig_obs: 129115 survey2
1991 4 3 697866 0.1 #_orig_obs: 328697 survey2
1992 4 3 1.74833e+06 0.1 #_orig_obs: 2.00105e+06 survey2
1993 4 3 733134 0.1 #_orig_obs: 1.03349e+06 survey2
1994 4 3 275406 0.1 #_orig_obs: 250591 survey2
1995 4 3 413905 0.1 #_orig_obs: 515878 survey2
1996 4 3 361882 0.1 #_orig_obs: 419123 survey2
1997 4 3 283161 0.1 #_orig_obs: 211584 survey2
1998 4 3 838034 0.1 #_orig_obs: 852235 survey2
1999 4 3 715210 0.1 #_orig_obs: 1.03369e+06 survey2
2000 4 3 257015 0.1 #_orig_obs: 333299 survey2
2001 4 3 132153 0.1 #_orig_obs: 100039 survey2
2002 4 3 220243 0.1 #_orig_obs: 179415 survey2
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
1985  1 1  0 0 1 -1 -1 800  124.445 280.556 326.89 58.4511 8.07251 1.58582 0
1986  1 1  0 0 1 -1 -1 800  29.2071 314.175 373.843 71.5201 9.45877 1.37661 0.419342
1987  1 1  0 0 1 -1 -1 800  38.0106 95.5022 542.77 106.023 14.9925 2.70168 0
1988  1 1  0 0 1 -1 -1 800  45.6462 199.416 265.019 247.454 35.687 5.31243 1.46556
1989  1 1  0 0 1 -1 -1 800  276.3 123.905 285.703 62.5375 43.1313 6.54781 1.87542
1990  1 1  0 0 1 -1 -1 800  456.097 257.015 57.129 22.4463 3.74287 2.74966 0.820599
1991  1 1  0 0 1 -1 -1 800  85.3503 552.303 154.678 5.26679 2.40276 0 0
1992  1 1  0 0 1 -1 -1 800  27.9083 176.4 568.848 25.6854 1.15858 0 0
1993  1 1  0 0 1 -1 -1 800  115.052 126.28 356.727 194.165 7.23258 0.212667 0.330156
1994  1 1  0 0 1 -1 -1 800  173.096 357.333 166.352 67.6004 33.8328 1.78584 0
1995  1 1  0 0 1 -1 -1 800  58.3978 366.015 340.663 21.8847 7.96107 5.07854 0
1996  1 1  0 0 1 -1 -1 800  379.601 109.08 265.139 41.8419 4.3379 0 0
1997  1 1  0 0 1 -1 -1 800  229.86 497.167 54.1334 18.8396 0 0 0
1998  1 1  0 0 1 -1 -1 800  73.2716 403.149 316.721 6.85935 0 0 0
1999  1 1  0 0 1 -1 -1 800  50.2232 238.433 466.098 43.9461 1.29962 0 0
2000  1 1  0 0 1 -1 -1 800  232.615 195.766 285.819 76.6143 9.1857 0 0
2001  1 1  0 0 1 -1 -1 800  200.807 466.885 109.271 15.4147 7.6217 0 0
2002  1 1  0 0 1 -1 -1 800  61.6043 430.456 298.999 6.45585 2.48555 0 0
1990  10 2  0 0 1 -1 -1 800  52.1846 235.675 423.555 87.5476 1.03717 0 0
1991  10 2  0 0 1 -1 -1 800  4.52116 236.396 549.21 9.87288 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 28.98 753.292 17.7279 0 0 0
1993  10 2  0 0 1 -1 -1 800  3.25483 27.9498 590.041 178.288 0.46631 0 0
1994  10 2  0 0 1 -1 -1 800  9.27743 149.72 519.462 117.407 4.13364 0 0
1995  10 2  0 0 1 -1 -1 800  0 94.4343 681.581 23.985 0 0 0
1996  10 2  0 0 1 -1 -1 800  19.623 42.4398 672.897 65.0405 0 0 0
1997  10 2  0 0 1 -1 -1 800  24.4774 407.872 314.802 52.8492 0 0 0
1998  10 2  0 0 1 -1 -1 800  3.16218 130.478 659.936 6.42297 0 0 0
1999  10 2  0 0 1 -1 -1 800  1.51491 54.3599 704.031 40.0409 0.0536659 0 0
2000  10 2  0 0 1 -1 -1 800  12.8639 77.1343 596.277 112.691 1.03409 0 0
2001  10 2  0 0 1 -1 -1 800  19.9614 330.332 407.679 42.0274 0 0 0
2002  10 2  0 0 1 -1 -1 800  3.01532 154.404 633.495 9.08564 0 0 0
1985  4 3  0 0 1 -1 -1 800  0.0280003 106.337 610.502 83.1327 0 0 0
1986  4 3  0 0 1 -1 -1 800  0.00578519 103.673 607.794 88.527 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 24.1336 675.357 100.51 0 0 0
1988  4 3  0 0 1 -1 -1 800  0.0089668 65.5744 429.077 302.939 2.40037 0 0
1989  4 3  0 0 1 -1 -1 800  0.0738341 55.8782 635.025 105.044 3.97894 0 0
1990  4 3  0 0 1 -1 -1 800  0.340048 325.821 365.714 108.124 0 0 0
1991  4 3  0 0 1 -1 -1 800  0.0300423 328.665 459.367 11.9383 0 0 0
1992  4 3  0 0 1 -1 -1 800  0.00429053 45.1683 730.112 24.715 0 0 0
1993  4 3  0 0 1 -1 -1 800  0.0197487 37.0601 544.817 218.103 0 0 0
1994  4 3  0 0 1 -1 -1 800  0.0542321 191.966 465.491 138.79 3.69906 0 0
1995  4 3  0 0 1 -1 -1 800  0.0126082 133.909 635.2 30.2747 0.604293 0 0
1996  4 3  0 0 1 -1 -1 800  0.102542 51.251 671.793 76.8531 0 0 0
1997  4 3  0 0 1 -1 -1 800  0.126252 471.155 271.276 57.4431 0 0 0
1998  4 3  0 0 1 -1 -1 800  0.0158337 151.065 641.641 7.27766 0 0 0
1999  4 3  0 0 1 -1 -1 800  0.00801 65.4364 687.605 46.9511 0 0 0
2000  4 3  0 0 1 -1 -1 800  0.05043 75.06 607.187 117.703 0 0 0
2001  4 3  0 0 1 -1 -1 800  0.0799362 328.989 426.737 43.2875 0.906463 0 0
2002  4 3  0 0 1 -1 -1 800  0.0134756 164.369 625.793 9.8249 0 0 0
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

