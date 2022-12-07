#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Dec 07 12:02:10 2022
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
-999 1 1 69433.6 0.05
1985 1 1 16205.2 0.2
1986 1 1 14453 0.2
1987 1 1 7331.58 0.2
1988 1 1 1834.92 0.2
1989 1 1 3238.65 0.2
1990 1 1 61217.6 0.2
1991 1 1 104584 0.2
1992 1 1 289335 0.2
1993 1 1 468278 0.2
1994 1 1 234038 0.2
1995 1 1 119105 0.2
1996 1 1 339306 0.2
1997 1 1 372572 0.2
1998 1 1 867843 0.2
1999 1 1 645147 0.2
2000 1 1 395750 0.2
2001 1 1 283869 0.2
2002 1 1 358746 0.2
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
1990 10 2 561858 0.5 #_orig_obs: 615377 survey1
1991 10 2 2.32253e+06 0.5 #_orig_obs: 5.72451e+06 survey1
1992 10 2 6.69615e+06 0.5 #_orig_obs: 1.15449e+07 survey1
1993 10 2 2.27344e+06 0.5 #_orig_obs: 4.1733e+06 survey1
1994 10 2 811944 0.5 #_orig_obs: 437096 survey1
1995 10 2 1.46001e+06 0.5 #_orig_obs: 2.95117e+06 survey1
1996 10 2 1.00727e+06 0.5 #_orig_obs: 962787 survey1
1997 10 2 747430 0.5 #_orig_obs: 398559 survey1
1998 10 2 2.07953e+06 0.5 #_orig_obs: 5.19944e+06 survey1
1999 10 2 1.95411e+06 0.5 #_orig_obs: 1.2382e+06 survey1
2000 10 2 645115 0.5 #_orig_obs: 491605 survey1
2001 10 2 511458 0.5 #_orig_obs: 629262 survey1
2002 10 2 1.36792e+06 0.5 #_orig_obs: 194347 survey1
1985 4 3 754000 0.5 #_orig_obs: 2.4376e+06 survey2
1986 4 3 771885 0.5 #_orig_obs: 4.48772e+06 survey2
1987 4 3 704442 0.5 #_orig_obs: 1.93581e+06 survey2
1988 4 3 274065 0.5 #_orig_obs: 88146.9 survey2
1989 4 3 194082 0.5 #_orig_obs: 208560 survey2
1990 4 3 186522 0.5 #_orig_obs: 223337 survey2
1991 4 3 756509 0.5 #_orig_obs: 227198 survey2
1992 4 3 1.93777e+06 0.5 #_orig_obs: 1.89336e+06 survey2
1993 4 3 843764 0.5 #_orig_obs: 672533 survey2
1994 4 3 313503 0.5 #_orig_obs: 142457 survey2
1995 4 3 460979 0.5 #_orig_obs: 945722 survey2
1996 4 3 419730 0.5 #_orig_obs: 441389 survey2
1997 4 3 329539 0.5 #_orig_obs: 253735 survey2
1998 4 3 949146 0.5 #_orig_obs: 1.40229e+06 survey2
1999 4 3 848508 0.5 #_orig_obs: 512918 survey2
2000 4 3 331118 0.5 #_orig_obs: 403577 survey2
2001 4 3 233078 0.5 #_orig_obs: 79351.4 survey2
2002 4 3 541404 0.5 #_orig_obs: 387126 survey2
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
1985  1 1  0 0 1 -1 -1 800  111.514 270.61 339.792 66.0797 9.87075 2.13377 0
1986  1 1  0 0 1 -1 -1 800  31.6247 296.991 379.459 78.2548 11.3012 1.78272 0.586493
1987  1 1  0 0 1 -1 -1 800  43.7266 105.172 521.585 109.431 16.7265 3.35844 0
1988  1 1  0 0 1 -1 -1 800  51.4609 213.307 271.754 221.875 34.3974 5.53505 1.67098
1989  1 1  0 0 1 -1 -1 800  279.326 130.503 285.859 60.2184 36.3252 5.92457 1.84338
1990  1 1  0 0 1 -1 -1 800  447.235 262.851 60.525 22.6376 3.64746 2.34864 0.755295
1991  1 1  0 0 1 -1 -1 800  83.704 548.665 159.682 5.59125 2.35855 0 0
1992  1 1  0 0 1 -1 -1 800  26.5612 176.64 568.884 26.7303 1.18456 0 0
1993  1 1  0 0 1 -1 -1 800  101.7 127.812 365.651 196.475 7.81886 0.243037 0.299524
1994  1 1  0 0 1 -1 -1 800  161.661 351.697 178.457 70.0922 36.0331 2.06019 0
1995  1 1  0 0 1 -1 -1 800  56.2223 358.866 348.517 22.6695 8.17077 5.55397 0
1996  1 1  0 0 1 -1 -1 800  355.467 113.795 280.206 45.7058 4.82648 0 0
1997  1 1  0 0 1 -1 -1 800  225.279 496.731 57.605 20.385 0 0 0
1998  1 1  0 0 1 -1 -1 800  70.4006 410.664 312.232 6.70338 0 0 0
1999  1 1  0 0 1 -1 -1 800  51.0667 236.732 470.879 40.0717 1.25055 0 0
2000  1 1  0 0 1 -1 -1 800  267.423 186.767 272.204 66.3986 7.2072 0 0
2001  1 1  0 0 1 -1 -1 800  229.084 449.507 101.841 14.2407 5.32713 0 0
2002  1 1  0 0 1 -1 -1 800  62.2087 423.663 304.58 7.68058 1.86755 0 0
1990  10 2  0 0 1 -1 -1 800  50.715 236.004 423.89 88.3671 1.024 0 0
1991  10 2  0 0 1 -1 -1 800  4.49755 235.317 549.427 10.7588 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 30.1343 750.295 19.5705 0 0 0
1993  10 2  0 0 1 -1 -1 800  3.00646 29.0402 581.368 186.049 0.536377 0 0
1994  10 2  0 0 1 -1 -1 800  8.81873 147.113 517.736 121.774 4.55757 0 0
1995  10 2  0 0 1 -1 -1 800  0 93.087 681.341 25.572 0 0 0
1996  10 2  0 0 1 -1 -1 800  18.152 43.4005 668.52 69.9276 0 0 0
1997  10 2  0 0 1 -1 -1 800  24.7012 410.354 308.248 56.6965 0 0 0
1998  10 2  0 0 1 -1 -1 800  3.31002 142.581 647.598 6.51168 0 0 0
1999  10 2  0 0 1 -1 -1 800  1.66468 57.3961 702.337 38.5488 0.0534011 0 0
2000  10 2  0 0 1 -1 -1 800  15.2514 76.779 604.015 103.104 0.850315 0 0
2001  10 2  0 0 1 -1 -1 800  21.3674 310.888 427.895 39.8496 0 0 0
2002  10 2  0 0 1 -1 -1 800  2.63304 136.045 651.118 10.2041 0 0 0
1985  4 3  0 0 1 -1 -1 800  0.0250058 102.935 604.857 92.1837 0 0 0
1986  4 3  0 0 1 -1 -1 800  0.00638268 100.718 601.995 97.2813 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 28.5891 662.397 109.014 0 0 0
1988  4 3  0 0 1 -1 -1 800  0.0106251 74.344 442.254 280.672 2.71886 0 0
1989  4 3  0 0 1 -1 -1 800  0.0776101 61.6284 631.124 103.28 3.89079 0 0
1990  4 3  0 0 1 -1 -1 800  0.327503 329.614 364.464 105.595 0 0 0
1991  4 3  0 0 1 -1 -1 800  0.0296426 330.835 456.573 12.5618 0 0 0
1992  4 3  0 0 1 -1 -1 800  0.00422652 47.1804 726.538 26.277 0 0 0
1993  4 3  0 0 1 -1 -1 800  0.0175068 37.9444 541.93 220.108 0 0 0
1994  4 3  0 0 1 -1 -1 800  0.04923 185.412 470.903 139.33 4.30526 0 0
1995  4 3  0 0 1 -1 -1 800  0.0123969 134.885 632.911 31.4816 0.709321 0 0
1996  4 3  0 0 1 -1 -1 800  0.0941282 52.6983 665.789 81.4186 0 0 0
1997  4 3  0 0 1 -1 -1 800  0.120908 464.91 274.6 60.3685 0 0 0
1998  4 3  0 0 1 -1 -1 800  0.0157586 160.698 632.115 7.1705 0 0 0
1999  4 3  0 0 1 -1 -1 800  0.00836086 67.2873 688.899 43.8052 0 0 0
2000  4 3  0 0 1 -1 -1 800  0.06451 79.689 608.998 111.248 0 0 0
2001  4 3  0 0 1 -1 -1 800  0.1014 348.843 407.725 42.5328 0.797287 0 0
2002  4 3  0 0 1 -1 -1 800  0.0144149 169.939 618.239 11.8078 0 0 0
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

