#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Nov 07 10:33:24 2022
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
-999 1 1 93350.7 0.05
1985 1 1 13603.9 0.05
1986 1 1 12608.1 0.05
1987 1 1 6965.11 0.05
1988 1 1 1875.42 0.05
1989 1 1 3547.84 0.05
1990 1 1 75299.6 0.05
1991 1 1 113407 0.05
1992 1 1 249129 0.05
1993 1 1 416431 0.05
1994 1 1 203465 0.05
1995 1 1 128792 0.05
1996 1 1 343208 0.05
1997 1 1 314013 0.05
1998 1 1 775939 0.05
1999 1 1 602424 0.05
2000 1 1 495301 0.05
2001 1 1 346673 0.05
2002 1 1 374283 0.05
2003 1 1 387775 0.05
2004 1 1 432282 0.05
2005 1 1 365318 0.05
2006 1 1 670660 0.05
2007 1 1 315895 0.05
2008 1 1 314636 0.05
2009 1 1 468717 0.05
2010 1 1 368066 0.05
2011 1 1 284822 0.05
2012 1 1 506552 0.05
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
1990 10 2 2.72466e+06 0.2 #_orig_obs: 565246 survey1
1991 10 2 1.79878e+06 0.2 #_orig_obs: 3.17686e+06 survey1
1992 10 2 882974 0.2 #_orig_obs: 6.37058e+06 survey1
1993 10 2 994654 0.2 #_orig_obs: 1.31436e+06 survey1
1994 10 2 1.07917e+06 0.2 #_orig_obs: 702016 survey1
1995 10 2 697230 0.2 #_orig_obs: 1.44464e+06 survey1
1996 10 2 2.02801e+06 0.2 #_orig_obs: 819120 survey1
1997 10 2 2.55762e+06 0.2 #_orig_obs: 956532 survey1
1998 10 2 1.40955e+06 0.2 #_orig_obs: 5.72099e+06 survey1
1999 10 2 770415 0.2 #_orig_obs: 1.80107e+06 survey1
2000 10 2 1.01323e+06 0.2 #_orig_obs: 939122 survey1
2001 10 2 1.20735e+06 0.2 #_orig_obs: 582386 survey1
2002 10 2 577656 0.2 #_orig_obs: 1.16078e+06 survey1
2003 10 2 927955 0.2 #_orig_obs: 315524 survey1
2004 10 2 1.61399e+06 0.2 #_orig_obs: 216162 survey1
2005 10 2 925936 0.2 #_orig_obs: 1.39021e+06 survey1
2006 10 2 1.10463e+06 0.2 #_orig_obs: 1.09307e+06 survey1
2007 10 2 1.85915e+06 0.2 #_orig_obs: 747254 survey1
2008 10 2 1.03282e+06 0.2 #_orig_obs: 3.34384e+06 survey1
2009 10 2 1.52043e+06 0.2 #_orig_obs: 2.00662e+06 survey1
2010 10 2 3.22888e+06 0.2 #_orig_obs: 1.43041e+06 survey1
2011 10 2 3.60506e+06 0.2 #_orig_obs: 6.42547e+06 survey1
2012 10 2 3.09058e+06 0.2 #_orig_obs: 5.55618e+06 survey1
1985 4 3 716328 0.2 #_orig_obs: 1.6165e+06 survey2
1986 4 3 311169 0.2 #_orig_obs: 1.81081e+06 survey2
1987 4 3 213883 0.2 #_orig_obs: 798204 survey2
1988 4 3 154358 0.2 #_orig_obs: 203427 survey2
1989 4 3 321700 0.2 #_orig_obs: 202875 survey2
1990 4 3 1.07829e+06 0.2 #_orig_obs: 113055 survey2
1991 4 3 657074 0.2 #_orig_obs: 381334 survey2
1992 4 3 304826 0.2 #_orig_obs: 2.33967e+06 survey2
1993 4 3 386600 0.2 #_orig_obs: 990740 survey2
1994 4 3 417814 0.2 #_orig_obs: 322724 survey2
1995 4 3 255992 0.2 #_orig_obs: 429031 survey2
1996 4 3 816752 0.2 #_orig_obs: 555860 survey2
1997 4 3 1.00254e+06 0.2 #_orig_obs: 278987 survey2
1998 4 3 546036 0.2 #_orig_obs: 856773 survey2
1999 4 3 299041 0.2 #_orig_obs: 1.86496e+06 survey2
2000 4 3 414184 0.2 #_orig_obs: 656768 survey2
2001 4 3 487230 0.2 #_orig_obs: 158660 survey2
2002 4 3 225109 0.2 #_orig_obs: 243983 survey2
2003 4 3 380069 0.2 #_orig_obs: 219397 survey2
2004 4 3 666670 0.2 #_orig_obs: 38808.9 survey2
2005 4 3 358598 0.2 #_orig_obs: 146939 survey2
2006 4 3 459155 0.2 #_orig_obs: 647377 survey2
2007 4 3 746566 0.2 #_orig_obs: 313413 survey2
2008 4 3 387008 0.2 #_orig_obs: 594616 survey2
2009 4 3 606015 0.2 #_orig_obs: 1.31059e+06 survey2
2010 4 3 1.28789e+06 0.2 #_orig_obs: 555482 survey2
2011 4 3 1.38305e+06 0.2 #_orig_obs: 918923 survey2
2012 4 3 1.1645e+06 0.2 #_orig_obs: 2.29242e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  112.255 265.179 344.755 66.4245 9.45983 1.92799 0
1986  1 1  0 0 1 -1 -1 800  30.9661 291.175 385.48 79.3519 10.8833 1.63147 0.511789
1987  1 1  0 0 1 -1 -1 800  39.3867 100.387 529.873 111.044 16.2551 3.05387 0
1988  1 1  0 0 1 -1 -1 800  61.6598 191.963 275.147 230.213 34.2465 5.26781 1.50357
1989  1 1  0 0 1 -1 -1 800  210.882 171.797 300.053 68.3981 40.6375 6.35038 1.88179
1990  1 1  0 0 1 -1 -1 800  395.335 256.07 107.844 31.1445 5.25034 3.33026 1.02606
1991  1 1  0 0 1 -1 -1 800  93.3248 519.062 173.609 10.5832 3.42179 0 0
1992  1 1  0 0 1 -1 -1 800  28.7953 191.836 549.343 28.075 1.95109 0 0
1993  1 1  0 0 1 -1 -1 800  120.967 125.723 373.648 171.601 7.27155 0.387087 0.402751
1994  1 1  0 0 1 -1 -1 800  177.994 369.021 162.792 61.7031 26.7118 1.77844 0
1995  1 1  0 0 1 -1 -1 800  75.3877 352.626 343.305 18.6794 6.30234 3.69948 0
1996  1 1  0 0 1 -1 -1 800  318.033 148.885 285.407 47.6755 0 0 0
1997  1 1  0 0 1 -1 -1 800  230.092 460.976 86.7648 18.7019 2.98199 0.193309 0.289536
1998  1 1  0 0 1 -1 -1 800  76.6825 403.734 309.786 7.66291 2.13497 0 0
1999  1 1  0 0 1 -1 -1 800  59.7624 233.121 465.719 39.8481 1.06477 0.485089 0
2000  1 1  0 0 1 -1 -1 800  211.164 225.891 282.597 72.6915 7.65752 0 0
2001  1 1  0 0 1 -1 -1 800  233.418 414.525 131.895 13.9453 5.21172 1.00466 0
2002  1 1  0 0 1 -1 -1 800  69.5519 456.062 265.257 7.29131 1.03348 0.616996 0.187299
2003  1 1  0 0 1 -1 -1 800  226.327 178.291 370.77 23.4101 0.801159 0.169715 0.230253
2004  1 1  0 0 1 -1 -1 800  343.014 367.083 73.3147 14.9386 1.45106 0.0842659 0.113857
2005  1 1  0 0 1 -1 -1 800  97.5912 529.606 170.266 2.53619 0 0 0
2006  1 1  0 0 1 -1 -1 800  198.522 227.584 359.508 14.3861 0 0 0
2007  1 1  0 0 1 -1 -1 800  292.86 364.328 128.498 14.314 0 0 0
2008  1 1  0 0 1 -1 -1 800  76.7306 478.17 235.974 9.12537 0 0 0
2009  1 1  0 0 1 -1 -1 800  174.218 169.405 427.23 28.0691 1.07729 0 0
2010  1 1  0 0 1 -1 -1 800  323.055 316.303 121.035 39.6065 0 0 0
2011  1 1  0 0 1 -1 -1 800  177 423.193 189.183 8.06897 2.55444 0 0
2012  1 1  0 0 1 -1 -1 800  104.587 310.3 360.649 23.3535 1.11041 0 0
1990  10 2  0 0 1 -1 -1 800  731.571 55.188 5.98567 3.37016 3.88537 0 0
1991  10 2  0 0 1 -1 -1 800  463.874 302.69 26.7805 3.13166 1.75057 0.622127 1.15053
1992  10 2  0 0 1 -1 -1 800  328.86 256.106 191.454 18.9196 2.20217 1.02916 1.42924
1993  10 2  0 0 1 -1 -1 800  622.823 73.0713 49.5819 47.7885 6.73523 0 0
1994  10 2  0 0 1 -1 -1 800  614.48 144.174 14.6687 11.5958 13.2448 1.83715 0
1995  10 2  0 0 1 -1 -1 800  465.771 252.773 62.4866 6.68571 5.70047 5.7441 0.839501
1996  10 2  0 0 1 -1 -1 800  739.242 38.2745 15.4019 7.08136 0 0 0
1997  10 2  0 0 1 -1 -1 800  644.107 155.893 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  475.945 275.775 48.2805 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  482.863 209.046 88.9604 16.674 1.21726 0.704744 0.534993
2000  10 2  0 0 1 -1 -1 800  692.412 77.4475 15.8827 10.5404 3.71759 0 0
2001  10 2  0 0 1 -1 -1 800  664.202 124.404 6.75051 1.79634 2.84725 0 0
2002  10 2  0 0 1 -1 -1 800  444.102 315.742 35.421 2.26881 0.917105 1.07753 0.47243
2003  10 2  0 0 1 -1 -1 800  715.128 59.4978 21.2346 3.36099 0.344804 0.145969 0.287461
2004  10 2  0 0 1 -1 -1 800  720.759 79.2405 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  489.275 290.763 19.9618 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  698.078 81.2837 20.6387 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  697.64 94.0872 6.39635 1.87685 0 0 0
2008  10 2  0 0 1 -1 -1 800  446.077 314.605 35.8099 2.5607 0.947614 0 0
2009  10 2  0 0 1 -1 -1 800  679.445 73.6964 40.4276 5.74356 0.51079 0.14517 0.0309053
2010  10 2  0 0 1 -1 -1 800  710.893 77.5598 11.5476 0 0 0 0
2011  10 2  0 0 1 -1 -1 800  609.015 168.857 19.1308 1.60641 1.17657 0.214603 0
2012  10 2  0 0 1 -1 -1 800  548.202 188.399 55.2607 7.06278 0.621068 0.454998 0
1985  4 3  0 0 1 -1 -1 800  607.969 131.722 39.9103 13.2684 7.12979 0 0
1986  4 3  0 0 1 -1 -1 800  352.236 303.76 93.7047 33.2862 11.193 5.82007 0
1987  4 3  0 0 1 -1 -1 800  476.005 111.252 136.748 49.4679 17.7592 5.59523 3.17237
1988  4 3  0 0 1 -1 -1 800  501.77 143.231 47.784 69.0298 25.1903 8.46151 4.53349
1989  4 3  0 0 1 -1 -1 800  699.447 52.2595 21.2696 8.36644 12.1869 4.15793 2.31268
1990  4 3  0 0 1 -1 -1 800  745.755 44.6406 4.52035 2.219 0.903397 1.24361 0.71766
1991  4 3  0 0 1 -1 -1 800  511.809 262.299 25.8914 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  384.113 236.14 161.653 14.0805 1.59062 0.857135 1.56644
1993  4 3  0 0 1 -1 -1 800  649.084 63.0901 46.9703 36.0328 4.82294 0 0
1994  4 3  0 0 1 -1 -1 800  642.688 124.495 13.7188 8.69516 10.4033 0 0
1995  4 3  0 0 1 -1 -1 800  512.039 221.67 52.1859 4.8139 3.91097 5.38016 0
1996  4 3  0 0 1 -1 -1 800  745.47 32.8779 16.1082 5.54372 0 0 0
1997  4 3  0 0 1 -1 -1 800  665.857 124.89 5.90715 2.12441 1.22118 0 0
1998  4 3  0 0 1 -1 -1 800  499.287 248.076 48.849 2.00255 1.785 0 0
1999  4 3  0 0 1 -1 -1 800  504.994 185.353 94.3486 13.4058 0.837999 0.534714 0.525849
2000  4 3  0 0 1 -1 -1 800  692.757 71.102 23.453 9.98289 2.23629 0.176574 0.292637
2001  4 3  0 0 1 -1 -1 800  672.419 114.269 9.5603 1.67114 2.08046 0 0
2002  4 3  0 0 1 -1 -1 800  463.988 288.564 43.5335 1.97863 0.648247 0.822932 0.464208
2003  4 3  0 0 1 -1 -1 800  713.208 53.7395 29.3704 3.06545 0.239841 0.107332 0.269838
2004  4 3  0 0 1 -1 -1 800  719.102 75.1536 3.96153 1.78251 0 0 0
2005  4 3  0 0 1 -1 -1 800  513.728 263.542 22.7305 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  689.281 76.4591 31.9844 2.27591 0 0 0
2007  4 3  0 0 1 -1 -1 800  707.35 83.4661 7.6366 1.54731 0 0 0
2008  4 3  0 0 1 -1 -1 800  482.055 280.683 37.2629 0 0 0 0
2009  4 3  0 0 1 -1 -1 800  691.554 63.16 40.3956 4.41396 0.476637 0 0
2010  4 3  0 0 1 -1 -1 800  723.143 66.5266 6.46244 3.86816 0 0 0
2011  4 3  0 0 1 -1 -1 800  640.783 141.825 15.3427 1.1091 0.939861 0 0
2012  4 3  0 0 1 -1 -1 800  587.373 161.393 45.4679 5.76625 0 0 0
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

