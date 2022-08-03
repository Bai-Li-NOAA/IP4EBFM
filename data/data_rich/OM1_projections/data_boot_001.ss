#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 09:16:08 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659532568 first rand#: 0.674593
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1.00001 #_spawn_month
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
#_catch_biomass(mtons):_columns_are_fisheries,year,season
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 126494 0.05
1985 1 1 589884 0.05
1986 1 1 301976 0.05
1987 1 1 389306 0.05
1988 1 1 440943 0.05
1989 1 1 432362 0.05
1990 1 1 496181 0.05
1991 1 1 483445 0.05
1992 1 1 323926 0.05
1993 1 1 263090 0.05
1994 1 1 224183 0.05
1995 1 1 347668 0.05
1996 1 1 285886 0.05
1997 1 1 367958 0.05
1998 1 1 366267 0.05
1999 1 1 288542 0.05
2000 1 1 191263 0.05
2001 1 1 255208 0.05
2002 1 1 222211 0.05
2003 1 1 233488 0.05
2004 1 1 225904 0.05
2005 1 1 209482 0.05
2006 1 1 242008 0.05
2007 1 1 200725 0.05
2008 1 1 180049 0.05
2009 1 1 172754 0.05
2010 1 1 266065 0.05
2011 1 1 229880 0.05
2012 1 1 177902 0.05
-9999 0 0 0 0
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
1990 10 2 4.28336e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 784746 0.75 #_orig_obs: 457211 survey1
1992 10 2 713013 0.76 #_orig_obs: 654267 survey1
1993 10 2 551112 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 7.03142e+06 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 713250 0.74 #_orig_obs: 765889 survey1
1996 10 2 1.16253e+06 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 1.8978e+06 0.59 #_orig_obs: 798920 survey1
1998 10 2 542552 0.88 #_orig_obs: 467336 survey1
1999 10 2 2.4873e+06 0.61 #_orig_obs: 762429 survey1
2000 10 2 3.30566e+06 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 844995 0.83 #_orig_obs: 181093 survey1
2002 10 2 605285 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 667794 0.68 #_orig_obs: 433759 survey1
2004 10 2 874620 0.73 #_orig_obs: 655693 survey1
2005 10 2 2.18475e+06 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 844172 0.67 #_orig_obs: 848202 survey1
2007 10 2 1.17509e+06 0.59 #_orig_obs: 853227 survey1
2008 10 2 602802 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 1.28739e+06 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 486392 0.8 #_orig_obs: 704446 survey1
2011 10 2 739772 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 519865 0.59 #_orig_obs: 472946 survey1
1985 4 3 4.24139e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 1.63261e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 1.44577e+06 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 916893 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 9.69273e+06 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 3.25686e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 2.33656e+06 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 2.09014e+06 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 1.01968e+06 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 1.11746e+06 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 2.57703e+06 1.13 #_orig_obs: 489338 survey2
1996 4 3 2.351e+06 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 2.26261e+06 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 823890 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 921581 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 2.05831e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 1.84141e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 1.8135e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.65456e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 3.39898e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 1.44757e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 2.41835e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 2.64175e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 3.78056e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 2.0922e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 1.16125e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 1.06821e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 1.13522e+06 0.44 #_orig_obs: 2.47554e+06 survey2
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
50 # maximum size in the population (lower edge of last bin) 
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
1985  1 1  0 0 1 -1 -1 800  53 232 376 106 27 2 4
1986  1 1  0 0 1 -1 -1 800  58 240 399 79 18 6 0
1987  1 1  0 0 1 -1 -1 800  64 182 447 84 17 2 4
1988  1 1  0 0 1 -1 -1 800  115 262 314 82 22 5 0
1989  1 1  0 0 1 -1 -1 800  67 371 307 43 8 3 1
1990  1 1  0 0 1 -1 -1 800  49 256 443 40 10 2 0
1991  1 1  0 0 1 -1 -1 800  35 205 431 116 10 3 0
1992  1 1  0 0 1 -1 -1 800  53 177 412 119 31 4 4
1993  1 1  0 0 1 -1 -1 800  53 207 385 125 23 7 0
1994  1 1  0 0 1 -1 -1 800  61 223 405 81 23 7 0
1995  1 1  0 0 1 -1 -1 800  72 277 348 82 13 8 0
1996  1 1  0 0 1 -1 -1 800  66 263 385 70 12 4 0
1997  1 1  0 0 1 -1 -1 800  55 232 407 89 13 4 0
1998  1 1  0 0 1 -1 -1 800  54 264 366 92 12 12 0
1999  1 1  0 0 1 -1 -1 800  49 209 436 80 22 4 0
2000  1 1  0 0 1 -1 -1 800  75 213 376 116 14 6 0
2001  1 1  0 0 1 -1 -1 800  70 236 383 94 16 1 0
2002  1 1  0 0 1 -1 -1 800  62 244 390 90 11 0 3
2003  1 1  0 0 1 -1 -1 800  60 229 398 95 18 0 0
2004  1 1  0 0 1 -1 -1 800  79 196 393 105 23 4 0
2005  1 1  0 0 1 -1 -1 800  59 268 357 83 24 9 0
2006  1 1  0 0 1 -1 -1 800  51 177 462 90 14 6 0
2007  1 1  0 0 1 -1 -1 800  47 266 360 105 18 4 0
2008  1 1  0 0 1 -1 -1 800  59 211 403 96 23 8 0
2009  1 1  0 0 1 -1 -1 800  61 229 389 90 20 11 0
2010  1 1  0 0 1 -1 -1 800  51 223 406 87 24 9 0
2011  1 1  0 0 1 -1 -1 800  35 211 421 107 21 5 0
2012  1 1  0 0 1 -1 -1 800  45 182 443 102 16 6 6
1990  10 2  0 0 1 -1 -1 800  583 171 38 5 3 0 0
1991  10 2  0 0 1 -1 -1 800  571 176 45 7 1 0 0
1992  10 2  0 0 1 -1 -1 800  630 117 34 13 6 0 0
1993  10 2  0 0 1 -1 -1 800  599 152 34 11 4 0 0
1994  10 2  0 0 1 -1 -1 800  656 110 21 9 4 0 0
1995  10 2  0 0 1 -1 -1 800  632 132 26 7 2 1 0
1996  10 2  0 0 1 -1 -1 800  613 140 37 6 3 1 0
1997  10 2  0 0 1 -1 -1 800  613 145 35 7 0 0 0
1998  10 2  0 0 1 -1 -1 800  595 167 34 3 1 0 0
1999  10 2  0 0 1 -1 -1 800  637 116 39 7 0 1 0
2000  10 2  0 0 1 -1 -1 800  625 128 33 12 1 0 1
2001  10 2  0 0 1 -1 -1 800  638 135 20 6 1 0 0
2002  10 2  0 0 1 -1 -1 800  615 144 34 3 2 2 0
2003  10 2  0 0 1 -1 -1 800  630 134 29 3 1 3 0
2004  10 2  0 0 1 -1 -1 800  651 112 28 7 2 0 0
2005  10 2  0 0 1 -1 -1 800  612 147 29 10 2 0 0
2006  10 2  0 0 1 -1 -1 800  631 117 43 7 2 0 0
2007  10 2  0 0 1 -1 -1 800  656 107 23 13 1 0 0
2008  10 2  0 0 1 -1 -1 800  636 124 33 7 0 0 0
2009  10 2  0 0 1 -1 -1 800  609 147 31 9 0 3 1
2010  10 2  0 0 1 -1 -1 800  607 154 29 7 2 1 0
2011  10 2  0 0 1 -1 -1 800  570 175 41 8 6 0 0
2012  10 2  0 0 1 -1 -1 800  607 136 48 5 3 0 1
1985  4 3  0 0 1 -1 -1 800  639 127 23 11 0 0 0
1986  4 3  0 0 1 -1 -1 800  594 150 46 8 1 1 0
1987  4 3  0 0 1 -1 -1 800  651 107 30 9 2 1 0
1988  4 3  0 0 1 -1 -1 800  713 72 11 4 0 0 0
1989  4 3  0 0 1 -1 -1 800  629 149 18 1 3 0 0
1990  4 3  0 0 1 -1 -1 800  601 152 43 4 0 0 0
1991  4 3  0 0 1 -1 -1 800  568 174 39 19 0 0 0
1992  4 3  0 0 1 -1 -1 800  629 122 36 11 2 0 0
1993  4 3  0 0 1 -1 -1 800  648 118 23 11 0 0 0
1994  4 3  0 0 1 -1 -1 800  658 101 32 7 2 0 0
1995  4 3  0 0 1 -1 -1 800  644 117 24 12 2 1 0
1996  4 3  0 0 1 -1 -1 800  623 142 30 5 0 0 0
1997  4 3  0 0 1 -1 -1 800  599 160 32 7 2 0 0
1998  4 3  0 0 1 -1 -1 800  626 131 34 7 2 0 0
1999  4 3  0 0 1 -1 -1 800  623 127 40 7 1 2 0
2000  4 3  0 0 1 -1 -1 800  660 111 23 3 1 2 0
2001  4 3  0 0 1 -1 -1 800  632 125 34 9 0 0 0
2002  4 3  0 0 1 -1 -1 800  644 119 31 6 0 0 0
2003  4 3  0 0 1 -1 -1 800  627 139 27 7 0 0 0
2004  4 3  0 0 1 -1 -1 800  677 96 22 4 1 0 0
2005  4 3  0 0 1 -1 -1 800  595 159 37 4 5 0 0
2006  4 3  0 0 1 -1 -1 800  617 133 37 7 5 1 0
2007  4 3  0 0 1 -1 -1 800  629 134 31 5 1 0 0
2008  4 3  0 0 1 -1 -1 800  631 125 31 10 1 0 2
2009  4 3  0 0 1 -1 -1 800  628 137 26 6 3 0 0
2010  4 3  0 0 1 -1 -1 800  621 138 31 9 1 0 0
2011  4 3  0 0 1 -1 -1 800  580 151 58 9 2 0 0
2012  4 3  0 0 1 -1 -1 800  619 132 38 5 2 4 0
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

