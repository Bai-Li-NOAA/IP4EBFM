#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Apr 04 10:34:24 2024
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
-999 1 1 50874.2 0.05
1985 1 1 13603.9 0.05
1986 1 1 12608.1 0.05
1987 1 1 6965.11 0.05
1988 1 1 1875.42 0.05
1989 1 1 3547.84 0.05
1990 1 1 75299.6 0.05
1991 1 1 117945 0.05
1992 1 1 268179 0.05
1993 1 1 458765 0.05
1994 1 1 229069 0.05
1995 1 1 149976 0.05
1996 1 1 392662 0.05
1997 1 1 359267 0.05
1998 1 1 936431 0.05
1999 1 1 662528 0.05
2000 1 1 465322 0.05
2001 1 1 321823 0.05
2002 1 1 312110 0.05
2003 1 1 172842 0.05
2004 1 1 160464 0.05
2005 1 1 137873 0.05
2006 1 1 195876 0.05
2007 1 1 106169 0.05
2008 1 1 152208 0.05
2009 1 1 171018 0.05
2010 1 1 135988 0.05
2011 1 1 230424 0.05
2012 1 1 392003 0.05
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
1990 10 2 516528 0.1 #_orig_obs: 547420 survey1
1991 10 2 2.10994e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 6.89516e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.3263e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 838303 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.37786e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.17583e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 849393 0.1 #_orig_obs: 870120 survey1
1998 10 2 2.83481e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.83535e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 670962 0.1 #_orig_obs: 512338 survey1
2001 10 2 325450 0.1 #_orig_obs: 291699 survey1
2002 10 2 172166 0.1 #_orig_obs: 364967 survey1
2003 10 2 113161 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 40599.5 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 109445 0.1 #_orig_obs: 197600 survey1
2006 10 2 198075 0.1 #_orig_obs: 152760 survey1
2007 10 2 160972 0.1 #_orig_obs: 210482 survey1
2008 10 2 461823 0.1 #_orig_obs: 788883 survey1
2009 10 2 426773 0.1 #_orig_obs: 218864 survey1
2010 10 2 284285 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.47219e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 1.80125e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 574767 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 578495 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 479453 0.1 #_orig_obs: 846626 survey2
1988 4 3 192222 0.1 #_orig_obs: 194950 survey2
1989 4 3 145304 0.1 #_orig_obs: 153912 survey2
1990 4 3 138673 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 551446 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.6674e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 658875 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 240154 0.1 #_orig_obs: 365721 survey2
1995 4 3 380173 0.1 #_orig_obs: 410270 survey2
1996 4 3 350627 0.1 #_orig_obs: 386093 survey2
1997 4 3 278495 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.05387e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 780592 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 261516 0.1 #_orig_obs: 286601 survey2
2001 4 3 156880 0.1 #_orig_obs: 121367 survey2
2002 4 3 190919 0.1 #_orig_obs: 174609 survey2
2003 4 3 59733.9 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 26847.2 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 60170 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 93239.6 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 70464.8 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 166660 0.1 #_orig_obs: 129808 survey2
2009 4 3 138476 0.1 #_orig_obs: 166268 survey2
2010 4 3 95617.1 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 433271 0.1 #_orig_obs: 347709 survey2
2012 4 3 572494 0.1 #_orig_obs: 617787 survey2
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
1985  1 1  0 0 1 -1 -1 200  24.3005 77.0701 81.9054 16.724 0 0 0
1986  1 1  0 0 1 -1 -1 200  8.21927 74.6096 96.4208 16.9123 3.83803 0 0
1987  1 1  0 0 1 -1 -1 200  12.6246 32.9048 122.151 26.1177 6.20146 0 0
1988  1 1  0 0 1 -1 -1 200  15.1982 63.3273 67.6585 41.707 9.38349 1.01621 1.70931
1989  1 1  0 0 1 -1 -1 200  79.3649 36.8097 62.7978 11.1721 7.24327 2.61221 0
1990  1 1  0 0 1 -1 -1 200  111.755 70.489 12.553 3.65395 0.700786 0.271166 0.577082
1991  1 1  0 0 1 -1 -1 200  15.5988 148.631 35.7702 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  5.77189 41.6592 147.227 5.34209 0 0 0
1993  1 1  0 0 1 -1 -1 200  29.5623 33.3835 86.8826 48.0262 2.1454 0 0
1994  1 1  0 0 1 -1 -1 200  35.8092 99.5222 39.1201 15.0942 10.4543 0 0
1995  1 1  0 0 1 -1 -1 200  15.012 90.8082 85.7146 4.84187 2.30281 1.32047 0
1996  1 1  0 0 1 -1 -1 200  105.889 28.6694 56.379 9.06242 0 0 0
1997  1 1  0 0 1 -1 -1 200  45.8228 139.267 11.1007 2.98442 0.542013 0.0275979 0.255374
1998  1 1  0 0 1 -1 -1 200  12.3422 102.828 83.5626 1.26699 0 0 0
1999  1 1  0 0 1 -1 -1 200  13.1035 57.8559 118.517 10.1552 0.368681 0 0
2000  1 1  0 0 1 -1 -1 200  72.7309 54.1662 60.0836 11.1454 1.87387 0 0
2001  1 1  0 0 1 -1 -1 200  17.3172 154.643 23.9791 4.06017 0 0 0
2002  1 1  0 0 1 -1 -1 200  12.0882 80.5578 105.538 1.81587 0 0 0
2003  1 1  0 0 1 -1 -1 200  87.2386 52.6084 57.952 2.201 0 0 0
2004  1 1  0 0 1 -1 -1 200  64.8228 124.733 10.4437 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  28.8618 137.481 33.6567 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  77.5778 62.3045 59.3707 0.747083 0 0 0
2007  1 1  0 0 1 -1 -1 200  38.6735 136.368 23.1482 1.81007 0 0 0
2008  1 1  0 0 1 -1 -1 200  12.1352 99.836 86.8334 1.03498 0.160338 0 0
2009  1 1  0 0 1 -1 -1 200  103.469 26.9424 63.7139 5.87505 0 0 0
2010  1 1  0 0 1 -1 -1 200  65.1497 122.892 8.97484 2.62832 0.355228 0 0
2011  1 1  0 0 1 -1 -1 200  26.0297 110.145 63.0989 0.489079 0.237692 0 0
2012  1 1  0 0 1 -1 -1 200  39.7589 67.0891 86.4785 6.67346 0 0 0
1990  10 2  0 0 1 -1 -1 200  11.4568 52.8038 114.33 21.4096 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 53.6661 146.334 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 4.54927 191.327 4.12386 0 0 0
1993  10 2  0 0 1 -1 -1 200  0.576206 4.71324 143.274 51.4367 0 0 0
1994  10 2  0 0 1 -1 -1 200  1.4832 29.7141 133.334 33.728 1.74066 0 0
1995  10 2  0 0 1 -1 -1 200  0.383073 16.6402 176.132 6.84457 0 0 0
1996  10 2  0 0 1 -1 -1 200  4.21956 8.13337 171.98 15.6675 0 0 0
1997  10 2  0 0 1 -1 -1 200  4.79024 101.509 78.3645 15.336 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 24.5459 175.454 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 10.9689 177.044 11.9871 0 0 0
2000  10 2  0 0 1 -1 -1 200  3.19325 16.2663 158.036 22.5047 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.69407 96.9015 90.8646 10.5398 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 39.5906 160.409 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  5.86201 22.9742 166.614 4.55026 0 0 0
2004  10 2  0 0 1 -1 -1 200  16.2967 161.854 18.6392 3.20996 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 87.7376 112.262 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  4.59842 24.4211 169.213 1.76719 0 0 0
2007  10 2  0 0 1 -1 -1 200  3.76223 87.0069 102.485 6.74551 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 22.5806 177.419 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  4.07719 7.45624 177.203 11.2633 0 0 0
2010  10 2  0 0 1 -1 -1 200  8.02899 104.876 71.5952 15.4999 0 0 0
2011  10 2  0 0 1 -1 -1 200  0.929074 27.9275 171.143 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  1.13192 13.4435 176.083 9.34166 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 15.9492 158.988 25.0628 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 12.8131 160.359 26.8282 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 4.71692 162.177 33.1061 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 11.7061 118.423 68.9578 0.912883 0 0
1989  4 3  0 0 1 -1 -1 200  3.38691 9.48069 159.337 26.7718 1.02344 0 0
1990  4 3  0 0 1 -1 -1 200  14.7383 56.3001 101.066 27.8954 0 0 0
1991  4 3  0 0 1 -1 -1 200  1.01109 58.4416 136.913 3.63421 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 5.40987 188.59 5.99977 0 0 0
1993  4 3  0 0 1 -1 -1 200  0.703161 4.81964 128.17 66.3076 0 0 0
1994  4 3  0 0 1 -1 -1 200  1.79025 30.2375 122.309 45.6629 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 18.1502 172.521 9.32908 0 0 0
1996  4 3  0 0 1 -1 -1 200  4.89831 8.08454 166.281 20.7359 0 0 0
1997  4 3  0 0 1 -1 -1 200  5.06664 94.3339 80.3826 20.2168 0 0 0
1998  4 3  0 0 1 -1 -1 200  0.394423 20.2049 179.401 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 8.22573 177.631 14.1431 0 0 0
2000  4 3  0 0 1 -1 -1 200  2.84593 13.0402 156.919 27.1953 0 0 0
2001  4 3  0 0 1 -1 -1 200  1.22761 68.343 116.836 13.5934 0 0 0
2002  4 3  0 0 1 -1 -1 200  0.319368 13.4931 186.188 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 18.4007 176.505 5.09459 0 0 0
2004  4 3  0 0 1 -1 -1 200  8.75902 108.198 75.6286 7.41482 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.80426 53.7604 144.435 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  3.40317 16.9353 177.601 2.06083 0 0 0
2007  4 3  0 0 1 -1 -1 200  2.9962 65.57 122.674 8.76022 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 19.4028 178.609 1.9879 0 0 0
2009  4 3  0 0 1 -1 -1 200  4.35493 6.93521 174.125 14.5845 0 0 0
2010  4 3  0 0 1 -1 -1 200  8.28339 95.8694 75.2844 20.5628 0 0 0
2011  4 3  0 0 1 -1 -1 200  1.09299 28.208 169.449 1.24947 0 0 0
2012  4 3  0 0 1 -1 -1 200  1.23406 12.7284 173.807 12.2303 0 0 0
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

