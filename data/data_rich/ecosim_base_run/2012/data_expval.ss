#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Jul 01 11:15:40 2024
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
-999 1 1 110649 0.05
1985 1 1 17436.2 0.05
1986 1 1 17346.6 0.05
1987 1 1 16217.3 0.05
1988 1 1 12503.7 0.05
1989 1 1 25206.3 0.05
1990 1 1 299352 0.05
1991 1 1 248600 0.05
1992 1 1 374691 0.05
1993 1 1 604531 0.05
1994 1 1 664103 0.05
1995 1 1 559627 0.05
1996 1 1 863655 0.05
1997 1 1 780745 0.05
1998 1 1 855977 0.05
1999 1 1 974223 0.05
2000 1 1 912100 0.05
2001 1 1 890342 0.05
2002 1 1 974506 0.05
2003 1 1 428576 0.05
2004 1 1 301750 0.05
2005 1 1 67140.5 0.05
2006 1 1 65468.3 0.05
2007 1 1 32458.5 0.05
2008 1 1 42180 0.05
2009 1 1 40806.6 0.05
2010 1 1 43723.7 0.05
2011 1 1 48941.6 0.05
2012 1 1 95385.9 0.05
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
1990 10 2 5.96367e+06 0.1 #_orig_obs: 4.80559e+06 survey1
1991 10 2 5.28418e+06 0.1 #_orig_obs: 4.48145e+06 survey1
1992 10 2 5.10751e+06 0.1 #_orig_obs: 3.71027e+06 survey1
1993 10 2 4.40616e+06 0.1 #_orig_obs: 3.99854e+06 survey1
1994 10 2 4.19074e+06 0.1 #_orig_obs: 3.71786e+06 survey1
1995 10 2 4.57889e+06 0.1 #_orig_obs: 3.64541e+06 survey1
1996 10 2 3.5712e+06 0.1 #_orig_obs: 3.00776e+06 survey1
1997 10 2 2.95676e+06 0.1 #_orig_obs: 2.8157e+06 survey1
1998 10 2 2.55377e+06 0.1 #_orig_obs: 2.91494e+06 survey1
1999 10 2 2.20245e+06 0.1 #_orig_obs: 2.35383e+06 survey1
2000 10 2 1.41427e+06 0.1 #_orig_obs: 1.26764e+06 survey1
2001 10 2 1.07074e+06 0.1 #_orig_obs: 1.16742e+06 survey1
2002 10 2 333300 0.1 #_orig_obs: 420712 survey1
2003 10 2 217106 0.1 #_orig_obs: 259467 survey1
2004 10 2 46515.5 0.1 #_orig_obs: 69499.5 survey1
2005 10 2 72556.4 0.1 #_orig_obs: 88295.7 survey1
2006 10 2 62920.9 0.1 #_orig_obs: 62110.2 survey1
2007 10 2 63733.3 0.1 #_orig_obs: 74899.2 survey1
2008 10 2 88467 0.1 #_orig_obs: 94886.5 survey1
2009 10 2 97442.9 0.1 #_orig_obs: 80962.6 survey1
2010 10 2 120799 0.1 #_orig_obs: 145920 survey1
2011 10 2 211220 0.1 #_orig_obs: 208996 survey1
2012 10 2 242121 0.1 #_orig_obs: 234805 survey1
1985 4 3 1.14515e+06 0.1 #_orig_obs: 2.24436e+06 survey2
1986 4 3 1.21763e+06 0.1 #_orig_obs: 1.82735e+06 survey2
1987 4 3 1.71798e+06 0.1 #_orig_obs: 1.92059e+06 survey2
1988 4 3 2.04876e+06 0.1 #_orig_obs: 2.54638e+06 survey2
1989 4 3 2.04526e+06 0.1 #_orig_obs: 2.18369e+06 survey2
1990 4 3 1.48974e+06 0.1 #_orig_obs: 1.80311e+06 survey2
1991 4 3 1.30634e+06 0.1 #_orig_obs: 1.5341e+06 survey2
1992 4 3 1.32165e+06 0.1 #_orig_obs: 1.83772e+06 survey2
1993 4 3 1.2685e+06 0.1 #_orig_obs: 1.8809e+06 survey2
1994 4 3 1.25998e+06 0.1 #_orig_obs: 1.38271e+06 survey2
1995 4 3 1.30569e+06 0.1 #_orig_obs: 1.44713e+06 survey2
1996 4 3 1.19555e+06 0.1 #_orig_obs: 1.34622e+06 survey2
1997 4 3 1.02052e+06 0.1 #_orig_obs: 1.0623e+06 survey2
1998 4 3 964359 0.1 #_orig_obs: 1.12452e+06 survey2
1999 4 3 921793 0.1 #_orig_obs: 800049 survey2
2000 4 3 680983 0.1 #_orig_obs: 582640 survey2
2001 4 3 583576 0.1 #_orig_obs: 477674 survey2
2002 4 3 338234 0.1 #_orig_obs: 255773 survey2
2003 4 3 171409 0.1 #_orig_obs: 112183 survey2
2004 4 3 70344.9 0.1 #_orig_obs: 38993.6 survey2
2005 4 3 38331.6 0.1 #_orig_obs: 26002.5 survey2
2006 4 3 34743.2 0.1 #_orig_obs: 34241.2 survey2
2007 4 3 26440.5 0.1 #_orig_obs: 17224 survey2
2008 4 3 34938.5 0.1 #_orig_obs: 31879.1 survey2
2009 4 3 36676.6 0.1 #_orig_obs: 35098.3 survey2
2010 4 3 43904.7 0.1 #_orig_obs: 37313.3 survey2
2011 4 3 67464.9 0.1 #_orig_obs: 61124.2 survey2
2012 4 3 90168.8 0.1 #_orig_obs: 86872 survey2
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
1985  1 1  0 0 1 -1 -1 200  39.3485 72.0742 73.5413 12.5298 2.50615 0 0
1986  1 1  0 0 1 -1 -1 200  37.9627 88.0375 60.7837 11.0969 1.23728 0.881976 0
1987  1 1  0 0 1 -1 -1 200  30.7939 84.3951 73.8671 9.12297 1.0891 0.731797 0
1988  1 1  0 0 1 -1 -1 200  20.766 80.7069 83.6268 13.1102 1.79002 0 0
1989  1 1  0 0 1 -1 -1 200  21.9993 63.9891 93.8828 20.1288 0 0 0
1990  1 1  0 0 1 -1 -1 200  28.1858 72.5555 75.3192 20.2258 3.71378 0 0
1991  1 1  0 0 1 -1 -1 200  30.479 80.453 72.5196 12.6414 2.38382 0.426405 1.09682
1992  1 1  0 0 1 -1 -1 200  32.4873 81.0077 72.3818 14.1232 0 0 0
1993  1 1  0 0 1 -1 -1 200  34.02 86.2608 67.2362 9.92297 2.56001 0 0
1994  1 1  0 0 1 -1 -1 200  32.9621 89.8686 67.4202 9.74899 0 0 0
1995  1 1  0 0 1 -1 -1 200  30.5656 88.0493 72.3457 7.54749 0.724654 0.7672 0
1996  1 1  0 0 1 -1 -1 200  33.5616 86.9421 69.4139 10.0825 0 0 0
1997  1 1  0 0 1 -1 -1 200  38.8609 91.4727 62.1036 6.31417 0.743269 0.505338 0
1998  1 1  0 0 1 -1 -1 200  32.1214 102.334 59.5503 5.99449 0 0 0
1999  1 1  0 0 1 -1 -1 200  36.458 91.7342 66.6005 5.20721 0 0 0
2000  1 1  0 0 1 -1 -1 200  38.3691 103.392 53.6728 3.96282 0.317323 0.286173 0
2001  1 1  0 0 1 -1 -1 200  26.9889 113.029 56.9618 3.01981 0 0 0
2002  1 1  0 0 1 -1 -1 200  27.9922 106.771 62.4197 2.81765 0 0 0
2003  1 1  0 0 1 -1 -1 200  19.9019 120.094 60.0037 0 0 0 0
2004  1 1  0 0 1 -1 -1 200  29.8005 101.337 68.8626 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  28.9502 116.821 54.2293 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  44.8444 88.2596 64.6005 2.29546 0 0 0
2007  1 1  0 0 1 -1 -1 200  42.7932 109.914 44.9246 2.3677 0 0 0
2008  1 1  0 0 1 -1 -1 200  42.6487 97.435 57.4134 2.50283 0 0 0
2009  1 1  0 0 1 -1 -1 200  53.0436 92.9447 50.7035 3.30825 0 0 0
2010  1 1  0 0 1 -1 -1 200  53.6694 100.053 43.4389 2.83913 0 0 0
2011  1 1  0 0 1 -1 -1 200  48.7166 98.893 49.743 2.64742 0 0 0
2012  1 1  0 0 1 -1 -1 200  62.596 88.4208 45.6401 3.34309 0 0 0
1990  10 2  0 0 1 -1 -1 200  0.518734 8.91553 167.517 23.049 0 0 0
1991  10 2  0 0 1 -1 -1 200  0.602444 10.6182 173.286 15.4394 0.053644 0 0
1992  10 2  0 0 1 -1 -1 200  0.673851 11.1351 174.257 13.934 0 0 0
1993  10 2  0 0 1 -1 -1 200  0.817423 13.5224 171.941 13.7196 0 0 0
1994  10 2  0 0 1 -1 -1 200  0.830029 14.6586 173.461 11.05 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 13.8405 176.226 9.93344 0 0 0
1996  10 2  0 0 1 -1 -1 200  0.896587 14.7964 171.974 12.3333 0 0 0
1997  10 2  0 0 1 -1 -1 200  1.18559 17.6974 171.02 10.097 0 0 0
1998  10 2  0 0 1 -1 -1 200  1.09546 21.8238 168.464 8.61674 0 0 0
1999  10 2  0 0 1 -1 -1 200  1.26224 19.5223 172.003 7.21225 0 0 0
2000  10 2  0 0 1 -1 -1 200  1.7851 28.9058 161.295 8.01418 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.35034 33.2695 160.251 5.129 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 52.1224 142.26 5.61757 0 0 0
2003  10 2  0 0 1 -1 -1 200  1.41845 47.1009 151.481 0 0 0 0
2004  10 2  0 0 1 -1 -1 200  3.9653 65.3258 130.709 0 0 0 0
2005  10 2  0 0 1 -1 -1 200  1.50474 35.8862 162.609 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  2.11042 24.3998 169.303 4.18707 0 0 0
2007  10 2  0 0 1 -1 -1 200  2.02717 32.0733 160.869 5.03034 0 0 0
2008  10 2  0 0 1 -1 -1 200  1.61108 22.8322 171.247 4.3096 0 0 0
2009  10 2  0 0 1 -1 -1 200  2.12081 23.2432 168.376 6.25973 0 0 0
2010  10 2  0 0 1 -1 -1 200  2.34693 27.547 164.219 5.88714 0 0 0
2011  10 2  0 0 1 -1 -1 200  1.72385 22.4712 171.045 4.75989 0 0 0
2012  10 2  0 0 1 -1 -1 200  2.71384 24.0255 166.377 6.88385 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 17.1315 161.476 21.3922 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 23.8513 154.267 21.8821 0 0 0
1987  4 3  0 0 1 -1 -1 200  0.902988 18.9827 164.318 15.7965 0 0 0
1988  4 3  0 0 1 -1 -1 200  0.536073 15.9796 163.673 19.466 0.344904 0 0
1989  4 3  0 0 1 -1 -1 200  0 11.8373 164.434 23.2113 0.517544 0 0
1990  4 3  0 0 1 -1 -1 200  0.736683 14.591 152.878 30.9546 0.839686 0 0
1991  4 3  0 0 1 -1 -1 200  0 18.4223 159.722 20.9939 0.862117 0 0
1992  4 3  0 0 1 -1 -1 200  0 18.6932 162.098 19.2083 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 20.8116 160.969 18.2196 0 0 0
1994  4 3  0 0 1 -1 -1 200  0.981882 20.7508 163.74 14.527 0 0 0
1995  4 3  0 0 1 -1 -1 200  0.871511 19.4266 166.442 13.2597 0 0 0
1996  4 3  0 0 1 -1 -1 200  0.953846 19.2272 164.219 15.5997 0 0 0
1997  4 3  0 0 1 -1 -1 200  0 23.663 163.626 12.7109 0 0 0
1998  4 3  0 0 1 -1 -1 200  1.03477 25.7569 162.686 10.5227 0 0 0
1999  4 3  0 0 1 -1 -1 200  1.07727 21.255 169.106 8.56157 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 29.4864 161.397 9.11626 0 0 0
2001  4 3  0 0 1 -1 -1 200  0.888121 29.4152 164.022 5.675 0 0 0
2002  4 3  0 0 1 -1 -1 200  0.882389 27.0909 166.662 5.36427 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 31.8889 168.111 0 0 0 0
2004  4 3  0 0 1 -1 -1 200  0 27.3138 169.422 3.26433 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.02062 32.543 165.337 1.09965 0 0 0
2006  4 3  0 0 1 -1 -1 200  1.37021 21.333 172.766 4.53077 0 0 0
2007  4 3  0 0 1 -1 -1 200  1.74511 35.1326 157.203 5.91936 0 0 0
2008  4 3  0 0 1 -1 -1 200  1.45607 26.0353 167.337 5.17207 0 0 0
2009  4 3  0 0 1 -1 -1 200  2.00982 27.5144 162.894 7.58207 0 0 0
2010  4 3  0 0 1 -1 -1 200  0 35.7834 157.021 7.19516 0 0 0
2011  4 3  0 0 1 -1 -1 200  1.92092 30.2875 161.739 6.05301 0 0 0
2012  4 3  0 0 1 -1 -1 200  2.59886 28.6691 160.377 8.355 0 0 0
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

