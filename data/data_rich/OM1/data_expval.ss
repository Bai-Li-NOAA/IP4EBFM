#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:12:36 2022
#_expected_values
#C data file for simple example
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
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 219405 0.05
1985 1 1 146025 0.05
1986 1 1 134502 0.05
1987 1 1 27073.8 0.05
1988 1 1 2015.26 0.05
1989 1 1 3146.2 0.05
1990 1 1 17543.5 0.05
1991 1 1 28428.3 0.05
1992 1 1 65373.9 0.05
1993 1 1 145271 0.05
1994 1 1 23983.6 0.05
1995 1 1 4622.27 0.05
1996 1 1 13624.6 0.05
1997 1 1 54297.4 0.05
1998 1 1 151739 0.05
1999 1 1 134446 0.05
2000 1 1 213400 0.05
2001 1 1 135196 0.05
2002 1 1 12822.8 0.05
2003 1 1 56633.8 0.05
2004 1 1 173331 0.05
2005 1 1 665719 0.05
2006 1 1 3.18683e+06 0.05
2007 1 1 2.13178e+06 0.05
2008 1 1 252357 0.05
2009 1 1 319150 0.05
2010 1 1 517330 0.05
2011 1 1 945312 0.05
2012 1 1 1.05032e+06 0.05
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
1990 10 2 3.37762e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.62834e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.87277e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.31456e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.0349e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.13476e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.80256e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 3.89856e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 4.98714e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.68946e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.62577e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.61214e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.76341e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.40541e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 6.87466e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 7.25225e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.73283e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 2.82847e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.49495e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.34228e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 5.29479e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 3.6968e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.57754e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 962904 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 451693 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 441200 0.1 #_orig_obs: 572537 survey2
1988 4 3 442705 0.1 #_orig_obs: 204010 survey2
1989 4 3 329076 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.33126e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.29447e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 544004 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 431157 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 355595 0.1 #_orig_obs: 418617 survey2
1995 4 3 408644 0.1 #_orig_obs: 310064 survey2
1996 4 3 675723 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.49927e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.8272e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.21682e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 862946 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 928754 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 574421 0.1 #_orig_obs: 577555 survey2
2003 4 3 886289 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.7008e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.62871e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.76151e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.05206e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 468476 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 896606 0.1 #_orig_obs: 624374 survey2
2010 4 3 2.08538e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.28547e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 911127 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  397.175 229.643 140.721 59.8002 17.5762 4.68201 2.40219
1986  1 1  0 0 1 -1 -1 583  116.805 233.869 144.357 62.217 18.4137 4.86968 2.46804
1987  1 1  0 0 1 -1 -1 762  280.288 107.317 231.527 100.833 30.0923 7.96845 3.97368
1988  1 1  0 0 1 -1 -1 737  315.36 180.682 75.372 116.449 35.2557 9.32248 4.55931
1989  1 1  0 0 1 -1 -1 692  239.82 215.836 135.011 40.4874 43.5606 11.6605 5.62504
1990  1 1  0 0 1 -1 -1 684  539.073 54.8045 53.7755 24.1571 5.04773 4.80713 2.33514
1991  1 1  0 0 1 -1 -1 777  403.429 304.919 33.7399 23.7273 7.42279 1.37473 2.38749
1992  1 1  0 0 1 -1 -1 568  92.7347 246.004 201.691 15.9645 7.82884 3.77685 0
1993  1 1  0 0 1 -1 -1 548  156.501 69.2067 196.884 114.523 6.33986 2.78443 1.75969
1994  1 1  0 0 1 -1 -1 526  179.711 121.458 57.8199 115.899 46.6593 4.45277 0
1995  1 1  0 0 1 -1 -1 500  235.431 106.815 78.6053 26.7873 37.3351 13.3231 1.70349
1996  1 1  0 0 1 -1 -1 463  284.543 92.605 45.7809 24.1844 5.74244 7.08658 3.05748
1997  1 1  0 0 1 -1 -1 454  326.191 82.2118 29.037 10.2721 3.78388 0.797907 1.70658
1998  1 1  0 0 1 -1 -1 459  265.518 141.459 38.4276 9.65411 3.9417 0 0
1999  1 1  0 0 1 -1 -1 428  146.736 164.397 94.2545 18.1225 3.16615 0.699133 0.62494
2000  1 1  0 0 1 -1 -1 366  112.985 91.3514 109.705 44.5198 5.97565 1.46335 0
2001  1 1  0 0 1 -1 -1 501  219.828 99.1327 85.8238 72.5294 20.4516 2.46587 0.76847
2002  1 1  0 0 1 -1 -1 439  126.726 154.86 75.6261 46.4671 27.216 6.83747 1.26765
2003  1 1  0 0 1 -1 -1 402  217.678 58.9342 78.1966 27.3582 11.7294 6.09738 2.00646
2004  1 1  0 0 1 -1 -1 459  355.716 61.4531 17.9258 16.9098 4.1281 1.58046 1.28694
2005  1 1  0 0 1 -1 -1 394  206.899 149.112 27.1758 5.55769 5.25556 0 0
2006  1 1  0 0 1 -1 -1 421  161.956 145.241 98.4531 15.35 0 0 0
2007  1 1  0 0 1 -1 -1 532  192.624 161.576 124.812 47.4585 5.52909 0 0
2008  1 1  0 0 1 -1 -1 445  96.8387 153.417 122.973 55.9349 15.8364 0 0
2009  1 1  0 0 1 -1 -1 402  240.331 41.3265 67.9101 37.3397 15.0931 0 0
2010  1 1  0 0 1 -1 -1 442  328.478 76.8576 13.5636 15.0829 8.0176 0 0
2011  1 1  0 0 1 -1 -1 434  162.173 209.987 49.1261 5.7772 6.93702 0 0
2012  1 1  0 0 1 -1 -1 370  134.217 95.2034 119.303 17.8846 3.39272 0 0
1990  10 2  0 0 1 -1 -1 118  105.671 12.3287 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  25.9476 12.7987 1.25368 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  33.8789 58.5731 27.698 1.32466 0.421215 0.104042 0
1993  10 2  0 0 1 -1 -1 119  61.7589 17.725 28.8878 10.1263 0.364982 0.137111 0
1994  10 2  0 0 1 -1 -1 53  30.301 22.699 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  176.644 52.3413 22.2907 4.59567 5.12788 0 0
1996  10 2  0 0 1 -1 -1 192  147.878 31.4128 8.97815 3.73148 0 0 0
1997  10 2  0 0 1 -1 -1 110  91.1263 18.8737 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  124.768 43.2375 7.9946 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  247.25 180.349 59.5402 7.86046 0 0 0
2000  10 2  0 0 1 -1 -1 464  233.888 122.808 84.5719 20.6905 2.04183 0 0
2001  10 2  0 0 1 -1 -1 268  175.328 51.4236 25.5935 13.0519 2.60309 0 0
2002  10 2  0 0 1 -1 -1 602  280.724 224.007 63.2909 23.5244 8.91738 1.53633 0
2003  10 2  0 0 1 -1 -1 56  41.4498 7.31421 5.59731 1.18321 0.328936 0.105924 0.0205969
2004  10 2  0 0 1 -1 -1 294  256.942 37.0578 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  486.194 226.053 23.3702 2.86914 1.24485 0.268376 0
2006  10 2  0 0 1 -1 -1 335  190.66 104.653 36.7346 2.9526 0 0 0
2007  10 2  0 0 1 -1 -1 553  312.752 160.718 64.3948 14.1623 0.973247 0 0
2008  10 2  0 0 1 -1 -1 344  130.306 133.388 60.7983 19.5071 0 0 0
2009  10 2  0 0 1 -1 -1 149  118.691 13.133 17.1765 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  145.981 26.0194 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  457.989 376.63 48.6841 3.40079 1.76946 0.408256 0.118717
2012  10 2  0 0 1 -1 -1 464  260.16 116.422 79.6934 7.72468 0 0 0
1985  4 3  0 0 1 -1 -1 1000  750.173 177.662 50.832 14.9727 4.32876 2.03176 0
1986  4 3  0 0 1 -1 -1 1000  463.458 380.198 109.63 32.7588 9.53465 4.42122 0
1987  4 3  0 0 1 -1 -1 1000  723.954 113.321 113.722 34.2626 10.0749 2.98004 1.68611
1988  4 3  0 0 1 -1 -1 1000  741.29 173.518 33.6265 35.9167 10.7203 3.16901 1.75948
1989  4 3  0 0 1 -1 -1 1000  653.073 240.189 69.8059 14.473 15.3506 4.59336 2.5154
1990  4 3  0 0 1 -1 -1 1000  934.923 38.8464 17.7204 8.5106 0 0 0
1991  4 3  0 0 1 -1 -1 1000  748.281 231.161 11.8932 5.78484 1.78347 0.369112 0.727364
1992  4 3  0 0 1 -1 -1 1000  393.849 427.329 163.113 8.93577 4.3159 2.45668 0
1993  4 3  0 0 1 -1 -1 1000  653.995 118.516 157.569 69.9208 0 0 0
1994  4 3  0 0 1 -1 -1 1000  685.012 189.276 41.9151 58.1247 25.6719 0 0
1995  4 3  0 0 1 -1 -1 1000  773.028 143.311 49.0046 11.5467 15.864 7.24613 0
1996  4 3  0 0 1 -1 -1 1000  845.483 112.471 25.8511 9.44497 2.2102 3.0476 1.4922
1997  4 3  0 0 1 -1 -1 1000  887.393 91.4717 15.0398 6.0956 0 0 0
1998  4 3  0 0 1 -1 -1 1000  798.33 174.113 22.0595 5.49711 0 0 0
1999  4 3  0 0 1 -1 -1 1000  624.438 286.273 76.4852 10.1831 2.62026 0 0
2000  4 3  0 0 1 -1 -1 1000  633.634 209.889 117.732 33.1225 4.37248 0.762957 0.487109
2001  4 3  0 0 1 -1 -1 1000  759.228 140.165 56.6008 33.1374 9.19534 1.23635 0.436662
2002  4 3  0 0 1 -1 -1 1000  588.891 294.076 66.742 28.3561 16.3707 5.56398 0
2003  4 3  0 0 1 -1 -1 1000  827.614 91.6539 56.6187 13.71 5.78922 3.35973 1.25392
2004  4 3  0 0 1 -1 -1 1000  917.945 64.9233 8.83364 5.77295 1.38694 0.592146 0.546393
2005  4 3  0 0 1 -1 -1 1000  752.649 222.898 19.0854 2.71396 1.76362 0.433152 0.456491
2006  4 3  0 0 1 -1 -1 1000  660.218 248.538 82.1147 6.9314 1.00162 1.19667 0
2007  4 3  0 0 1 -1 -1 1000  656.045 230.921 86.8974 26.1365 0 0 0
2008  4 3  0 0 1 -1 -1 1000  501.343 326.192 122.68 38.775 11.01 0 0
2009  4 3  0 0 1 -1 -1 1000  865.816 61.2561 47.3972 18.141 5.6499 1.73957 0
2010  4 3  0 0 1 -1 -1 1000  897.731 102.269 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  622.54 333.519 37.1248 3.0548 3.76187 0 0
2012  4 3  0 0 1 -1 -1 1000  669.832 197.134 118.12 14.9144 0 0 0
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

