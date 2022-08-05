#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Aug 05 13:24:18 2022
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
-999 1 1 132062 0.05
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
2004 1 1 583396 0.05
2005 1 1 796845 0.05
2006 1 1 1.52398e+06 0.05
2007 1 1 843571 0.05
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
1990 10 2 3.23462e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.3952e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.2384e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.49488e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.53801e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 991786 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.99082e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.62037e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.44375e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.34959e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.07926e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.52624e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.25099e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.27096e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.88964e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.46515e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.37497e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.43748e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.88345e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.55287e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.1035e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.01883e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.29591e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.06826e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 448864 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 336364 0.1 #_orig_obs: 954308 survey2
1988 4 3 264789 0.1 #_orig_obs: 245537 survey2
1989 4 3 442255 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.19701e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 844214 0.1 #_orig_obs: 527308 survey2
1992 4 3 419622 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 542113 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 553530 0.1 #_orig_obs: 375877 survey2
1995 4 3 343882 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.10915e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.68825e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.21494e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 815302 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 740401 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 918239 0.1 #_orig_obs: 689461 survey2
2002 4 3 432215 0.1 #_orig_obs: 525909 survey2
2003 4 3 842929 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.22408e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.63258e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.26732e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.27632e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 666120 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.32343e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.88728e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.81573e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.5521e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  135.572 273.328 320.86 60.7727 8.01361 1.45372 0
1986  1 1  0 0 1 -1 -1 800  39.0684 315.488 367.822 66.9415 9.01365 1.29193 0.374682
1987  1 1  0 0 1 -1 -1 800  59.0927 109.997 522.46 94.132 12.0458 2.2722 0
1988  1 1  0 0 1 -1 -1 800  92.7397 230.463 257.202 191.574 23.7902 4.23145 0
1989  1 1  0 0 1 -1 -1 800  209.996 204.96 298.466 54.042 27.8131 3.67349 1.04891
1990  1 1  0 0 1 -1 -1 800  364.774 253.368 142.299 32.4252 7.13392 0 0
1991  1 1  0 0 1 -1 -1 800  122.519 467.512 190.184 16.3645 2.63965 0.369135 0.411979
1992  1 1  0 0 1 -1 -1 800  41.9422 222.744 500.642 32.1827 2.48922 0 0
1993  1 1  0 0 1 -1 -1 800  129.22 130.452 391.47 141.706 7.15147 0 0
1994  1 1  0 0 1 -1 -1 800  163.818 334.623 191.155 86.1806 22.8288 1.39356 0
1995  1 1  0 0 1 -1 -1 800  76.575 308.137 369.746 32.0691 10.2506 3.22169 0
1996  1 1  0 0 1 -1 -1 800  306.147 130.195 300.12 58.2836 3.55452 1.2199 0.479734
1997  1 1  0 0 1 -1 -1 800  273.909 391.67 95.7013 33.4607 5.2598 0 0
1998  1 1  0 0 1 -1 -1 800  106.544 370.357 307.948 11.7025 3.44839 0 0
1999  1 1  0 0 1 -1 -1 800  68.5533 219.942 451.169 58.2498 2.08639 0 0
2000  1 1  0 0 1 -1 -1 800  101.599 198.485 367.325 121.131 11.4597 0 0
2001  1 1  0 0 1 -1 -1 800  172.785 251.748 274.959 79.4222 19.0295 1.89283 0.162433
2002  1 1  0 0 1 -1 -1 800  57.5606 375.507 302.742 50.1972 10.7383 3.25482 0
2003  1 1  0 0 1 -1 -1 800  200.588 121.394 416.884 52.2996 6.59337 1.58625 0.655146
2004  1 1  0 0 1 -1 -1 800  407.103 274.571 73.4466 39.546 5.3341 0 0
2005  1 1  0 0 1 -1 -1 800  149.803 494.016 148.726 7.45499 0 0 0
2006  1 1  0 0 1 -1 -1 800  116.539 273.601 392.59 17.2691 0 0 0
2007  1 1  0 0 1 -1 -1 800  164.028 284.852 298.314 50.5483 2.25741 0 0
2008  1 1  0 0 1 -1 -1 800  72.1814 363.329 316.357 41.6468 6.48582 0 0
2009  1 1  0 0 1 -1 -1 800  223.803 146.974 374.858 48.3289 5.08072 0.955262 0
2010  1 1  0 0 1 -1 -1 800  261.101 369.676 120.38 43.4816 5.36116 0 0
2011  1 1  0 0 1 -1 -1 800  158.208 357.639 268.457 11.7439 3.95219 0 0
2012  1 1  0 0 1 -1 -1 800  119.589 288.821 349.774 39.9521 1.86423 0 0
1990  10 2  0 0 1 -1 -1 800  721.951 63.4976 8.6287 3.21519 2.70745 0 0
1991  10 2  0 0 1 -1 -1 800  517.505 251.306 31.1893 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  381.522 257.675 142.187 18.616 0 0 0
1993  10 2  0 0 1 -1 -1 800  625.269 79.4741 56.5859 33.9204 4.75064 0 0
1994  10 2  0 0 1 -1 -1 800  597.441 154.364 21.2589 15.7091 11.227 0 0
1995  10 2  0 0 1 -1 -1 800  467.033 239.449 70.9816 9.93319 7.37004 5.23323 0
1996  10 2  0 0 1 -1 -1 800  730.003 39.1905 21.6311 9.17542 0 0 0
1997  10 2  0 0 1 -1 -1 800  666.096 120.799 7.18043 4.09102 1.83273 0 0
1998  10 2  0 0 1 -1 -1 800  519.096 229.079 46.4935 2.87288 1.65821 0.528633 0.271209
1999  10 2  0 0 1 -1 -1 800  480.906 196.503 99.4445 20.7337 1.28128 1.13157 0
2000  10 2  0 0 1 -1 -1 800  558.999 138.123 61.6042 33.3037 7.08506 0.885449 0
2001  10 2  0 0 1 -1 -1 800  630.113 115.55 29.9094 14.3175 8.12089 1.98861 0
2002  10 2  0 0 1 -1 -1 800  388.798 319.075 60.8594 16.742 8.4853 4.78066 1.25962
2003  10 2  0 0 1 -1 -1 800  693.609 52.135 54.2565 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  733.619 66.3807 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  558.732 224.555 16.7134 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  585.387 164.1 45.942 4.57125 0 0 0
2007  10 2  0 0 1 -1 -1 800  628.295 132.619 29.0141 8.84601 1.22578 0 0
2008  10 2  0 0 1 -1 -1 800  446.785 280.02 55.641 12.4401 4.38424 0.729754 0
2009  10 2  0 0 1 -1 -1 800  701.159 56.8702 32.1499 7.17451 1.84172 0.804784 0
2010  10 2  0 0 1 -1 -1 800  667.947 116.548 8.3461 7.15901 0 0 0
2011  10 2  0 0 1 -1 -1 800  596.516 169.326 29.8815 4.27636 0 0 0
2012  10 2  0 0 1 -1 -1 800  569.532 171.769 47.9689 9.24268 0.734551 0.509789 0.242792
1985  4 3  0 0 1 -1 -1 800  616.878 131.12 35.9274 10.8282 5.24553 0 0
1986  4 3  0 0 1 -1 -1 800  366.516 311.917 84.7557 24.5641 7.98092 2.62538 1.64012
1987  4 3  0 0 1 -1 -1 800  532.212 104.244 114.705 33.015 10.2248 3.42045 2.17851
1988  4 3  0 0 1 -1 -1 800  553.573 144.57 37.1881 44.3689 13.368 4.20054 2.73163
1989  4 3  0 0 1 -1 -1 800  685.837 70.5456 23.9429 6.90378 8.57328 2.59892 1.59864
1990  4 3  0 0 1 -1 -1 800  734.203 53.7799 7.05749 4.95948 0 0 0
1991  4 3  0 0 1 -1 -1 800  552.14 221.731 20.9087 5.2209 0 0 0
1992  4 3  0 0 1 -1 -1 800  423.463 236.744 123.482 16.3104 0 0 0
1993  4 3  0 0 1 -1 -1 800  649.462 69.3026 49.0165 28.0934 4.12567 0 0
1994  4 3  0 0 1 -1 -1 800  624.84 134.656 18.0033 12.8975 9.60304 0 0
1995  4 3  0 0 1 -1 -1 800  506.432 214.366 59.5114 8.2515 6.38735 5.05168 0
1996  4 3  0 0 1 -1 -1 800  741.164 33.2808 18.01 5.54906 0.813665 0.640081 0.54201
1997  4 3  0 0 1 -1 -1 800  685.89 103.362 5.88651 4.86096 0 0 0
1998  4 3  0 0 1 -1 -1 800  553.519 202.693 39.2193 4.56921 0 0 0
1999  4 3  0 0 1 -1 -1 800  521.106 175.896 83.5341 17.2351 2.22847 0 0
2000  4 3  0 0 1 -1 -1 800  590.901 121.796 52.7611 27.645 6.89733 0 0
2001  4 3  0 0 1 -1 -1 800  653.023 100.583 25.9051 11.8446 6.80744 1.55082 0.286448
2002  4 3  0 0 1 -1 -1 800  423.94 292.427 55.6355 14.5969 7.48736 5.9139 0
2003  4 3  0 0 1 -1 -1 800  705.363 45.3632 37.4185 7.36362 2.20533 1.21079 1.07525
2004  4 3  0 0 1 -1 -1 800  738.257 53.7792 3.61855 2.99803 0.750617 0.256081 0.340532
2005  4 3  0 0 1 -1 -1 800  578.493 204.184 15.1003 0.71364 0.886778 0.292367 0.329513
2006  4 3  0 0 1 -1 -1 800  591.96 149.839 53.8562 4.34519 0 0 0
2007  4 3  0 0 1 -1 -1 800  640.844 119.228 30.7588 9.16837 0 0 0
2008  4 3  0 0 1 -1 -1 800  476.665 254.721 53.097 10.9821 4.53452 0 0
2009  4 3  0 0 1 -1 -1 800  711.125 49.7341 30.685 6.18495 1.53868 0.731992 0
2010  4 3  0 0 1 -1 -1 800  682.605 103.008 8.13579 4.58872 1.66255 0 0
2011  4 3  0 0 1 -1 -1 800  621.329 148.618 26.3954 1.82475 1.83335 0 0
2012  4 3  0 0 1 -1 -1 800  594.526 152.26 43.9688 9.24534 0 0 0
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

