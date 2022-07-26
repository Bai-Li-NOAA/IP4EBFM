#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Jul 26 11:55:03 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1658850903 first rand#: -0.779122
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
-999 1 1 126141 0.05
1985 1 1 154388 0.05
1986 1 1 129887 0.05
1987 1 1 25704.8 0.05
1988 1 1 1936.43 0.05
1989 1 1 3062.34 0.05
1990 1 1 19188.6 0.05
1991 1 1 29246.1 0.05
1992 1 1 62985.2 0.05
1993 1 1 144894 0.05
1994 1 1 22972.3 0.05
1995 1 1 4853.4 0.05
1996 1 1 13483.9 0.05
1997 1 1 53162.3 0.05
1998 1 1 150102 0.05
1999 1 1 136204 0.05
2000 1 1 207470 0.05
2001 1 1 131558 0.05
2002 1 1 12339.6 0.05
2003 1 1 57795.2 0.05
2004 1 1 164396 0.05
2005 1 1 629532 0.05
2006 1 1 3.40511e+06 0.05
2007 1 1 2.01029e+06 0.05
2008 1 1 238984 0.05
2009 1 1 325514 0.05
2010 1 1 485796 0.05
2011 1 1 1.01726e+06 0.05
2012 1 1 1.04733e+06 0.05
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
1990 10 2 938302 0.1 #_orig_obs: 676462 survey1
1991 10 2 4.14364e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 3.95309e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 2.51622e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.57859e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.3382e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 940235 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 1.72174e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 3.66114e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 6.9852e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 3.76292e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.42093e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 2.60153e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 1.15429e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 2.42137e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 1.24529e+07 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 1.28608e+07 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 5.47926e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 3.05372e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 1.4434e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 2.32453e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 6.51879e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 3.1436e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 794846 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 781186 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 739204 0.1 #_orig_obs: 572537 survey2
1988 4 3 457098 0.1 #_orig_obs: 204010 survey2
1989 4 3 407987 0.1 #_orig_obs: 253977 survey2
1990 4 3 240786 0.1 #_orig_obs: 250505 survey2
1991 4 3 481298 0.1 #_orig_obs: 315253 survey2
1992 4 3 1.65012e+06 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 1.56899e+06 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 691448 0.1 #_orig_obs: 418617 survey2
1995 4 3 537620 0.1 #_orig_obs: 310064 survey2
1996 4 3 444281 0.1 #_orig_obs: 381408 survey2
1997 4 3 337053 0.1 #_orig_obs: 452433 survey2
1998 4 3 650018 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.41361e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 1.87371e+06 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 970477 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 984470 0.1 #_orig_obs: 577555 survey2
2003 4 3 866626 0.1 #_orig_obs: 821136 survey2
2004 4 3 465882 0.1 #_orig_obs: 375379 survey2
2005 4 3 1.46134e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 4.33518e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 2.87007e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 1.67853e+06 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 720727 0.1 #_orig_obs: 624374 survey2
2010 4 3 483408 0.1 #_orig_obs: 227348 survey2
2011 4 3 947013 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 1.70184e+06 0.1 #_orig_obs: 2.40226e+06 survey2
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
1 # use length composition data (0/1)
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_ParmSelect:  parm number for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-05 0 0 0 0 1 #_fleet:1_fleet1
0 1e-05 0 0 0 0 1 #_fleet:2_survey1
0 1e-05 0 0 0 0 1 #_fleet:3_survey2
60 #_N_LengthBins
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part Nsamp datavector(female-male)
 1990 10 2 0 0 118  0 0 0 0 0 0 2 2 3 3 5 6 6 6 2 3 2 3 7 4 5 8 8 2 2 3 4 1 0 3 2 2 1 5 2 4 2 2 2 2 1 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 3 2 2 0 0 5 0 3 4 3 3 2 2 2 2 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 3 5 5 9 7 8 9 10 11 6 11 8 4 4 1 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 8 2 9 5 6 7 5 10 11 5 5 6 5 2 3 3 3 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 5 2 3 7 4 1 3 3 2 2 1 0 3 0 2 1 1 0 2 1 1 1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 2 0 1 1 2 3 3 5 16 15 14 19 12 17 13 6 9 11 10 7 7 2 6 9 12 11 48 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 2 0 3 4 3 2 3 3 1 11 4 14 3 10 10 9 12 9 7 5 9 9 9 6 7 4 5 2 5 2 5 1 5 2 1 0 0 0 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 1 0 0 1 1 1 6 7 3 3 8 7 9 10 6 9 6 6 5 2 2 3 1 3 2 1 1 2 1 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 0 2 1 3 5 1 4 4 6 7 17 21 24 16 10 16 14 11 3 1 2 2 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 1 3 3 6 6 19 22 38 36 39 40 54 44 37 33 30 21 17 9 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 38 10 31 23 32 29 21 28 25 21 33 24 15 24 16 19 18 11 9 8 2 27 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 0 2 1 1 3 3 2 3 4 4 10 20 25 14 14 14 8 12 15 13 12 5 10 17 13 7 6 8 7 3 1 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 1 2 3 2 5 9 20 26 35 30 53 60 36 46 43 30 26 17 20 21 5 11 101 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 4 1 2 4 1 3 0 2 4 3 5 2 7 2 3 4 2 2 1 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 5 2 14 14 12 11 14 11 6 7 11 19 19 14 21 28 8 12 17 11 5 1 1 5 1 2 2 1 2 6 4 1 0 1 1 1 2 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 1 0 2 3 6 12 17 19 19 31 36 43 67 68 60 77 69 59 151 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 12 12 12 14 13 31 34 36 31 30 27 26 11 7 4 6 14 2 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 1 0 0 0 1 2 4 8 15 8 21 22 37 30 52 42 48 41 49 28 19 20 21 13 20 13 8 10 4 6 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 31 7 16 18 24 19 20 16 28 16 20 19 9 15 16 16 14 8 3 9 4 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 1 2 1 1 3 1 5 3 3 3 1 2 3 5 11 6 7 3 4 4 9 10 6 7 9 4 5 4 3 5 3 3 4 0 1 2 0 1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 1 1 2 2 7 5 5 6 9 2 5 9 9 15 11 18 15 13 10 7 4 0 2 6 2 2 1 1 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 0 0 0 0 26 19 26 25 40 60 73 103 100 85 91 62 45 42 30 19 15 11 4 2 3 1 1 2 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 7 2 10 13 19 31 28 43 38 42 36 32 26 25 21 14 19 14 9 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 0 3 1 0 4 3 5 13 15 11 16 29 42 43 44 44 64 48 54 53 60 51 59 39 35 38 32 38 26 31 19 12 14 9 11 34 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 12 6 8 17 20 28 34 33 35 39 53 62 72 66 74 50 51 52 47 35 34 26 31 19 22 18 9 11 12 8 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 3 2 0 0 0 2 3 3 6 5 8 20 22 20 34 45 66 65 67 60 75 63 68 58 43 41 42 41 21 17 12 19 15 11 10 12 5 3 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 0 1 0 0 2 1 5 7 6 15 17 18 22 32 30 33 36 40 46 41 53 55 62 44 54 39 46 36 36 41 28 29 15 23 16 16 15 40 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 2 0 0 1 0 1 2 6 10 13 13 31 30 30 51 37 57 69 59 53 56 49 53 47 43 49 37 29 23 18 28 23 14 12 5 8 41 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 1 12 18 16 9 1 0 3 2 5 10 12 16 23 15 19 28 29 36 26 55 46 37 54 42 52 45 54 41 35 39 37 29 28 23 17 13 11 11 9 11 3 6 6 3 5 3 0 0 2 0 1 1 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 7 1 9 3 3 6 9 17 28 32 61 62 94 94 70 62 41 42 32 31 33 28 16 23 18 26 15 13 13 11 16 17 8 8 9 6 6 8 7 4 4 1 1 0 0 1 4 0 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 2 1 2 8 7 14 18 36 38 39 49 42 46 67 66 76 77 79 77 49 56 33 23 95 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 7 3 7 10 9 23 29 33 58 49 71 65 79 82 86 65 56 51 42 34 31 27 17 13 15 12 5 6 6 2 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 0 5 0 2 1 0 3 3 9 10 21 15 11 22 24 28 20 31 39 41 48 63 51 73 57 57 48 62 38 48 39 28 23 23 14 10 11 4 5 7 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 1 2 0 2 0 2 2 2 3 4 18 15 23 25 31 32 34 34 45 60 56 54 46 57 49 46 33 33 27 40 39 27 25 26 25 12 16 12 10 6 7 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 1 4 2 0 0 1 0 1 3 10 4 6 15 26 24 23 39 48 46 51 58 56 55 66 43 39 39 50 39 38 22 36 17 22 20 18 13 14 8 10 5 7 4 4 13 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 0 3 10 7 6 1 1 0 6 11 18 25 49 46 42 39 30 33 43 35 26 26 43 31 37 42 31 36 26 37 30 28 28 27 28 30 15 14 11 6 9 9 7 6 3 2 3 0 0 0 3 0 1 0 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 15 8 4 0 3 2 8 16 25 50 48 62 49 64 49 50 45 61 54 53 49 54 30 41 30 21 15 11 11 11 13 9 6 4 5 5 2 5 2 2 4 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 2 0 1 2 5 8 17 19 40 50 39 59 49 48 73 56 65 66 58 52 56 49 36 33 25 25 14 17 13 5 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 7 1 3 3 14 14 19 23 22 40 62 63 79 75 86 78 75 63 58 35 44 34 21 21 13 16 11 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 0 0 6 1 0 0 2 1 4 12 10 10 18 18 19 30 30 40 42 56 49 47 69 66 57 57 55 47 56 40 31 25 26 26 13 10 7 9 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 1 0 0 0 0 1 0 3 8 14 15 25 23 31 25 25 39 32 38 52 59 50 47 44 45 52 39 44 42 30 36 24 25 30 26 75 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 1 4 2 0 0 0 0 2 1 5 3 9 6 17 27 38 40 60 52 69 82 67 67 58 47 52 46 26 31 29 29 24 20 22 10 6 7 6 11 4 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 5 18 23 23 12 4 4 2 5 6 11 21 25 35 27 30 25 26 31 30 31 33 41 34 36 32 44 46 43 32 47 38 28 22 21 20 21 19 13 6 9 6 6 6 0 3 0 0 0 0 0 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 7 16 9 6 4 4 16 19 26 49 70 96 100 81 80 64 48 29 36 24 38 23 24 14 18 13 6 11 5 6 6 9 5 13 4 5 1 3 3 2 3 2 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 6 0 1 3 5 10 18 33 33 45 51 59 65 47 67 70 73 64 65 65 49 52 22 97 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 1 0 0 2 2 5 9 11 21 18 28 35 37 66 54 72 68 80 84 65 68 60 37 42 31 31 21 13 11 3 8 7 2 1 3 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 1 3 6 7 6 14 23 21 35 45 42 66 62 70 76 59 71 62 64 61 48 22 36 16 11 20 13 40 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 0 2 2 1 0 0 0 2 4 3 4 7 11 19 22 31 44 49 37 46 64 64 59 57 55 54 43 51 54 42 34 34 26 26 18 7 7 7 6 0 3 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 4 10 9 13 11 6 2 5 4 12 25 28 50 44 49 44 44 38 32 21 20 32 37 25 30 35 43 33 28 46 32 25 29 24 22 25 16 12 6 7 12 2 4 0 3 1 0 0 0 0 0 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 0 7 1 3 3 15 19 25 37 52 59 78 81 84 57 77 49 34 46 49 35 29 36 35 20 11 13 5 10 4 8 4 1 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 0 2 0 0 1 2 2 12 10 13 16 18 31 42 48 61 93 85 92 72 77 61 58 49 58 29 18 12 11 12 1 1 5 3 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
