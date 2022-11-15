#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Nov 07 10:33:24 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1667835204 first rand#: 0.697271
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
-999 1 1 85126.5 0.05
1985 1 1 13049.9 0.05
1986 1 1 12995.3 0.05
1987 1 1 6892.98 0.05
1988 1 1 1959.34 0.05
1989 1 1 3583.15 0.05
1990 1 1 75390.3 0.05
1991 1 1 107781 0.05
1992 1 1 253739 0.05
1993 1 1 454212 0.05
1994 1 1 201625 0.05
1995 1 1 143416 0.05
1996 1 1 324587 0.05
1997 1 1 324934 0.05
1998 1 1 798167 0.05
1999 1 1 604836 0.05
2000 1 1 489056 0.05
2001 1 1 337289 0.05
2002 1 1 374575 0.05
2003 1 1 367958 0.05
2004 1 1 441261 0.05
2005 1 1 375795 0.05
2006 1 1 711867 0.05
2007 1 1 321204 0.05
2008 1 1 311938 0.05
2009 1 1 452714 0.05
2010 1 1 325550 0.05
2011 1 1 278998 0.05
2012 1 1 449899 0.05
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
1990 10 2 1.78072e+06 0.2 #_orig_obs: 565246 survey1
1991 10 2 2.19534e+06 0.2 #_orig_obs: 3.17686e+06 survey1
1992 10 2 873695 0.2 #_orig_obs: 6.37058e+06 survey1
1993 10 2 1.54067e+06 0.2 #_orig_obs: 1.31436e+06 survey1
1994 10 2 825595 0.2 #_orig_obs: 702016 survey1
1995 10 2 726647 0.2 #_orig_obs: 1.44464e+06 survey1
1996 10 2 1.53999e+06 0.2 #_orig_obs: 819120 survey1
1997 10 2 3.76221e+06 0.2 #_orig_obs: 956532 survey1
1998 10 2 1.34085e+06 0.2 #_orig_obs: 5.72099e+06 survey1
1999 10 2 759501 0.2 #_orig_obs: 1.80107e+06 survey1
2000 10 2 903413 0.2 #_orig_obs: 939122 survey1
2001 10 2 1.14164e+06 0.2 #_orig_obs: 582386 survey1
2002 10 2 572946 0.2 #_orig_obs: 1.16078e+06 survey1
2003 10 2 1.02885e+06 0.2 #_orig_obs: 315524 survey1
2004 10 2 2.2781e+06 0.2 #_orig_obs: 216162 survey1
2005 10 2 753660 0.2 #_orig_obs: 1.39021e+06 survey1
2006 10 2 1.05938e+06 0.2 #_orig_obs: 1.09307e+06 survey1
2007 10 2 2.19866e+06 0.2 #_orig_obs: 747254 survey1
2008 10 2 1.00657e+06 0.2 #_orig_obs: 3.34384e+06 survey1
2009 10 2 1.41764e+06 0.2 #_orig_obs: 2.00662e+06 survey1
2010 10 2 2.95299e+06 0.2 #_orig_obs: 1.43041e+06 survey1
2011 10 2 2.70837e+06 0.2 #_orig_obs: 6.42547e+06 survey1
2012 10 2 2.07715e+06 0.2 #_orig_obs: 5.55618e+06 survey1
1985 4 3 820315 0.2 #_orig_obs: 1.6165e+06 survey2
1986 4 3 327462 0.2 #_orig_obs: 1.81081e+06 survey2
1987 4 3 197956 0.2 #_orig_obs: 798204 survey2
1988 4 3 152630 0.2 #_orig_obs: 203427 survey2
1989 4 3 248744 0.2 #_orig_obs: 202875 survey2
1990 4 3 723450 0.2 #_orig_obs: 113055 survey2
1991 4 3 400950 0.2 #_orig_obs: 381334 survey2
1992 4 3 340287 0.2 #_orig_obs: 2.33967e+06 survey2
1993 4 3 423716 0.2 #_orig_obs: 990740 survey2
1994 4 3 433243 0.2 #_orig_obs: 322724 survey2
1995 4 3 236293 0.2 #_orig_obs: 429031 survey2
1996 4 3 953202 0.2 #_orig_obs: 555860 survey2
1997 4 3 842045 0.2 #_orig_obs: 278987 survey2
1998 4 3 526346 0.2 #_orig_obs: 856773 survey2
1999 4 3 309549 0.2 #_orig_obs: 1.86496e+06 survey2
2000 4 3 316178 0.2 #_orig_obs: 656768 survey2
2001 4 3 362518 0.2 #_orig_obs: 158660 survey2
2002 4 3 248826 0.2 #_orig_obs: 243983 survey2
2003 4 3 551434 0.2 #_orig_obs: 219397 survey2
2004 4 3 727109 0.2 #_orig_obs: 38808.9 survey2
2005 4 3 297121 0.2 #_orig_obs: 146939 survey2
2006 4 3 347630 0.2 #_orig_obs: 647377 survey2
2007 4 3 708611 0.2 #_orig_obs: 313413 survey2
2008 4 3 513136 0.2 #_orig_obs: 594616 survey2
2009 4 3 428815 0.2 #_orig_obs: 1.31059e+06 survey2
2010 4 3 911198 0.2 #_orig_obs: 555482 survey2
2011 4 3 1.27195e+06 0.2 #_orig_obs: 918923 survey2
2012 4 3 1.24819e+06 0.2 #_orig_obs: 2.29242e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  107 261 343 77 10 2 0
1986  1 1  0 0 1 -1 -1 800  28 284 396 82 9 1 0
1987  1 1  0 0 1 -1 -1 800  37 113 514 116 18 2 0
1988  1 1  0 0 1 -1 -1 800  54 197 280 230 33 5 1
1989  1 1  0 0 1 -1 -1 800  194 170 315 80 35 6 0
1990  1 1  0 0 1 -1 -1 800  383 275 94 33 5 6 4
1991  1 1  0 0 1 -1 -1 800  94 542 158 5 1 0 0
1992  1 1  0 0 1 -1 -1 800  33 186 547 32 2 0 0
1993  1 1  0 0 1 -1 -1 800  125 134 364 172 4 0 1
1994  1 1  0 0 1 -1 -1 800  180 346 167 77 29 1 0
1995  1 1  0 0 1 -1 -1 800  95 356 325 14 4 6 0
1996  1 1  0 0 1 -1 -1 800  317 137 297 49 0 0 0
1997  1 1  0 0 1 -1 -1 800  220 474 86 17 2 0 1
1998  1 1  0 0 1 -1 -1 800  81 380 331 5 3 0 0
1999  1 1  0 0 1 -1 -1 800  55 243 461 39 1 1 0
2000  1 1  0 0 1 -1 -1 800  193 220 291 88 8 0 0
2001  1 1  0 0 1 -1 -1 800  228 413 132 14 12 1 0
2002  1 1  0 0 1 -1 -1 800  74 437 283 4 1 1 0
2003  1 1  0 0 1 -1 -1 800  236 171 366 25 0 0 2
2004  1 1  0 0 1 -1 -1 800  347 369 66 15 2 1 0
2005  1 1  0 0 1 -1 -1 800  86 554 158 2 0 0 0
2006  1 1  0 0 1 -1 -1 800  170 239 381 10 0 0 0
2007  1 1  0 0 1 -1 -1 800  313 336 138 13 0 0 0
2008  1 1  0 0 1 -1 -1 800  66 477 244 13 0 0 0
2009  1 1  0 0 1 -1 -1 800  181 174 414 29 2 0 0
2010  1 1  0 0 1 -1 -1 800  307 328 112 53 0 0 0
2011  1 1  0 0 1 -1 -1 800  174 444 175 5 2 0 0
2012  1 1  0 0 1 -1 -1 800  89 308 388 14 1 0 0
1990  10 2  0 0 1 -1 -1 800  732 56 7 2 3 0 0
1991  10 2  0 0 1 -1 -1 800  465 303 26 3 2 1 0
1992  10 2  0 0 1 -1 -1 800  321 246 204 27 2 0 0
1993  10 2  0 0 1 -1 -1 800  603 89 60 45 3 0 0
1994  10 2  0 0 1 -1 -1 800  635 120 17 9 19 0 0
1995  10 2  0 0 1 -1 -1 800  476 250 48 7 9 9 1
1996  10 2  0 0 1 -1 -1 800  748 35 11 6 0 0 0
1997  10 2  0 0 1 -1 -1 800  652 148 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  505 249 46 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  480 221 78 18 2 0 1
2000  10 2  0 0 1 -1 -1 800  683 86 18 13 0 0 0
2001  10 2  0 0 1 -1 -1 800  656 130 6 1 7 0 0
2002  10 2  0 0 1 -1 -1 800  464 299 33 4 0 0 0
2003  10 2  0 0 1 -1 -1 800  729 56 11 4 0 0 0
2004  10 2  0 0 1 -1 -1 800  719 81 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  481 294 25 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  696 68 36 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  696 95 8 1 0 0 0
2008  10 2  0 0 1 -1 -1 800  445 321 31 3 0 0 0
2009  10 2  0 0 1 -1 -1 800  675 78 44 2 1 0 0
2010  10 2  0 0 1 -1 -1 800  727 61 12 0 0 0 0
2011  10 2  0 0 1 -1 -1 800  608 165 23 3 1 0 0
2012  10 2  0 0 1 -1 -1 800  539 193 54 12 2 0 0
1985  4 3  0 0 1 -1 -1 800  608 132 43 13 4 0 0
1986  4 3  0 0 1 -1 -1 800  357 281 93 41 18 10 0
1987  4 3  0 0 1 -1 -1 800  482 118 128 44 23 4 1
1988  4 3  0 0 1 -1 -1 800  517 141 37 69 27 8 1
1989  4 3  0 0 1 -1 -1 800  705 47 23 7 12 4 2
1990  4 3  0 0 1 -1 -1 800  733 56 6 2 1 1 1
1991  4 3  0 0 1 -1 -1 800  545 233 22 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  399 256 128 11 2 0 4
1993  4 3  0 0 1 -1 -1 800  656 64 41 34 5 0 0
1994  4 3  0 0 1 -1 -1 800  646 131 9 3 11 0 0
1995  4 3  0 0 1 -1 -1 800  539 199 51 2 4 5 0
1996  4 3  0 0 1 -1 -1 800  750 28 17 5 0 0 0
1997  4 3  0 0 1 -1 -1 800  662 133 5 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  496 255 42 3 4 0 0
1999  4 3  0 0 1 -1 -1 800  493 189 96 21 0 1 0
2000  4 3  0 0 1 -1 -1 800  683 76 27 11 3 0 0
2001  4 3  0 0 1 -1 -1 800  666 121 9 2 2 0 0
2002  4 3  0 0 1 -1 -1 800  458 301 37 3 0 0 1
2003  4 3  0 0 1 -1 -1 800  701 58 33 6 1 1 0
2004  4 3  0 0 1 -1 -1 800  715 76 6 3 0 0 0
2005  4 3  0 0 1 -1 -1 800  514 269 17 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  682 86 29 3 0 0 0
2007  4 3  0 0 1 -1 -1 800  708 79 13 0 0 0 0
2008  4 3  0 0 1 -1 -1 800  494 267 39 0 0 0 0
2009  4 3  0 0 1 -1 -1 800  682 71 42 5 0 0 0
2010  4 3  0 0 1 -1 -1 800  725 67 4 4 0 0 0
2011  4 3  0 0 1 -1 -1 800  645 138 16 0 1 0 0
2012  4 3  0 0 1 -1 -1 800  582 163 52 3 0 0 0
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

