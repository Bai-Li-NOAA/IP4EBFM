#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Dec 07 12:03:58 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1670432638 first rand#: 0.864997
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
-999 1 1 62011.2 0.05
1985 1 1 14534.1 0.2
1986 1 1 12052.7 0.2
1987 1 1 6211.13 0.2
1988 1 1 1691.16 0.2
1989 1 1 4246.28 0.2
1990 1 1 62760.1 0.2
1991 1 1 108309 0.2
1992 1 1 281465 0.2
1993 1 1 471687 0.2
1994 1 1 221148 0.2
1995 1 1 103432 0.2
1996 1 1 309026 0.2
1997 1 1 430351 0.2
1998 1 1 1.11068e+06 0.2
1999 1 1 526384 0.2
2000 1 1 534316 0.2
2001 1 1 297258 0.2
2002 1 1 327803 0.2
2003 1 1 129936 0.2
2004 1 1 133223 0.2
2005 1 1 134668 0.2
2006 1 1 228499 0.2
2007 1 1 70291.2 0.2
2008 1 1 177838 0.2
2009 1 1 180003 0.2
2010 1 1 121913 0.2
2011 1 1 366870 0.2
2012 1 1 425416 0.2
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
1990 10 2 1.48745e+06 0.5 #_orig_obs: 615377 survey1
1991 10 2 6.39896e+06 0.5 #_orig_obs: 5.72451e+06 survey1
1992 10 2 9.86552e+06 0.5 #_orig_obs: 1.15449e+07 survey1
1993 10 2 2.02603e+06 0.5 #_orig_obs: 4.1733e+06 survey1
1994 10 2 477447 0.5 #_orig_obs: 437096 survey1
1995 10 2 1.28405e+06 0.5 #_orig_obs: 2.95117e+06 survey1
1996 10 2 519499 0.5 #_orig_obs: 962787 survey1
1997 10 2 321104 0.5 #_orig_obs: 398559 survey1
1998 10 2 1.10598e+06 0.5 #_orig_obs: 5.19944e+06 survey1
1999 10 2 2.63156e+06 0.5 #_orig_obs: 1.2382e+06 survey1
2000 10 2 179070 0.5 #_orig_obs: 491605 survey1
2001 10 2 148645 0.5 #_orig_obs: 629262 survey1
2002 10 2 203374 0.5 #_orig_obs: 194347 survey1
2003 10 2 66276.5 0.5 #_orig_obs: 40803.7 survey1
2004 10 2 87048.5 0.5 #_orig_obs: 23769.8 survey1
2005 10 2 447517 0.5 #_orig_obs: 71333.7 survey1
2006 10 2 505453 0.5 #_orig_obs: 228094 survey1
2007 10 2 494727 0.5 #_orig_obs: 200863 survey1
2008 10 2 622893 0.5 #_orig_obs: 1.16875e+06 survey1
2009 10 2 352273 0.5 #_orig_obs: 337207 survey1
2010 10 2 329881 0.5 #_orig_obs: 443840 survey1
2011 10 2 3.24344e+06 0.5 #_orig_obs: 2.7311e+06 survey1
2012 10 2 614557 0.5 #_orig_obs: 686684 survey1
1985 4 3 632069 0.5 #_orig_obs: 2.4376e+06 survey2
1986 4 3 829332 0.5 #_orig_obs: 4.48772e+06 survey2
1987 4 3 674472 0.5 #_orig_obs: 1.93581e+06 survey2
1988 4 3 197027 0.5 #_orig_obs: 88146.9 survey2
1989 4 3 98181.5 0.5 #_orig_obs: 208560 survey2
1990 4 3 80268.2 0.5 #_orig_obs: 223337 survey2
1991 4 3 388090 0.5 #_orig_obs: 227198 survey2
1992 4 3 2.34747e+06 0.5 #_orig_obs: 1.89336e+06 survey2
1993 4 3 212903 0.5 #_orig_obs: 672533 survey2
1994 4 3 317065 0.5 #_orig_obs: 142457 survey2
1995 4 3 623647 0.5 #_orig_obs: 945722 survey2
1996 4 3 193922 0.5 #_orig_obs: 441389 survey2
1997 4 3 283133 0.5 #_orig_obs: 253735 survey2
1998 4 3 808386 0.5 #_orig_obs: 1.40229e+06 survey2
1999 4 3 535163 0.5 #_orig_obs: 512918 survey2
2000 4 3 357818 0.5 #_orig_obs: 403577 survey2
2001 4 3 343500 0.5 #_orig_obs: 79351.4 survey2
2002 4 3 184732 0.5 #_orig_obs: 387126 survey2
2003 4 3 45890.6 0.5 #_orig_obs: 133377 survey2
2004 4 3 20114.3 0.5 #_orig_obs: 7550.2 survey2
2005 4 3 151483 0.5 #_orig_obs: 35297.4 survey2
2006 4 3 173415 0.5 #_orig_obs: 219834 survey2
2007 4 3 93334.9 0.5 #_orig_obs: 25436.5 survey2
2008 4 3 296276 0.5 #_orig_obs: 123200 survey2
2009 4 3 350734 0.5 #_orig_obs: 137117 survey2
2010 4 3 267984 0.5 #_orig_obs: 44355.3 survey2
2011 4 3 279581 0.5 #_orig_obs: 242955 survey2
2012 4 3 235876 0.5 #_orig_obs: 868378 survey2
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
1985  1 1  0 0 1 -1 -1 800  104 249 372 65 9 1 0
1986  1 1  0 0 1 -1 -1 800  38 280 390 75 12 3 2
1987  1 1  0 0 1 -1 -1 800  42 134 501 99 19 5 0
1988  1 1  0 0 1 -1 -1 800  53 237 276 193 32 6 3
1989  1 1  0 0 1 -1 -1 800  274 149 263 70 39 5 0
1990  1 1  0 0 1 -1 -1 800  457 257 61 20 3 0 2
1991  1 1  0 0 1 -1 -1 800  74 564 159 1 2 0 0
1992  1 1  0 0 1 -1 -1 800  30 171 576 22 1 0 0
1993  1 1  0 0 1 -1 -1 800  101 142 355 195 7 0 0
1994  1 1  0 0 1 -1 -1 800  163 372 152 64 45 4 0
1995  1 1  0 0 1 -1 -1 800  53 352 360 21 7 7 0
1996  1 1  0 0 1 -1 -1 800  365 127 257 47 4 0 0
1997  1 1  0 0 1 -1 -1 800  208 509 61 22 0 0 0
1998  1 1  0 0 1 -1 -1 800  84 403 306 7 0 0 0
1999  1 1  0 0 1 -1 -1 800  59 250 452 38 1 0 0
2000  1 1  0 0 1 -1 -1 800  223 214 273 79 11 0 0
2001  1 1  0 0 1 -1 -1 800  156 503 122 12 7 0 0
2002  1 1  0 0 1 -1 -1 800  35 444 312 3 6 0 0
2003  1 1  0 0 1 -1 -1 800  300 164 311 25 0 0 0
2004  1 1  0 0 1 -1 -1 800  349 410 37 4 0 0 0
2005  1 1  0 0 1 -1 -1 800  85 555 160 0 0 0 0
2006  1 1  0 0 1 -1 -1 800  274 210 308 8 0 0 0
2007  1 1  0 0 1 -1 -1 800  182 483 120 15 0 0 0
2008  1 1  0 0 1 -1 -1 800  46 367 369 15 3 0 0
2009  1 1  0 0 1 -1 -1 800  345 112 296 47 0 0 0
2010  1 1  0 0 1 -1 -1 800  272 451 52 21 4 0 0
2011  1 1  0 0 1 -1 -1 800  101 427 267 5 0 0 0
2012  1 1  0 0 1 -1 -1 800  106 228 424 42 0 0 0
1990  10 2  0 0 1 -1 -1 800  47 209 445 99 0 0 0
1991  10 2  0 0 1 -1 -1 800  3 228 558 11 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 32 743 25 0 0 0
1993  10 2  0 0 1 -1 -1 800  1 23 567 209 0 0 0
1994  10 2  0 0 1 -1 -1 800  11 145 510 128 6 0 0
1995  10 2  0 0 1 -1 -1 800  0 89 682 29 0 0 0
1996  10 2  0 0 1 -1 -1 800  19 35 678 68 0 0 0
1997  10 2  0 0 1 -1 -1 800  23 376 345 56 0 0 0
1998  10 2  0 0 1 -1 -1 800  2 127 659 12 0 0 0
1999  10 2  0 0 1 -1 -1 800  0 66 701 33 0 0 0
2000  10 2  0 0 1 -1 -1 800  10 94 597 99 0 0 0
2001  10 2  0 0 1 -1 -1 800  19 333 403 45 0 0 0
2002  10 2  0 0 1 -1 -1 800  2 205 582 11 0 0 0
2003  10 2  0 0 1 -1 -1 800  26 66 675 33 0 0 0
2004  10 2  0 0 1 -1 -1 800  65 554 162 19 0 0 0
2005  10 2  0 0 1 -1 -1 800  6 284 508 2 0 0 0
2006  10 2  0 0 1 -1 -1 800  19 106 652 23 0 0 0
2007  10 2  0 0 1 -1 -1 800  23 255 489 33 0 0 0
2008  10 2  0 0 1 -1 -1 800  0 88 699 13 0 0 0
2009  10 2  0 0 1 -1 -1 800  10 33 697 60 0 0 0
2010  10 2  0 0 1 -1 -1 800  28 381 322 69 0 0 0
2011  10 2  0 0 1 -1 -1 800  3 139 654 4 0 0 0
2012  10 2  0 0 1 -1 -1 800  3 67 684 46 0 0 0
1985  4 3  0 0 1 -1 -1 800  0 125 560 115 0 0 0
1986  4 3  0 0 1 -1 -1 800  0 118 593 89 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 32 663 105 0 0 0
1988  4 3  0 0 1 -1 -1 800  0 73 454 270 3 0 0
1989  4 3  0 0 1 -1 -1 800  0 79 598 120 3 0 0
1990  4 3  0 0 1 -1 -1 800  1 359 346 94 0 0 0
1991  4 3  0 0 1 -1 -1 800  0 357 432 11 0 0 0
1992  4 3  0 0 1 -1 -1 800  0 65 711 24 0 0 0
1993  4 3  0 0 1 -1 -1 800  0 39 550 211 0 0 0
1994  4 3  0 0 1 -1 -1 800  0 198 470 132 0 0 0
1995  4 3  0 0 1 -1 -1 800  0 142 626 32 0 0 0
1996  4 3  0 0 1 -1 -1 800  0 59 665 76 0 0 0
1997  4 3  0 0 1 -1 -1 800  0 511 236 53 0 0 0
1998  4 3  0 0 1 -1 -1 800  1 182 611 6 0 0 0
1999  4 3  0 0 1 -1 -1 800  0 66 707 27 0 0 0
2000  4 3  0 0 1 -1 -1 800  0 77 611 112 0 0 0
2001  4 3  0 0 1 -1 -1 800  0 357 410 32 1 0 0
2002  4 3  0 0 1 -1 -1 800  0 175 613 12 0 0 0
2003  4 3  0 0 1 -1 -1 800  0 79 699 22 0 0 0
2004  4 3  0 0 1 -1 -1 800  1 551 229 19 0 0 0
2005  4 3  0 0 1 -1 -1 800  0 368 432 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  0 112 674 14 0 0 0
2007  4 3  0 0 1 -1 -1 800  0 378 385 37 0 0 0
2008  4 3  0 0 1 -1 -1 800  0 139 641 20 0 0 0
2009  4 3  0 0 1 -1 -1 800  0 52 686 62 0 0 0
2010  4 3  0 0 1 -1 -1 800  0 495 234 71 0 0 0
2011  4 3  0 0 1 -1 -1 800  0 217 577 6 0 0 0
2012  4 3  0 0 1 -1 -1 800  0 74 665 61 0 0 0
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