-9999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
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
1985  1 1  0 0 1 -1 -1 852  400 236 141 58 11 4 2
1986  1 1  0 0 1 -1 -1 583  106 259 146 57 9 5 1
1987  1 1  0 0 1 -1 -1 762  329 98 224 80 24 5 2
1988  1 1  0 0 1 -1 -1 737  196 254 93 139 41 11 3
1989  1 1  0 0 1 -1 -1 692  266 115 179 50 63 13 6
1990  1 1  0 0 1 -1 -1 684  615 25 18 16 4 3 3
1991  1 1  0 0 1 -1 -1 777  463 293 14 2 3 2 0
1992  1 1  0 0 1 -1 -1 568  53 282 221 7 3 2 0
1993  1 1  0 0 1 -1 -1 548  154 39 233 117 3 0 2
1994  1 1  0 0 1 -1 -1 526  178 135 23 132 55 3 0
1995  1 1  0 0 1 -1 -1 500  122 143 128 28 61 17 1
1996  1 1  0 0 1 -1 -1 463  285 51 67 43 2 12 3
1997  1 1  0 0 1 -1 -1 454  353 74 11 7 3 4 2
1998  1 1  0 0 1 -1 -1 459  317 116 22 2 2 0 0
1999  1 1  0 0 1 -1 -1 428  112 225 78 13 0 0 0
2000  1 1  0 0 1 -1 -1 366  99 75 145 38 8 1 0
2001  1 1  0 0 1 -1 -1 501  227 87 70 97 18 2 0
2002  1 1  0 0 1 -1 -1 439  38 229 73 43 48 6 2
2003  1 1  0 0 1 -1 -1 402  232 24 101 30 8 6 1
2004  1 1  0 0 1 -1 -1 459  417 29 2 6 1 1 3
2005  1 1  0 0 1 -1 -1 394  249 136 7 0 2 0 0
2006  1 1  0 0 1 -1 -1 421  154 185 78 4 0 0 0
2007  1 1  0 0 1 -1 -1 532  130 190 175 36 1 0 0
2008  1 1  0 0 1 -1 -1 445  67 136 157 77 8 0 0
2009  1 1  0 0 1 -1 -1 402  280 25 43 38 16 0 0
2010  1 1  0 0 1 -1 -1 442  382 50 4 3 3 0 0
2011  1 1  0 0 1 -1 -1 434  177 235 20 0 2 0 0
2012  1 1  0 0 1 -1 -1 370  95 112 158 4 1 0 0
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

