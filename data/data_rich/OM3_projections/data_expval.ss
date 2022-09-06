#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Sep 05 13:26:18 2022
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
-999 1 1 121057 0.05
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
2006 1 1 1.52399e+06 0.05
2007 1 1 843571 0.05
2008 1 1 441591 0.05
2009 1 1 517514 0.05
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
1990 10 2 3.23782e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.4133e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.24348e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.48408e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.5289e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 987497 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.97394e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.629e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.46346e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.35786e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.07385e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.5094e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.23787e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.20833e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.92244e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.57333e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.42775e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.4638e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.88545e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.51328e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.10127e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.03544e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.30416e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.06235e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 446070 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 334054 0.1 #_orig_obs: 954308 survey2
1988 4 3 262891 0.1 #_orig_obs: 245537 survey2
1989 4 3 439259 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.1994e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 850172 0.1 #_orig_obs: 527308 survey2
1992 4 3 422088 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 540561 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 550921 0.1 #_orig_obs: 375877 survey2
1995 4 3 342439 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.10506e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.69231e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.22227e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 819620 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 740803 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 913933 0.1 #_orig_obs: 689461 survey2
2002 4 3 427905 0.1 #_orig_obs: 525909 survey2
2003 4 3 822872 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.23363e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.66814e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.29173e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.28932e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 667917 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.3131e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.88687e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.82285e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.55872e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  134.868 273.095 320.596 61.6476 8.26539 1.52741 0
1986  1 1  0 0 1 -1 -1 800  38.985 316.024 366.872 67.116 9.24998 1.35352 0.399231
1987  1 1  0 0 1 -1 -1 800  59.132 110.436 521.911 93.9441 12.1972 2.37943 0
1988  1 1  0 0 1 -1 -1 800  92.5777 231.067 257.112 190.993 23.886 4.36363 0
1989  1 1  0 0 1 -1 -1 800  209.544 205.204 298.22 54.1962 28.0031 3.73484 1.09841
1990  1 1  0 0 1 -1 -1 800  365.026 252.745 142.59 32.4211 7.21767 0 0
1991  1 1  0 0 1 -1 -1 800  122.539 467.589 189.782 16.6225 2.67022 0.375272 0.421972
1992  1 1  0 0 1 -1 -1 800  41.7187 223.483 499.819 32.4211 2.55866 0 0
1993  1 1  0 0 1 -1 -1 800  128.601 131.042 390.937 142.088 7.33281 0 0
1994  1 1  0 0 1 -1 -1 800  163.596 335.467 191.387 85.1255 22.9762 1.44831 0
1995  1 1  0 0 1 -1 -1 800  76.4149 308.454 369.538 32.1139 10.1946 3.2849 0
1996  1 1  0 0 1 -1 -1 800  305.444 130.395 300.25 58.5834 3.59977 1.22978 0.496807
1997  1 1  0 0 1 -1 -1 800  273.76 391.224 96.0737 33.6145 5.32834 0 0
1998  1 1  0 0 1 -1 -1 800  106.431 370.545 307.599 11.9123 3.513 0 0
1999  1 1  0 0 1 -1 -1 800  68.2344 220.41 450.638 58.5705 2.14795 0 0
2000  1 1  0 0 1 -1 -1 800  101.049 198.933 366.787 121.541 11.6889 0 0
2001  1 1  0 0 1 -1 -1 800  172.089 252.617 274.797 79.0834 19.2811 1.96162 0.171283
2002  1 1  0 0 1 -1 -1 800  57.1404 376.523 302.244 49.961 10.7753 3.35687 0
2003  1 1  0 0 1 -1 -1 800  200 122.43 416.305 52.257 6.67738 1.63394 0.696218
2004  1 1  0 0 1 -1 -1 800  409.229 271.678 75.1932 38.6443 5.25517 0 0
2005  1 1  0 0 1 -1 -1 800  150.211 491.974 149.862 7.9534 0 0 0
2006  1 1  0 0 1 -1 -1 800  116.464 275.792 389.749 17.995 0 0 0
2007  1 1  0 0 1 -1 -1 800  163.545 287.063 298.041 49.005 2.34587 0 0
2008  1 1  0 0 1 -1 -1 800  71.5879 364.555 316.458 41.0725 6.32635 0 0
2009  1 1  0 0 1 -1 -1 800  222.978 147.761 374.983 48.246 5.07705 0.955101 0
2010  1 1  0 0 1 -1 -1 800  261.43 369.155 121.249 42.8319 5.33386 0 0
2011  1 1  0 0 1 -1 -1 800  157.952 357.856 268.19 12.0542 3.94725 0 0
2012  1 1  0 0 1 -1 -1 800  119.652 289.751 348.512 40.1612 1.92279 0 0
1990  10 2  0 0 1 -1 -1 800  721.749 63.5737 8.59755 3.15701 2.92259 0 0
1991  10 2  0 0 1 -1 -1 800  516.924 251.984 31.0923 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  380.553 260.063 140.591 18.7926 0 0 0
1993  10 2  0 0 1 -1 -1 800  625.723 80.3428 55.5769 33.3181 5.03933 0 0
1994  10 2  0 0 1 -1 -1 800  597.026 155.267 21.0141 15.1944 11.499 0 0
1995  10 2  0 0 1 -1 -1 800  466.151 240.736 70.2391 9.75921 7.34472 5.76955 0
1996  10 2  0 0 1 -1 -1 800  729.843 39.4592 21.4328 9.26528 0 0 0
1997  10 2  0 0 1 -1 -1 800  665.66 121.203 7.17223 4.03921 1.92578 0 0
1998  10 2  0 0 1 -1 -1 800  518.566 229.996 45.9827 2.86732 1.68954 0.574478 0.323517
1999  10 2  0 0 1 -1 -1 800  480.241 198.175 98.4823 20.4904 1.32409 1.28682 0
2000  10 2  0 0 1 -1 -1 800  558.751 139.396 60.7595 32.8027 7.25488 1.03661 0
2001  10 2  0 0 1 -1 -1 800  629.539 116.529 29.4815 13.9676 8.25171 2.23156 0
2002  10 2  0 0 1 -1 -1 800  386.905 321.53 59.9139 16.324 8.5386 5.23506 1.55363
2003  10 2  0 0 1 -1 -1 800  693.829 52.7545 53.4164 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  733.597 66.4029 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  558.394 224.566 17.0401 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  585.408 165.523 44.3387 4.72937 0 0 0
2007  10 2  0 0 1 -1 -1 800  627.802 134.087 28.4203 8.36517 1.32535 0 0
2008  10 2  0 0 1 -1 -1 800  445.08 282.85 54.92 12.0307 4.27451 0.844859 0
2009  10 2  0 0 1 -1 -1 800  701.332 57.4373 31.5133 6.9945 1.84506 0.877815 0
2010  10 2  0 0 1 -1 -1 800  667.72 116.855 8.38796 7.03694 0 0 0
2011  10 2  0 0 1 -1 -1 800  595.912 170.149 29.5875 4.35105 0 0 0
2012  10 2  0 0 1 -1 -1 800  569.715 172.651 46.9648 9.07033 0.762809 0.548064 0.287357
1985  4 3  0 0 1 -1 -1 800  616.545 131.075 36.0424 10.9705 5.36725 0 0
1986  4 3  0 0 1 -1 -1 800  366.428 311.848 84.7157 24.5437 8.09199 2.68838 1.68403
1987  4 3  0 0 1 -1 -1 800  532.495 104.24 114.585 32.7646 10.2071 3.47445 2.23418
1988  4 3  0 0 1 -1 -1 800  553.767 144.697 37.2226 44.0629 13.2622 4.20127 2.78783
1989  4 3  0 0 1 -1 -1 800  685.853 70.5359 23.9764 6.90222 8.5335 2.58439 1.61436
1990  4 3  0 0 1 -1 -1 800  734.66 53.3833 7.04046 4.9166 0 0 0
1991  4 3  0 0 1 -1 -1 800  552.915 221.025 20.829 5.2316 0 0 0
1992  4 3  0 0 1 -1 -1 800  422.568 237.401 123.634 16.3965 0 0 0
1993  4 3  0 0 1 -1 -1 800  648.712 69.6476 49.2834 28.1763 4.18115 0 0
1994  4 3  0 0 1 -1 -1 800  625.027 134.669 18.0456 12.6873 9.5706 0 0
1995  4 3  0 0 1 -1 -1 800  506.495 214.363 59.5844 8.2364 6.2815 5.04052 0
1996  4 3  0 0 1 -1 -1 800  741.141 33.2741 18.0409 5.55719 0.814356 0.63094 0.541134
1997  4 3  0 0 1 -1 -1 800  686.385 102.876 5.89151 4.84702 0 0 0
1998  4 3  0 0 1 -1 -1 800  553.943 202.285 39.1689 4.6032 0 0 0
1999  4 3  0 0 1 -1 -1 800  520.594 176.201 83.6639 17.2879 2.2524 0 0
2000  4 3  0 0 1 -1 -1 800  590.168 122.154 52.9818 27.73 6.96662 0 0
2001  4 3  0 0 1 -1 -1 800  652.643 100.891 25.9989 11.7769 6.82589 1.57317 0.29148
2002  4 3  0 0 1 -1 -1 800  422.636 293.547 55.8652 14.5294 7.44645 5.97621 0
2003  4 3  0 0 1 -1 -1 800  704.733 45.7379 37.635 7.36098 2.21085 1.22022 1.10184
2004  4 3  0 0 1 -1 -1 800  739.566 52.6122 3.64066 2.87631 0.719644 0.248685 0.33637
2005  4 3  0 0 1 -1 -1 800  580.368 202.264 15.105 0.782196 0.881325 0.280255 0.318776
2006  4 3  0 0 1 -1 -1 800  591.397 150.537 53.5746 4.49094 0 0 0
2007  4 3  0 0 1 -1 -1 800  640.27 119.969 30.8298 8.93108 0 0 0
2008  4 3  0 0 1 -1 -1 800  475.181 256.094 53.4722 10.8438 4.40941 0 0
2009  4 3  0 0 1 -1 -1 800  710.699 50.0021 30.8822 6.17524 1.52263 0.719296 0
2010  4 3  0 0 1 -1 -1 800  683.411 102.33 8.15057 4.48199 1.62671 0 0
2011  4 3  0 0 1 -1 -1 800  621.601 148.365 26.3662 1.86444 1.80273 0 0
2012  4 3  0 0 1 -1 -1 800  594.709 152.188 43.8495 9.25424 0 0 0
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

