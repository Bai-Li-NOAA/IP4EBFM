#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:49:26 2022
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
-999 1 1 10915.1 0.05
1985 1 1 194770 0.05
1986 1 1 172920 0.05
1987 1 1 92648.6 0.05
1988 1 1 25300.1 0.05
1989 1 1 52000.1 0.05
1990 1 1 65260.1 0.05
1991 1 1 76070.9 0.05
1992 1 1 133200 0.05
1993 1 1 203061 0.05
1994 1 1 92400.1 0.05
1995 1 1 49317.1 0.05
1996 1 1 121583 0.05
1997 1 1 101885 0.05
1998 1 1 191019 0.05
1999 1 1 156214 0.05
2000 1 1 234075 0.05
2001 1 1 205016 0.05
2002 1 1 150070 0.05
2003 1 1 131840 0.05
2004 1 1 193157 0.05
2005 1 1 376081 0.05
2006 1 1 460848 0.05
2007 1 1 323373 0.05
2008 1 1 251169 0.05
2009 1 1 203507 0.05
2010 1 1 179489 0.05
2011 1 1 227384 0.05
2012 1 1 185444 0.05
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
1990 10 2 4.75e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 3.95878e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.92227e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.72406e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.6023e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 947113 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.21472e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 5.70685e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.46058e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.97333e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.25849e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.46426e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 996935 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.08816e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.42288e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.49378e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.98485e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.84039e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.71707e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.92783e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 3.39947e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 2.25011e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 1.2489e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.01235e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 385793 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 285646 0.1 #_orig_obs: 954308 survey2
1988 4 3 215611 0.1 #_orig_obs: 245537 survey2
1989 4 3 446704 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.80383e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.38085e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 626053 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 655197 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 589521 0.1 #_orig_obs: 375877 survey2
1995 4 3 321246 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.24227e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 2.11894e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.58456e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.01864e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 836501 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 946582 0.1 #_orig_obs: 689461 survey2
2002 4 3 363428 0.1 #_orig_obs: 525909 survey2
2003 4 3 816839 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.86539e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 2.03654e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.5259e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.46924e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 634080 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.14223e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.287e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 845099 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 475708 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  114.663 152.588 222.444 173.256 78.7272 58.3226 0
1986  1 1  0 0 1 -1 -1 800  49.2049 284.888 325.645 122.811 13.8666 2.23625 1.34891
1987  1 1  0 0 1 -1 -1 800  94.9986 97.4714 489.559 115.668 2.25781 0.0452117 0
1988  1 1  0 0 1 -1 -1 800  101.273 180.347 194.778 316.818 6.75497 0.0292565 0
1989  1 1  0 0 1 -1 -1 800  313.289 150.083 235.9 74.6148 25.8451 0.26698 0.00109424
1990  1 1  0 0 1 -1 -1 800  544.99 162.46 68.9757 23.1596 0.413853 0 0
1991  1 1  0 0 1 -1 -1 800  193.082 451.312 137.101 17.9212 0.580412 0.00240326 0.000173193
1992  1 1  0 0 1 -1 -1 800  44.3695 200.687 495.84 57.5923 1.51044 0 0
1993  1 1  0 0 1 -1 -1 800  120.146 83.3216 343.134 248.166 5.23184 0 0
1994  1 1  0 0 1 -1 -1 800  192.979 280.225 167.383 151.573 7.80655 0.0323724 0
1995  1 1  0 0 1 -1 -1 800  83.4306 266.678 382.766 62.9166 4.1674 0.0411136 0
1996  1 1  0 0 1 -1 -1 800  422.987 82.2895 215.782 76.9057 1.98492 0.0503684 0.000491677
1997  1 1  0 0 1 -1 -1 800  395.683 321.327 55.002 27.6578 0.330233 0 0
1998  1 1  0 0 1 -1 -1 800  163.723 355.573 267.973 12.118 0.612661 0 0
1999  1 1  0 0 1 -1 -1 800  83.7231 189.581 423.347 102.824 0.524728 0 0
2000  1 1  0 0 1 -1 -1 800  112.955 151.484 315.785 210.475 9.30164 0 0
2001  1 1  0 0 1 -1 -1 800  252.636 236.58 223.115 83.5277 4.1039 0.0378069 0.000138095
2002  1 1  0 0 1 -1 -1 800  80.121 431.767 261.68 26.316 0.115346 0.000357716 0
2003  1 1  0 0 1 -1 -1 800  351.876 94.6797 331.965 21.4542 0.0253229 8.53966e-05 8.00066e-05
2004  1 1  0 0 1 -1 -1 800  567.904 187.124 32.7262 12.2357 0.00933233 0 0
2005  1 1  0 0 1 -1 -1 800  214.794 480.728 102.557 1.92106 0 0 0
2006  1 1  0 0 1 -1 -1 800  168.183 254.507 368.916 8.39437 0 0 0
2007  1 1  0 0 1 -1 -1 800  234.935 265.039 259.851 40.1652 0.0107704 0 0
2008  1 1  0 0 1 -1 -1 800  95.2395 390.087 284.84 29.7793 0.0539347 0 0
2009  1 1  0 0 1 -1 -1 800  318.551 124.479 331.153 25.785 0.0316197 8.2784e-05 0
2010  1 1  0 0 1 -1 -1 800  316.494 364.897 92.3792 26.2062 0.0239551 0 0
2011  1 1  0 0 1 -1 -1 800  166.613 358.511 267.627 7.22496 0.0240605 0 0
2012  1 1  0 0 1 -1 -1 800  122.282 270.642 377.052 30.0142 0.00956151 0 0
1990  10 2  0 0 1 -1 -1 800  744.816 50.9795 3.99915 0.203526 0.00138766 0 0
1991  10 2  0 0 1 -1 -1 800  504.976 276.742 18.2811 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  303.934 322.991 168.193 4.88216 0 0 0
1993  10 2  0 0 1 -1 -1 800  622.131 98.5536 72.3601 6.90874 0.0469093 0 0
1994  10 2  0 0 1 -1 -1 800  583.994 193.273 20.3609 2.33375 0.0375609 0 0
1995  10 2  0 0 1 -1 -1 800  403.008 303.408 90.0551 3.40977 0.117777 0.00116201 0
1996  10 2  0 0 1 -1 -1 800  753.499 32.8128 13.3258 0.362318 0 0 0
1997  10 2  0 0 1 -1 -1 800  670.23 125.386 4.04863 0.333956 0.00162601 0 0
1998  10 2  0 0 1 -1 -1 800  508.662 254.68 36.3781 0.274783 0.00553681 9.44865e-05 8.00314e-05
1999  10 2  0 0 1 -1 -1 800  445.167 236.622 111.494 6.69806 0.0187701 0.000317301 0
2000  10 2  0 0 1 -1 -1 800  557.888 171.379 64.6271 6.016 0.0897448 0.000241656 0
2001  10 2  0 0 1 -1 -1 800  650.782 132.771 16.2188 0.227403 0.0013681 8.77413e-05 0
2002  10 2  0 0 1 -1 -1 800  351.929 415.342 32.6055 0.122842 0.000142015 8.0097e-05 8.00004e-05
2003  10 2  0 0 1 -1 -1 800  736.873 43.379 19.7482 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  745.251 54.7489 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  532.823 259.988 7.18933 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  574.692 189.666 35.6108 0.0304105 0 0 0
2007  10 2  0 0 1 -1 -1 800  626.371 153.963 19.5522 0.113227 8.34732e-05 0 0
2008  10 2  0 0 1 -1 -1 800  403.936 361.718 34.2116 0.133989 0.000107929 8.00002e-05 0
2009  10 2  0 0 1 -1 -1 800  717.7 61.1628 21.0757 0.0615189 8.86672e-05 8.00005e-05 0
2010  10 2  0 0 1 -1 -1 800  635.114 159.596 5.23354 0.0556691 0 0 0
2011  10 2  0 0 1 -1 -1 800  528.273 247.747 23.9552 0.024301 0 0 0
2012  10 2  0 0 1 -1 -1 800  509.777 245.745 44.346 0.132241 8.48142e-05 8.00005e-05 7.99999e-05
1985  4 3  0 0 1 -1 -1 800  595.585 140.734 43.4477 13.0533 7.17996 0 0
1986  4 3  0 0 1 -1 -1 800  341.394 355.396 89.9194 12.2052 0.899911 0.141118 0.0447553
1987  4 3  0 0 1 -1 -1 800  570.249 104.693 114.734 10.1819 0.138994 0.00242606 0.000290085
1988  4 3  0 0 1 -1 -1 800  559.38 176.565 39.4027 24.2496 0.400967 0.0018157 9.32674e-05
1989  4 3  0 0 1 -1 -1 800  713.836 61.7024 21.4492 2.44973 0.556684 0.00567308 9.11629e-05
1990  4 3  0 0 1 -1 -1 800  755.563 40.2466 3.71221 0.478153 0 0 0
1991  4 3  0 0 1 -1 -1 800  554.864 229.773 14.6113 0.751229 0 0 0
1992  4 3  0 0 1 -1 -1 800  357.655 287.139 148.458 6.74819 0 0 0
1993  4 3  0 0 1 -1 -1 800  631.482 78.4472 70.7295 19.0641 0.277019 0 0
1994  4 3  0 0 1 -1 -1 800  612.53 159.333 20.8822 7.00726 0.247424 0 0
1995  4 3  0 0 1 -1 -1 800  455.711 260.354 78.6984 4.98172 0.252578 0.00259462 0
1996  4 3  0 0 1 -1 -1 800  755.917 26.5665 15.6031 1.88266 0.0293927 0.000788042 8.30366e-05
1997  4 3  0 0 1 -1 -1 800  694.844 100.709 3.72658 0.721218 0 0 0
1998  4 3  0 0 1 -1 -1 800  551.086 213.543 34.7488 0.62251 0 0 0
1999  4 3  0 0 1 -1 -1 800  497.977 199.911 93.3797 8.69727 0.0342933 0 0
2000  4 3  0 0 1 -1 -1 800  580.716 139.463 63.4563 15.8745 0.489765 0 0
2001  4 3  0 0 1 -1 -1 800  660.683 112.539 24.121 2.59181 0.0645049 0.000621438 8.04342e-05
2002  4 3  0 0 1 -1 -1 800  376.467 370.959 51.0963 1.47488 0.00334827 8.71825e-05 0
2003  4 3  0 0 1 -1 -1 800  734.589 36.1059 28.771 0.533743 0.000397688 8.0062e-05 8e-05
2004  4 3  0 0 1 -1 -1 800  752.872 45.141 1.79431 0.192613 0.000153656 8.00038e-05 7.99999e-05
2005  4 3  0 0 1 -1 -1 800  560.519 228.35 11.0716 0.0593405 0.000211154 8.00044e-05 7.99999e-05
2006  4 3  0 0 1 -1 -1 800  585.259 161.267 53.127 0.346992 0 0 0
2007  4 3  0 0 1 -1 -1 800  638.478 131.03 29.1964 1.29549 0 0 0
2008  4 3  0 0 1 -1 -1 800  426.562 318.922 52.9257 1.58816 0.00153308 0 0
2009  4 3  0 0 1 -1 -1 800  717.403 51.0446 30.862 0.68977 0.000506826 8.00344e-05 0
2010  4 3  0 0 1 -1 -1 800  654.205 137.254 7.89725 0.643056 0.000376374 0 0
2011  4 3  0 0 1 -1 -1 800  548.509 214.771 36.4372 0.282399 0.000554101 0 0
2012  4 3  0 0 1 -1 -1 800  521.911 210.059 66.5105 1.51985 0 0 0
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

