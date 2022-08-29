#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 29 11:41:55 2022
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
-999 1 1 11873.5 0.05
1985 1 1 194844 0.05
1986 1 1 172975 0.05
1987 1 1 92664.4 0.05
1988 1 1 25300.9 0.05
1989 1 1 52001.9 0.05
1990 1 1 65260.1 0.05
1991 1 1 76070.9 0.05
1992 1 1 133200 0.05
1993 1 1 203197 0.05
1994 1 1 92416.1 0.05
1995 1 1 49317.4 0.05
1996 1 1 121595 0.05
1997 1 1 101885 0.05
1998 1 1 191020 0.05
1999 1 1 156214 0.05
2000 1 1 234417 0.05
2001 1 1 219463 0.05
2002 1 1 213720 0.05
2003 1 1 199372 0.05
2004 1 1 219671 0.05
2005 1 1 411493 0.05
2006 1 1 467448 0.05
2007 1 1 317224 0.05
2008 1 1 247215 0.05
2009 1 1 193910 0.05
2010 1 1 176511 0.05
2011 1 1 218296 0.05
2012 1 1 163472 0.05
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
1990 10 2 4.67544e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 3.90925e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.88219e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.68192e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.55322e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 900253 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.22412e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 5.96559e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.97684e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 3.70333e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 3.2714e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 3.52173e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.35493e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.12292e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.04546e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.07047e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.59873e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.4588e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.48239e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.61231e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 2.92502e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 1.7979e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 922539 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.00629e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 376546 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 276697 0.1 #_orig_obs: 954308 survey2
1988 4 3 202841 0.1 #_orig_obs: 245537 survey2
1989 4 3 429766 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.78869e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.36876e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 611901 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 643528 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 574850 0.1 #_orig_obs: 375877 survey2
1995 4 3 305612 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.25556e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 2.22931e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.7772e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.27844e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 1.19815e+06 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.32221e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 485230 0.1 #_orig_obs: 525909 survey2
2003 4 3 845936 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.75057e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.91142e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.40295e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.34323e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 558251 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.0332e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.12187e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 686927 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 358914 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  113.352 157.913 230.274 168.786 74.6554 55.02 0
1986  1 1  0 0 1 -1 -1 800  45.724 288.709 329.429 117.023 14.2923 2.91115 1.91096
1987  1 1  0 0 1 -1 -1 800  90.3262 95.8701 500.64 110.396 2.66309 0.105163 0
1988  1 1  0 0 1 -1 -1 800  97.3494 188.705 200.685 305.848 7.35213 0.0605385 0
1989  1 1  0 0 1 -1 -1 800  313.861 151.159 241.137 68.9922 24.5109 0.337294 0.0026524
1990  1 1  0 0 1 -1 -1 800  547.889 165.78 66.2046 19.7576 0.369084 0 0
1991  1 1  0 0 1 -1 -1 800  187.972 461.004 135.54 14.9904 0.489862 0.00290564 0.000280157
1992  1 1  0 0 1 -1 -1 800  41.3024 201.995 502.782 52.5924 1.32777 0 0
1993  1 1  0 0 1 -1 -1 800  117.03 83.113 352.191 242.316 5.35045 0 0
1994  1 1  0 0 1 -1 -1 800  189.741 290.736 167.519 143.319 8.62819 0.0575036 0
1995  1 1  0 0 1 -1 -1 800  77.9497 271.545 390.839 55.5363 4.059 0.0707132 0
1996  1 1  0 0 1 -1 -1 800  429.131 80.485 216.159 72.3095 1.84828 0.0659409 0.00110905
1997  1 1  0 0 1 -1 -1 800  398.974 325.635 51.2071 23.8501 0.333449 0 0
1998  1 1  0 0 1 -1 -1 800  169.76 356.446 262.63 10.5441 0.620192 0 0
1999  1 1  0 0 1 -1 -1 800  94.5379 195.123 413.032 96.7138 0.592649 0 0
2000  1 1  0 0 1 -1 -1 800  120.898 155.659 304.371 207.643 11.4298 0 0
2001  1 1  0 0 1 -1 -1 800  206 230.478 242.596 110.054 10.6301 0.241493 0.000799138
2002  1 1  0 0 1 -1 -1 800  58.16 383.736 303.962 52.4808 1.61988 0.0415457 0
2003  1 1  0 0 1 -1 -1 800  292.431 96.44 376.442 34.4951 0.191594 0.00104392 9.77494e-05
2004  1 1  0 0 1 -1 -1 800  554.513 198.065 36.3876 11.0244 0.00954864 0 0
2005  1 1  0 0 1 -1 -1 800  210.711 490.592 97.3052 1.39153 0 0 0
2006  1 1  0 0 1 -1 -1 800  173.137 271.001 350.466 5.39613 0 0 0
2007  1 1  0 0 1 -1 -1 800  244.376 283.919 246.916 24.7846 0.0036548 0 0
2008  1 1  0 0 1 -1 -1 800  94.9667 417.54 269.298 18.178 0.0171752 0 0
2009  1 1  0 0 1 -1 -1 800  337.736 129.439 316.948 15.8666 0.0101143 8.07194e-05 0
2010  1 1  0 0 1 -1 -1 800  313.476 388.159 82.6488 15.708 0.0074476 0 0
2011  1 1  0 0 1 -1 -1 800  158.33 377.685 259.685 4.29179 0.00772228 0 0
2012  1 1  0 0 1 -1 -1 800  117.377 284.988 377.487 20.1455 0.0031997 0 0
1990  10 2  0 0 1 -1 -1 800  746.545 49.7113 3.55861 0.18315 0.0016934 0 0
1991  10 2  0 0 1 -1 -1 800  503.933 278.491 17.5762 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  296.759 327.79 170.35 5.10069 0 0 0
1993  10 2  0 0 1 -1 -1 800  623.368 97.0527 71.7385 7.76455 0.0764287 0 0
1994  10 2  0 0 1 -1 -1 800  583.138 195.171 19.2167 2.41233 0.0622243 0 0
1995  10 2  0 0 1 -1 -1 800  394.519 310.828 91.1171 3.37757 0.155411 0.00275329 0
1996  10 2  0 0 1 -1 -1 800  757.048 30.4267 12.1513 0.373511 0 0 0
1997  10 2  0 0 1 -1 -1 800  674.227 121.868 3.5749 0.327717 0.0024565 0 0
1998  10 2  0 0 1 -1 -1 800  522.012 243.529 34.1606 0.288608 0.00925115 0.00012599 8.02011e-05
1999  10 2  0 0 1 -1 -1 800  472.907 220.88 99.2949 6.88924 0.028347 0.000758873 0
2000  10 2  0 0 1 -1 -1 800  566.663 162.54 61.3222 9.19128 0.282266 0.00101458 0
2001  10 2  0 0 1 -1 -1 800  620.737 151.087 26.4947 1.61781 0.0628025 0.00137038 0
2002  10 2  0 0 1 -1 -1 800  311.105 438.483 49.7196 0.686265 0.00611597 0.000207943 8.23881e-05
2003  10 2  0 0 1 -1 -1 800  729.12 49.5326 21.347 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  744.293 55.7068 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  537.389 256.998 5.61383 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  585.049 188.153 26.7851 0.0135231 0 0 0
2007  10 2  0 0 1 -1 -1 800  634.207 151.264 14.4811 0.0474666 8.11062e-05 0 0
2008  10 2  0 0 1 -1 -1 800  406.113 367.722 26.1074 0.0575313 8.8745e-05 8e-05 0
2009  10 2  0 0 1 -1 -1 800  727.274 57.265 15.4356 0.0252707 8.25785e-05 8.00001e-05 0
2010  10 2  0 0 1 -1 -1 800  634.789 161.404 3.78319 0.0235217 0 0 0
2011  10 2  0 0 1 -1 -1 800  523.93 256.635 19.4242 0.0105483 0 0 0
2012  10 2  0 0 1 -1 -1 800  509.204 253.735 36.9967 0.0644469 8.16131e-05 8.00001e-05 7.99999e-05
1985  4 3  0 0 1 -1 -1 800  595.755 140.443 42.9789 13.1439 7.67943 0 0
1986  4 3  0 0 1 -1 -1 800  334.138 361.4 90.3255 12.6594 1.15578 0.23869 0.0829002
1987  4 3  0 0 1 -1 -1 800  569.874 103.117 116.323 10.4814 0.197659 0.00638256 0.000965064
1988  4 3  0 0 1 -1 -1 800  553.962 181.341 39.5037 24.6954 0.493912 0.00415284 0.000150682
1989  4 3  0 0 1 -1 -1 800  716.805 59.4182 20.8435 2.31889 0.606079 0.00850345 0.000113969
1990  4 3  0 0 1 -1 -1 800  757.182 39.0376 3.363 0.417205 0 0 0
1991  4 3  0 0 1 -1 -1 800  555.43 229.909 14.0007 0.659726 0 0 0
1992  4 3  0 0 1 -1 -1 800  352.226 291.186 149.952 6.63535 0 0 0
1993  4 3  0 0 1 -1 -1 800  632.772 76.715 70.5153 19.6625 0.3355 0 0
1994  4 3  0 0 1 -1 -1 800  612.378 160.283 20.1111 6.90845 0.31963 0 0
1995  4 3  0 0 1 -1 -1 800  448.848 266.208 79.9233 4.72978 0.285868 0.00521387 0
1996  4 3  0 0 1 -1 -1 800  759.002 24.5269 14.6314 1.80577 0.0323088 0.00122815 8.9475e-05
1997  4 3  0 0 1 -1 -1 800  699.097 97.0056 3.2609 0.636545 0 0 0
1998  4 3  0 0 1 -1 -1 800  566.015 201.808 31.623 0.553416 0 0 0
1999  4 3  0 0 1 -1 -1 800  528.246 183.921 80.0683 7.72528 0.0394786 0 0
2000  4 3  0 0 1 -1 -1 800  598.778 130.877 54.2342 15.4207 0.689765 0 0
2001  4 3  0 0 1 -1 -1 800  643.139 123.057 28.3311 5.09473 0.369899 0.00860286 9.34256e-05
2002  4 3  0 0 1 -1 -1 800  339.579 387.635 68.4548 4.23979 0.0891626 0.00232914 0
2003  4 3  0 0 1 -1 -1 800  720.872 41.5973 36.567 0.960614 0.00312228 9.46987e-05 8.01423e-05
2004  4 3  0 0 1 -1 -1 800  751.101 46.7942 1.93614 0.168224 0.000162353 8.00334e-05 8e-05
2005  4 3  0 0 1 -1 -1 800  561.628 228.139 10.1906 0.0417348 0.000147453 8.00042e-05 7.99999e-05
2006  4 3  0 0 1 -1 -1 800  591.245 161.509 47.0387 0.207679 0 0 0
2007  4 3  0 0 1 -1 -1 800  643.393 130.344 25.5288 0.734698 0 0 0
2008  4 3  0 0 1 -1 -1 800  424.857 326.762 47.4625 0.91847 0.00057272 0 0
2009  4 3  0 0 1 -1 -1 800  724.446 48.4516 26.7188 0.3835 0.000218332 8.00095e-05 0
2010  4 3  0 0 1 -1 -1 800  652.054 140.825 6.75296 0.367986 0.000178443 0 0
2011  4 3  0 0 1 -1 -1 800  540.253 224.776 34.8058 0.164972 0.000247508 0 0
2012  4 3  0 0 1 -1 -1 800  515.65 218.249 65.1045 0.996149 0 0 0
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

