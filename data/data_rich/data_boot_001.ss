#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Jul 19 17:22:01 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1658265721 first rand#: 1.49671
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
-999 1 1 124856 0.05
1985 1 1 144718 0.05
1986 1 1 131502 0.05
1987 1 1 27641.4 0.05
1988 1 1 2073.77 0.05
1989 1 1 3629.32 0.05
1990 1 1 16247 0.05
1991 1 1 28619.7 0.05
1992 1 1 63224.6 0.05
1993 1 1 138330 0.05
1994 1 1 23223.7 0.05
1995 1 1 4791.4 0.05
1996 1 1 13344.4 0.05
1997 1 1 52884.3 0.05
1998 1 1 155675 0.05
1999 1 1 127005 0.05
2000 1 1 227333 0.05
2001 1 1 143849 0.05
2002 1 1 12329.1 0.05
2003 1 1 57854.9 0.05
2004 1 1 169478 0.05
2005 1 1 713968 0.05
2006 1 1 3.17758e+06 0.05
2007 1 1 2.33369e+06 0.05
2008 1 1 252273 0.05
2009 1 1 298523 0.05
2010 1 1 512249 0.05
2011 1 1 903750 0.05
2012 1 1 960514 0.05
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
1990 10 2 656518 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.77261e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 5.11304e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.86823e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.70297e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.30788e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 893769 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 1.56519e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 3.7224e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 6.11046e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 3.6068e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.33598e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 2.60447e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 1.1874e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 2.31737e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 1.20458e+07 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 1.38398e+07 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 4.95115e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 2.74845e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 1.17877e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 2.52328e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 6.43209e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.99213e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 767915 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 723360 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 564232 0.1 #_orig_obs: 572537 survey2
1988 4 3 498662 0.1 #_orig_obs: 204010 survey2
1989 4 3 379839 0.1 #_orig_obs: 253977 survey2
1990 4 3 253862 0.1 #_orig_obs: 250505 survey2
1991 4 3 491709 0.1 #_orig_obs: 315253 survey2
1992 4 3 1.28766e+06 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 1.40464e+06 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 734263 0.1 #_orig_obs: 418617 survey2
1995 4 3 532364 0.1 #_orig_obs: 310064 survey2
1996 4 3 444991 0.1 #_orig_obs: 381408 survey2
1997 4 3 388534 0.1 #_orig_obs: 452433 survey2
1998 4 3 703341 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.34494e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 1.99098e+06 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 1.20547e+06 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 840302 0.1 #_orig_obs: 577555 survey2
2003 4 3 932103 0.1 #_orig_obs: 821136 survey2
2004 4 3 520528 0.1 #_orig_obs: 375379 survey2
2005 4 3 1.44664e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 3.71299e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 2.24695e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 1.63494e+06 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 695659 0.1 #_orig_obs: 624374 survey2
2010 4 3 434388 0.1 #_orig_obs: 227348 survey2
2011 4 3 944936 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 1.54313e+06 0.1 #_orig_obs: 2.40226e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 1 0 1 3 5 3 5 4 3 1 0 4 5 2 5 5 12 5 6 3 6 0 5 2 3 4 2 3 4 4 5 1 3 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 0 2 0 1 1 2 5 3 2 7 3 1 3 1 2 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 4 1 4 5 7 18 14 14 10 6 11 7 5 4 5 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12 6 2 9 3 8 5 8 8 14 10 4 4 5 6 4 2 3 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 3 4 1 1 3 3 6 4 1 3 4 0 1 2 3 1 0 3 3 0 0 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 0 0 1 2 2 3 6 8 18 7 10 26 21 15 17 8 15 12 9 13 7 6 4 8 3 5 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 0 4 3 5 3 3 6 3 5 8 5 12 12 9 9 9 7 7 8 5 5 11 5 6 6 8 1 1 4 4 1 2 5 2 1 1 3 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 0 1 2 0 3 2 3 3 9 4 6 10 13 11 4 9 6 5 3 3 3 1 1 2 2 0 0 1 0 1 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 0 0 3 5 1 2 5 8 7 9 18 14 19 12 11 17 12 6 12 5 2 3 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 5 3 3 8 9 22 30 28 47 48 48 44 35 35 34 19 14 16 12 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 19 23 27 26 26 34 32 22 29 28 26 23 21 19 19 14 14 11 5 3 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 1 0 0 0 1 1 4 3 5 4 7 5 13 17 27 10 20 11 13 13 12 15 11 8 12 7 17 2 3 7 3 9 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 0 0 0 2 10 18 16 12 25 45 44 40 44 58 51 33 33 26 16 18 16 15 80 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 1 4 1 6 2 0 4 3 2 2 4 4 3 2 3 0 3 3 1 2 0 1 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 0 8 5 16 8 14 11 7 11 4 11 16 23 16 25 24 14 13 8 9 3 5 1 5 3 2 4 3 4 4 2 5 1 2 4 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 1 1 4 15 8 16 17 21 21 35 46 71 67 70 66 82 55 144 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 16 5 11 21 16 28 26 22 27 36 28 22 23 11 12 10 5 5 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 0 1 2 0 2 3 4 16 15 20 27 31 37 41 52 40 36 36 33 25 26 18 15 13 16 17 4 6 5 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 28 13 25 24 17 21 18 18 21 17 21 22 12 16 10 12 13 11 9 4 3 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 1 0 0 1 2 2 5 1 5 1 3 4 2 5 4 7 12 7 9 8 5 6 10 5 10 4 4 5 3 1 2 4 1 2 4 0 0 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 0 1 0 5 3 8 5 6 5 8 5 4 10 18 17 13 13 11 13 6 5 6 1 2 0 2 1 0 1 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 0 0 0 0 20 17 16 26 55 64 75 88 94 92 86 71 44 37 36 20 14 7 9 5 3 2 2 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 11 8 6 14 13 33 28 30 35 36 33 37 37 23 22 21 15 8 13 41 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 0 5 0 1 0 1 6 12 17 19 23 36 29 41 39 36 45 55 78 58 66 67 58 38 45 41 27 32 26 18 17 8 8 7 12 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 13 5 8 18 24 35 26 49 32 38 55 78 61 68 58 65 63 52 46 30 35 30 19 13 18 11 12 8 4 5 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 3 1 0 0 0 1 1 8 5 5 8 22 23 36 24 38 50 67 75 78 67 61 49 75 52 40 37 19 24 21 21 19 21 17 7 6 6 4 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 1 0 0 0 2 0 3 8 14 14 20 29 24 28 28 40 29 22 43 47 46 49 52 59 66 68 46 31 55 34 27 25 15 12 13 12 11 27 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 4 2 1 0 2 1 3 7 6 7 16 19 31 20 37 38 50 67 60 74 68 58 41 39 35 36 37 37 36 25 26 23 18 17 11 12 36 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 1 6 16 15 3 6 0 1 4 8 8 9 15 14 28 21 25 38 34 40 32 60 48 48 48 35 44 39 45 42 28 34 32 26 20 23 21 21 13 5 10 6 3 6 5 3 3 1 1 2 2 1 0 1 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 4 9 6 1 3 1 5 16 27 40 52 59 85 73 71 65 48 39 26 27 34 21 23 27 24 22 25 15 18 16 19 16 16 15 7 8 4 7 2 7 4 4 2 2 2 2 0 0 0 0 0 1 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 4 0 1 5 11 13 27 32 30 38 40 53 57 66 78 86 76 76 78 45 50 36 23 75 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 13 4 7 7 20 19 35 28 37 57 71 77 71 82 74 83 63 49 35 37 33 26 12 19 9 8 11 3 2 1 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 0 2 1 0 2 4 2 6 8 10 13 20 20 15 33 35 35 30 38 46 47 46 72 61 46 66 58 46 52 35 37 29 14 14 18 8 10 9 4 3 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 0 0 1 2 0 0 1 2 6 4 6 15 19 15 25 28 33 41 55 52 70 53 45 43 50 44 45 37 22 44 36 34 27 26 24 20 12 14 21 5 10 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 0 2 3 0 0 0 1 0 4 4 8 13 17 22 25 34 22 34 41 51 47 59 67 47 57 46 48 39 44 33 34 24 22 21 27 21 18 14 6 12 12 4 5 5 7 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 0 5 11 12 5 0 3 3 5 15 15 22 31 43 35 48 34 40 30 31 33 35 39 35 35 57 37 39 33 29 45 23 23 21 22 14 20 17 8 12 8 7 8 2 3 1 2 1 0 1 1 0 0 1 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 15 10 4 0 2 8 8 13 27 32 43 55 56 60 56 50 50 56 45 52 53 47 31 36 30 15 12 26 17 13 12 13 7 12 5 6 4 8 5 1 2 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 3 0 0 5 8 11 17 16 30 51 43 50 59 51 53 73 67 51 56 63 53 58 24 37 19 25 14 18 9 10 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 4 5 4 13 12 14 22 20 27 38 53 51 63 78 82 86 74 78 63 38 35 33 24 24 19 10 5 25 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 3 0 2 1 0 0 0 5 3 9 7 11 18 19 21 22 41 43 53 61 47 76 57 75 57 54 49 61 44 29 19 33 16 15 10 15 6 7 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 0 2 0 0 0 1 1 2 10 10 8 14 28 24 31 28 30 47 47 49 65 53 60 46 51 49 46 34 28 28 35 25 19 24 21 84 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 1 1 2 2 2 0 0 0 1 4 1 12 10 14 23 32 30 44 51 58 65 75 57 62 49 48 53 43 35 29 29 25 22 25 20 12 12 4 13 8 4 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 2 9 33 26 8 2 2 2 4 19 11 21 23 34 26 29 33 27 36 28 21 29 46 36 30 33 36 48 40 37 48 41 25 27 20 18 15 11 13 11 10 12 7 4 1 2 1 2 0 0 1 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 7 6 10 4 4 5 9 14 37 43 66 85 79 107 77 69 50 44 39 30 28 27 16 27 19 16 11 7 6 13 6 7 3 5 3 3 5 2 2 2 3 1 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 3 2 6 4 6 16 25 31 33 39 45 54 59 60 52 75 66 76 73 67 53 32 34 89 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 2 0 0 3 1 3 3 8 15 23 31 36 34 50 49 60 68 88 84 57 72 73 64 43 39 19 16 17 16 7 5 1 6 1 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 0 0 2 1 1 7 4 3 16 16 25 33 34 41 56 60 71 69 80 70 70 66 45 45 30 31 30 29 18 14 33 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 1 7 1 1 0 0 0 0 2 1 4 7 17 16 21 28 26 46 45 60 69 68 53 63 62 66 53 48 43 39 37 26 19 16 15 9 7 10 1 2 3 2 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 2 10 13 22 10 2 4 3 11 16 21 36 48 40 45 53 42 29 32 30 24 33 29 33 43 31 30 20 29 23 51 26 21 29 19 10 18 10 12 8 7 6 7 6 3 0 0 1 0 1 1 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 0 8 0 1 7 5 21 27 46 47 60 89 64 80 67 60 47 48 39 45 32 37 42 25 14 18 12 3 9 7 5 6 5 24 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 0 1 0 0 1 0 0 1 13 17 30 29 35 41 39 64 63 76 69 74 90 90 72 52 55 32 18 10 10 5 4 3 1 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 1 -1 852  440 222 123 44 13 7 3
1986  1 1  0 0 1 1 -1 583  112 241 151 51 23 3 2
1987  1 1  0 0 1 1 -1 762  320 87 218 104 22 6 5
1988  1 1  0 0 1 1 -1 737  184 248 81 161 48 8 7
1989  1 1  0 0 1 1 -1 692  279 111 178 53 53 12 6
1990  1 1  0 0 1 1 -1 684  599 34 13 22 3 8 5
1991  1 1  0 0 1 1 -1 777  456 295 14 5 6 0 1
1992  1 1  0 0 1 1 -1 568  67 291 193 12 2 3 0
1993  1 1  0 0 1 1 -1 548  186 53 203 102 1 0 3
1994  1 1  0 0 1 1 -1 526  167 145 38 118 57 1 0
1995  1 1  0 0 1 1 -1 500  120 123 146 33 56 20 2
1996  1 1  0 0 1 1 -1 463  294 40 59 49 6 13 2
1997  1 1  0 0 1 1 -1 454  340 83 11 9 8 2 1
1998  1 1  0 0 1 1 -1 459  315 116 22 4 2 0 0
1999  1 1  0 0 1 1 -1 428  116 213 84 13 0 1 1
2000  1 1  0 0 1 1 -1 366  97 82 145 37 3 2 0
2001  1 1  0 0 1 1 -1 501  226 81 67 109 17 1 0
2002  1 1  0 0 1 1 -1 439  42 205 75 59 50 6 2
2003  1 1  0 0 1 1 -1 402  226 24 98 27 8 17 2
2004  1 1  0 0 1 1 -1 459  417 28 2 7 3 1 1
2005  1 1  0 0 1 1 -1 394  262 124 6 1 1 0 0
2006  1 1  0 0 1 1 -1 421  145 193 80 3 0 0 0
2007  1 1  0 0 1 1 -1 532  143 187 168 33 1 0 0
2008  1 1  0 0 1 1 -1 445  56 116 168 92 13 0 0
2009  1 1  0 0 1 1 -1 402  277 27 38 46 14 0 0
2010  1 1  0 0 1 1 -1 442  376 54 2 4 6 0 0
2011  1 1  0 0 1 1 -1 434  181 225 25 0 3 0 0
2012  1 1  0 0 1 1 -1 370  96 122 143 8 1 0 0
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

