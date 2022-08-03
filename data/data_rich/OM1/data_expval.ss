#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 09:20:44 2022
#_expected_values
#C data file for simple example
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
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 236103 0.05
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
1990 10 2 3.37788e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.62186e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.86692e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.31754e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.03811e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.13755e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.80785e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 3.90484e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 4.97563e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.67576e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.62241e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.61332e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.76116e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.39928e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 6.77192e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 7.06826e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.65255e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 2.86724e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.53146e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.40127e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 5.30449e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 3.67354e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.585e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 963822 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 452592 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 442697 0.1 #_orig_obs: 572537 survey2
1988 4 3 443659 0.1 #_orig_obs: 204010 survey2
1989 4 3 329434 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.33161e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.29275e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 542989 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 431723 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 357007 0.1 #_orig_obs: 418617 survey2
1995 4 3 409957 0.1 #_orig_obs: 310064 survey2
1996 4 3 678013 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.50264e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.82467e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.21323e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 861671 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 929090 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 574346 0.1 #_orig_obs: 577555 survey2
2003 4 3 884234 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.66216e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.56729e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.73028e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.05608e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 478292 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 917282 0.1 #_orig_obs: 624374 survey2
2010 4 3 2.09511e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.27845e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 907998 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  397.723 229.933 140.585 59.4226 17.3704 4.60874 2.35769
1986  1 1  0 0 1 -1 -1 583  116.783 234.024 144.536 62.1374 18.2898 4.80668 2.4229
1987  1 1  0 0 1 -1 -1 762  280.09 107.269 231.651 101.03 30.1208 7.92542 3.91343
1988  1 1  0 0 1 -1 -1 737  315.33 180.885 75.3407 116.308 35.2885 9.32896 4.51872
1989  1 1  0 0 1 -1 -1 692  239.948 216.077 135.028 40.3268 43.3682 11.6477 5.6038
1990  1 1  0 0 1 -1 -1 684  539.315 54.8509 53.6983 24.0335 5.00444 4.77066 2.3272
1991  1 1  0 0 1 -1 -1 777  403.453 305.219 33.6897 23.5618 7.34626 1.35816 2.37169
1992  1 1  0 0 1 -1 -1 568  92.8377 246.154 201.648 15.8808 7.74447 3.73565 0
1993  1 1  0 0 1 -1 -1 548  156.584 69.1785 196.977 114.474 6.30102 2.74836 1.73789
1994  1 1  0 0 1 -1 -1 526  179.528 121.357 57.7711 116.13 46.7981 4.41543 0
1995  1 1  0 0 1 -1 -1 500  235.413 106.887 78.5446 26.7239 37.3806 13.3608 1.68959
1996  1 1  0 0 1 -1 -1 463  284.782 92.6147 45.7152 24.0548 5.70511 7.07424 3.05416
1997  1 1  0 0 1 -1 -1 454  326.373 82.2695 28.9355 10.1888 3.74209 0.789742 1.70177
1998  1 1  0 0 1 -1 -1 459  265.484 141.736 38.3395 9.54873 3.89173 0 0
1999  1 1  0 0 1 -1 -1 428  146.816 164.53 94.2604 17.9758 3.11242 0.685833 0.619943
2000  1 1  0 0 1 -1 -1 366  113.06 91.3584 109.757 44.4675 5.91843 1.4387 0
2001  1 1  0 0 1 -1 -1 501  219.702 99.1355 85.8448 72.6464 20.4709 2.44438 0.755921
2002  1 1  0 0 1 -1 -1 439  126.598 154.929 75.6336 46.456 27.2796 6.84922 1.25409
2003  1 1  0 0 1 -1 -1 402  217.532 59.0215 78.2925 27.3249 11.7142 6.10988 2.00506
2004  1 1  0 0 1 -1 -1 459  354.973 61.9936 18.0415 16.9644 4.13969 1.58868 1.29954
2005  1 1  0 0 1 -1 -1 394  206.352 149.531 27.3357 5.53772 5.24318 0 0
2006  1 1  0 0 1 -1 -1 421  162.961 144.48 98.2868 15.2721 0 0 0
2007  1 1  0 0 1 -1 -1 532  193.609 160.607 124.322 47.9216 5.53934 0 0
2008  1 1  0 0 1 -1 -1 445  96.2798 152.45 122.637 57.144 16.4896 0 0
2009  1 1  0 0 1 -1 -1 402  239.131 41.2486 68.0941 37.8054 15.7207 0 0
2010  1 1  0 0 1 -1 -1 442  327.069 77.6914 13.6636 15.2588 8.31711 0 0
2011  1 1  0 0 1 -1 -1 434  161.523 210.27 49.4904 5.72955 6.98684 0 0
2012  1 1  0 0 1 -1 -1 370  133.558 94.8548 120.061 18.117 3.40948 0 0
1990  10 2  0 0 1 -1 -1 118  105.736 12.2645 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  25.9678 12.7926 1.23959 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  33.9793 58.6129 27.5861 1.3073 0.412484 0.101953 0
1993  10 2  0 0 1 -1 -1 119  61.8568 17.7248 28.8532 10.0712 0.359765 0.134228 0
1994  10 2  0 0 1 -1 -1 53  30.3474 22.6526 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  176.877 52.3411 22.1614 4.54201 5.07852 0 0
1996  10 2  0 0 1 -1 -1 192  148.057 31.3605 8.9096 3.67261 0 0 0
1997  10 2  0 0 1 -1 -1 110  91.2017 18.7983 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  124.855 43.243 7.90232 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  247.666 180.36 59.2565 7.71729 0 0 0
2000  10 2  0 0 1 -1 -1 464  234.296 122.808 84.3646 20.5305 2.00174 0 0
2001  10 2  0 0 1 -1 -1 268  175.493 51.4304 25.5174 12.9807 2.57857 0 0
2002  10 2  0 0 1 -1 -1 602  281.093 224.17 63.043 23.3238 8.84693 1.52322 0
2003  10 2  0 0 1 -1 -1 56  41.479 7.32084 5.57827 1.17141 0.324956 0.105075 0.0204289
2004  10 2  0 0 1 -1 -1 294  256.78 37.2204 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  486.035 226.353 23.305 2.81958 1.22086 0.266812 0
2006  10 2  0 0 1 -1 -1 335  191.585 103.917 36.5726 2.92509 0 0 0
2007  10 2  0 0 1 -1 -1 553  312.943 159.849 64.7548 14.4745 0.978252 0 0
2008  10 2  0 0 1 -1 -1 344  130.071 133.091 60.8429 19.9952 0 0 0
2009  10 2  0 0 1 -1 -1 149  118.539 13.1508 17.3099 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  145.81 26.1895 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  457.392 377.183 48.804 3.34265 1.74071 0.412057 0.125277
2012  10 2  0 0 1 -1 -1 464  259.185 116.336 80.6319 7.84671 0 0 0
1985  4 3  0 0 1 -1 -1 1000  750.558 177.651 50.6825 14.8526 4.26796 1.98728 0
1986  4 3  0 0 1 -1 -1 1000  463.618 380.339 109.592 32.6633 9.45142 4.33614 0
1987  4 3  0 0 1 -1 -1 1000  723.942 113.298 113.744 34.3298 10.0778 2.95593 1.65183
1988  4 3  0 0 1 -1 -1 1000  741.254 173.668 33.5929 35.8696 10.721 3.16145 1.73381
1989  4 3  0 0 1 -1 -1 1000  653.255 240.276 69.7381 14.4066 15.2616 4.57187 2.49027
1990  4 3  0 0 1 -1 -1 1000  935.009 38.857 17.6822 8.45132 0 0 0
1991  4 3  0 0 1 -1 -1 1000  748.234 231.308 11.8689 5.74434 1.76359 0.363522 0.718329
1992  4 3  0 0 1 -1 -1 1000  394.233 427.328 162.877 8.88076 4.2627 2.41875 0
1993  4 3  0 0 1 -1 -1 1000  654.629 118.405 157.305 69.6613 0 0 0
1994  4 3  0 0 1 -1 -1 1000  684.97 189.21 41.8731 58.2498 25.697 0 0
1995  4 3  0 0 1 -1 -1 1000  773.069 143.374 48.9379 11.5179 15.8694 7.23187 0
1996  4 3  0 0 1 -1 -1 1000  845.741 112.383 25.7834 9.38778 2.19259 3.03102 1.48108
1997  4 3  0 0 1 -1 -1 1000  887.49 91.4877 14.9815 6.04028 0 0 0
1998  4 3  0 0 1 -1 -1 1000  798.128 174.428 22.01 5.43431 0 0 0
1999  4 3  0 0 1 -1 -1 1000  624.617 286.317 76.4013 10.0926 2.57204 0 0
2000  4 3  0 0 1 -1 -1 1000  634.103 209.762 117.569 33.0216 4.3207 0.745619 0.477644
2001  4 3  0 0 1 -1 -1 1000  759.261 140.171 56.5623 33.1646 9.19194 1.22173 0.427166
2002  4 3  0 0 1 -1 -1 1000  588.676 294.281 66.7389 28.3579 16.4018 5.54451 0
2003  4 3  0 0 1 -1 -1 1000  827.481 91.7901 56.6585 13.6911 5.77676 3.35673 1.24615
2004  4 3  0 0 1 -1 -1 1000  917.153 65.5901 8.90994 5.80972 1.39344 0.594634 0.549474
2005  4 3  0 0 1 -1 -1 1000  751.501 223.884 19.2498 2.71445 1.75781 0.432568 0.459844
2006  4 3  0 0 1 -1 -1 1000  662.872 246.481 81.6117 6.87508 0.981575 1.1785 0
2007  4 3  0 0 1 -1 -1 1000  659.202 228.799 85.8831 26.1161 0 0 0
2008  4 3  0 0 1 -1 -1 1000  501.032 325.347 122.516 39.6436 11.4614 0 0
2009  4 3  0 0 1 -1 -1 1000  865.014 61.3225 47.5828 18.3825 5.87425 1.82436 0
2010  4 3  0 0 1 -1 -1 1000  896.125 103.875 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  621.164 334.543 37.4633 3.03589 3.79389 0 0
2012  4 3  0 0 1 -1 -1 1000  669.328 196.858 118.756 15.0581 0 0 0
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

