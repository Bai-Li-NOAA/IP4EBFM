#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 18 16:37:28 2022
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
-999 1 1 74888.8 0.05
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
2003 1 1 332008 0.05
2004 1 1 583430 0.05
2005 1 1 796850 0.05
2006 1 1 1.52473e+06 0.05
2007 1 1 843671 0.05
2008 1 1 441592 0.05
2009 1 1 517532 0.05
2010 1 1 470582 0.05
2011 1 1 428285 0.05
2012 1 1 684821 0.05
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
1990 10 2 2.94237e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.22936e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.16892e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.36908e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.41665e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 932372 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.79462e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.37231e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.3448e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.36509e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.15414e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.70733e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.37026e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.6842e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.41768e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.47974e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.76108e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.54521e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.89039e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.41247e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.74051e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.55316e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.7798e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 952817 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 398489 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 301534 0.1 #_orig_obs: 954308 survey2
1988 4 3 240901 0.1 #_orig_obs: 245537 survey2
1989 4 3 405504 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.11398e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 797759 0.1 #_orig_obs: 527308 survey2
1992 4 3 399336 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 507594 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 519586 0.1 #_orig_obs: 375877 survey2
1995 4 3 326462 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.06118e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.63104e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.19987e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 830148 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 780548 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.00563e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 481041 0.1 #_orig_obs: 525909 survey2
2003 4 3 1.02505e+06 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.88972e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 2.05165e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.46323e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.36113e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 686604 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.31311e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.80933e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.68909e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.40936e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  128.56 263.835 325.59 70.0116 10.0295 1.97492 0
1986  1 1  0 0 1 -1 -1 800  37.1858 309.666 370.753 69.4981 10.6397 1.71603 0.541253
1987  1 1  0 0 1 -1 -1 800  56.8322 105.205 527.464 95.1767 12.4659 2.85633 0
1988  1 1  0 0 1 -1 -1 800  89.0717 222.919 257.625 201.155 24.4554 4.77383 0
1989  1 1  0 0 1 -1 -1 800  204.532 201.083 301.028 57.5514 30.5176 3.99714 1.29089
1990  1 1  0 0 1 -1 -1 800  364.045 251.858 143.098 33.0608 7.93792 0 0
1991  1 1  0 0 1 -1 -1 800  121.874 465.771 192.606 16.2106 2.64617 0.406284 0.485656
1992  1 1  0 0 1 -1 -1 800  40.1653 218.634 505.786 32.916 2.49847 0 0
1993  1 1  0 0 1 -1 -1 800  124.076 128.213 392.821 147.333 7.55755 0 0
1994  1 1  0 0 1 -1 -1 800  162.468 333.18 193.924 85.0948 23.7745 1.55856 0
1995  1 1  0 0 1 -1 -1 800  74.8341 304.115 375.786 31.9412 9.89876 3.42507 0
1996  1 1  0 0 1 -1 -1 800  302.142 129.135 302.125 61.1844 3.63745 1.23702 0.538441
1997  1 1  0 0 1 -1 -1 800  272.632 391.795 96.9846 33.1028 5.48517 0 0
1998  1 1  0 0 1 -1 -1 800  106.334 366.526 311.939 11.782 3.41879 0 0
1999  1 1  0 0 1 -1 -1 800  68.1943 216.23 454.338 59.1592 2.07895 0 0
2000  1 1  0 0 1 -1 -1 800  102.117 196.069 365.504 124.586 11.7229 0 0
2001  1 1  0 0 1 -1 -1 800  177.626 252.237 270.983 77.6894 19.3173 1.98093 0.166246
2002  1 1  0 0 1 -1 -1 800  58.8834 381.521 299.122 47.0253 10.1038 3.34372 0
2003  1 1  0 0 1 -1 -1 800  218.684 121.789 403.576 47.8933 5.8788 1.49772 0.681647
2004  1 1  0 0 1 -1 -1 800  435.668 271.623 59.5415 28.9891 4.17834 0 0
2005  1 1  0 0 1 -1 -1 800  149.024 515.552 131.214 4.21019 0 0 0
2006  1 1  0 0 1 -1 -1 800  110.52 284.013 392.584 12.8831 0 0 0
2007  1 1  0 0 1 -1 -1 800  159.632 294.021 303.619 41.1615 1.56649 0 0
2008  1 1  0 0 1 -1 -1 800  71.0944 370.034 319.628 34.5034 4.73963 0 0
2009  1 1  0 0 1 -1 -1 800  227.237 152.796 371.074 44.0416 4.09994 0.75077 0
2010  1 1  0 0 1 -1 -1 800  265.218 383.095 113.236 34.0707 4.38019 0 0
2011  1 1  0 0 1 -1 -1 800  157.395 368.221 263.095 8.53718 2.75211 0 0
2012  1 1  0 0 1 -1 -1 800  120.015 295.686 347.485 35.4842 1.32993 0 0
1990  10 2  0 0 1 -1 -1 800  720.791 63.9929 8.53253 3.32605 3.35721 0 0
1991  10 2  0 0 1 -1 -1 800  513.731 254.219 32.0508 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  371.444 261.649 146.729 20.178 0 0 0
1993  10 2  0 0 1 -1 -1 800  619.601 81.4909 56.7146 36.5396 5.6535 0 0
1994  10 2  0 0 1 -1 -1 800  594.039 156.114 21.2069 15.748 12.8921 0 0
1995  10 2  0 0 1 -1 -1 800  459.746 242.476 73.4337 10.2837 7.84466 6.21627 0
1996  10 2  0 0 1 -1 -1 800  728.671 39.8052 21.5109 10.0128 0 0 0
1997  10 2  0 0 1 -1 -1 800  663.723 122.817 7.22951 4.13323 2.09702 0 0
1998  10 2  0 0 1 -1 -1 800  517.284 230.096 46.965 2.95747 1.76718 0.620461 0.310368
1999  10 2  0 0 1 -1 -1 800  477.801 196.608 101.226 21.7185 1.39169 1.25447 0
2000  10 2  0 0 1 -1 -1 800  558.338 137.692 60.4455 34.6961 7.84905 0.979143 0
2001  10 2  0 0 1 -1 -1 800  632.572 114.518 28.1288 13.8031 8.74417 2.23396 0
2002  10 2  0 0 1 -1 -1 800  389.736 321.876 57.6616 15.5213 8.4991 5.31278 1.39335
2003  10 2  0 0 1 -1 -1 800  704.428 49.0731 46.4984 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  741.001 58.9989 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  552.835 234.111 13.0534 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  578.61 176.79 41.2527 3.34708 0 0 0
2007  10 2  0 0 1 -1 -1 800  626.427 139.474 26.2361 6.91402 0.949011 0 0
2008  10 2  0 0 1 -1 -1 800  443.703 289.064 52.9546 10.2012 3.47726 0.600602 0
2009  10 2  0 0 1 -1 -1 800  705.233 58.365 27.9727 6.16865 1.57091 0.689779 0
2010  10 2  0 0 1 -1 -1 800  669.876 118.056 6.62652 5.44173 0 0 0
2011  10 2  0 0 1 -1 -1 800  593.642 175.493 27.6607 3.20391 0 0 0
2012  10 2  0 0 1 -1 -1 800  571.344 175.931 43.5763 7.96876 0.553283 0.399096 0.22701
1985  4 3  0 0 1 -1 -1 800  611.609 131.438 37.5724 12.5692 6.8108 0 0
1986  4 3  0 0 1 -1 -1 800  359.461 313.348 86.7695 25.3198 9.47496 3.44628 2.18027
1987  4 3  0 0 1 -1 -1 800  529.59 102.343 117.346 33.1155 10.6657 4.11916 2.82087
1988  4 3  0 0 1 -1 -1 800  551.008 143.64 37.5981 46.1021 13.8523 4.46366 3.336
1989  4 3  0 0 1 -1 -1 800  684.049 70.3811 24.3452 7.24839 9.39991 2.77716 1.79922
1990  4 3  0 0 1 -1 -1 800  734.592 53.258 7.02976 5.11991 0 0 0
1991  4 3  0 0 1 -1 -1 800  553.191 220.758 20.8972 5.15382 0 0 0
1992  4 3  0 0 1 -1 -1 800  418.994 238.208 126.271 16.5262 0 0 0
1993  4 3  0 0 1 -1 -1 800  645.618 70.1378 50.5455 29.317 4.38158 0 0
1994  4 3  0 0 1 -1 -1 800  625.067 134.405 18.2134 12.4084 9.90687 0 0
1995  4 3  0 0 1 -1 -1 800  505.769 214.418 60.4076 8.04059 6.13728 5.22736 0
1996  4 3  0 0 1 -1 -1 800  740.876 33.2357 18.1769 5.70616 0.824478 0.630861 0.550348
1997  4 3  0 0 1 -1 -1 800  686.162 103.196 5.90239 4.7397 0 0 0
1998  4 3  0 0 1 -1 -1 800  555.928 200.364 39.2581 4.44979 0 0 0
1999  4 3  0 0 1 -1 -1 800  524.351 173.448 83.1007 16.9439 2.15671 0 0
2000  4 3  0 0 1 -1 -1 800  594.47 119.57 51.7098 27.4046 6.84582 0 0
2001  4 3  0 0 1 -1 -1 800  657.745 98.1344 24.7394 10.9783 6.61996 1.52612 0.256582
2002  4 3  0 0 1 -1 -1 800  428.791 291.918 53.719 13.0707 6.8097 5.69169 0
2003  4 3  0 0 1 -1 -1 800  714.452 42.108 33.583 6.11332 1.79357 1.02085 0.928827
2004  4 3  0 0 1 -1 -1 800  743.918 50.2278 2.79077 2.06697 0.536899 0.192077 0.267374
2005  4 3  0 0 1 -1 -1 800  573.714 211.695 13.2657 0.377302 0.491772 0.200045 0.256196
2006  4 3  0 0 1 -1 -1 800  580.291 160.629 55.839 3.24057 0 0 0
2007  4 3  0 0 1 -1 -1 800  635.101 125.309 32.1927 7.39664 0 0 0
2008  4 3  0 0 1 -1 -1 800  473.112 260.535 54.1216 8.96403 3.26697 0 0
2009  4 3  0 0 1 -1 -1 800  711.535 50.9314 30.2975 5.48744 1.20776 0.540741 0
2010  4 3  0 0 1 -1 -1 800  682.26 105.232 7.68065 3.51991 1.3071 0 0
2011  4 3  0 0 1 -1 -1 800  618.873 152.638 25.9129 1.29556 1.28104 0 0
2012  4 3  0 0 1 -1 -1 800  593.56 154.808 43.8299 7.80205 0 0 0
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

