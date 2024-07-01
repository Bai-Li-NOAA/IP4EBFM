#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Jul 01 11:17:07 2024
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
-999 1 1 149620 0.05
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
2006 1 1 2.60239e+06 0.05
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
1990 10 2 644428 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.38284e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 6.7894e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 3.02966e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.23212e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.63786e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.62428e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.54593e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 7.48032e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 9.60174e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.08741e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.89136e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.75367e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 2.1173e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.49713e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 6.83815e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.17692e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.73047e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.515e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.91168e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.37606e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 4.0547e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.63072e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.45321e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.39687e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 690343 0.1 #_orig_obs: 854127 survey2
1988 4 3 212729 0.1 #_orig_obs: 239407 survey2
1989 4 3 186756 0.1 #_orig_obs: 185762 survey2
1990 4 3 192026 0.1 #_orig_obs: 137981 survey2
1991 4 3 708616 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.16624e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 1.01951e+06 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 391447 0.1 #_orig_obs: 539130 survey2
1995 4 3 511439 0.1 #_orig_obs: 564396 survey2
1996 4 3 519262 0.1 #_orig_obs: 610556 survey2
1997 4 3 443392 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.41389e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.25595e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.38243e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 616632 0.1 #_orig_obs: 715021 survey2
2002 4 3 548899 0.1 #_orig_obs: 568480 survey2
2003 4 3 681424 0.1 #_orig_obs: 836482 survey2
2004 4 3 443318 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.20503e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.54799e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.18051e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.27226e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 700631 0.1 #_orig_obs: 638168 survey2
2010 4 3 445720 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.70015e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.63554e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  65.128 58.4732 58.4653 9.35755 8.57601 0 0
1986  1 1  0 0 1 -1 -1 200  26.31 42.4683 100.403 16.0648 10.4231 2.06149 2.26933
1987  1 1  0 0 1 -1 -1 200  55.4759 17.0651 73.7385 27.9438 18.2252 3.59526 3.95632
1988  1 1  0 0 1 -1 -1 200  68.2213 35.6483 29.6546 20.9537 32.1103 6.42368 6.98822
1989  1 1  0 0 1 -1 -1 200  151.478 13.0772 18.5151 2.54463 7.23165 3.41883 3.7348
1990  1 1  0 0 1 -1 -1 200  176.01 16.973 3.96344 3.05372 0 0 0
1991  1 1  0 0 1 -1 -1 200  82.9347 90.6145 23.446 0.906785 0.849919 1.24812 0
1992  1 1  0 0 1 -1 -1 200  36.3657 39.9912 116.953 4.95631 0.771252 0.222844 0.739893
1993  1 1  0 0 1 -1 -1 200  89.1735 19.7688 57.7378 27.7158 5.60405 0 0
1994  1 1  0 0 1 -1 -1 200  101.911 39.7935 23.6951 11.1627 21.789 1.12769 0.520707
1995  1 1  0 0 1 -1 -1 200  59.956 56.1218 59.1407 5.78589 10.9822 6.60009 1.41331
1996  1 1  0 0 1 -1 -1 200  175.619 5.4772 13.811 2.40138 0.94348 0.553255 1.19465
1997  1 1  0 0 1 -1 -1 200  151.553 41.8291 3.48189 1.44963 1.68637 0 0
1998  1 1  0 0 1 -1 -1 200  66.261 76.3471 54.7154 0.750932 1.92551 0 0
1999  1 1  0 0 1 -1 -1 200  42.8692 36.2291 107.192 12.2062 0.675265 0.341954 0.486501
2000  1 1  0 0 1 -1 -1 200  69.6078 27.5039 60.7862 28.0656 14.0365 0 0
2001  1 1  0 0 1 -1 -1 200  105.081 29.4596 30.7514 10.9017 20.4014 3.40445 0
2002  1 1  0 0 1 -1 -1 200  52.3158 66.575 50.1211 8.41166 12.1485 6.91727 3.51066
2003  1 1  0 0 1 -1 -1 200  163.12 6.64936 22.6508 2.81334 1.89151 0.845943 2.02888
2004  1 1  0 0 1 -1 -1 200  178.509 17.5054 1.89052 1.05687 1.03814 0 0
2005  1 1  0 0 1 -1 -1 200  95.7602 82.6042 21.6356 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  71.0377 45.2068 80.0477 3.70776 0 0 0
2007  1 1  0 0 1 -1 -1 200  66.8592 55.9501 61.3325 15.8582 0 0 0
2008  1 1  0 0 1 -1 -1 200  49.2788 46.2945 86.6285 7.6678 10.1304 0 0
2009  1 1  0 0 1 -1 -1 200  166.785 7.8596 17.8329 4.94961 1.79713 0.775363 0
2010  1 1  0 0 1 -1 -1 200  140.32 49.7134 5.46456 1.87237 2.62919 0 0
2011  1 1  0 0 1 -1 -1 200  72.689 71.067 56.244 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  66.9946 41.2305 82.7284 9.04652 0 0 0
1990  10 2  0 0 1 -1 -1 200  11.5936 56.8214 112.748 18.8371 0 0 0
1991  10 2  0 0 1 -1 -1 200  1.10475 61.2873 133.843 3.76475 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 194.462 5.53816 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 6.44188 144.735 48.8231 0 0 0
1994  10 2  0 0 1 -1 -1 200  1.27577 25.3074 127.675 41.6396 4.10181 0 0
1995  10 2  0 0 1 -1 -1 200  0 19.2027 168.23 12.5672 0 0 0
1996  10 2  0 0 1 -1 -1 200  4.92708 7.80651 166.758 20.5087 0 0 0
1997  10 2  0 0 1 -1 -1 200  7.20875 100.966 70.6476 21.178 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 29.2095 170.79 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 7.5408 178.082 14.3775 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 8.23349 144.124 47.6426 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.1568 16.4446 143.531 38.8677 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 24.7829 155.702 19.5155 0 0 0
2003  10 2  0 0 1 -1 -1 200  2.95057 6.10568 175.28 15.1175 0.546346 0 0
2004  10 2  0 0 1 -1 -1 200  16.317 81.1356 73.25 28.5667 0.73071 0 0
2005  10 2  0 0 1 -1 -1 200  1.5556 67.4706 130.974 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 16.1034 178.168 5.72828 0 0 0
2007  10 2  0 0 1 -1 -1 200  0.622868 24.9561 145.224 29.1967 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 12.3253 175.682 11.9929 0 0 0
2009  10 2  0 0 1 -1 -1 200  3.71941 8.80066 155.537 31.9429 0 0 0
2010  10 2  0 0 1 -1 -1 200  5.37136 95.0885 78.5219 21.0183 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 32.7717 164.995 2.23293 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 13.3333 173.46 13.2064 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 15.0095 163.037 21.9534 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 6.58202 170.455 22.9629 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 3.34152 149.012 47.6461 0 0 0
1988  4 3  0 0 1 -1 -1 200  0.518818 12.7061 116.342 68.6854 1.74803 0 0
1989  4 3  0 0 1 -1 -1 200  2.6428 10.6933 166.614 19.1338 0.916233 0 0
1990  4 3  0 0 1 -1 -1 200  10.2882 46.5018 119.583 23.6273 0 0 0
1991  4 3  0 0 1 -1 -1 200  0.9833 50.3676 143.932 4.64504 0.0724237 0 0
1992  4 3  0 0 1 -1 -1 200  0 5.91406 187.441 6.64496 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 4.72126 139.364 55.9149 0 0 0
1994  4 3  0 0 1 -1 -1 200  1.0623 19.4439 127.661 50.216 1.61693 0 0
1995  4 3  0 0 1 -1 -1 200  0.33489 14.6927 170.584 13.9388 0.449108 0 0
1996  4 3  0 0 1 -1 -1 200  4.07724 5.96085 165.74 24.2221 0 0 0
1997  4 3  0 0 1 -1 -1 200  6.65671 86.1483 79.3333 27.5436 0.318056 0 0
1998  4 3  0 0 1 -1 -1 200  0 22.3464 175.595 2.05822 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 5.50177 177.68 16.8179 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 6.00098 139.832 54.1671 0 0 0
2001  4 3  0 0 1 -1 -1 200  0.940467 12.3649 143.106 42.2721 1.31693 0 0
2002  4 3  0 0 1 -1 -1 200  0.319057 19.0315 157.97 22.1371 0.542185 0 0
2003  4 3  0 0 1 -1 -1 200  2.4272 4.63887 174.633 18.0952 0.205482 0 0
2004  4 3  0 0 1 -1 -1 200  14.606 67.174 80.4403 37.7797 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.28975 52.2798 144.206 2.22428 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 9.04693 184.979 5.97454 0 0 0
2007  4 3  0 0 1 -1 -1 200  0.29905 11.8737 159.142 28.6852 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 8.55045 178.153 13.2961 0 0 0
2009  4 3  0 0 1 -1 -1 200  2.71703 6.01855 155.424 35.8401 0 0 0
2010  4 3  0 0 1 -1 -1 200  4.46155 74.3818 94.119 27.0377 0 0 0
2011  4 3  0 0 1 -1 -1 200  0.432365 19.944 177.217 2.407 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 7.75987 178.284 13.9563 0 0 0
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

