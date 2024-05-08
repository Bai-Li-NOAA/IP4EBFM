#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon May 06 13:14:33 2024
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
-999 1 1 50926.8 0.05
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
1999 1 1 662527 0.05
2000 1 1 465321 0.05
2001 1 1 321823 0.05
2002 1 1 312110 0.05
2003 1 1 172842 0.05
2004 1 1 160465 0.05
2005 1 1 137873 0.05
2006 1 1 195875 0.05
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
1990 10 2 516559 0.1 #_orig_obs: 547420 survey1
1991 10 2 2.10989e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 6.89515e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.32628e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 838346 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.37778e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.17582e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 849556 0.1 #_orig_obs: 870120 survey1
1998 10 2 2.83435e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.83525e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 670858 0.1 #_orig_obs: 512338 survey1
2001 10 2 325562 0.1 #_orig_obs: 291699 survey1
2002 10 2 172136 0.1 #_orig_obs: 364967 survey1
2003 10 2 113134 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 40592.7 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 109437 0.1 #_orig_obs: 197600 survey1
2006 10 2 198070 0.1 #_orig_obs: 152760 survey1
2007 10 2 161048 0.1 #_orig_obs: 210482 survey1
2008 10 2 461820 0.1 #_orig_obs: 788883 survey1
2009 10 2 426774 0.1 #_orig_obs: 218864 survey1
2010 10 2 284300 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.47201e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 1.80142e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 575194 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 578909 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 479604 0.1 #_orig_obs: 846626 survey2
1988 4 3 192237 0.1 #_orig_obs: 194950 survey2
1989 4 3 145306 0.1 #_orig_obs: 153912 survey2
1990 4 3 138675 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 551468 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.66745e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 658864 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 240153 0.1 #_orig_obs: 365721 survey2
1995 4 3 380184 0.1 #_orig_obs: 410270 survey2
1996 4 3 350612 0.1 #_orig_obs: 386093 survey2
1997 4 3 278495 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.05384e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 780455 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 261466 0.1 #_orig_obs: 286601 survey2
2001 4 3 156853 0.1 #_orig_obs: 121367 survey2
2002 4 3 190909 0.1 #_orig_obs: 174609 survey2
2003 4 3 59715.8 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 26837 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 60154.1 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 93219.6 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 70459.3 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 166673 0.1 #_orig_obs: 129808 survey2
2009 4 3 138478 0.1 #_orig_obs: 166268 survey2
2010 4 3 95618.1 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 433242 0.1 #_orig_obs: 347709 survey2
2012 4 3 572440 0.1 #_orig_obs: 617787 survey2
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
1985  1 1  0 0 1 -1 -1 200  24.2919 77.0822 81.9039 16.722 0 0 0
1986  1 1  0 0 1 -1 -1 200  8.21626 74.5967 96.4353 16.913 3.83865 0 0
1987  1 1  0 0 1 -1 -1 200  12.6229 32.9026 122.144 26.1263 6.20431 0 0
1988  1 1  0 0 1 -1 -1 200  15.1969 63.3292 67.6519 41.7057 9.38779 1.01717 1.71137
1989  1 1  0 0 1 -1 -1 200  79.3679 36.8097 62.7931 11.1705 7.24345 2.61531 0
1990  1 1  0 0 1 -1 -1 200  111.757 70.4888 12.5508 3.65319 0.700648 0.271286 0.577792
1991  1 1  0 0 1 -1 -1 200  15.5987 148.637 35.764 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  5.77199 41.6636 147.223 5.34114 0 0 0
1993  1 1  0 0 1 -1 -1 200  29.5657 33.3847 86.8805 48.0238 2.14528 0 0
1994  1 1  0 0 1 -1 -1 200  35.8083 99.5295 39.1151 15.0931 10.454 0 0
1995  1 1  0 0 1 -1 -1 200  15.0098 90.8131 85.7112 4.84168 2.30299 1.32122 0
1996  1 1  0 0 1 -1 -1 200  105.894 28.6665 56.3766 9.06238 0 0 0
1997  1 1  0 0 1 -1 -1 200  45.8169 139.274 11.0995 2.98472 0.542031 0.0276117 0.255573
1998  1 1  0 0 1 -1 -1 200  12.3416 102.828 83.5632 1.26754 0 0 0
1999  1 1  0 0 1 -1 -1 200  13.0987 57.8601 118.517 10.1554 0.368968 0 0
2000  1 1  0 0 1 -1 -1 200  72.7391 54.151 60.0863 11.1488 1.87467 0 0
2001  1 1  0 0 1 -1 -1 200  17.3168 154.647 23.9744 4.06163 0 0 0
2002  1 1  0 0 1 -1 -1 200  12.0816 80.5586 105.542 1.81789 0 0 0
2003  1 1  0 0 1 -1 -1 200  87.2406 52.597 57.9603 2.20212 0 0 0
2004  1 1  0 0 1 -1 -1 200  64.8283 124.73 10.4418 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  28.8549 137.489 33.656 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  77.5909 62.2891 59.3725 0.747453 0 0 0
2007  1 1  0 0 1 -1 -1 200  38.6781 136.367 23.144 1.81095 0 0 0
2008  1 1  0 0 1 -1 -1 200  12.1351 99.8427 86.8256 1.03597 0.160537 0 0
2009  1 1  0 0 1 -1 -1 200  103.472 26.9437 63.7102 5.87436 0 0 0
2010  1 1  0 0 1 -1 -1 200  65.1432 122.899 8.974 2.62821 0.355236 0 0
2011  1 1  0 0 1 -1 -1 200  26.027 110.148 63.0983 0.489063 0.237744 0 0
2012  1 1  0 0 1 -1 -1 200  39.7533 67.0881 86.4846 6.67396 0 0 0
1990  10 2  0 0 1 -1 -1 200  11.4596 52.8127 114.322 21.406 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 53.6803 146.32 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 4.55028 191.327 4.12282 0 0 0
1993  10 2  0 0 1 -1 -1 200  0.576373 4.71399 143.276 51.4332 0 0 0
1994  10 2  0 0 1 -1 -1 200  1.48343 29.7203 133.329 33.726 1.7414 0 0
1995  10 2  0 0 1 -1 -1 200  0.383101 16.6437 176.129 6.84443 0 0 0
1996  10 2  0 0 1 -1 -1 200  4.22037 8.13329 171.981 15.6656 0 0 0
1997  10 2  0 0 1 -1 -1 200  4.78958 101.511 78.3628 15.3367 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 24.5491 175.451 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 10.9691 177.045 11.9863 0 0 0
2000  10 2  0 0 1 -1 -1 200  3.19371 16.2614 158.035 22.5094 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.69355 96.8807 90.8827 10.5431 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 39.593 160.407 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  5.86168 22.9661 166.621 4.55073 0 0 0
2004  10 2  0 0 1 -1 -1 200  16.2974 161.842 18.648 3.21288 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 87.7313 112.269 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  4.59879 24.4121 169.221 1.76784 0 0 0
2007  10 2  0 0 1 -1 -1 200  3.76156 86.9844 102.505 6.74861 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 22.586 177.414 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  4.07807 7.45755 177.203 11.2618 0 0 0
2010  10 2  0 0 1 -1 -1 200  8.02907 104.887 71.5856 15.4982 0 0 0
2011  10 2  0 0 1 -1 -1 200  0.929127 27.9312 171.14 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  1.13165 13.4416 176.086 9.34064 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 15.9511 158.992 25.057 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 12.8088 160.368 26.8234 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 4.71641 162.17 33.1133 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 11.707 118.425 68.9546 0.913267 0 0
1989  4 3  0 0 1 -1 -1 200  3.38744 9.48101 159.341 26.7671 1.02342 0 0
1990  4 3  0 0 1 -1 -1 200  14.7414 56.3055 101.063 27.8901 0 0 0
1991  4 3  0 0 1 -1 -1 200  1.01124 58.4479 136.907 3.63356 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 5.41031 188.592 5.99785 0 0 0
1993  4 3  0 0 1 -1 -1 200  0.703321 4.81992 128.176 66.3005 0 0 0
1994  4 3  0 0 1 -1 -1 200  1.7905 30.242 122.308 45.6591 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 18.1507 172.521 9.32786 0 0 0
1996  4 3  0 0 1 -1 -1 200  4.89907 8.08386 166.285 20.7322 0 0 0
1997  4 3  0 0 1 -1 -1 200  5.06653 94.3396 80.377 20.2168 0 0 0
1998  4 3  0 0 1 -1 -1 200  0.394406 20.2034 179.402 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 8.22589 177.633 14.1414 0 0 0
2000  4 3  0 0 1 -1 -1 200  2.84624 13.0354 156.92 27.1987 0 0 0
2001  4 3  0 0 1 -1 -1 200  1.22777 68.3483 116.828 13.5962 0 0 0
2002  4 3  0 0 1 -1 -1 200  0.319189 13.492 186.189 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 18.3948 176.511 5.09456 0 0 0
2004  4 3  0 0 1 -1 -1 200  8.76058 108.195 75.6264 7.41813 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.8039 53.7606 144.435 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  3.40385 16.9301 177.605 2.06149 0 0 0
2007  4 3  0 0 1 -1 -1 200  2.99709 65.5739 122.665 8.7637 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 19.4043 178.606 1.98969 0 0 0
2009  4 3  0 0 1 -1 -1 200  4.3555 6.93564 174.127 14.5814 0 0 0
2010  4 3  0 0 1 -1 -1 200  8.28325 95.8749 75.2816 20.5602 0 0 0
2011  4 3  0 0 1 -1 -1 200  1.09291 28.2075 169.45 1.24928 0 0 0
2012  4 3  0 0 1 -1 -1 200  1.2339 12.7272 173.81 12.2288 0 0 0
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

