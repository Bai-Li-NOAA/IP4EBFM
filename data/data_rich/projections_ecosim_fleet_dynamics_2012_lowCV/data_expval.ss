#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Apr 04 10:36:26 2024
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
-999 1 1 149291 0.05
1985 1 1 136099 0.05
1986 1 1 123815 0.05
1987 1 1 34355.1 0.05
1988 1 1 2165.92 0.05
1989 1 1 934.197 0.05
1990 1 1 7273.59 0.05
1991 1 1 24630.4 0.05
1992 1 1 47429.3 0.05
1993 1 1 105877 0.05
1994 1 1 26274.8 0.05
1995 1 1 8728.65 0.05
1996 1 1 24082.6 0.05
1997 1 1 63288.6 0.05
1998 1 1 218324 0.05
1999 1 1 221118 0.05
2000 1 1 185409 0.05
2001 1 1 120010 0.05
2002 1 1 12156.9 0.05
2003 1 1 66124.8 0.05
2004 1 1 126269 0.05
2005 1 1 521663 0.05
2006 1 1 2.6024e+06 0.05
2007 1 1 2.46025e+06 0.05
2008 1 1 359124 0.05
2009 1 1 425344 0.05
2010 1 1 581421 0.05
2011 1 1 827856 0.05
2012 1 1 807264 0.05
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
1990 10 2 644348 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.38258e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 6.78864e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 3.02956e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.23218e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.63795e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.62442e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.546e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 7.47976e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 9.60032e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.08721e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.89144e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.7538e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 2.11749e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.49734e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 6.83916e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.17672e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.72967e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.51472e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.91174e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.37628e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 4.05413e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.6319e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.45042e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.39417e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 689673 0.1 #_orig_obs: 854127 survey2
1988 4 3 212655 0.1 #_orig_obs: 239407 survey2
1989 4 3 186740 0.1 #_orig_obs: 185762 survey2
1990 4 3 192039 0.1 #_orig_obs: 137981 survey2
1991 4 3 708677 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.1664e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 1.0197e+06 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 391552 0.1 #_orig_obs: 539130 survey2
1995 4 3 511569 0.1 #_orig_obs: 564396 survey2
1996 4 3 519408 0.1 #_orig_obs: 610556 survey2
1997 4 3 443500 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.41426e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.25633e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.38265e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 616786 0.1 #_orig_obs: 715021 survey2
2002 4 3 549049 0.1 #_orig_obs: 568480 survey2
2003 4 3 681618 0.1 #_orig_obs: 836482 survey2
2004 4 3 443471 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.20573e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.54969e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.18094e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.27251e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 700812 0.1 #_orig_obs: 638168 survey2
2010 4 3 445878 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.70063e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.63605e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
 0 1 2 3 4 5 6
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
1985  1 1  0 0 1 -1 -1 200  65.1728 58.446 58.4438 9.3574 8.58003 0 0
1986  1 1  0 0 1 -1 -1 200  26.3358 42.4973 100.35 16.0595 10.4247 2.06202 2.2705
1987  1 1  0 0 1 -1 -1 200  55.5022 17.0726 73.7471 27.9157 18.2135 3.59355 3.95531
1988  1 1  0 0 1 -1 -1 200  68.2438 35.6578 29.6614 20.9544 32.0805 6.41823 6.98402
1989  1 1  0 0 1 -1 -1 200  151.482 13.0787 18.516 2.54503 7.2325 3.41503 3.73126
1990  1 1  0 0 1 -1 -1 200  176.006 16.9758 3.96445 3.05343 0 0 0
1991  1 1  0 0 1 -1 -1 200  82.9303 90.6142 23.4502 0.907157 0.850462 1.24765 0
1992  1 1  0 0 1 -1 -1 200  36.3633 39.9898 116.955 4.95798 0.771804 0.222993 0.73958
1993  1 1  0 0 1 -1 -1 200  89.1622 19.7688 57.7394 27.7222 5.60738 0 0
1994  1 1  0 0 1 -1 -1 200  101.895 39.7914 23.6968 11.1655 21.8019 1.12855 0.520802
1995  1 1  0 0 1 -1 -1 200  59.9476 56.116 59.1411 5.78752 10.9888 6.60458 1.41435
1996  1 1  0 0 1 -1 -1 200  175.61 5.47856 13.815 2.40269 0.944393 0.553819 1.19603
1997  1 1  0 0 1 -1 -1 200  151.545 41.8333 3.48332 1.45049 1.68819 0 0
1998  1 1  0 0 1 -1 -1 200  66.2528 76.3465 54.722 0.75138 1.92732 0 0
1999  1 1  0 0 1 -1 -1 200  42.8645 36.2274 107.194 12.2094 0.67583 0.342235 0.486963
2000  1 1  0 0 1 -1 -1 200  69.5979 27.5023 60.7861 28.0693 14.0443 0 0
2001  1 1  0 0 1 -1 -1 200  105.065 29.4585 30.7531 10.9045 20.412 3.40671 0
2002  1 1  0 0 1 -1 -1 200  52.3098 66.566 50.1206 8.41363 12.1555 6.92113 3.51329
2003  1 1  0 0 1 -1 -1 200  163.11 6.65055 22.6545 2.81457 1.89306 0.846707 2.03079
2004  1 1  0 0 1 -1 -1 200  178.508 17.5049 1.89092 1.05723 1.03898 0 0
2005  1 1  0 0 1 -1 -1 200  95.7533 82.6094 21.6373 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  71.0287 45.2108 80.0519 3.70858 0 0 0
2007  1 1  0 0 1 -1 -1 200  66.8538 55.9525 61.3384 15.8554 0 0 0
2008  1 1  0 0 1 -1 -1 200  49.2777 46.295 86.6325 7.66753 10.1273 0 0
2009  1 1  0 0 1 -1 -1 200  166.783 7.86014 17.8343 4.95033 1.79742 0.774922 0
2010  1 1  0 0 1 -1 -1 200  140.308 49.7225 5.46601 1.87305 2.63006 0 0
2011  1 1  0 0 1 -1 -1 200  72.7045 71.0545 56.2411 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  67.0193 41.2321 82.7058 9.04283 0 0 0
1990  10 2  0 0 1 -1 -1 200  11.5931 56.8207 112.75 18.8363 0 0 0
1991  10 2  0 0 1 -1 -1 200  1.10476 61.2819 133.848 3.7652 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 194.461 5.53911 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 6.44198 144.733 48.8252 0 0 0
1994  10 2  0 0 1 -1 -1 200  1.27574 25.3056 127.676 41.6408 4.10196 0 0
1995  10 2  0 0 1 -1 -1 200  0 19.2016 168.23 12.5688 0 0 0
1996  10 2  0 0 1 -1 -1 200  4.92636 7.80655 166.756 20.5109 0 0 0
1997  10 2  0 0 1 -1 -1 200  7.20782 100.953 70.6575 21.1817 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 29.2082 170.792 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 7.54099 178.08 14.3791 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 8.2335 144.125 47.642 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.15678 16.4439 143.53 38.8693 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 24.7811 155.701 19.5174 0 0 0
2003  10 2  0 0 1 -1 -1 200  2.95047 6.10603 175.278 15.1193 0.546432 0 0
2004  10 2  0 0 1 -1 -1 200  16.3181 81.1268 73.2558 28.5685 0.730795 0 0
2005  10 2  0 0 1 -1 -1 200  1.5557 67.4738 130.97 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 16.108 178.163 5.72854 0 0 0
2007  10 2  0 0 1 -1 -1 200  0.623036 24.9617 145.23 29.1857 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 12.3265 175.683 11.9901 0 0 0
2009  10 2  0 0 1 -1 -1 200  3.71994 8.80131 155.538 31.9403 0 0 0
2010  10 2  0 0 1 -1 -1 200  5.3707 95.0883 78.524 21.017 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 32.7752 164.992 2.23317 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 13.3367 173.462 13.2013 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 15.0082 163.032 21.9598 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 6.5897 170.445 22.9653 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 3.34359 149.052 47.6041 0 0 0
1988  4 3  0 0 1 -1 -1 200  0.518938 12.708 116.351 68.6758 1.74594 0 0
1989  4 3  0 0 1 -1 -1 200  2.64283 10.6942 166.612 19.1351 0.916142 0 0
1990  4 3  0 0 1 -1 -1 200  10.2861 46.5 119.585 23.6291 0 0 0
1991  4 3  0 0 1 -1 -1 200  0.983151 50.3617 143.937 4.64614 0.0724506 0 0
1992  4 3  0 0 1 -1 -1 200  0 5.91388 187.439 6.64686 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 4.721 139.357 55.922 0 0 0
1994  4 3  0 0 1 -1 -1 200  1.06207 19.4415 127.657 50.2217 1.61752 0 0
1995  4 3  0 0 1 -1 -1 200  0.334853 14.6914 170.582 13.9421 0.449315 0 0
1996  4 3  0 0 1 -1 -1 200  4.07596 5.96067 165.736 24.2272 0 0 0
1997  4 3  0 0 1 -1 -1 200  6.6547 86.134 79.3421 27.5509 0.318239 0 0
1998  4 3  0 0 1 -1 -1 200  0 22.3441 175.597 2.05916 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 5.50139 177.677 16.8212 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 6.00065 139.828 54.1715 0 0 0
2001  4 3  0 0 1 -1 -1 200  0.940281 12.3637 143.101 42.2781 1.31733 0 0
2002  4 3  0 0 1 -1 -1 200  0.319035 19.0294 157.968 22.1416 0.542429 0 0
2003  4 3  0 0 1 -1 -1 200  2.42672 4.63899 174.629 18.0993 0.205589 0 0
2004  4 3  0 0 1 -1 -1 200  14.6045 67.164 80.4454 37.7861 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.28964 52.2817 144.204 2.22503 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 9.04707 184.978 5.97529 0 0 0
2007  4 3  0 0 1 -1 -1 200  0.299018 11.8738 159.149 28.6784 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 8.55032 178.155 13.2947 0 0 0
2009  4 3  0 0 1 -1 -1 200  2.71688 6.01861 155.423 35.8415 0 0 0
2010  4 3  0 0 1 -1 -1 200  4.46026 74.3791 94.1203 27.0403 0 0 0
2011  4 3  0 0 1 -1 -1 200  0.432486 19.9416 177.218 2.40758 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 7.76279 178.283 13.9543 0 0 0
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

