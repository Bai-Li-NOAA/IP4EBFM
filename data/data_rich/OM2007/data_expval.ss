#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Nov 07 10:31:24 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2007 #_EndYr
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
-999 1 1 69843.4 0.05
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
1996 1 1 343212 0.05
1997 1 1 314013 0.05
1998 1 1 775946 0.05
1999 1 1 602429 0.05
2000 1 1 495328 0.05
2001 1 1 346676 0.05
2002 1 1 374297 0.05
2003 1 1 387980 0.05
2004 1 1 432273 0.05
2005 1 1 365339 0.05
2006 1 1 669543 0.05
2007 1 1 315938 0.05
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
1990 10 2 2.50578e+06 0.2 #_orig_obs: 565246 survey1
1991 10 2 1.68914e+06 0.2 #_orig_obs: 3.17686e+06 survey1
1992 10 2 840786 0.2 #_orig_obs: 6.37058e+06 survey1
1993 10 2 947965 0.2 #_orig_obs: 1.31436e+06 survey1
1994 10 2 1.03749e+06 0.2 #_orig_obs: 702016 survey1
1995 10 2 679120 0.2 #_orig_obs: 1.44464e+06 survey1
1996 10 2 1.9727e+06 0.2 #_orig_obs: 819120 survey1
1997 10 2 2.50721e+06 0.2 #_orig_obs: 956532 survey1
1998 10 2 1.3907e+06 0.2 #_orig_obs: 5.72099e+06 survey1
1999 10 2 761709 0.2 #_orig_obs: 1.80107e+06 survey1
2000 10 2 991062 0.2 #_orig_obs: 939122 survey1
2001 10 2 1.17608e+06 0.2 #_orig_obs: 582386 survey1
2002 10 2 563340 0.2 #_orig_obs: 1.16078e+06 survey1
2003 10 2 877939 0.2 #_orig_obs: 315524 survey1
2004 10 2 1.4467e+06 0.2 #_orig_obs: 216162 survey1
2005 10 2 779703 0.2 #_orig_obs: 1.39021e+06 survey1
2006 10 2 656944 0.2 #_orig_obs: 1.09307e+06 survey1
2007 10 2 1.13782e+06 0.2 #_orig_obs: 747254 survey1
1985 4 3 581731 0.2 #_orig_obs: 1.6165e+06 survey2
1986 4 3 262060 0.2 #_orig_obs: 1.81081e+06 survey2
1987 4 3 189192 0.2 #_orig_obs: 798204 survey2
1988 4 3 142575 0.2 #_orig_obs: 203427 survey2
1989 4 3 314674 0.2 #_orig_obs: 202875 survey2
1990 4 3 1.09302e+06 0.2 #_orig_obs: 113055 survey2
1991 4 3 676733 0.2 #_orig_obs: 381334 survey2
1992 4 3 318164 0.2 #_orig_obs: 2.33967e+06 survey2
1993 4 3 406710 0.2 #_orig_obs: 990740 survey2
1994 4 3 442264 0.2 #_orig_obs: 322724 survey2
1995 4 3 273492 0.2 #_orig_obs: 429031 survey2
1996 4 3 875532 0.2 #_orig_obs: 555860 survey2
1997 4 3 1.08028e+06 0.2 #_orig_obs: 278987 survey2
1998 4 3 591077 0.2 #_orig_obs: 856773 survey2
1999 4 3 324710 0.2 #_orig_obs: 1.86496e+06 survey2
2000 4 3 446512 0.2 #_orig_obs: 656768 survey2
2001 4 3 522323 0.2 #_orig_obs: 158660 survey2
2002 4 3 240923 0.2 #_orig_obs: 243983 survey2
2003 4 3 396783 0.2 #_orig_obs: 219397 survey2
2004 4 3 660576 0.2 #_orig_obs: 38808.9 survey2
2005 4 3 332824 0.2 #_orig_obs: 146939 survey2
2006 4 3 309567 0.2 #_orig_obs: 647377 survey2
2007 4 3 517067 0.2 #_orig_obs: 313413 survey2
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
1985  1 1  0 0 1 -1 -1 800  112.205 265.769 340.842 68.5873 10.3381 2.25792 0
1986  1 1  0 0 1 -1 -1 800  33.0469 291.187 380.022 81.3772 11.8603 1.88229 0.62381
1987  1 1  0 0 1 -1 -1 800  43.4305 106.213 516.804 112.586 17.4378 3.52831 0
1988  1 1  0 0 1 -1 -1 800  66.5971 200.079 270.892 220.433 34.6514 5.63749 1.7092
1989  1 1  0 0 1 -1 -1 800  223.646 174.365 289.231 65.7608 38.623 6.37416 2.0004
1990  1 1  0 0 1 -1 -1 800  406.62 255.037 100.133 29.0538 4.99306 3.13953 1.02319
1991  1 1  0 0 1 -1 -1 800  96.203 524.892 165.824 9.79521 3.28572 0 0
1992  1 1  0 0 1 -1 -1 800  30.0256 197.702 542.867 27.4996 1.90612 0 0
1993  1 1  0 0 1 -1 -1 800  124.921 129.239 367.991 169.752 7.31004 0.388338 0.398504
1994  1 1  0 0 1 -1 -1 800  181.309 372.771 158.471 59.223 26.4218 1.80393 0
1995  1 1  0 0 1 -1 -1 800  77.1964 357.681 336.808 18.3092 6.20767 3.79842 0
1996  1 1  0 0 1 -1 -1 800  323.142 150.837 278.833 47.1885 0 0 0
1997  1 1  0 0 1 -1 -1 800  231.846 462.035 84.5398 18.1129 2.96529 0.199023 0.301756
1998  1 1  0 0 1 -1 -1 800  77.8697 408.137 304.21 7.62408 2.15857 0 0
1999  1 1  0 0 1 -1 -1 800  61.0072 237.44 460.249 39.7065 1.08764 0.50958 0
2000  1 1  0 0 1 -1 -1 800  213.169 229.095 278.242 71.7388 7.75564 0 0
2001  1 1  0 0 1 -1 -1 800  233.987 416.877 129.387 13.5841 5.12602 1.03915 0
2002  1 1  0 0 1 -1 -1 800  70.0996 460.216 260.624 7.20914 1.02188 0.627852 0.201332
2003  1 1  0 0 1 -1 -1 800  227.565 182.569 365.449 23.1775 0.813486 0.176151 0.250199
2004  1 1  0 0 1 -1 -1 800  337.434 375.027 71.7799 14.1134 1.43028 0.089015 0.125948
2005  1 1  0 0 1 -1 -1 800  91.9662 539.745 166.001 2.28767 0 0 0
2006  1 1  0 0 1 -1 -1 800  170.01 253.497 362.365 14.1283 0 0 0
2007  1 1  0 0 1 -1 -1 800  336.114 346.034 109.735 8.11706 0 0 0
1990  10 2  0 0 1 -1 -1 800  733.172 54.4866 5.64305 3.14731 3.55078 0 0
1991  10 2  0 0 1 -1 -1 800  464.66 303.101 26.094 2.90778 1.63183 0.581049 1.02469
1992  10 2  0 0 1 -1 -1 800  329.002 257.99 190.371 18.3388 2.06019 0.969735 1.26883
1993  10 2  0 0 1 -1 -1 800  623.735 73.9903 49.0125 46.7639 6.49781 0 0
1994  10 2  0 0 1 -1 -1 800  614.253 145.335 14.5827 11.1769 12.8866 1.76614 0
1995  10 2  0 0 1 -1 -1 800  464.424 254.401 62.6769 6.58027 5.50119 5.62886 0.788338
1996  10 2  0 0 1 -1 -1 800  738.865 38.7646 15.372 6.99794 0 0 0
1997  10 2  0 0 1 -1 -1 800  642.553 157.447 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  473.613 277.933 48.4541 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  480.348 211.127 89.5261 16.5652 1.21317 0.69992 0.520978
2000  10 2  0 0 1 -1 -1 800  691.077 78.8366 16.0059 10.3884 3.69188 0 0
2001  10 2  0 0 1 -1 -1 800  662.174 126.423 6.84719 1.76377 2.79167 0 0
2002  10 2  0 0 1 -1 -1 800  440.833 318.89 35.616 2.24698 0.891409 1.05458 0.4685
2003  10 2  0 0 1 -1 -1 800  713.626 61.1809 21.1034 3.30861 0.344732 0.146513 0.290198
2004  10 2  0 0 1 -1 -1 800  718.237 81.7629 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  473.592 306.629 19.7786 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  684.234 98.5626 17.2037 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  721.323 74.7471 3.08852 0.841385 0 0 0
1985  4 3  0 0 1 -1 -1 800  605.031 131.844 40.808 14.1736 8.14249 0 0
1986  4 3  0 0 1 -1 -1 800  361.661 293.167 92.3196 34.125 12.1779 6.54929 0
1987  4 3  0 0 1 -1 -1 800  486.301 109.39 128.326 48.275 18.3149 6.03165 3.36227
1988  4 3  0 0 1 -1 -1 800  510.217 140.967 45.9822 64.6347 24.8961 8.7001 4.60222
1989  4 3  0 0 1 -1 -1 800  703.743 50.474 20.199 7.92812 11.4022 4.04091 2.21244
1990  4 3  0 0 1 -1 -1 800  747.426 43.5032 4.26727 2.10433 0.870595 1.16706 0.661755
1991  4 3  0 0 1 -1 -1 800  515.133 259.888 24.9791 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  386.358 235.597 160.387 13.8538 1.54428 0.845693 1.4138
1993  4 3  0 0 1 -1 -1 800  649.228 63.1069 46.7703 36.0946 4.80059 0 0
1994  4 3  0 0 1 -1 -1 800  643.183 124.08 13.6767 8.56214 10.4979 0 0
1995  4 3  0 0 1 -1 -1 800  512.967 220.752 52.1 4.80695 3.91686 5.45746 0
1996  4 3  0 0 1 -1 -1 800  745.321 32.919 16.133 5.62655 0 0 0
1997  4 3  0 0 1 -1 -1 800  665.981 124.707 5.94041 2.12921 1.24242 0 0
1998  4 3  0 0 1 -1 -1 800  499.131 247.866 49.1284 2.04759 1.82739 0 0
1999  4 3  0 0 1 -1 -1 800  504.171 185.363 94.8807 13.6353 0.872117 0.557446 0.520688
2000  4 3  0 0 1 -1 -1 800  691.613 71.6362 23.7498 10.187 2.33252 0.188107 0.293146
2001  4 3  0 0 1 -1 -1 800  671.483 114.969 9.71462 1.69458 2.13916 0 0
2002  4 3  0 0 1 -1 -1 800  462.634 289.32 44.0444 2.02252 0.661461 0.848009 0.468927
2003  4 3  0 0 1 -1 -1 800  711.369 54.8928 29.9401 3.15594 0.252636 0.113263 0.276444
2004  4 3  0 0 1 -1 -1 800  715.814 78.3016 4.07211 1.81252 0 0 0
2005  4 3  0 0 1 -1 -1 800  497.88 278.231 23.8888 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  662.069 97.5548 37.6532 2.7227 0 0 0
2007  4 3  0 0 1 -1 -1 800  720.269 72.5367 6.28793 0.906687 0 0 0
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

