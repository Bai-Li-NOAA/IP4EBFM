#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 29 11:05:49 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661785549 first rand#: -1.11591
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
#_catch_biomass(mtons):_columns_are_fisheries,year,season
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 114003 0.05
1985 1 1 635658 0.05
1986 1 1 321206 0.05
1987 1 1 388199 0.05
1988 1 1 424114 0.05
1989 1 1 470301 0.05
1990 1 1 485702 0.05
1991 1 1 430953 0.05
1992 1 1 305225 0.05
1993 1 1 253656 0.05
1994 1 1 237588 0.05
1995 1 1 324551 0.05
1996 1 1 263109 0.05
1997 1 1 373223 0.05
1998 1 1 414191 0.05
1999 1 1 293406 0.05
2000 1 1 189205 0.05
2001 1 1 253650 0.05
2002 1 1 221533 0.05
2003 1 1 232199 0.05
2004 1 1 224346 0.05
2005 1 1 232526 0.05
2006 1 1 269497 0.05
2007 1 1 202989 0.05
2008 1 1 182658 0.05
2009 1 1 180470 0.05
2010 1 1 251850 0.05
2011 1 1 217260 0.05
2012 1 1 149872 0.05
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
1990 10 2 4.37861e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 773359 0.75 #_orig_obs: 457211 survey1
1992 10 2 2.62716e+06 0.76 #_orig_obs: 654267 survey1
1993 10 2 738067 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 246913 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 1.45925e+06 0.74 #_orig_obs: 765889 survey1
1996 10 2 839507 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 918463 0.59 #_orig_obs: 798920 survey1
1998 10 2 433312 0.88 #_orig_obs: 467336 survey1
1999 10 2 1.38056e+06 0.61 #_orig_obs: 762429 survey1
2000 10 2 1.79332e+06 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 399095 0.83 #_orig_obs: 181093 survey1
2002 10 2 886986 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 534241 0.68 #_orig_obs: 433759 survey1
2004 10 2 2.11283e+06 0.73 #_orig_obs: 655693 survey1
2005 10 2 1.7708e+06 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 1.0366e+06 0.67 #_orig_obs: 848202 survey1
2007 10 2 632268 0.59 #_orig_obs: 853227 survey1
2008 10 2 247169 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 2.28475e+06 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 1.00123e+06 0.8 #_orig_obs: 704446 survey1
2011 10 2 306172 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 1.43213e+06 0.59 #_orig_obs: 472946 survey1
1985 4 3 2.15028e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 4.72104e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 1.56747e+06 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 1.12703e+07 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 3.80103e+07 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 3.34367e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 5.35334e+06 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 5.99059e+06 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 291697 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 1.03867e+06 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 2.6637e+06 1.13 #_orig_obs: 489338 survey2
1996 4 3 1.13659e+06 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 1.72622e+06 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 868474 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 4.13294e+06 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 2.65611e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 1.68518e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 1.6704e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.1799e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 1.82778e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 1.04791e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 3.76746e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 1.7882e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 3.65549e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 2.41653e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 1.80713e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 849845 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 1.78449e+06 0.44 #_orig_obs: 2.47554e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  60 247 375 84 27 4 3
1986  1 1  0 0 1 -1 -1 800  46 261 393 73 18 9 0
1987  1 1  0 0 1 -1 -1 800  64 197 433 89 16 1 0
1988  1 1  0 0 1 -1 -1 800  111 260 321 80 23 3 2
1989  1 1  0 0 1 -1 -1 800  66 357 312 52 12 1 0
1990  1 1  0 0 1 -1 -1 800  53 213 473 54 3 4 0
1991  1 1  0 0 1 -1 -1 800  33 210 426 120 8 3 0
1992  1 1  0 0 1 -1 -1 800  42 166 441 132 17 1 1
1993  1 1  0 0 1 -1 -1 800  49 244 364 115 19 9 0
1994  1 1  0 0 1 -1 -1 800  70 223 408 78 17 4 0
1995  1 1  0 0 1 -1 -1 800  65 256 379 85 11 4 0
1996  1 1  0 0 1 -1 -1 800  38 278 412 58 12 2 0
1997  1 1  0 0 1 -1 -1 800  59 195 442 80 22 2 0
1998  1 1  0 0 1 -1 -1 800  46 243 394 99 14 4 0
1999  1 1  0 0 1 -1 -1 800  52 222 414 88 18 6 0
2000  1 1  0 0 1 -1 -1 800  70 243 381 87 13 6 0
2001  1 1  0 0 1 -1 -1 800  61 242 392 84 15 5 1
2002  1 1  0 0 1 -1 -1 800  49 268 390 78 13 1 1
2003  1 1  0 0 1 -1 -1 800  63 225 398 95 19 0 0
2004  1 1  0 0 1 -1 -1 800  69 225 391 96 17 2 0
2005  1 1  0 0 1 -1 -1 800  59 267 372 86 13 3 0
2006  1 1  0 0 1 -1 -1 800  49 199 447 89 15 1 0
2007  1 1  0 0 1 -1 -1 800  48 246 354 129 17 6 0
2008  1 1  0 0 1 -1 -1 800  50 214 422 96 16 2 0
2009  1 1  0 0 1 -1 -1 800  67 213 384 110 19 7 0
2010  1 1  0 0 1 -1 -1 800  55 234 400 86 14 11 0
2011  1 1  0 0 1 -1 -1 800  39 209 409 115 22 6 0
2012  1 1  0 0 1 -1 -1 800  38 183 426 123 22 7 1
1990  10 2  0 0 1 -1 -1 800  594 159 41 5 1 0 0
1991  10 2  0 0 1 -1 -1 800  566 172 39 21 2 0 0
1992  10 2  0 0 1 -1 -1 800  615 131 33 15 6 0 0
1993  10 2  0 0 1 -1 -1 800  610 147 25 14 4 0 0
1994  10 2  0 0 1 -1 -1 800  650 113 28 6 3 0 0
1995  10 2  0 0 1 -1 -1 800  628 136 25 8 1 1 1
1996  10 2  0 0 1 -1 -1 800  617 147 27 6 3 0 0
1997  10 2  0 0 1 -1 -1 800  609 130 41 20 0 0 0
1998  10 2  0 0 1 -1 -1 800  624 146 19 10 1 0 0
1999  10 2  0 0 1 -1 -1 800  612 145 33 5 3 2 0
2000  10 2  0 0 1 -1 -1 800  651 111 27 8 1 1 1
2001  10 2  0 0 1 -1 -1 800  635 135 24 5 1 0 0
2002  10 2  0 0 1 -1 -1 800  640 123 30 4 1 2 0
2003  10 2  0 0 1 -1 -1 800  633 133 26 6 1 1 0
2004  10 2  0 0 1 -1 -1 800  646 121 23 8 2 0 0
2005  10 2  0 0 1 -1 -1 800  607 158 22 12 1 0 0
2006  10 2  0 0 1 -1 -1 800  615 131 43 10 1 0 0
2007  10 2  0 0 1 -1 -1 800  620 139 32 6 3 0 0
2008  10 2  0 0 1 -1 -1 800  619 126 43 6 6 0 0
2009  10 2  0 0 1 -1 -1 800  614 146 29 6 4 1 0
2010  10 2  0 0 1 -1 -1 800  612 133 38 12 2 3 0
2011  10 2  0 0 1 -1 -1 800  570 162 55 11 2 0 0
2012  10 2  0 0 1 -1 -1 800  589 141 51 14 5 0 0
1985  4 3  0 0 1 -1 -1 800  631 126 33 10 0 0 0
1986  4 3  0 0 1 -1 -1 800  604 142 41 9 4 0 0
1987  4 3  0 0 1 -1 -1 800  653 111 27 5 4 0 0
1988  4 3  0 0 1 -1 -1 800  681 102 14 1 2 0 0
1989  4 3  0 0 1 -1 -1 800  653 132 13 1 1 0 0
1990  4 3  0 0 1 -1 -1 800  615 146 33 6 0 0 0
1991  4 3  0 0 1 -1 -1 800  555 192 45 8 0 0 0
1992  4 3  0 0 1 -1 -1 800  632 114 37 15 2 0 0
1993  4 3  0 0 1 -1 -1 800  625 128 32 8 7 0 0
1994  4 3  0 0 1 -1 -1 800  645 117 28 7 3 0 0
1995  4 3  0 0 1 -1 -1 800  664 110 17 7 1 1 0
1996  4 3  0 0 1 -1 -1 800  625 137 28 7 3 0 0
1997  4 3  0 0 1 -1 -1 800  629 128 33 8 2 0 0
1998  4 3  0 0 1 -1 -1 800  598 157 39 4 2 0 0
1999  4 3  0 0 1 -1 -1 800  634 115 39 9 3 0 0
2000  4 3  0 0 1 -1 -1 800  647 124 23 3 2 1 0
2001  4 3  0 0 1 -1 -1 800  644 127 21 5 3 0 0
2002  4 3  0 0 1 -1 -1 800  622 145 28 5 0 0 0
2003  4 3  0 0 1 -1 -1 800  662 110 24 4 0 0 0
2004  4 3  0 0 1 -1 -1 800  653 107 28 9 3 0 0
2005  4 3  0 0 1 -1 -1 800  585 169 38 7 1 0 0
2006  4 3  0 0 1 -1 -1 800  640 115 38 6 1 0 0
2007  4 3  0 0 1 -1 -1 800  628 123 30 12 5 2 0
2008  4 3  0 0 1 -1 -1 800  645 116 29 4 6 0 0
2009  4 3  0 0 1 -1 -1 800  606 157 29 5 3 0 0
2010  4 3  0 0 1 -1 -1 800  613 137 34 9 7 0 0
2011  4 3  0 0 1 -1 -1 800  611 142 38 7 2 0 0
2012  4 3  0 0 1 -1 -1 800  602 142 38 13 3 2 0
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

