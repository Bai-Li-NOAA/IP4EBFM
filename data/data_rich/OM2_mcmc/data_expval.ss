#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 11:47:35 2022
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
-999 1 1 299301 0.05
1985 1 1 194804 0.05
1986 1 1 173166 0.05
1987 1 1 92711.3 0.05
1988 1 1 25297.1 0.05
1989 1 1 52045.2 0.05
1990 1 1 65260.2 0.05
1991 1 1 76070.9 0.05
1992 1 1 133199 0.05
1993 1 1 203614 0.05
1994 1 1 92471.1 0.05
1995 1 1 49317 0.05
1996 1 1 121714 0.05
1997 1 1 101885 0.05
1998 1 1 191020 0.05
1999 1 1 156212 0.05
2000 1 1 234442 0.05
2001 1 1 219618 0.05
2002 1 1 213895 0.05
2003 1 1 332006 0.05
2004 1 1 583392 0.05
2005 1 1 796844 0.05
2006 1 1 1.52397e+06 0.05
2007 1 1 843569 0.05
2008 1 1 441591 0.05
2009 1 1 517513 0.05
2010 1 1 470576 0.05
2011 1 1 428285 0.05
2012 1 1 684817 0.05
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
1990 10 2 300.818 0.1 #_orig_obs: 544208 survey1
1991 10 2 298.631 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 293.299 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 285.315 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 290.114 0.1 #_orig_obs: 974412 survey1
1995 10 2 295.684 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 290.236 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 288.995 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 283.434 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 282.724 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 277.287 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 274.367 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 273.948 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 263.709 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 239.168 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 211.521 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 144.364 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 151.936 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 189.437 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 179.666 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 171.595 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 180.993 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 167.22 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1495.5 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 1491.01 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 1320.7 0.1 #_orig_obs: 954308 survey2
1988 4 3 1318.63 0.1 #_orig_obs: 245537 survey2
1989 4 3 1328.26 0.1 #_orig_obs: 165382 survey2
1990 4 3 1320.35 0.1 #_orig_obs: 140452 survey2
1991 4 3 1313.39 0.1 #_orig_obs: 527308 survey2
1992 4 3 1302.73 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 1283.73 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 1281.41 0.1 #_orig_obs: 375877 survey2
1995 4 3 1295.28 0.1 #_orig_obs: 528242 survey2
1996 4 3 1286.73 0.1 #_orig_obs: 581896 survey2
1997 4 3 1277.83 0.1 #_orig_obs: 407766 survey2
1998 4 3 1272.92 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1263.07 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 1256.16 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1240.92 0.1 #_orig_obs: 689461 survey2
2002 4 3 1238.03 0.1 #_orig_obs: 525909 survey2
2003 4 3 1218.62 0.1 #_orig_obs: 634479 survey2
2004 4 3 1165.42 0.1 #_orig_obs: 201645 survey2
2005 4 3 1091.64 0.1 #_orig_obs: 901519 survey2
2006 4 3 931.308 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 853.777 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 933.685 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 897.384 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 851.702 0.1 #_orig_obs: 552500 survey2
2011 4 3 886.336 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 877.899 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  398.481 328.112 61.604 9.68066 1.68467 0.43801 0
1986  1 1  0 0 1 -1 -1 800  362.932 355.582 68.5497 10.6397 1.82573 0.340986 0.130316
1987  1 1  0 0 1 -1 -1 800  387.512 323.879 74.3284 11.7845 1.9907 0.504682 0
1988  1 1  0 0 1 -1 -1 800  389.372 330.544 65.2647 12.21 2.09162 0.517324 0
1989  1 1  0 0 1 -1 -1 800  387.506 331.665 67.3194 10.7977 2.17231 0.396656 0.142744
1990  1 1  0 0 1 -1 -1 800  388.178 330.759 67.425 11.1484 2.49021 0 0
1991  1 1  0 0 1 -1 -1 800  389.012 330.412 66.9335 11.1334 1.98747 0.366991 0.154896
1992  1 1  0 0 1 -1 -1 800  390.609 329.305 66.5271 11.0428 2.51643 0 0
1993  1 1  0 0 1 -1 -1 800  393.769 327.596 65.2402 10.8947 2.50059 0 0
1994  1 1  0 0 1 -1 -1 800  393.322 330.013 63.7444 10.4869 1.91482 0.519642 0
1995  1 1  0 0 1 -1 -1 800  389.005 332.36 65.8861 10.3938 1.84961 0.505603 0
1996  1 1  0 0 1 -1 -1 800  390.073 329.469 67.217 10.8906 1.85507 0.352515 0.142625
1997  1 1  0 0 1 -1 -1 800  392.411 328.774 65.435 10.9614 2.41941 0 0
1998  1 1  0 0 1 -1 -1 800  393.424 328.173 65.2458 10.703 2.45386 0 0
1999  1 1  0 0 1 -1 -1 800  395.122 328.123 63.8408 10.5169 2.39747 0 0
2000  1 1  0 0 1 -1 -1 800  395.524 327.699 64.0618 10.3491 2.36636 0 0
2001  1 1  0 0 1 -1 -1 800  397.781 326.837 62.8072 10.2548 1.82422 0.354048 0.141246
2002  1 1  0 0 1 -1 -1 800  397.177 327.893 62.6078 10.0359 1.80219 0.484166 0
2003  1 1  0 0 1 -1 -1 800  399.951 324.992 62.7321 10.0632 1.77978 0.344574 0.137786
2004  1 1  0 0 1 -1 -1 800  410.214 317.821 59.723 9.95903 2.28321 0 0
2005  1 1  0 0 1 -1 -1 800  424.511 310.804 53.3841 11.3008 0 0 0
2006  1 1  0 0 1 -1 -1 800  455.669 288.214 46.0771 10.0394 0 0 0
2007  1 1  0 0 1 -1 -1 800  469.985 292.551 30.5696 5.21429 1.67966 0 0
2008  1 1  0 0 1 -1 -1 800  420.83 334.486 39.584 3.91847 1.18167 0 0
2009  1 1  0 0 1 -1 -1 800  414.01 322.842 56.2387 5.95274 0.685249 0.271586 0
2010  1 1  0 0 1 -1 -1 800  433.251 306.299 51.2083 8.03175 1.20993 0 0
2011  1 1  0 0 1 -1 -1 800  428.731 314.619 47.9452 7.1539 1.5511 0 0
2012  1 1  0 0 1 -1 -1 800  432.17 308.933 50.4029 6.96506 1.52839 0 0
1990  10 2  0 0 1 -1 -1 800  61.8079 637.177 99.6572 1.33998 0.017484 0 0
1991  10 2  0 0 1 -1 -1 800  62.0974 637.418 100.484 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  62.8575 636.755 99.0284 1.35937 0 0 0
1993  10 2  0 0 1 -1 -1 800  64.1516 636.549 97.9421 1.33945 0.0183081 0 0
1994  10 2  0 0 1 -1 -1 800  63.2758 640.388 95.0455 1.27345 0.0175303 0 0
1995  10 2  0 0 1 -1 -1 800  61.7984 639.707 97.2313 1.24648 0.0164699 0.000321841 0
1996  10 2  0 0 1 -1 -1 800  62.6209 636.176 99.8664 1.33649 0 0 0
1997  10 2  0 0 1 -1 -1 800  63.1773 637.879 97.5942 1.33206 0.0176563 0 0
1998  10 2  0 0 1 -1 -1 800  63.951 636.933 97.7849 1.31295 0.0177988 0.000325543 8.67944e-05
1999  10 2  0 0 1 -1 -1 800  64.1946 638.699 95.7991 1.28956 0.0172279 0.000333478 0
2000  10 2  0 0 1 -1 -1 800  64.7615 637.477 96.4649 1.27868 0.0171752 0.000329574 0
2001  10 2  0 0 1 -1 -1 800  65.3236 638.473 94.9157 1.2708 0.0168498 0.000326473 0
2002  10 2  0 0 1 -1 -1 800  65.0632 639.274 94.4048 1.24061 0.0166048 0.000312824 8.68987e-05
2003  10 2  0 0 1 -1 -1 800  66.6971 636.388 96.9153 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  71.8362 728.164 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  78.7299 632.553 88.7171 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  102.772 611.022 84.8532 1.35278 0 0 0
2007  10 2  0 0 1 -1 -1 800  99.2385 644.364 55.5543 0.82848 0.0151647 0 0
2008  10 2  0 0 1 -1 -1 800  73.6345 663.644 62.1957 0.51691 0.00827573 0.000248133 0
2009  10 2  0 0 1 -1 -1 800  72.9977 637.708 88.4959 0.791052 0.00692028 0.000204174 0
2010  10 2  0 0 1 -1 -1 800  79.7356 634.808 84.3314 1.12465 0 0 0
2011  10 2  0 0 1 -1 -1 800  77.2289 644.139 77.647 0.984966 0 0 0
2012  10 2  0 0 1 -1 -1 800  81.6307 633.732 83.6327 0.990849 0.0131519 0.000275929 8.39643e-05
1985  4 3  0 0 1 -1 -1 800  79.3485 639.946 79.7452 0.948362 0.011864 0 0
1986  4 3  0 0 1 -1 -1 800  67.6208 648.412 82.9804 0.975086 0.0118666 0.000237504 8.43332e-05
1987  4 3  0 0 1 -1 -1 800  76.8049 626.518 95.515 1.14812 0.0137521 0.000259946 8.49086e-05
1988  4 3  0 0 1 -1 -1 800  77.2025 637.868 83.7258 1.18925 0.0144515 0.000265668 8.49588e-05
1989  4 3  0 0 1 -1 -1 800  76.3468 636.705 85.8877 1.04532 0.0149112 0.00027387 8.50236e-05
1990  4 3  0 0 1 -1 -1 800  76.5786 636.156 86.171 1.09421 0 0 0
1991  4 3  0 0 1 -1 -1 800  76.8198 636.427 85.6586 1.09435 0 0 0
1992  4 3  0 0 1 -1 -1 800  77.1944 636.357 85.3613 1.08702 0 0 0
1993  4 3  0 0 1 -1 -1 800  78.0294 636.761 84.1338 1.06247 0.013804 0 0
1994  4 3  0 0 1 -1 -1 800  78.0102 638.969 81.9846 1.02246 0.0134281 0 0
1995  4 3  0 0 1 -1 -1 800  76.6683 638.227 84.085 1.00656 0.0127123 0.000261564 0
1996  4 3  0 0 1 -1 -1 800  77.0127 635.782 86.1347 1.05728 0.0127707 0.000252576 8.50269e-05
1997  4 3  0 0 1 -1 -1 800  77.8373 636.888 84.1924 1.08236 0 0 0
1998  4 3  0 0 1 -1 -1 800  77.8907 637.017 84.0363 1.05627 0 0 0
1999  4 3  0 0 1 -1 -1 800  78.4813 638.073 82.4052 1.02757 0.0132609 0 0
2000  4 3  0 0 1 -1 -1 800  78.3677 637.906 82.7039 1.00953 0.0130617 0 0
2001  4 3  0 0 1 -1 -1 800  79.133 638.47 81.3801 1.00424 0.0126533 0.000254532 8.50117e-05
2002  4 3  0 0 1 -1 -1 800  78.8634 639.187 80.9556 0.980896 0.0124781 0.000254757 0
2003  4 3  0 0 1 -1 -1 800  79.5281 637.904 81.5686 0.986271 0.0123399 0.000249655 8.48816e-05
2004  4 3  0 0 1 -1 -1 800  82.3569 637.499 79.1429 0.988499 0.01258 0.000251591 8.4989e-05
2005  4 3  0 0 1 -1 -1 800  86.4818 640.122 72.4688 0.914196 0.0124909 0.000256363 8.51581e-05
2006  4 3  0 0 1 -1 -1 800  95.8737 636.47 66.8135 0.842829 0 0 0
2007  4 3  0 0 1 -1 -1 800  102.17 652.424 44.8319 0.574048 0 0 0
2008  4 3  0 0 1 -1 -1 800  83.5548 664.14 51.9145 0.384777 0.00589419 0 0
2009  4 3  0 0 1 -1 -1 800  82.1511 643.302 73.9569 0.584789 0.00478827 0.000162332 0
2010  4 3  0 0 1 -1 -1 800  90.1053 638.578 70.4824 0.826569 0.00733015 0 0
2011  4 3  0 0 1 -1 -1 800  88.1134 646.104 65.0466 0.726935 0.00947931 0 0
2012  4 3  0 0 1 -1 -1 800  88.5208 641.786 68.9761 0.716991 0 0 0
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

