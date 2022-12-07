#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Dec 07 12:03:58 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
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
-999 1 1 61435.3 0.05
1985 1 1 16205.2 0.2
1986 1 1 14453 0.2
1987 1 1 7331.58 0.2
1988 1 1 1834.92 0.2
1989 1 1 3238.65 0.2
1990 1 1 61217.6 0.2
1991 1 1 104584 0.2
1992 1 1 289335 0.2
1993 1 1 468277 0.2
1994 1 1 234038 0.2
1995 1 1 119105 0.2
1996 1 1 339304 0.2
1997 1 1 372572 0.2
1998 1 1 867859 0.2
1999 1 1 645187 0.2
2000 1 1 396076 0.2
2001 1 1 283909 0.2
2002 1 1 359144 0.2
2003 1 1 163791 0.2
2004 1 1 184088 0.2
2005 1 1 137251 0.2
2006 1 1 266352 0.2
2007 1 1 75543.8 0.2
2008 1 1 160170 0.2
2009 1 1 151717 0.2
2010 1 1 143189 0.2
2011 1 1 255288 0.2
2012 1 1 449833 0.2
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
1990 10 2 517166 0.5 #_orig_obs: 615377 survey1
1991 10 2 2.20231e+06 0.5 #_orig_obs: 5.72451e+06 survey1
1992 10 2 6.583e+06 0.5 #_orig_obs: 1.15449e+07 survey1
1993 10 2 2.24974e+06 0.5 #_orig_obs: 4.1733e+06 survey1
1994 10 2 803294 0.5 #_orig_obs: 437096 survey1
1995 10 2 1.44603e+06 0.5 #_orig_obs: 2.95117e+06 survey1
1996 10 2 989616 0.5 #_orig_obs: 962787 survey1
1997 10 2 695924 0.5 #_orig_obs: 398559 survey1
1998 10 2 1.94345e+06 0.5 #_orig_obs: 5.19944e+06 survey1
1999 10 2 1.72417e+06 0.5 #_orig_obs: 1.2382e+06 survey1
2000 10 2 462102 0.5 #_orig_obs: 491605 survey1
2001 10 2 246881 0.5 #_orig_obs: 629262 survey1
2002 10 2 246956 0.5 #_orig_obs: 194347 survey1
2003 10 2 119806 0.5 #_orig_obs: 40803.7 survey1
2004 10 2 57792 0.5 #_orig_obs: 23769.8 survey1
2005 10 2 260072 0.5 #_orig_obs: 71333.7 survey1
2006 10 2 216316 0.5 #_orig_obs: 228094 survey1
2007 10 2 265059 0.5 #_orig_obs: 200863 survey1
2008 10 2 647339 0.5 #_orig_obs: 1.16875e+06 survey1
2009 10 2 524969 0.5 #_orig_obs: 337207 survey1
2010 10 2 360857 0.5 #_orig_obs: 443840 survey1
2011 10 2 1.50507e+06 0.5 #_orig_obs: 2.7311e+06 survey1
2012 10 2 1.39289e+06 0.5 #_orig_obs: 686684 survey1
1985 4 3 555258 0.5 #_orig_obs: 2.4376e+06 survey2
1986 4 3 567994 0.5 #_orig_obs: 4.48772e+06 survey2
1987 4 3 511909 0.5 #_orig_obs: 1.93581e+06 survey2
1988 4 3 206940 0.5 #_orig_obs: 88146.9 survey2
1989 4 3 152570 0.5 #_orig_obs: 208560 survey2
1990 4 3 158808 0.5 #_orig_obs: 223337 survey2
1991 4 3 657531 0.5 #_orig_obs: 227198 survey2
1992 4 3 1.61072e+06 0.5 #_orig_obs: 1.89336e+06 survey2
1993 4 3 702599 0.5 #_orig_obs: 672533 survey2
1994 4 3 270968 0.5 #_orig_obs: 142457 survey2
1995 4 3 393998 0.5 #_orig_obs: 945722 survey2
1996 4 3 349936 0.5 #_orig_obs: 441389 survey2
1997 4 3 293920 0.5 #_orig_obs: 253735 survey2
1998 4 3 785720 0.5 #_orig_obs: 1.40229e+06 survey2
1999 4 3 661662 0.5 #_orig_obs: 512918 survey2
2000 4 3 232808 0.5 #_orig_obs: 403577 survey2
2001 4 3 131401 0.5 #_orig_obs: 79351.4 survey2
2002 4 3 165911 0.5 #_orig_obs: 387126 survey2
2003 4 3 79792.1 0.5 #_orig_obs: 133377 survey2
2004 4 3 40353 0.5 #_orig_obs: 7550.2 survey2
2005 4 3 110063 0.5 #_orig_obs: 35297.4 survey2
2006 4 3 137107 0.5 #_orig_obs: 219834 survey2
2007 4 3 95679 0.5 #_orig_obs: 25436.5 survey2
2008 4 3 218601 0.5 #_orig_obs: 123200 survey2
2009 4 3 178091 0.5 #_orig_obs: 137117 survey2
2010 4 3 143107 0.5 #_orig_obs: 44355.3 survey2
2011 4 3 467405 0.5 #_orig_obs: 242955 survey2
2012 4 3 503294 0.5 #_orig_obs: 868378 survey2
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
1985  1 1  0 0 1 -1 -1 800  114.775 275.644 330.787 66.0348 10.3734 2.38576 0
1986  1 1  0 0 1 -1 -1 800  34.1459 303.066 370.129 78.1126 11.8911 1.97332 0.681628
1987  1 1  0 0 1 -1 -1 800  48.6006 112.304 508.587 109.212 17.538 3.75837 0
1988  1 1  0 0 1 -1 -1 800  55.7324 224.438 265.55 212.053 34.5324 5.83748 1.85687
1989  1 1  0 0 1 -1 -1 800  292.695 133.179 274.008 57.4399 34.7741 5.95601 1.94766
1990  1 1  0 0 1 -1 -1 800  455.987 259.911 56.3995 21.1999 3.48686 2.25413 0.761118
1991  1 1  0 0 1 -1 -1 800  86.2435 554.717 151.347 5.35316 2.33866 0 0
1992  1 1  0 0 1 -1 -1 800  28.0626 183.473 560.762 26.4782 1.22387 0 0
1993  1 1  0 0 1 -1 -1 800  105.589 131.548 358.88 195.422 7.99235 0.257238 0.311737
1994  1 1  0 0 1 -1 -1 800  163.021 354.767 173.532 69.6823 36.8404 2.15661 0
1995  1 1  0 0 1 -1 -1 800  57.419 362.985 341.671 23.223 8.66872 6.03247 0
1996  1 1  0 0 1 -1 -1 800  360.213 115.223 273.101 46.1686 5.2938 0 0
1997  1 1  0 0 1 -1 -1 800  224.998 498.311 55.9577 20.7341 0 0 0
1998  1 1  0 0 1 -1 -1 800  70.1407 416.697 306.137 7.02554 0 0 0
1999  1 1  0 0 1 -1 -1 800  49.1098 243.546 465.043 40.8694 1.4319 0 0
2000  1 1  0 0 1 -1 -1 800  231.762 204.021 284.985 70.6225 8.60934 0 0
2001  1 1  0 0 1 -1 -1 800  160.642 503.166 114.078 14.9628 7.15047 0 0
2002  1 1  0 0 1 -1 -1 800  46.8152 433.089 310.263 6.8757 2.9567 0 0
2003  1 1  0 0 1 -1 -1 800  316.188 159.194 307.738 16.8794 0 0 0
2004  1 1  0 0 1 -1 -1 800  357.174 399.352 37.4309 5.18572 0.569682 0.0560356 0.231836
2005  1 1  0 0 1 -1 -1 800  92.0726 554.869 152.179 0.566407 0.181882 0.0465179 0.0842044
2006  1 1  0 0 1 -1 -1 800  269.786 203.863 314.335 12.0171 0 0 0
2007  1 1  0 0 1 -1 -1 800  199.857 476.205 112.55 11.3879 0 0 0
2008  1 1  0 0 1 -1 -1 800  49.5232 387.609 349.265 12.3408 1.26177 0 0
2009  1 1  0 0 1 -1 -1 800  353.376 106.973 299.794 38.2436 1.61334 0 0
2010  1 1  0 0 1 -1 -1 800  264.013 462.149 52.2836 18.8599 2.695 0 0
2011  1 1  0 0 1 -1 -1 800  89.4768 414.019 289.932 6.57291 0 0 0
2012  1 1  0 0 1 -1 -1 800  119.188 237.431 397.786 45.5949 0 0 0
1990  10 2  0 0 1 -1 -1 800  44.0871 227.62 438.676 88.7232 0.893831 0 0
1991  10 2  0 0 1 -1 -1 800  3.82753 224.913 560.577 10.682 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 27.9355 753.011 19.054 0 0 0
1993  10 2  0 0 1 -1 -1 800  2.45857 26.9107 586.991 183.173 0.466853 0 0
1994  10 2  0 0 1 -1 -1 800  7.13328 136.211 530.252 122.361 4.04269 0 0
1995  10 2  0 0 1 -1 -1 800  0 84.9561 689.066 25.978 0 0 0
1996  10 2  0 0 1 -1 -1 800  14.5841 39.783 675.391 70.2419 0 0 0
1997  10 2  0 0 1 -1 -1 800  20.5858 392.509 327.184 59.721 0 0 0
1998  10 2  0 0 1 -1 -1 800  2.65167 132.377 658.299 6.67242 0 0 0
1999  10 2  0 0 1 -1 -1 800  1.29073 53.9519 705.665 39.0418 0.0505236 0 0
2000  10 2  0 0 1 -1 -1 800  11.0377 77.7528 603.288 107.038 0.883263 0 0
2001  10 2  0 0 1 -1 -1 800  13.2455 331.516 415.005 40.2341 0 0 0
2002  10 2  0 0 1 -1 -1 800  2.71148 189.941 596.197 11.1511 0 0 0
2003  10 2  0 0 1 -1 -1 800  20.9353 79.7189 671.58 27.7662 0 0 0
2004  10 2  0 0 1 -1 -1 800  68.5144 542.969 165.454 23.0627 0 0 0
2005  10 2  0 0 1 -1 -1 800  5.37397 273.725 519.665 1.23587 0 0 0
2006  10 2  0 0 1 -1 -1 800  16.4178 94.8484 668.336 20.3975 0 0 0
2007  10 2  0 0 1 -1 -1 800  12.5849 263.343 496.865 27.207 0 0 0
2008  10 2  0 0 1 -1 -1 800  0 100.895 684.77 14.3346 0 0 0
2009  10 2  0 0 1 -1 -1 800  13.0772 33.9791 698.997 53.9469 0 0 0
2010  10 2  0 0 1 -1 -1 800  24.375 373.259 332.413 69.953 0 0 0
2011  10 2  0 0 1 -1 -1 800  2.87403 117.58 673.315 6.23171 0 0 0
2012  10 2  0 0 1 -1 -1 800  3.39505 57.6635 691.476 47.4653 0 0 0
1985  4 3  0 0 1 -1 -1 800  0.0495266 117.542 593.225 89.184 0 0 0
1986  4 3  0 0 1 -1 -1 800  0.0131831 115.104 590.961 93.9218 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 34.6564 658.722 106.622 0 0 0
1988  4 3  0 0 1 -1 -1 800  0.0225113 89.356 443.516 265.318 1.78791 0 0
1989  4 3  0 0 1 -1 -1 800  0.161103 72.4988 626.547 98.3312 2.46201 0 0
1990  4 3  0 0 1 -1 -1 800  0.640438 363.715 340.386 95.2581 0 0 0
1991  4 3  0 0 1 -1 -1 800  0.0571939 364.799 423.853 11.2915 0 0 0
1992  4 3  0 0 1 -1 -1 800  0.00850852 54.8472 719.929 25.2156 0 0 0
1993  4 3  0 0 1 -1 -1 800  0.0353281 44.2723 540.938 214.755 0 0 0
1994  4 3  0 0 1 -1 -1 800  0.094781 207.87 456.008 133.216 2.81108 0 0
1995  4 3  0 0 1 -1 -1 800  0.0240526 151.244 617.304 30.9523 0.475996 0 0
1996  4 3  0 0 1 -1 -1 800  0.185441 60.4133 658.844 80.5575 0 0 0
1997  4 3  0 0 1 -1 -1 800  0.218881 492.128 252.354 55.2997 0 0 0
1998  4 3  0 0 1 -1 -1 800  0.0296099 179.636 613.344 6.99105 0 0 0
1999  4 3  0 0 1 -1 -1 800  0.015217 76.7877 680.123 43.0745 0 0 0
2000  4 3  0 0 1 -1 -1 800  0.0993085 90.8126 601.217 107.871 0 0 0
2001  4 3  0 0 1 -1 -1 800  0.112813 367.251 394.746 37.3329 0.557068 0 0
2002  4 3  0 0 1 -1 -1 800  0.0184782 179.627 610.374 9.98138 0 0 0
2003  4 3  0 0 1 -1 -1 800  0.143395 76.1749 698.315 25.3665 0 0 0
2004  4 3  0 0 1 -1 -1 800  0.450769 540.054 234.828 24.6676 0 0 0
2005  4 3  0 0 1 -1 -1 800  0.0572125 351.875 448.068 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  0.118029 93.8318 687.117 18.9332 0 0 0
2007  4 3  0 0 1 -1 -1 800  0.156193 375.074 397.212 27.5577 0 0 0
2008  4 3  0 0 1 -1 -1 800  0.0195225 154.111 629.686 16.1833 0 0 0
2009  4 3  0 0 1 -1 -1 800  0.173189 53.2742 683.469 63.084 0 0 0
2010  4 3  0 0 1 -1 -1 800  0.275438 486.718 247.723 65.2839 0 0 0
2011  4 3  0 0 1 -1 -1 800  0.0414836 192.689 600.152 7.11684 0 0 0
2012  4 3  0 0 1 -1 -1 800  0.0423085 85.7182 660.864 53.3756 0 0 0
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

