#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 20 12:15:36 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2002 #_EndYr
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
-999 1 1 78689.2 0.05
1985 1 1 194804 0.05
1986 1 1 173166 0.05
1987 1 1 92711.3 0.05
1988 1 1 25297.1 0.05
1989 1 1 52045.2 0.05
1990 1 1 105700 0.05
1991 1 1 155568 0.05
1992 1 1 316552 0.05
1993 1 1 504594 0.05
1994 1 1 241518 0.05
1995 1 1 153878 0.05
1996 1 1 362728 0.05
1997 1 1 299663 0.05
1998 1 1 716199 0.05
1999 1 1 523685 0.05
2000 1 1 383964 0.05
2001 1 1 252228 0.05
2002 1 1 284433 0.05
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
1990 10 2 2.65575e+06 0.1 #_orig_obs: 753778 survey1
1991 10 2 2.04312e+06 0.1 #_orig_obs: 3.03948e+06 survey1
1992 10 2 1.11531e+06 0.1 #_orig_obs: 5.01039e+06 survey1
1993 10 2 1.18582e+06 0.1 #_orig_obs: 1.02921e+06 survey1
1994 10 2 1.19321e+06 0.1 #_orig_obs: 538085 survey1
1995 10 2 802199 0.1 #_orig_obs: 1.35469e+06 survey1
1996 10 2 2.1559e+06 0.1 #_orig_obs: 855800 survey1
1997 10 2 2.77941e+06 0.1 #_orig_obs: 1.08518e+06 survey1
1998 10 2 1.59321e+06 0.1 #_orig_obs: 6.31316e+06 survey1
1999 10 2 924721 0.1 #_orig_obs: 2.35408e+06 survey1
2000 10 2 1.27756e+06 0.1 #_orig_obs: 1.0043e+06 survey1
2001 10 2 1.55833e+06 0.1 #_orig_obs: 599574 survey1
2002 10 2 876679 0.1 #_orig_obs: 1.47872e+06 survey1
1985 4 3 802703 0.1 #_orig_obs: 1.73725e+06 survey2
1986 4 3 360045 0.1 #_orig_obs: 1.74265e+06 survey2
1987 4 3 279088 0.1 #_orig_obs: 887516 survey2
1988 4 3 225680 0.1 #_orig_obs: 173052 survey2
1989 4 3 385050 0.1 #_orig_obs: 179095 survey2
1990 4 3 1.12855e+06 0.1 #_orig_obs: 122240 survey2
1991 4 3 791040 0.1 #_orig_obs: 495675 survey2
1992 4 3 407059 0.1 #_orig_obs: 2.07029e+06 survey2
1993 4 3 501056 0.1 #_orig_obs: 984464 survey2
1994 4 3 493915 0.1 #_orig_obs: 288569 survey2
1995 4 3 308826 0.1 #_orig_obs: 592388 survey2
1996 4 3 941817 0.1 #_orig_obs: 369457 survey2
1997 4 3 1.16275e+06 0.1 #_orig_obs: 205217 survey2
1998 4 3 646409 0.1 #_orig_obs: 753599 survey2
1999 4 3 373494 0.1 #_orig_obs: 1.54452e+06 survey2
2000 4 3 551689 0.1 #_orig_obs: 517081 survey2
2001 4 3 655670 0.1 #_orig_obs: 229964 survey2
2002 4 3 341252 0.1 #_orig_obs: 344393 survey2
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
1985  1 1  0 0 1 -1 -1 800  127.197 260.6 327.654 72.0446 10.4245 2.07939 0
1986  1 1  0 0 1 -1 -1 800  41.6236 302.699 370.538 71.7779 11.0073 1.78581 0.568593
1987  1 1  0 0 1 -1 -1 800  60.0145 114.598 513.49 96.2185 12.7598 2.91902 0
1988  1 1  0 0 1 -1 -1 800  89.1594 221.398 269.942 191.164 23.6837 4.65268 0
1989  1 1  0 0 1 -1 -1 800  204.198 197.564 302.544 61.6155 28.9918 3.84804 1.23891
1990  1 1  0 0 1 -1 -1 800  381.854 243.061 134.003 33.0723 4.77791 3.23111 0
1991  1 1  0 0 1 -1 -1 800  123.836 482.006 176.715 14.0237 2.53288 0.427943 0.458816
1992  1 1  0 0 1 -1 -1 800  45.3943 224.791 499.476 28.1402 2.1989 0 0
1993  1 1  0 0 1 -1 -1 800  151.559 155.632 357.905 128.278 5.90047 0.725551 0
1994  1 1  0 0 1 -1 -1 800  189.204 378.649 171.884 43.842 15.1395 1.00297 0.27795
1995  1 1  0 0 1 -1 -1 800  87.6939 338.752 349.672 17.8732 3.92343 2.08473 0
1996  1 1  0 0 1 -1 -1 800  350.11 150.816 254.738 41.6374 1.82397 0.501316 0.372962
1997  1 1  0 0 1 -1 -1 800  256.353 443.063 83.9784 16.6047 0 0 0
1998  1 1  0 0 1 -1 -1 800  90.6041 403.041 297.708 8.64694 0 0 0
1999  1 1  0 0 1 -1 -1 800  73.3129 234.868 455.163 35.5029 0.848721 0.304026 0
2000  1 1  0 0 1 -1 -1 800  230.618 216.338 280.325 67.2389 5.47975 0 0
2001  1 1  0 0 1 -1 -1 800  234.677 388.633 152.205 19.0154 5.46906 0 0
2002  1 1  0 0 1 -1 -1 800  77.2991 399.088 307.913 15.6997 0 0 0
1990  10 2  0 0 1 -1 -1 800  715.445 66.9852 9.44284 4.34091 1.61618 1.56748 0.602594
1991  10 2  0 0 1 -1 -1 800  485.511 280.225 27.1442 3.9434 3.17622 0 0
1992  10 2  0 0 1 -1 -1 800  362.702 264.953 152.318 15.8845 2.3252 0.880533 0.936502
1993  10 2  0 0 1 -1 -1 800  628.639 90.5088 43.2026 32.2628 4.23529 0.557758 0.593539
1994  10 2  0 0 1 -1 -1 800  595.989 168.938 16.6693 8.64017 8.32728 1.43648 0
1995  10 2  0 0 1 -1 -1 800  458.462 259.779 67.793 6.49334 3.69408 3.77851 0
1996  10 2  0 0 1 -1 -1 800  735.509 43.7635 14.3115 5.06211 0.654414 0.345194 0.354238
1997  10 2  0 0 1 -1 -1 800  633.873 156.028 10.0987 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  465.227 288.167 42.7958 2.18882 0.99203 0.43106 0.19919
1999  10 2  0 0 1 -1 -1 800  476.923 216.226 90.7378 14.4122 0.963352 0.73742 0
2000  10 2  0 0 1 -1 -1 800  677.222 87.2784 21.3424 11.2337 2.92339 0 0
2001  10 2  0 0 1 -1 -1 800  634.012 147.755 12.2157 3.15087 2.25793 0.608516 0
2002  10 2  0 0 1 -1 -1 800  423.398 313.48 55.5428 4.79537 1.5078 1.00465 0.271524
1985  4 3  0 0 1 -1 -1 800  608.014 131.647 39.0552 13.801 7.48256 0 0
1986  4 3  0 0 1 -1 -1 800  381.048 292.74 84.4167 26.2966 10.1665 3.50672 1.82504
1987  4 3  0 0 1 -1 -1 800  530.397 106.716 111.407 33.7158 11.339 4.11757 2.30742
1988  4 3  0 0 1 -1 -1 800  548.476 143.193 40.2851 46.2565 14.6081 4.47496 2.7059
1989  4 3  0 0 1 -1 -1 800  682.983 69.7446 25.0662 8.22122 9.77197 2.75981 1.4529
1990  4 3  0 0 1 -1 -1 800  738.433 49.8922 6.60402 2.60266 0.938081 1.04715 0.48285
1991  4 3  0 0 1 -1 -1 800  549.333 226.239 24.4283 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  435.68 228.749 121.502 14.069 0 0 0
1993  4 3  0 0 1 -1 -1 800  657.153 72.8952 42.4779 23.9493 3.52431 0 0
1994  4 3  0 0 1 -1 -1 800  635.027 136.797 15.5975 6.26828 5.25467 1.0553 0
1995  4 3  0 0 1 -1 -1 800  522.539 214.486 53.369 4.34988 2.37678 2.87933 0
1996  4 3  0 0 1 -1 -1 800  745.279 34.8551 15.0765 3.87286 0.406198 0.510616 0
1997  4 3  0 0 1 -1 -1 800  667.745 123.984 8.27083 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  506.986 244.193 48.821 0 0 0 0
1999  4 3  0 0 1 -1 -1 800  520.858 179.668 87.5251 10.7547 0.623819 0.301279 0.269237
2000  4 3  0 0 1 -1 -1 800  694.741 70.8823 23.5954 8.89489 1.63441 0.115549 0.136739
2001  4 3  0 0 1 -1 -1 800  665.231 118.85 11.7589 2.31212 1.8472 0 0
2002  4 3  0 0 1 -1 -1 800  478.869 264.947 50.7031 5.48058 0 0 0
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

