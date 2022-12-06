#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Dec 06 18:28:13 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
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
-999 1 1 113905 0.05
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
1996 1 1 392687 0.05
1997 1 1 359263 0.05
1998 1 1 936251 0.05
1999 1 1 661932 0.05
2000 1 1 465868 0.05
2001 1 1 321721 0.05
2002 1 1 313904 0.05
2003 1 1 172439 0.05
2004 1 1 160943 0.05
2005 1 1 137626 0.05
2006 1 1 195512 0.05
2007 1 1 106039 0.05
2008 1 1 152179 0.05
2009 1 1 171036 0.05
2010 1 1 135985 0.05
2011 1 1 230422 0.05
2012 1 1 392002 0.05
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
1990 10 2 597556 0.1 #_orig_obs: 559970 survey1
1991 10 2 2.49123e+06 0.1 #_orig_obs: 4.1271e+06 survey1
1992 10 2 7.47012e+06 0.1 #_orig_obs: 7.13121e+06 survey1
1993 10 2 2.4932e+06 0.1 #_orig_obs: 1.66483e+06 survey1
1994 10 2 880569 0.1 #_orig_obs: 613678 survey1
1995 10 2 1.55809e+06 0.1 #_orig_obs: 1.43796e+06 survey1
1996 10 2 1.02818e+06 0.1 #_orig_obs: 845940 survey1
1997 10 2 758333 0.1 #_orig_obs: 770676 survey1
1998 10 2 2.2616e+06 0.1 #_orig_obs: 5.12954e+06 survey1
1999 10 2 2.03558e+06 0.1 #_orig_obs: 1.39835e+06 survey1
2000 10 2 507464 0.1 #_orig_obs: 494764 survey1
2001 10 2 219034 0.1 #_orig_obs: 377871 survey1
2002 10 2 252444 0.1 #_orig_obs: 325152 survey1
2003 10 2 84250.7 0.1 #_orig_obs: 58372.8 survey1
2004 10 2 41792.7 0.1 #_orig_obs: 37164.9 survey1
2005 10 2 165749 0.1 #_orig_obs: 162458 survey1
2006 10 2 195173 0.1 #_orig_obs: 169167 survey1
2007 10 2 210240 0.1 #_orig_obs: 183701 survey1
2008 10 2 558864 0.1 #_orig_obs: 744596 survey1
2009 10 2 415401 0.1 #_orig_obs: 276588 survey1
2010 10 2 308271 0.1 #_orig_obs: 354944 survey1
2011 10 2 1.38839e+06 0.1 #_orig_obs: 2.18964e+06 survey1
2012 10 2 1.44932e+06 0.1 #_orig_obs: 1.09137e+06 survey1
1985 4 3 868813 0.1 #_orig_obs: 1.90597e+06 survey2
1986 4 3 892438 0.1 #_orig_obs: 2.21911e+06 survey2
1987 4 3 802439 0.1 #_orig_obs: 1.05381e+06 survey2
1988 4 3 282186 0.1 #_orig_obs: 192092 survey2
1989 4 3 180179 0.1 #_orig_obs: 179548 survey2
1990 4 3 162407 0.1 #_orig_obs: 129115 survey2
1991 4 3 650892 0.1 #_orig_obs: 328697 survey2
1992 4 3 1.61159e+06 0.1 #_orig_obs: 2.00105e+06 survey2
1993 4 3 678580 0.1 #_orig_obs: 1.03349e+06 survey2
1994 4 3 256581 0.1 #_orig_obs: 250591 survey2
1995 4 3 384020 0.1 #_orig_obs: 515878 survey2
1996 4 3 332162 0.1 #_orig_obs: 419123 survey2
1997 4 3 270142 0.1 #_orig_obs: 211584 survey2
1998 4 3 776485 0.1 #_orig_obs: 852235 survey2
1999 4 3 653611 0.1 #_orig_obs: 1.03369e+06 survey2
2000 4 3 229639 0.1 #_orig_obs: 333299 survey2
2001 4 3 109662 0.1 #_orig_obs: 100039 survey2
2002 4 3 135399 0.1 #_orig_obs: 179415 survey2
2003 4 3 60138.3 0.1 #_orig_obs: 72751 survey2
2004 4 3 26169.1 0.1 #_orig_obs: 8396.46 survey2
2005 4 3 69194.2 0.1 #_orig_obs: 29003.8 survey2
2006 4 3 95561.2 0.1 #_orig_obs: 95924.2 survey2
2007 4 3 74389.6 0.1 #_orig_obs: 43712.8 survey2
2008 4 3 169793 0.1 #_orig_obs: 132667 survey2
2009 4 3 139609 0.1 #_orig_obs: 174806 survey2
2010 4 3 107704 0.1 #_orig_obs: 63441.7 survey2
2011 4 3 377832 0.1 #_orig_obs: 289129 survey2
2012 4 3 436748 0.1 #_orig_obs: 706797 survey2
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
1985  1 1  0 0 1 -1 -1 800  117.751 283.717 328.97 59.2351 8.5506 1.7763 0
1986  1 1  0 0 1 -1 -1 800  29.6798 314.495 372.322 71.6005 9.91068 1.5109 0.481292
1987  1 1  0 0 1 -1 -1 800  39.4886 102.545 534.569 104.937 15.5004 2.96082 0
1988  1 1  0 0 1 -1 -1 800  45.9269 210.25 268.997 232.744 35.0424 5.45972 1.57969
1989  1 1  0 0 1 -1 -1 800  274.672 127.709 287.391 61.2069 40.6331 6.45205 1.93557
1990  1 1  0 0 1 -1 -1 800  449.307 264.919 56.6223 21.9855 3.71112 2.63214 0.822222
1991  1 1  0 0 1 -1 -1 800  81.1682 559.325 152.152 5.00429 2.35078 0 0
1992  1 1  0 0 1 -1 -1 800  26.3348 178.234 569.089 25.1973 1.14564 0 0
1993  1 1  0 0 1 -1 -1 800  109.409 128.051 359.014 195.544 7.43148 0.220262 0.329887
1994  1 1  0 0 1 -1 -1 800  165.204 363.174 166.787 67.6096 35.33 1.8958 0
1995  1 1  0 0 1 -1 -1 800  55.0427 369.891 339.77 21.6368 8.18707 5.47182 0
1996  1 1  0 0 1 -1 -1 800  370.145 112.51 270.107 42.5481 4.69015 0 0
1997  1 1  0 0 1 -1 -1 800  220.047 507.614 53.7775 18.5611 0 0 0
1998  1 1  0 0 1 -1 -1 800  69.5752 408.573 315.098 6.7541 0 0 0
1999  1 1  0 0 1 -1 -1 800  47.6516 243.137 464.905 42.967 1.33878 0 0
2000  1 1  0 0 1 -1 -1 800  208.932 208.605 295.161 77.5821 9.71984 0 0
2001  1 1  0 0 1 -1 -1 800  156.387 500.244 118.772 15.857 8.74084 0 0
2002  1 1  0 0 1 -1 -1 800  43.2819 434.957 312.159 6.31345 3.28842 0 0
2003  1 1  0 0 1 -1 -1 800  312.179 157.635 309.696 20.4901 0 0 0
2004  1 1  0 0 1 -1 -1 800  359.635 402.085 33.4562 3.79369 0.65453 0.0633615 0.312684
2005  1 1  0 0 1 -1 -1 800  107.678 558.67 132.936 0.41074 0.134348 0.0538734 0.117363
2006  1 1  0 0 1 -1 -1 800  297.247 214.776 280.298 7.67925 0 0 0
2007  1 1  0 0 1 -1 -1 800  208.13 480.471 101.025 10.3745 0 0 0
2008  1 1  0 0 1 -1 -1 800  50.4992 409.685 330.106 8.69247 1.01694 0 0
2009  1 1  0 0 1 -1 -1 800  368.456 108.922 288.904 32.6109 1.10701 0 0
2010  1 1  0 0 1 -1 -1 800  272.768 463.456 47.7222 14.0884 1.96508 0 0
2011  1 1  0 0 1 -1 -1 800  94.9526 421.227 278.631 5.1893 0 0 0
2012  1 1  0 0 1 -1 -1 800  122.267 242.878 394.069 40.7857 0 0 0
1990  10 2  0 0 1 -1 -1 800  40.5612 223.691 442.788 92.0247 0.934933 0 0
1991  10 2  0 0 1 -1 -1 800  3.36648 218.981 567.668 9.98508 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 25.5007 756.767 17.7319 0 0 0
1993  10 2  0 0 1 -1 -1 800  2.30584 24.632 590.855 181.793 0.414208 0 0
1994  10 2  0 0 1 -1 -1 800  6.76638 135.669 531.766 121.971 3.82766 0 0
1995  10 2  0 0 1 -1 -1 800  0 84.2489 691.317 24.4345 0 0 0
1996  10 2  0 0 1 -1 -1 800  14.3687 38.25 680.289 67.0921 0 0 0
1997  10 2  0 0 1 -1 -1 800  18.8313 390.183 334.881 56.1039 0 0 0
1998  10 2  0 0 1 -1 -1 800  2.32066 118.978 672.191 6.50975 0 0 0
1999  10 2  0 0 1 -1 -1 800  1.09834 49.2887 709.131 40.4347 0.0475111 0 0
2000  10 2  0 0 1 -1 -1 800  8.87695 72.8706 600.968 116.323 0.961309 0 0
2001  10 2  0 0 1 -1 -1 800  12.6144 325.47 417.236 44.6797 0 0 0
2002  10 2  0 0 1 -1 -1 800  2.10483 168.419 619.192 10.284 0 0 0
2003  10 2  0 0 1 -1 -1 800  22.5638 85.0837 654.195 38.158 0 0 0
2004  10 2  0 0 1 -1 -1 800  70.1134 560.087 150.551 19.2488 0 0 0
2005  10 2  0 0 1 -1 -1 800  7.01518 308.72 483.232 1.03341 0 0 0
2006  10 2  0 0 1 -1 -1 800  16.2466 94.9003 674.797 14.0565 0 0 0
2007  10 2  0 0 1 -1 -1 800  14.2208 290.215 467.534 28.031 0 0 0
2008  10 2  0 0 1 -1 -1 800  0 107.578 681.707 10.7143 0 0 0
2009  10 2  0 0 1 -1 -1 800  14.2766 36.6553 698.745 50.3226 0 0 0
2010  10 2  0 0 1 -1 -1 800  25.3658 388.748 329.034 56.8529 0 0 0
2011  10 2  0 0 1 -1 -1 800  2.90381 117.919 673.852 5.32476 0 0 0
2012  10 2  0 0 1 -1 -1 800  3.09883 54.8207 699.545 42.5354 0 0 0
1985  4 3  0 0 1 -1 -1 800  0.0382908 112.458 603.456 84.0476 0 0 0
1986  4 3  0 0 1 -1 -1 800  0.00855545 109.695 600.923 89.3733 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 27.8115 670.356 101.833 0 0 0
1988  4 3  0 0 1 -1 -1 800  0.0132361 73.5478 435.051 289.729 1.65908 0 0
1989  4 3  0 0 1 -1 -1 800  0.10706 60.7586 632.843 103.675 2.61652 0 0
1990  4 3  0 0 1 -1 -1 800  0.475977 345.222 350.446 103.856 0 0 0
1991  4 3  0 0 1 -1 -1 800  0.0411179 346.636 442.083 11.2401 0 0 0
1992  4 3  0 0 1 -1 -1 800  0.00590169 48.3569 727.085 24.552 0 0 0
1993  4 3  0 0 1 -1 -1 800  0.0271791 39.3907 540.428 220.154 0 0 0
1994  4 3  0 0 1 -1 -1 800  0.0743672 202.878 456.292 138.093 2.66256 0 0
1995  4 3  0 0 1 -1 -1 800  0.0172715 142.493 626.917 30.1416 0.431309 0 0
1996  4 3  0 0 1 -1 -1 800  0.143089 54.7861 667.571 77.4994 0 0 0
1997  4 3  0 0 1 -1 -1 800  0.169517 488.306 257.278 54.2462 0 0 0
1998  4 3  0 0 1 -1 -1 800  0.0218205 161.074 631.811 7.09312 0 0 0
1999  4 3  0 0 1 -1 -1 800  0.0110718 70.5825 682.914 46.4924 0 0 0
2000  4 3  0 0 1 -1 -1 800  0.0636364 81.5698 601.892 116.474 0 0 0
2001  4 3  0 0 1 -1 -1 800  0.0818965 338.227 419.815 41.2245 0.650739 0 0
2002  4 3  0 0 1 -1 -1 800  0.0128423 166.331 624.259 9.39766 0 0 0
2003  4 3  0 0 1 -1 -1 800  0.103643 68.8918 699.336 31.6682 0 0 0
2004  4 3  0 0 1 -1 -1 800  0.368738 548.094 231.119 20.4184 0 0 0
2005  4 3  0 0 1 -1 -1 800  0.054322 358.392 441.553 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  0.107802 100.529 685.759 13.6047 0 0 0
2007  4 3  0 0 1 -1 -1 800  0.129156 374.349 396.774 28.7477 0 0 0
2008  4 3  0 0 1 -1 -1 800  0.0155232 156.778 630.865 12.3415 0 0 0
2009  4 3  0 0 1 -1 -1 800  0.136804 51.0824 691.427 57.3538 0 0 0
2010  4 3  0 0 1 -1 -1 800  0.232665 492.946 251.431 55.3907 0 0 0
2011  4 3  0 0 1 -1 -1 800  0.0341988 187.774 605.853 6.33921 0 0 0
2012  4 3  0 0 1 -1 -1 800  0.0330746 82.1301 667.724 50.1131 0 0 0
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

