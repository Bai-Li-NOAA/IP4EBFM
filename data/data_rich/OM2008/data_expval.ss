#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Nov 07 10:13:53 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2008 #_EndYr
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
-999 1 1 74560.8 0.05
1985 1 1 13603.9 0.05
1986 1 1 12608.1 0.05
1987 1 1 6965.11 0.05
1988 1 1 1875.42 0.05
1989 1 1 3547.84 0.05
1990 1 1 75299.6 0.05
1991 1 1 113407 0.05
1992 1 1 249129 0.05
1993 1 1 416432 0.05
1994 1 1 203465 0.05
1995 1 1 128792 0.05
1996 1 1 343213 0.05
1997 1 1 314013 0.05
1998 1 1 775950 0.05
1999 1 1 602430 0.05
2000 1 1 495331 0.05
2001 1 1 346676 0.05
2002 1 1 374296 0.05
2003 1 1 387901 0.05
2004 1 1 432279 0.05
2005 1 1 365321 0.05
2006 1 1 670610 0.05
2007 1 1 315903 0.05
2008 1 1 314636 0.05
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
1990 10 2 2.49899e+06 0.2 #_orig_obs: 565246 survey1
1991 10 2 1.6851e+06 0.2 #_orig_obs: 3.17686e+06 survey1
1992 10 2 841057 0.2 #_orig_obs: 6.37058e+06 survey1
1993 10 2 944089 0.2 #_orig_obs: 1.31436e+06 survey1
1994 10 2 1.03164e+06 0.2 #_orig_obs: 702016 survey1
1995 10 2 676640 0.2 #_orig_obs: 1.44464e+06 survey1
1996 10 2 1.95299e+06 0.2 #_orig_obs: 819120 survey1
1997 10 2 2.479e+06 0.2 #_orig_obs: 956532 survey1
1998 10 2 1.37843e+06 0.2 #_orig_obs: 5.72099e+06 survey1
1999 10 2 757179 0.2 #_orig_obs: 1.80107e+06 survey1
2000 10 2 985309 0.2 #_orig_obs: 939122 survey1
2001 10 2 1.17456e+06 0.2 #_orig_obs: 582386 survey1
2002 10 2 568059 0.2 #_orig_obs: 1.16078e+06 survey1
2003 10 2 902861 0.2 #_orig_obs: 315524 survey1
2004 10 2 1.56495e+06 0.2 #_orig_obs: 216162 survey1
2005 10 2 905870 0.2 #_orig_obs: 1.39021e+06 survey1
2006 10 2 1.06559e+06 0.2 #_orig_obs: 1.09307e+06 survey1
2007 10 2 1.81199e+06 0.2 #_orig_obs: 747254 survey1
2008 10 2 1.05627e+06 0.2 #_orig_obs: 3.34384e+06 survey1
1985 4 3 594844 0.2 #_orig_obs: 1.6165e+06 survey2
1986 4 3 266861 0.2 #_orig_obs: 1.81081e+06 survey2
1987 4 3 189700 0.2 #_orig_obs: 798204 survey2
1988 4 3 141316 0.2 #_orig_obs: 203427 survey2
1989 4 3 304721 0.2 #_orig_obs: 202875 survey2
1990 4 3 1.04472e+06 0.2 #_orig_obs: 113055 survey2
1991 4 3 649117 0.2 #_orig_obs: 381334 survey2
1992 4 3 305789 0.2 #_orig_obs: 2.33967e+06 survey2
1993 4 3 387641 0.2 #_orig_obs: 990740 survey2
1994 4 3 421609 0.2 #_orig_obs: 322724 survey2
1995 4 3 261785 0.2 #_orig_obs: 429031 survey2
1996 4 3 830889 0.2 #_orig_obs: 555860 survey2
1997 4 3 1.02534e+06 0.2 #_orig_obs: 278987 survey2
1998 4 3 563495 0.2 #_orig_obs: 856773 survey2
1999 4 3 310099 0.2 #_orig_obs: 1.86496e+06 survey2
2000 4 3 425638 0.2 #_orig_obs: 656768 survey2
2001 4 3 500585 0.2 #_orig_obs: 158660 survey2
2002 4 3 233601 0.2 #_orig_obs: 243983 survey2
2003 4 3 390812 0.2 #_orig_obs: 219397 survey2
2004 4 3 683205 0.2 #_orig_obs: 38808.9 survey2
2005 4 3 370066 0.2 #_orig_obs: 146939 survey2
2006 4 3 468569 0.2 #_orig_obs: 647377 survey2
2007 4 3 768643 0.2 #_orig_obs: 313413 survey2
2008 4 3 418209 0.2 #_orig_obs: 594616 survey2
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
1985  1 1  0 0 1 -1 -1 800  111.541 262.949 344.701 68.6481 10.046 2.11518 0
1986  1 1  0 0 1 -1 -1 800  32.3019 288.063 384.225 81.5372 11.5264 1.77512 0.571511
1987  1 1  0 0 1 -1 -1 800  41.9173 103.227 521.938 112.667 16.9496 3.30148 0
1988  1 1  0 0 1 -1 -1 800  64.8762 195.628 273.789 224.434 34.2679 5.41321 1.59169
1989  1 1  0 0 1 -1 -1 800  218.285 172.543 294.89 67.1742 38.9616 6.24363 1.90228
1990  1 1  0 0 1 -1 -1 800  402.453 254.221 103.961 30.129 5.08411 3.15388 0.997937
1991  1 1  0 0 1 -1 -1 800  95.759 520.582 170.182 10.1654 3.31151 0 0
1992  1 1  0 0 1 -1 -1 800  29.6759 194.442 546.242 27.748 1.89246 0 0
1993  1 1  0 0 1 -1 -1 800  123.349 127.608 371.104 169.968 7.20469 0.379295 0.386702
1994  1 1  0 0 1 -1 -1 800  180.769 370.148 161.469 59.7983 26.0628 1.75291 0
1995  1 1  0 0 1 -1 -1 800  76.9326 354.066 340.914 18.3723 6.07823 3.63744 0
1996  1 1  0 0 1 -1 -1 800  320.53 149.993 282.238 47.2389 0 0 0
1997  1 1  0 0 1 -1 -1 800  231.568 460.237 86.519 18.2706 2.92803 0.191843 0.285232
1998  1 1  0 0 1 -1 -1 800  77.7208 404.804 307.723 7.65268 2.09934 0 0
1999  1 1  0 0 1 -1 -1 800  60.7118 234.827 463.61 39.3129 1.05695 0.481265 0
2000  1 1  0 0 1 -1 -1 800  212.474 227.594 280.976 71.4595 7.49633 0 0
2001  1 1  0 0 1 -1 -1 800  234.608 414.59 131.332 13.4905 4.99357 0.985543 0
2002  1 1  0 0 1 -1 -1 800  70.5609 456.912 263.617 7.14545 0.983319 0.594783 0.186327
2003  1 1  0 0 1 -1 -1 800  228.105 179.978 367.793 22.9582 0.776142 0.162763 0.226994
2004  1 1  0 0 1 -1 -1 800  344.27 367.067 72.7654 14.3223 1.38177 0.0815281 0.111168
2005  1 1  0 0 1 -1 -1 800  98.4785 530.22 168.9 2.40113 0 0 0
2006  1 1  0 0 1 -1 -1 800  199.959 229.594 356.36 14.0869 0 0 0
2007  1 1  0 0 1 -1 -1 800  296.747 362.863 126.924 13.4656 0 0 0
2008  1 1  0 0 1 -1 -1 800  82.2792 477.26 231.677 8.78407 0 0 0
1990  10 2  0 0 1 -1 -1 800  731.748 55.2724 5.88133 3.34281 3.75507 0 0
1991  10 2  0 0 1 -1 -1 800  463.218 303.682 26.6576 3.06634 1.74328 0.610515 1.02254
1992  10 2  0 0 1 -1 -1 800  327.293 257.651 191.707 18.9027 2.17922 1.00683 1.25949
1993  10 2  0 0 1 -1 -1 800  621.253 74.4123 49.591 47.9946 6.74895 0 0
1994  10 2  0 0 1 -1 -1 800  612.881 145.746 14.7539 11.4604 13.366 1.79303 0
1995  10 2  0 0 1 -1 -1 800  463.586 254.463 63.1274 6.71034 5.66425 5.68466 0.764685
1996  10 2  0 0 1 -1 -1 800  738.085 39.2052 15.5612 7.14865 0 0 0
1997  10 2  0 0 1 -1 -1 800  641.675 158.325 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  472.986 278.404 48.6101 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  479.612 211.499 89.7419 16.7046 1.24365 0.702435 0.496011
2000  10 2  0 0 1 -1 -1 800  690.383 79.3181 16.0172 10.5332 3.74854 0 0
2001  10 2  0 0 1 -1 -1 800  661.937 126.617 6.84628 1.77238 2.82725 0 0
2002  10 2  0 0 1 -1 -1 800  441.445 318.29 35.6274 2.25355 0.89838 1.04778 0.437766
2003  10 2  0 0 1 -1 -1 800  713.507 61.0016 21.3816 3.35387 0.346579 0.142531 0.266616
2004  10 2  0 0 1 -1 -1 800  719.402 80.5981 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  485.748 294.156 20.0965 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  696.43 83.1463 20.424 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  696.991 94.8049 6.40531 1.79838 0 0 0
2008  10 2  0 0 1 -1 -1 800  454.866 306.971 34.832 2.45826 0.872941 0 0
1985  4 3  0 0 1 -1 -1 800  603.369 133.51 41.2704 14.0313 7.8186 0 0
1986  4 3  0 0 1 -1 -1 800  356.143 298.099 93.7394 33.9629 11.7335 6.32213 0
1987  4 3  0 0 1 -1 -1 800  480.673 111.084 132.314 48.7812 17.9416 5.82458 3.38137
1988  4 3  0 0 1 -1 -1 800  505.841 143.118 47.1544 66.0389 24.6594 8.50743 4.68146
1989  4 3  0 0 1 -1 -1 800  700.993 52.0062 20.9529 8.14928 11.552 4.04204 2.30453
1990  4 3  0 0 1 -1 -1 800  746.017 44.603 4.45165 2.16844 0.879239 1.18265 0.698463
1991  4 3  0 0 1 -1 -1 800  511.949 262.538 25.5132 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  383.435 237.346 161.541 13.8364 1.52716 0.832615 1.48156
1993  4 3  0 0 1 -1 -1 800  647.588 64.1907 47.4947 35.9722 4.75495 0 0
1994  4 3  0 0 1 -1 -1 800  641.606 125.736 13.9082 8.52755 10.2217 0 0
1995  4 3  0 0 1 -1 -1 800  510.876 222.768 52.5527 4.75224 3.77017 5.28089 0
1996  4 3  0 0 1 -1 -1 800  744.403 33.6122 16.3971 5.58768 0 0 0
1997  4 3  0 0 1 -1 -1 800  664.098 126.513 6.05789 2.11474 1.21682 0 0
1998  4 3  0 0 1 -1 -1 800  496.74 250.023 49.4493 2.02074 1.76702 0 0
1999  4 3  0 0 1 -1 -1 800  502.216 187.148 95.4288 13.3205 0.833911 0.529653 0.522915
2000  4 3  0 0 1 -1 -1 800  690.617 72.6982 23.9683 10.0209 2.22261 0.179111 0.29428
2001  4 3  0 0 1 -1 -1 800  670.407 116.102 9.79645 1.65213 2.04244 0 0
2002  4 3  0 0 1 -1 -1 800  461.738 290.385 44.0412 1.95824 0.620034 0.796101 0.461546
2003  4 3  0 0 1 -1 -1 800  711.412 54.9908 29.9226 3.06614 0.235907 0.10428 0.268316
2004  4 3  0 0 1 -1 -1 800  717.651 76.5532 4.04656 1.74937 0 0 0
2005  4 3  0 0 1 -1 -1 800  510.795 266.201 23.0036 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  686.985 78.2161 32.5294 2.26976 0 0 0
2007  4 3  0 0 1 -1 -1 800  706.827 83.9696 7.72559 1.47763 0 0 0
2008  4 3  0 0 1 -1 -1 800  491.403 272.621 35.9758 0 0 0 0
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

