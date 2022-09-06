#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 06 08:56:35 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662468995 first rand#: 0.316901
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
#_catch_biomass(mtons):_columns_are_fisheries,year,season
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 130342 0.05
1985 1 1 194194 0.05
1986 1 1 169318 0.05
1987 1 1 93578.3 0.05
1988 1 1 26491.8 0.05
1989 1 1 51362.8 0.05
1990 1 1 63429.8 0.05
1991 1 1 73081 0.05
1992 1 1 147741 0.05
1993 1 1 209755 0.05
1994 1 1 90764.9 0.05
1995 1 1 48371.8 0.05
1996 1 1 127519 0.05
1997 1 1 101691 0.05
1998 1 1 191127 0.05
1999 1 1 140992 0.05
2000 1 1 234499 0.05
2001 1 1 210744 0.05
2002 1 1 206199 0.05
2003 1 1 318742 0.05
2004 1 1 578545 0.05
2005 1 1 717391 0.05
2006 1 1 1.63583e+06 0.05
2007 1 1 811166 0.05
2008 1 1 419285 0.05
2009 1 1 526383 0.05
2010 1 1 479191 0.05
2011 1 1 432367 0.05
2012 1 1 669186 0.05
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
1990 10 2 2.76291e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.37881e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.33362e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.776e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.45147e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.0405e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.84627e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.60199e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.13087e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.36825e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 1.87506e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.67707e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.20103e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.19863e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.42685e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.38015e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.42546e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 4.1455e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 2.36717e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.64164e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.38636e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.93149e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 3.93721e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 882033 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 486180 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 341344 0.1 #_orig_obs: 954308 survey2
1988 4 3 265819 0.1 #_orig_obs: 245537 survey2
1989 4 3 373377 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.26808e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 720227 0.1 #_orig_obs: 527308 survey2
1992 4 3 421534 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 494551 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 552891 0.1 #_orig_obs: 375877 survey2
1995 4 3 421178 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.19699e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.73476e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.21974e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 861045 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 809692 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 927190 0.1 #_orig_obs: 689461 survey2
2002 4 3 500941 0.1 #_orig_obs: 525909 survey2
2003 4 3 811243 0.1 #_orig_obs: 634479 survey2
2004 4 3 1.97974e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.92453e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.29626e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.10134e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 631562 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.30575e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.72086e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.69683e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.291e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  132 274 329 58 4 3 0
1986  1 1  0 0 1 -1 -1 800  44 319 372 57 6 2 0
1987  1 1  0 0 1 -1 -1 800  38 118 528 106 8 2 0
1988  1 1  0 0 1 -1 -1 800  98 238 263 173 23 5 0
1989  1 1  0 0 1 -1 -1 800  211 189 321 43 28 5 3
1990  1 1  0 0 1 -1 -1 800  386 232 133 39 10 0 0
1991  1 1  0 0 1 -1 -1 800  135 459 189 13 4 0 0
1992  1 1  0 0 1 -1 -1 800  43 219 509 26 3 0 0
1993  1 1  0 0 1 -1 -1 800  130 138 390 133 9 0 0
1994  1 1  0 0 1 -1 -1 800  165 315 194 100 26 0 0
1995  1 1  0 0 1 -1 -1 800  58 326 379 28 7 2 0
1996  1 1  0 0 1 -1 -1 800  317 122 309 50 2 0 0
1997  1 1  0 0 1 -1 -1 800  278 387 104 23 8 0 0
1998  1 1  0 0 1 -1 -1 800  121 346 319 12 2 0 0
1999  1 1  0 0 1 -1 -1 800  76 233 435 53 3 0 0
2000  1 1  0 0 1 -1 -1 800  92 195 364 137 12 0 0
2001  1 1  0 0 1 -1 -1 800  166 242 294 77 21 0 0
2002  1 1  0 0 1 -1 -1 800  55 388 301 47 8 1 0
2003  1 1  0 0 1 -1 -1 800  197 123 424 50 5 0 1
2004  1 1  0 0 1 -1 -1 800  421 266 72 32 9 0 0
2005  1 1  0 0 1 -1 -1 800  157 485 152 6 0 0 0
2006  1 1  0 0 1 -1 -1 800  104 279 390 27 0 0 0
2007  1 1  0 0 1 -1 -1 800  164 275 312 46 3 0 0
2008  1 1  0 0 1 -1 -1 800  80 351 313 49 7 0 0
2009  1 1  0 0 1 -1 -1 800  216 129 406 42 3 4 0
2010  1 1  0 0 1 -1 -1 800  273 357 126 40 4 0 0
2011  1 1  0 0 1 -1 -1 800  157 362 266 10 5 0 0
2012  1 1  0 0 1 -1 -1 800  116 292 353 37 2 0 0
1990  10 2  0 0 1 -1 -1 800  718 66 8 4 4 0 0
1991  10 2  0 0 1 -1 -1 800  485 283 32 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  386 250 142 22 0 0 0
1993  10 2  0 0 1 -1 -1 800  635 63 58 38 6 0 0
1994  10 2  0 0 1 -1 -1 800  621 144 15 15 5 0 0
1995  10 2  0 0 1 -1 -1 800  472 236 74 9 5 4 0
1996  10 2  0 0 1 -1 -1 800  728 31 27 14 0 0 0
1997  10 2  0 0 1 -1 -1 800  654 134 8 3 1 0 0
1998  10 2  0 0 1 -1 -1 800  527 216 50 4 2 1 0
1999  10 2  0 0 1 -1 -1 800  492 188 101 18 0 1 0
2000  10 2  0 0 1 -1 -1 800  586 121 51 38 3 1 0
2001  10 2  0 0 1 -1 -1 800  641 116 26 9 7 1 0
2002  10 2  0 0 1 -1 -1 800  357 335 74 15 5 10 4
2003  10 2  0 0 1 -1 -1 800  708 44 48 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  730 70 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  560 220 20 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  573 181 43 3 0 0 0
2007  10 2  0 0 1 -1 -1 800  638 141 15 6 0 0 0
2008  10 2  0 0 1 -1 -1 800  447 283 50 16 4 0 0
2009  10 2  0 0 1 -1 -1 800  693 57 31 15 2 2 0
2010  10 2  0 0 1 -1 -1 800  655 122 13 10 0 0 0
2011  10 2  0 0 1 -1 -1 800  602 165 31 2 0 0 0
2012  10 2  0 0 1 -1 -1 800  572 160 57 10 1 0 0
1985  4 3  0 0 1 -1 -1 800  609 133 48 8 2 0 0
1986  4 3  0 0 1 -1 -1 800  347 323 91 27 7 4 1
1987  4 3  0 0 1 -1 -1 800  535 99 106 38 14 6 2
1988  4 3  0 0 1 -1 -1 800  567 145 32 37 14 4 1
1989  4 3  0 0 1 -1 -1 800  684 74 27 3 9 1 2
1990  4 3  0 0 1 -1 -1 800  745 46 4 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  556 225 18 1 0 0 0
1992  4 3  0 0 1 -1 -1 800  437 232 117 14 0 0 0
1993  4 3  0 0 1 -1 -1 800  646 78 46 28 2 0 0
1994  4 3  0 0 1 -1 -1 800  629 127 18 14 12 0 0
1995  4 3  0 0 1 -1 -1 800  508 215 60 7 6 4 0
1996  4 3  0 0 1 -1 -1 800  739 36 18 6 1 0 0
1997  4 3  0 0 1 -1 -1 800  691 98 6 5 0 0 0
1998  4 3  0 0 1 -1 -1 800  551 201 44 4 0 0 0
1999  4 3  0 0 1 -1 -1 800  515 172 89 24 0 0 0
2000  4 3  0 0 1 -1 -1 800  601 119 50 23 7 0 0
2001  4 3  0 0 1 -1 -1 800  654 106 22 6 9 3 0
2002  4 3  0 0 1 -1 -1 800  417 292 60 20 6 5 0
2003  4 3  0 0 1 -1 -1 800  721 39 28 9 1 0 2
2004  4 3  0 0 1 -1 -1 800  742 50 5 1 0 0 2
2005  4 3  0 0 1 -1 -1 800  577 204 18 1 0 0 0
2006  4 3  0 0 1 -1 -1 800  592 145 58 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  615 137 45 3 0 0 0
2008  4 3  0 0 1 -1 -1 800  471 261 49 11 8 0 0
2009  4 3  0 0 1 -1 -1 800  714 49 29 5 2 1 0
2010  4 3  0 0 1 -1 -1 800  694 90 7 7 2 0 0
2011  4 3  0 0 1 -1 -1 800  608 169 20 1 2 0 0
2012  4 3  0 0 1 -1 -1 800  610 131 50 9 0 0 0
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

