#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Dec 06 18:28:13 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1670369293 first rand#: -1.22495
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
-999 1 1 118197 0.05
1985 1 1 13558 0.05
1986 1 1 13010.4 0.05
1987 1 1 6782.85 0.05
1988 1 1 1808.54 0.05
1989 1 1 3553.54 0.05
1990 1 1 77180.5 0.05
1991 1 1 117349 0.05
1992 1 1 276142 0.05
1993 1 1 428344 0.05
1994 1 1 222291 0.05
1995 1 1 156228 0.05
1996 1 1 410344 0.05
1997 1 1 326391 0.05
1998 1 1 901651 0.05
1999 1 1 645544 0.05
2000 1 1 445295 0.05
2001 1 1 284296 0.05
2002 1 1 285263 0.05
2003 1 1 170758 0.05
2004 1 1 162672 0.05
2005 1 1 133702 0.05
2006 1 1 195721 0.05
2007 1 1 107346 0.05
2008 1 1 151469 0.05
2009 1 1 167373 0.05
2010 1 1 131746 0.05
2011 1 1 240991 0.05
2012 1 1 373685 0.05
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
1990 10 2 602971 0.1 #_orig_obs: 559970 survey1
1991 10 2 2.45116e+06 0.1 #_orig_obs: 4.1271e+06 survey1
1992 10 2 8.28532e+06 0.1 #_orig_obs: 7.13121e+06 survey1
1993 10 2 2.29158e+06 0.1 #_orig_obs: 1.66483e+06 survey1
1994 10 2 975692 0.1 #_orig_obs: 613678 survey1
1995 10 2 1.3782e+06 0.1 #_orig_obs: 1.43796e+06 survey1
1996 10 2 1.18176e+06 0.1 #_orig_obs: 845940 survey1
1997 10 2 672567 0.1 #_orig_obs: 770676 survey1
1998 10 2 2.27032e+06 0.1 #_orig_obs: 5.12954e+06 survey1
1999 10 2 2.31549e+06 0.1 #_orig_obs: 1.39835e+06 survey1
2000 10 2 585389 0.1 #_orig_obs: 494764 survey1
2001 10 2 269182 0.1 #_orig_obs: 377871 survey1
2002 10 2 286755 0.1 #_orig_obs: 325152 survey1
2003 10 2 88655.4 0.1 #_orig_obs: 58372.8 survey1
2004 10 2 44139.5 0.1 #_orig_obs: 37164.9 survey1
2005 10 2 187479 0.1 #_orig_obs: 162458 survey1
2006 10 2 199076 0.1 #_orig_obs: 169167 survey1
2007 10 2 206584 0.1 #_orig_obs: 183701 survey1
2008 10 2 597250 0.1 #_orig_obs: 744596 survey1
2009 10 2 397300 0.1 #_orig_obs: 276588 survey1
2010 10 2 269127 0.1 #_orig_obs: 354944 survey1
2011 10 2 1.44172e+06 0.1 #_orig_obs: 2.18964e+06 survey1
2012 10 2 1.39972e+06 0.1 #_orig_obs: 1.09137e+06 survey1
1985 4 3 890877 0.1 #_orig_obs: 1.90597e+06 survey2
1986 4 3 836988 0.1 #_orig_obs: 2.21911e+06 survey2
1987 4 3 831798 0.1 #_orig_obs: 1.05381e+06 survey2
1988 4 3 287860 0.1 #_orig_obs: 192092 survey2
1989 4 3 187978 0.1 #_orig_obs: 179548 survey2
1990 4 3 153983 0.1 #_orig_obs: 129115 survey2
1991 4 3 618441 0.1 #_orig_obs: 328697 survey2
1992 4 3 1.7521e+06 0.1 #_orig_obs: 2.00105e+06 survey2
1993 4 3 568172 0.1 #_orig_obs: 1.03349e+06 survey2
1994 4 3 241972 0.1 #_orig_obs: 250591 survey2
1995 4 3 373241 0.1 #_orig_obs: 515878 survey2
1996 4 3 329482 0.1 #_orig_obs: 419123 survey2
1997 4 3 263785 0.1 #_orig_obs: 211584 survey2
1998 4 3 890084 0.1 #_orig_obs: 852235 survey2
1999 4 3 748836 0.1 #_orig_obs: 1.03369e+06 survey2
2000 4 3 238638 0.1 #_orig_obs: 333299 survey2
2001 4 3 116728 0.1 #_orig_obs: 100039 survey2
2002 4 3 132616 0.1 #_orig_obs: 179415 survey2
2003 4 3 63120.5 0.1 #_orig_obs: 72751 survey2
2004 4 3 27530.3 0.1 #_orig_obs: 8396.46 survey2
2005 4 3 82819.4 0.1 #_orig_obs: 29003.8 survey2
2006 4 3 81573.4 0.1 #_orig_obs: 95924.2 survey2
2007 4 3 71593.4 0.1 #_orig_obs: 43712.8 survey2
2008 4 3 174168 0.1 #_orig_obs: 132667 survey2
2009 4 3 155027 0.1 #_orig_obs: 174806 survey2
2010 4 3 92428.3 0.1 #_orig_obs: 63441.7 survey2
2011 4 3 377236 0.1 #_orig_obs: 289129 survey2
2012 4 3 419586 0.1 #_orig_obs: 706797 survey2
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
1985  1 1  0 0 1 -1 -1 800  113 267 354 52 12 2 0
1986  1 1  0 0 1 -1 -1 800  37 301 377 75 9 1 0
1987  1 1  0 0 1 -1 -1 800  40 114 530 90 22 4 0
1988  1 1  0 0 1 -1 -1 800  47 203 252 249 43 4 2
1989  1 1  0 0 1 -1 -1 800  291 131 252 70 50 6 0
1990  1 1  0 0 1 -1 -1 800  449 265 61 14 7 4 0
1991  1 1  0 0 1 -1 -1 800  82 543 170 1 4 0 0
1992  1 1  0 0 1 -1 -1 800  34 195 546 25 0 0 0
1993  1 1  0 0 1 -1 -1 800  119 135 339 201 6 0 0
1994  1 1  0 0 1 -1 -1 800  157 348 178 77 34 6 0
1995  1 1  0 0 1 -1 -1 800  55 378 340 19 3 5 0
1996  1 1  0 0 1 -1 -1 800  362 109 295 33 1 0 0
1997  1 1  0 0 1 -1 -1 800  236 480 64 20 0 0 0
1998  1 1  0 0 1 -1 -1 800  69 419 307 5 0 0 0
1999  1 1  0 0 1 -1 -1 800  49 239 474 36 2 0 0
2000  1 1  0 0 1 -1 -1 800  214 207 291 80 8 0 0
2001  1 1  0 0 1 -1 -1 800  151 497 131 15 6 0 0
2002  1 1  0 0 1 -1 -1 800  44 430 315 6 5 0 0
2003  1 1  0 0 1 -1 -1 800  318 164 302 16 0 0 0
2004  1 1  0 0 1 -1 -1 800  368 400 26 4 2 0 0
2005  1 1  0 0 1 -1 -1 800  98 561 141 0 0 0 0
2006  1 1  0 0 1 -1 -1 800  298 212 280 10 0 0 0
2007  1 1  0 0 1 -1 -1 800  201 510 84 5 0 0 0
2008  1 1  0 0 1 -1 -1 800  43 435 311 8 3 0 0
2009  1 1  0 0 1 -1 -1 800  394 109 257 38 2 0 0
2010  1 1  0 0 1 -1 -1 800  296 445 47 10 2 0 0
2011  1 1  0 0 1 -1 -1 800  83 430 281 6 0 0 0
2012  1 1  0 0 1 -1 -1 800  136 276 353 35 0 0 0
1990  10 2  0 0 1 -1 -1 800  50 208 444 97 1 0 0
1991  10 2  0 0 1 -1 -1 800  3 207 579 11 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 26 750 24 0 0 0
1993  10 2  0 0 1 -1 -1 800  3 23 559 215 0 0 0
1994  10 2  0 0 1 -1 -1 800  9 147 520 121 3 0 0
1995  10 2  0 0 1 -1 -1 800  0 77 697 26 0 0 0
1996  10 2  0 0 1 -1 -1 800  18 35 686 61 0 0 0
1997  10 2  0 0 1 -1 -1 800  22 401 325 52 0 0 0
1998  10 2  0 0 1 -1 -1 800  2 129 663 6 0 0 0
1999  10 2  0 0 1 -1 -1 800  2 49 710 38 1 0 0
2000  10 2  0 0 1 -1 -1 800  4 71 619 106 0 0 0
2001  10 2  0 0 1 -1 -1 800  19 329 414 38 0 0 0
2002  10 2  0 0 1 -1 -1 800  2 170 621 7 0 0 0
2003  10 2  0 0 1 -1 -1 800  23 96 642 39 0 0 0
2004  10 2  0 0 1 -1 -1 800  64 575 135 26 0 0 0
2005  10 2  0 0 1 -1 -1 800  8 337 454 1 0 0 0
2006  10 2  0 0 1 -1 -1 800  21 95 674 10 0 0 0
2007  10 2  0 0 1 -1 -1 800  14 269 488 29 0 0 0
2008  10 2  0 0 1 -1 -1 800  0 112 676 12 0 0 0
2009  10 2  0 0 1 -1 -1 800  13 51 685 51 0 0 0
2010  10 2  0 0 1 -1 -1 800  25 404 313 58 0 0 0
2011  10 2  0 0 1 -1 -1 800  4 112 677 7 0 0 0
2012  10 2  0 0 1 -1 -1 800  3 52 702 43 0 0 0
1985  4 3  0 0 1 -1 -1 800  0 120 589 91 0 0 0
1986  4 3  0 0 1 -1 -1 800  0 115 608 77 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 33 687 80 0 0 0
1988  4 3  0 0 1 -1 -1 800  0 72 445 283 0 0 0
1989  4 3  0 0 1 -1 -1 800  1 60 613 121 5 0 0
1990  4 3  0 0 1 -1 -1 800  0 362 338 100 0 0 0
1991  4 3  0 0 1 -1 -1 800  0 322 465 13 0 0 0
1992  4 3  0 0 1 -1 -1 800  0 51 726 23 0 0 0
1993  4 3  0 0 1 -1 -1 800  0 34 517 249 0 0 0
1994  4 3  0 0 1 -1 -1 800  0 218 428 152 2 0 0
1995  4 3  0 0 1 -1 -1 800  0 125 654 21 0 0 0
1996  4 3  0 0 1 -1 -1 800  1 48 679 72 0 0 0
1997  4 3  0 0 1 -1 -1 800  0 473 272 55 0 0 0
1998  4 3  0 0 1 -1 -1 800  0 152 643 5 0 0 0
1999  4 3  0 0 1 -1 -1 800  0 65 683 52 0 0 0
2000  4 3  0 0 1 -1 -1 800  0 87 594 119 0 0 0
2001  4 3  0 0 1 -1 -1 800  0 319 443 37 1 0 0
2002  4 3  0 0 1 -1 -1 800  0 176 617 7 0 0 0
2003  4 3  0 0 1 -1 -1 800  0 70 698 32 0 0 0
2004  4 3  0 0 1 -1 -1 800  0 536 246 18 0 0 0
2005  4 3  0 0 1 -1 -1 800  0 365 435 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  1 108 678 13 0 0 0
2007  4 3  0 0 1 -1 -1 800  0 353 420 27 0 0 0
2008  4 3  0 0 1 -1 -1 800  0 165 619 16 0 0 0
2009  4 3  0 0 1 -1 -1 800  0 37 696 67 0 0 0
2010  4 3  0 0 1 -1 -1 800  0 498 249 53 0 0 0
2011  4 3  0 0 1 -1 -1 800  0 210 581 9 0 0 0
2012  4 3  0 0 1 -1 -1 800  0 75 669 56 0 0 0
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

