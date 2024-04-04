#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Apr 04 12:05:40 2024
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
-999 1 1 149733 0.05
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
2007 1 1 2.46024e+06 0.05
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
1990 10 2 644422 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.38282e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 6.78941e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 3.02967e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.23211e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.63785e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.62428e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.54597e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 7.48025e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 9.60137e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.08734e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.89135e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.75365e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 2.11728e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.49713e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 6.83845e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.17676e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.73064e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.51497e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.91172e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.37612e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 4.05404e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.6316e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.45324e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.39692e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 690359 0.1 #_orig_obs: 854127 survey2
1988 4 3 212731 0.1 #_orig_obs: 239407 survey2
1989 4 3 186757 0.1 #_orig_obs: 185762 survey2
1990 4 3 192026 0.1 #_orig_obs: 137981 survey2
1991 4 3 708616 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.16625e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 1.01952e+06 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 391449 0.1 #_orig_obs: 539130 survey2
1995 4 3 511443 0.1 #_orig_obs: 564396 survey2
1996 4 3 519266 0.1 #_orig_obs: 610556 survey2
1997 4 3 443400 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.41395e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.256e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.3824e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 616631 0.1 #_orig_obs: 715021 survey2
2002 4 3 548899 0.1 #_orig_obs: 568480 survey2
2003 4 3 681423 0.1 #_orig_obs: 836482 survey2
2004 4 3 443320 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.2051e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.54807e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.18036e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.27226e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 700622 0.1 #_orig_obs: 638168 survey2
2010 4 3 445722 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.70007e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.63541e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  65.1282 58.4734 58.4653 9.35722 8.57598 0 0
1986  1 1  0 0 1 -1 -1 200  26.3099 42.4682 100.402 16.0651 10.4233 2.06167 2.26937
1987  1 1  0 0 1 -1 -1 200  55.4758 17.065 73.7372 27.9437 18.2262 3.59557 3.95653
1988  1 1  0 0 1 -1 -1 200  68.2213 35.6481 29.6538 20.953 32.1108 6.42437 6.9886
1989  1 1  0 0 1 -1 -1 200  151.478 13.0772 18.5147 2.54452 7.23156 3.41907 3.73506
1990  1 1  0 0 1 -1 -1 200  176.01 16.9729 3.96337 3.05375 0 0 0
1991  1 1  0 0 1 -1 -1 200  82.9354 90.6142 23.4456 0.90675 0.849902 1.24816 0
1992  1 1  0 0 1 -1 -1 200  36.3663 39.9916 116.952 4.9562 0.771252 0.222855 0.739931
1993  1 1  0 0 1 -1 -1 200  89.1746 19.7689 57.7371 27.7153 5.60411 0 0
1994  1 1  0 0 1 -1 -1 200  101.912 39.7935 23.6946 11.1624 21.789 1.12775 0.520729
1995  1 1  0 0 1 -1 -1 200  59.9564 56.1222 59.1398 5.78568 10.9821 6.60045 1.41335
1996  1 1  0 0 1 -1 -1 200  175.62 5.47705 13.8105 2.40123 0.943439 0.553263 1.19464
1997  1 1  0 0 1 -1 -1 200  151.554 41.8283 3.48169 1.44952 1.68631 0 0
1998  1 1  0 0 1 -1 -1 200  66.2601 76.3494 54.714 0.750901 1.92548 0 0
1999  1 1  0 0 1 -1 -1 200  42.8696 36.2292 107.192 12.2054 0.675235 0.341951 0.486492
2000  1 1  0 0 1 -1 -1 200  69.6095 27.5043 60.786 28.0643 14.0359 0 0
2001  1 1  0 0 1 -1 -1 200  105.083 29.4596 30.751 10.9015 20.4009 3.40447 0
2002  1 1  0 0 1 -1 -1 200  52.3165 66.5751 50.1202 8.41146 12.1486 6.9175 3.51059
2003  1 1  0 0 1 -1 -1 200  163.121 6.64936 22.6503 2.81323 1.8915 0.845994 2.02886
2004  1 1  0 0 1 -1 -1 200  178.511 17.504 1.89033 1.05675 1.03805 0 0
2005  1 1  0 0 1 -1 -1 200  95.7536 82.611 21.6355 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  71.0384 45.2047 80.0491 3.70773 0 0 0
2007  1 1  0 0 1 -1 -1 200  66.8597 55.9512 61.3323 15.8568 0 0 0
2008  1 1  0 0 1 -1 -1 200  49.2773 46.294 86.6291 7.66904 10.1306 0 0
2009  1 1  0 0 1 -1 -1 200  166.786 7.85914 17.8326 4.94957 1.7975 0.775427 0
2010  1 1  0 0 1 -1 -1 200  140.311 49.7212 5.46535 1.87278 2.62998 0 0
2011  1 1  0 0 1 -1 -1 200  72.6925 71.0596 56.2479 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  66.9945 41.23 82.7288 9.04671 0 0 0
1990  10 2  0 0 1 -1 -1 200  11.5937 56.822 112.747 18.8369 0 0 0
1991  10 2  0 0 1 -1 -1 200  1.10476 61.2877 133.843 3.76473 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 194.462 5.53816 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 6.44193 144.735 48.8235 0 0 0
1994  10 2  0 0 1 -1 -1 200  1.27579 25.3077 127.675 41.6396 4.10197 0 0
1995  10 2  0 0 1 -1 -1 200  0 19.203 168.23 12.5672 0 0 0
1996  10 2  0 0 1 -1 -1 200  4.92724 7.80659 166.758 20.5086 0 0 0
1997  10 2  0 0 1 -1 -1 200  7.20895 100.967 70.6466 21.1777 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 29.2112 170.789 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 7.54098 178.082 14.377 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 8.23358 144.125 47.6414 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.1568 16.4447 143.53 38.8681 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 24.7832 155.701 19.5157 0 0 0
2003  10 2  0 0 1 -1 -1 200  2.9506 6.10578 175.28 15.1175 0.546369 0 0
2004  10 2  0 0 1 -1 -1 200  16.3184 81.1357 73.2489 28.5663 0.73072 0 0
2005  10 2  0 0 1 -1 -1 200  1.55542 67.4739 130.971 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 16.1039 178.168 5.72857 0 0 0
2007  10 2  0 0 1 -1 -1 200  0.62281 24.9546 145.229 29.1934 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 12.3249 175.68 11.9948 0 0 0
2009  10 2  0 0 1 -1 -1 200  3.7193 8.8 155.537 31.9434 0 0 0
2010  10 2  0 0 1 -1 -1 200  5.36991 95.086 78.5239 21.0202 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 32.769 164.998 2.23337 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 13.3301 173.465 13.2049 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 15.0094 163.038 21.9529 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 6.58188 170.455 22.9636 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 3.34147 149.012 47.647 0 0 0
1988  4 3  0 0 1 -1 -1 200  0.518817 12.706 116.342 68.6854 1.74805 0 0
1989  4 3  0 0 1 -1 -1 200  2.6428 10.6933 166.614 19.1336 0.916212 0 0
1990  4 3  0 0 1 -1 -1 200  10.2882 46.5017 119.583 23.6271 0 0 0
1991  4 3  0 0 1 -1 -1 200  0.983303 50.3674 143.932 4.645 0.0724211 0 0
1992  4 3  0 0 1 -1 -1 200  0 5.91405 187.441 6.64493 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 4.72124 139.364 55.915 0 0 0
1994  4 3  0 0 1 -1 -1 200  1.0623 19.4439 127.661 50.216 1.61691 0 0
1995  4 3  0 0 1 -1 -1 200  0.334889 14.6927 170.585 13.9387 0.449095 0 0
1996  4 3  0 0 1 -1 -1 200  4.07733 5.96081 165.74 24.2219 0 0 0
1997  4 3  0 0 1 -1 -1 200  6.65693 86.1492 79.3327 27.5432 0.318044 0 0
1998  4 3  0 0 1 -1 -1 200  0 22.3469 175.595 2.05819 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 5.50163 177.681 16.817 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 6.00103 139.833 54.1657 0 0 0
2001  4 3  0 0 1 -1 -1 200  0.940465 12.3648 143.105 42.2724 1.31686 0 0
2002  4 3  0 0 1 -1 -1 200  0.319059 19.0314 157.97 22.1372 0.54218 0 0
2003  4 3  0 0 1 -1 -1 200  2.42721 4.63887 174.633 18.0951 0.205478 0 0
2004  4 3  0 0 1 -1 -1 200  14.6072 67.1735 80.44 37.7793 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.28962 52.2826 144.204 2.22421 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 9.04604 184.98 5.97444 0 0 0
2007  4 3  0 0 1 -1 -1 200  0.299053 11.874 159.144 28.6825 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 8.55003 178.152 13.2981 0 0 0
2009  4 3  0 0 1 -1 -1 200  2.71704 6.01821 155.424 35.8408 0 0 0
2010  4 3  0 0 1 -1 -1 200  4.46051 74.3816 94.1181 27.0398 0 0 0
2011  4 3  0 0 1 -1 -1 200  0.432348 19.9403 177.22 2.40735 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 7.75995 178.284 13.9561 0 0 0
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

