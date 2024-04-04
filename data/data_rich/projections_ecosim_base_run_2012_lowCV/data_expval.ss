#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Apr 04 10:31:43 2024
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
-999 1 1 110495 0.05
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
1997 1 1 780744 0.05
1998 1 1 855978 0.05
1999 1 1 974231 0.05
2000 1 1 912101 0.05
2001 1 1 890339 0.05
2002 1 1 974484 0.05
2003 1 1 428577 0.05
2004 1 1 301737 0.05
2005 1 1 67140.4 0.05
2006 1 1 65468.5 0.05
2007 1 1 32458.8 0.05
2008 1 1 42179.9 0.05
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
1990 10 2 5.96403e+06 0.1 #_orig_obs: 4.80559e+06 survey1
1991 10 2 5.28418e+06 0.1 #_orig_obs: 4.48145e+06 survey1
1992 10 2 5.10829e+06 0.1 #_orig_obs: 3.71027e+06 survey1
1993 10 2 4.40654e+06 0.1 #_orig_obs: 3.99854e+06 survey1
1994 10 2 4.1896e+06 0.1 #_orig_obs: 3.71786e+06 survey1
1995 10 2 4.57758e+06 0.1 #_orig_obs: 3.64541e+06 survey1
1996 10 2 3.5707e+06 0.1 #_orig_obs: 3.00776e+06 survey1
1997 10 2 2.9582e+06 0.1 #_orig_obs: 2.8157e+06 survey1
1998 10 2 2.5539e+06 0.1 #_orig_obs: 2.91494e+06 survey1
1999 10 2 2.20147e+06 0.1 #_orig_obs: 2.35383e+06 survey1
2000 10 2 1.41417e+06 0.1 #_orig_obs: 1.26764e+06 survey1
2001 10 2 1.07127e+06 0.1 #_orig_obs: 1.16742e+06 survey1
2002 10 2 333165 0.1 #_orig_obs: 420712 survey1
2003 10 2 217170 0.1 #_orig_obs: 259467 survey1
2004 10 2 46511.4 0.1 #_orig_obs: 69499.5 survey1
2005 10 2 72574.4 0.1 #_orig_obs: 88295.7 survey1
2006 10 2 62929.4 0.1 #_orig_obs: 62110.2 survey1
2007 10 2 63700.4 0.1 #_orig_obs: 74899.2 survey1
2008 10 2 88455.2 0.1 #_orig_obs: 94886.5 survey1
2009 10 2 97475.7 0.1 #_orig_obs: 80962.6 survey1
2010 10 2 120825 0.1 #_orig_obs: 145920 survey1
2011 10 2 211162 0.1 #_orig_obs: 208996 survey1
2012 10 2 242135 0.1 #_orig_obs: 234805 survey1
1985 4 3 1.14477e+06 0.1 #_orig_obs: 2.24436e+06 survey2
1986 4 3 1.21725e+06 0.1 #_orig_obs: 1.82735e+06 survey2
1987 4 3 1.71777e+06 0.1 #_orig_obs: 1.92059e+06 survey2
1988 4 3 2.04865e+06 0.1 #_orig_obs: 2.54638e+06 survey2
1989 4 3 2.04518e+06 0.1 #_orig_obs: 2.18369e+06 survey2
1990 4 3 1.48972e+06 0.1 #_orig_obs: 1.80311e+06 survey2
1991 4 3 1.30634e+06 0.1 #_orig_obs: 1.5341e+06 survey2
1992 4 3 1.32166e+06 0.1 #_orig_obs: 1.83772e+06 survey2
1993 4 3 1.26869e+06 0.1 #_orig_obs: 1.8809e+06 survey2
1994 4 3 1.26018e+06 0.1 #_orig_obs: 1.38271e+06 survey2
1995 4 3 1.30566e+06 0.1 #_orig_obs: 1.44713e+06 survey2
1996 4 3 1.19534e+06 0.1 #_orig_obs: 1.34622e+06 survey2
1997 4 3 1.02045e+06 0.1 #_orig_obs: 1.0623e+06 survey2
1998 4 3 964677 0.1 #_orig_obs: 1.12452e+06 survey2
1999 4 3 921922 0.1 #_orig_obs: 800049 survey2
2000 4 3 680876 0.1 #_orig_obs: 582640 survey2
2001 4 3 583628 0.1 #_orig_obs: 477674 survey2
2002 4 3 338306 0.1 #_orig_obs: 255773 survey2
2003 4 3 171379 0.1 #_orig_obs: 112183 survey2
2004 4 3 70351.4 0.1 #_orig_obs: 38993.6 survey2
2005 4 3 38333.3 0.1 #_orig_obs: 26002.5 survey2
2006 4 3 34754.2 0.1 #_orig_obs: 34241.2 survey2
2007 4 3 26442.8 0.1 #_orig_obs: 17224 survey2
2008 4 3 34926.5 0.1 #_orig_obs: 31879.1 survey2
2009 4 3 36672.1 0.1 #_orig_obs: 35098.3 survey2
2010 4 3 43913.1 0.1 #_orig_obs: 37313.3 survey2
2011 4 3 67473.5 0.1 #_orig_obs: 61124.2 survey2
2012 4 3 90167.8 0.1 #_orig_obs: 86872 survey2
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
1985  1 1  0 0 1 -1 -1 200  39.3528 72.0681 73.5424 12.5315 2.50521 0 0
1986  1 1  0 0 1 -1 -1 200  37.9652 88.0412 60.7783 11.0971 1.237 0.88124 0
1987  1 1  0 0 1 -1 -1 200  30.793 84.3949 73.8701 9.12217 1.08872 0.731092 0
1988  1 1  0 0 1 -1 -1 200  20.7645 80.7035 83.6314 13.1117 1.78885 0 0
1989  1 1  0 0 1 -1 -1 200  21.9987 63.985 93.8862 20.1301 0 0 0
1990  1 1  0 0 1 -1 -1 200  28.1826 72.5547 75.3221 20.2286 3.71204 0 0
1991  1 1  0 0 1 -1 -1 200  30.4807 80.4467 72.524 12.6433 2.38358 0.42505 1.09664
1992  1 1  0 0 1 -1 -1 200  32.496 81.0046 72.378 14.1214 0 0 0
1993  1 1  0 0 1 -1 -1 200  34.0211 86.2717 67.2262 9.9226 2.55849 0 0
1994  1 1  0 0 1 -1 -1 200  32.9555 89.8807 67.4184 9.74531 0 0 0
1995  1 1  0 0 1 -1 -1 200  30.5547 88.0548 72.3562 7.54357 0.724083 0.766648 0
1996  1 1  0 0 1 -1 -1 200  33.5739 86.9215 69.4247 10.0799 0 0 0
1997  1 1  0 0 1 -1 -1 200  38.874 91.4745 62.09 6.31421 0.742662 0.504601 0
1998  1 1  0 0 1 -1 -1 200  32.1098 102.352 59.5432 5.99527 0 0 0
1999  1 1  0 0 1 -1 -1 200  36.4475 91.7342 66.6134 5.2049 0 0 0
2000  1 1  0 0 1 -1 -1 200  38.3882 103.373 53.6751 3.96026 0.316928 0.286021 0
2001  1 1  0 0 1 -1 -1 200  26.9728 113.056 56.9516 3.01926 0 0 0
2002  1 1  0 0 1 -1 -1 200  27.992 106.739 62.4505 2.81878 0 0 0
2003  1 1  0 0 1 -1 -1 200  19.8995 120.105 59.9958 0 0 0 0
2004  1 1  0 0 1 -1 -1 200  29.8064 101.319 68.875 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  28.9579 116.825 54.2175 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  44.8211 88.2814 64.6022 2.29534 0 0 0
2007  1 1  0 0 1 -1 -1 200  42.7797 109.911 44.9421 2.3675 0 0 0
2008  1 1  0 0 1 -1 -1 200  42.6581 97.4201 57.4201 2.50169 0 0 0
2009  1 1  0 0 1 -1 -1 200  53.0563 92.9367 50.6981 3.30883 0 0 0
2010  1 1  0 0 1 -1 -1 200  53.6605 100.063 43.4367 2.84022 0 0 0
2011  1 1  0 0 1 -1 -1 200  48.7164 98.8914 49.745 2.64726 0 0 0
2012  1 1  0 0 1 -1 -1 200  62.5988 88.4216 45.6384 3.34116 0 0 0
1990  10 2  0 0 1 -1 -1 200  0.518593 8.91455 167.514 23.0524 0 0 0
1991  10 2  0 0 1 -1 -1 200  0.602412 10.6167 173.285 15.4422 0.0536438 0 0
1992  10 2  0 0 1 -1 -1 200  0.673951 11.1342 174.257 13.9352 0 0 0
1993  10 2  0 0 1 -1 -1 200  0.817541 13.5262 171.934 13.722 0 0 0
1994  10 2  0 0 1 -1 -1 200  0.830136 14.6652 173.456 11.0491 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 13.8421 176.229 9.92883 0 0 0
1996  10 2  0 0 1 -1 -1 200  0.896763 14.7912 171.981 12.3309 0 0 0
1997  10 2  0 0 1 -1 -1 200  1.18559 17.6943 171.022 10.0978 0 0 0
1998  10 2  0 0 1 -1 -1 200  1.09535 21.8336 168.45 8.62125 0 0 0
1999  10 2  0 0 1 -1 -1 200  1.26231 19.5282 172 7.20985 0 0 0
2000  10 2  0 0 1 -1 -1 200  1.7858 28.8997 161.305 8.00923 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.34912 33.2715 160.25 5.12897 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 52.1193 142.261 5.61973 0 0 0
2003  10 2  0 0 1 -1 -1 200  1.41767 47.0923 151.49 0 0 0 0
2004  10 2  0 0 1 -1 -1 200  3.96628 65.3207 130.713 0 0 0 0
2005  10 2  0 0 1 -1 -1 200  1.50506 35.8889 162.606 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  2.10952 24.4089 169.294 4.18712 0 0 0
2007  10 2  0 0 1 -1 -1 200  2.02692 32.0771 160.866 5.02961 0 0 0
2008  10 2  0 0 1 -1 -1 200  1.61096 22.8241 171.258 4.30743 0 0 0
2009  10 2  0 0 1 -1 -1 200  2.12057 23.2361 168.382 6.2613 0 0 0
2010  10 2  0 0 1 -1 -1 200  2.34641 27.5499 164.214 5.89012 0 0 0
2011  10 2  0 0 1 -1 -1 200  1.72427 22.4763 171.039 4.76041 0 0 0
2012  10 2  0 0 1 -1 -1 200  2.71381 24.026 166.38 6.88058 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 17.1304 161.474 21.3956 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 23.8544 154.261 21.8848 0 0 0
1987  4 3  0 0 1 -1 -1 200  0.903 18.9827 164.319 15.7955 0 0 0
1988  4 3  0 0 1 -1 -1 200  0.536042 15.9786 163.672 19.4681 0.344879 0 0
1989  4 3  0 0 1 -1 -1 200  0 11.8364 164.431 23.2148 0.517624 0 0
1990  4 3  0 0 1 -1 -1 200  0.736617 14.5905 152.874 30.9588 0.839847 0 0
1991  4 3  0 0 1 -1 -1 200  0 18.4202 159.721 20.9969 0.86228 0 0
1992  4 3  0 0 1 -1 -1 200  0 18.6945 162.095 19.2102 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 20.8167 160.961 18.2219 0 0 0
1994  4 3  0 0 1 -1 -1 200  0.981694 20.7534 163.741 14.5236 0 0 0
1995  4 3  0 0 1 -1 -1 200  0.871123 19.4256 166.451 13.2523 0 0 0
1996  4 3  0 0 1 -1 -1 200  0.954168 19.2213 164.228 15.5966 0 0 0
1997  4 3  0 0 1 -1 -1 200  0 23.6701 163.616 12.7137 0 0 0
1998  4 3  0 0 1 -1 -1 200  1.03449 25.763 162.675 10.5272 0 0 0
1999  4 3  0 0 1 -1 -1 200  1.07682 21.2517 169.114 8.55742 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 29.4834 161.406 9.11102 0 0 0
2001  4 3  0 0 1 -1 -1 200  0.887766 29.4265 164.01 5.67568 0 0 0
2002  4 3  0 0 1 -1 -1 200  0.882161 27.0753 166.677 5.36584 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 31.8944 168.106 0 0 0 0
2004  4 3  0 0 1 -1 -1 200  0 27.3075 169.427 3.26586 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.02115 32.5508 165.329 1.09954 0 0 0
2006  4 3  0 0 1 -1 -1 200  1.36952 21.338 172.762 4.53073 0 0 0
2007  4 3  0 0 1 -1 -1 200  1.74404 35.1205 157.218 5.91766 0 0 0
2008  4 3  0 0 1 -1 -1 200  1.45642 26.0307 167.343 5.16981 0 0 0
2009  4 3  0 0 1 -1 -1 200  2.01072 27.5163 162.888 7.58488 0 0 0
2010  4 3  0 0 1 -1 -1 200  0 35.7877 157.014 7.19876 0 0 0
2011  4 3  0 0 1 -1 -1 200  1.92084 30.2851 161.741 6.05292 0 0 0
2012  4 3  0 0 1 -1 -1 200  2.59929 28.6716 160.378 8.35119 0 0 0
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

