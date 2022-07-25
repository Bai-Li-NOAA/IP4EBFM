#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Jul 25 16:25:33 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1658780733 first rand#: -0.648922
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
-999 1 1 139827 0.05
1985 1 1 158389 0.05
1986 1 1 142515 0.05
1987 1 1 26415.2 0.05
1988 1 1 1911.56 0.05
1989 1 1 3079.68 0.05
1990 1 1 17554.9 0.05
1991 1 1 27092 0.05
1992 1 1 65426.8 0.05
1993 1 1 163530 0.05
1994 1 1 23705.9 0.05
1995 1 1 5408.43 0.05
1996 1 1 13458.5 0.05
1997 1 1 58002.7 0.05
1998 1 1 147373 0.05
1999 1 1 141531 0.05
2000 1 1 209714 0.05
2001 1 1 136298 0.05
2002 1 1 12708.1 0.05
2003 1 1 52318.2 0.05
2004 1 1 188463 0.05
2005 1 1 667306 0.05
2006 1 1 3.29953e+06 0.05
2007 1 1 2.1564e+06 0.05
2008 1 1 249069 0.05
2009 1 1 291907 0.05
2010 1 1 556395 0.05
2011 1 1 955276 0.05
2012 1 1 1.00997e+06 0.05
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
1990 10 2 815028 0.1 #_orig_obs: 676462 survey1
1991 10 2 4.27255e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 4.91246e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.9896e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.8865e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.27607e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 927855 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 1.9133e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 3.60292e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 6.98083e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 3.79358e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.27881e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 2.28302e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 1.08321e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 2.66647e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 1.23033e+07 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 1.59527e+07 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 5.58774e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 3.12922e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 1.05223e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 2.55177e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 6.16547e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.60049e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 940371 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 846663 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 859069 0.1 #_orig_obs: 572537 survey2
1988 4 3 471477 0.1 #_orig_obs: 204010 survey2
1989 4 3 409163 0.1 #_orig_obs: 253977 survey2
1990 4 3 286102 0.1 #_orig_obs: 250505 survey2
1991 4 3 576536 0.1 #_orig_obs: 315253 survey2
1992 4 3 1.67869e+06 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 1.55096e+06 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 706112 0.1 #_orig_obs: 418617 survey2
1995 4 3 630115 0.1 #_orig_obs: 310064 survey2
1996 4 3 425645 0.1 #_orig_obs: 381408 survey2
1997 4 3 381580 0.1 #_orig_obs: 452433 survey2
1998 4 3 656846 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.39753e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 1.79219e+06 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 1.13637e+06 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 878246 0.1 #_orig_obs: 577555 survey2
2003 4 3 892745 0.1 #_orig_obs: 821136 survey2
2004 4 3 463349 0.1 #_orig_obs: 375379 survey2
2005 4 3 1.39906e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 3.81427e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 2.24398e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 1.27525e+06 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 892944 0.1 #_orig_obs: 624374 survey2
2010 4 3 475630 0.1 #_orig_obs: 227348 survey2
2011 4 3 945716 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 1.59125e+06 0.1 #_orig_obs: 2.40226e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 0 2 1 7 3 6 6 7 4 2 4 2 4 3 4 11 5 5 8 5 0 4 7 4 0 2 4 0 1 2 1 3 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 0 0 3 0 4 3 2 3 6 4 5 1 4 1 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 7 5 2 6 6 5 9 11 10 10 9 4 7 6 8 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 26 1 9 8 5 7 7 6 5 8 4 2 10 6 5 3 2 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9 3 0 1 6 1 7 4 1 2 1 0 2 3 1 1 1 2 1 0 2 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 1 0 2 3 2 1 5 13 10 17 13 15 10 16 17 15 7 17 9 7 8 8 7 9 7 4 38 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 1 1 0 4 1 2 4 3 6 5 8 13 7 14 9 10 11 6 8 7 8 3 8 6 4 7 2 6 2 2 4 4 5 2 0 1 1 3 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 2 1 0 0 4 3 1 4 1 3 5 6 8 7 10 9 11 6 5 4 0 2 4 3 0 3 0 1 1 0 1 0 3 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 2 0 0 1 0 2 3 7 1 7 4 11 14 16 13 24 12 14 16 6 5 3 3 1 1 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 4 2 4 6 13 23 30 29 37 38 33 36 43 37 24 29 23 20 21 43 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 45 20 21 21 24 24 30 34 21 20 29 32 24 22 22 19 11 7 13 5 6 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 0 0 2 2 2 2 2 3 4 5 10 12 20 17 20 8 17 16 13 11 7 16 5 11 7 12 10 6 13 2 5 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 3 0 2 2 5 10 15 19 30 40 41 55 54 43 53 32 28 25 17 13 9 12 94 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 2 1 0 0 2 0 1 2 0 0 0 1 7 4 1 4 3 4 8 2 2 2 0 1 2 1 0 0 0 1 0 0 1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 1 5 12 11 14 8 16 8 11 8 11 19 19 23 18 11 21 9 11 7 7 3 4 3 3 6 2 4 4 3 4 1 2 1 0 1 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 2 0 5 0 4 4 11 15 15 34 34 51 60 86 74 76 54 72 143 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 7 13 8 19 16 28 25 34 39 29 30 30 14 9 9 6 5 3 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 2 0 0 1 1 2 3 4 9 13 24 27 33 48 54 44 34 50 32 25 27 27 24 11 9 12 8 8 5 4 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33 14 14 23 22 25 20 23 13 21 27 15 7 17 9 12 6 5 9 5 2 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 0 2 1 0 1 3 3 2 5 0 3 7 5 7 5 8 6 9 3 9 2 5 5 7 4 10 5 3 5 3 4 4 4 2 1 2 1 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 0 0 1 6 5 9 1 7 5 6 12 8 13 12 12 13 11 15 7 3 5 3 1 2 0 2 2 2 2 1 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 0 0 0 0 20 26 22 33 44 62 74 78 103 89 86 76 59 36 28 18 12 7 3 2 2 4 0 0 1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 5 11 10 6 14 20 34 42 29 37 29 35 37 28 33 20 21 12 13 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 0 2 1 0 2 2 5 6 11 17 19 29 34 43 32 50 51 66 60 64 65 69 64 45 43 35 34 25 27 17 19 14 10 9 4 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 8 14 15 16 20 43 23 31 34 50 46 48 70 61 68 61 59 57 41 34 32 28 24 15 25 12 9 10 11 8 27 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 1 0 0 0 0 1 1 4 6 5 11 19 25 25 23 43 44 67 60 56 69 81 66 75 64 40 34 25 33 20 19 22 15 6 15 2 12 1 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 0 0 1 0 1 3 1 14 14 12 13 30 23 31 26 28 37 37 34 47 42 59 60 51 38 61 51 47 38 43 22 23 27 18 16 15 9 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 1 0 0 0 1 3 3 10 8 10 12 23 17 36 46 42 51 50 44 65 55 56 57 52 44 35 38 32 35 35 24 29 13 26 5 11 31 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 2 5 14 17 9 2 0 4 4 7 5 10 14 16 20 21 23 30 35 33 39 52 57 46 53 41 49 45 38 32 50 44 27 22 22 23 20 12 9 12 3 9 6 10 4 2 1 1 0 0 0 0 0 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 3 8 10 2 1 4 7 13 25 37 60 82 82 89 90 57 42 37 34 31 26 25 21 17 27 28 17 18 11 11 12 10 8 7 5 9 9 7 1 8 3 0 2 1 0 3 0 0 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 2 4 10 20 23 30 34 47 46 51 58 76 87 73 79 64 74 58 32 35 21 75 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 7 2 5 6 13 27 19 27 40 58 73 71 90 93 81 64 57 51 41 31 37 17 24 14 13 14 7 3 6 4 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 0 1 1 0 0 2 1 4 7 6 12 19 26 13 22 24 22 37 34 47 32 43 55 63 67 51 60 56 51 44 42 26 31 28 18 20 9 7 8 5 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 1 0 1 1 0 0 1 3 6 9 12 24 17 26 26 21 40 40 48 52 56 52 48 46 47 44 38 37 32 36 24 30 30 32 25 16 13 14 12 6 5 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 0 4 5 1 1 0 1 2 8 4 5 14 20 21 21 21 31 46 39 51 52 49 50 56 54 66 37 39 44 32 25 26 23 24 26 26 15 11 12 10 5 7 4 5 7 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 0 7 8 9 5 0 1 1 5 16 23 27 38 49 39 37 29 35 34 30 32 36 50 44 36 32 38 30 37 28 31 35 19 26 21 20 16 20 16 9 10 6 4 3 1 3 1 0 1 0 0 1 0 1 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 10 4 3 1 0 2 6 20 25 40 48 54 55 54 53 44 54 44 67 44 58 56 41 32 26 25 28 17 12 10 6 7 7 9 6 5 4 4 4 4 0 4 7 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 7 0 1 1 2 7 17 16 32 43 50 44 68 44 44 58 66 70 53 65 62 49 42 41 33 13 17 11 10 6 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 1 4 5 5 9 10 17 22 34 32 55 54 84 79 71 80 73 72 71 66 31 16 21 25 14 12 10 27 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 0 0 2 3 1 2 1 3 4 7 16 10 21 17 17 31 22 36 53 53 55 60 61 76 50 64 54 47 38 30 37 32 17 15 23 12 10 3 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 0 1 0 0 1 3 2 3 13 10 15 33 26 36 30 25 24 37 36 43 52 54 58 54 48 40 43 34 29 34 34 36 28 22 17 79 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 3 1 1 0 1 0 2 2 1 3 7 8 7 20 22 38 33 56 52 66 85 68 59 70 65 38 38 35 33 22 24 10 24 16 14 12 12 15 9 9 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 5 10 27 19 18 1 2 1 6 10 17 22 20 32 22 32 30 17 28 25 31 42 38 44 43 36 48 38 38 41 32 41 39 22 18 22 13 16 7 14 9 2 6 5 5 1 2 1 1 0 1 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 6 12 6 4 3 6 10 9 29 46 68 73 81 96 79 73 57 36 33 33 27 31 33 17 23 19 7 7 9 6 6 11 5 10 7 3 4 5 2 3 2 0 2 0 0 0 0 1 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 4 2 0 5 8 17 22 39 36 49 50 42 60 58 58 67 74 69 72 61 50 48 35 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 1 1 1 0 2 2 11 12 16 20 26 40 40 42 60 60 58 73 80 71 68 64 73 52 28 24 23 18 12 6 4 4 4 3 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 0 3 4 9 14 7 19 24 34 43 56 59 59 67 54 73 77 71 65 54 35 29 32 34 22 16 10 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 2 1 3 2 0 0 0 0 3 7 3 9 12 13 20 18 33 40 47 60 62 60 56 60 69 55 48 49 51 33 38 31 20 22 22 9 12 11 6 3 3 2 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 2 10 19 16 4 2 1 3 11 10 24 40 40 50 57 47 33 34 34 21 24 25 39 33 31 36 31 30 42 27 40 22 33 27 19 16 15 13 5 10 4 4 6 3 3 1 2 0 0 0 0 1 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 0 8 0 3 5 11 14 25 28 60 77 77 74 72 79 67 42 41 34 46 44 36 41 17 20 17 13 9 3 8 4 2 5 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 0 1 1 0 1 3 3 5 10 15 21 31 39 34 60 64 52 53 81 93 87 81 73 59 32 33 27 12 10 6 2 0 4 1 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 -1 -1 852  403 236 149 50 11 3 0
1986  1 1  0 0 1 -1 -1 583  129 257 120 56 15 5 1
1987  1 1  0 0 1 -1 -1 762  299 95 228 91 33 9 7
1988  1 1  0 0 1 -1 -1 737  177 268 100 123 50 15 4
1989  1 1  0 0 1 -1 -1 692  257 119 193 54 51 15 3
1990  1 1  0 0 1 -1 -1 684  618 30 19 13 1 2 1
1991  1 1  0 0 1 -1 -1 777  441 303 18 10 3 0 2
1992  1 1  0 0 1 -1 -1 568  77 286 201 2 2 0 0
1993  1 1  0 0 1 -1 -1 548  172 38 226 109 2 1 0
1994  1 1  0 0 1 -1 -1 526  170 127 46 140 41 2 0
1995  1 1  0 0 1 -1 -1 500  120 134 130 25 72 18 1
1996  1 1  0 0 1 -1 -1 463  298 32 67 42 7 13 4
1997  1 1  0 0 1 -1 -1 454  369 64 5 9 6 0 1
1998  1 1  0 0 1 -1 -1 459  320 101 30 4 4 0 0
1999  1 1  0 0 1 -1 -1 428  124 213 74 12 3 1 1
2000  1 1  0 0 1 -1 -1 366  83 78 160 38 6 1 0
2001  1 1  0 0 1 -1 -1 501  235 92 65 86 19 3 1
2002  1 1  0 0 1 -1 -1 439  29 205 93 41 60 10 1
2003  1 1  0 0 1 -1 -1 402  231 19 95 32 12 11 2
2004  1 1  0 0 1 -1 -1 459  426 19 2 10 2 0 0
2005  1 1  0 0 1 -1 -1 394  273 109 9 2 1 0 0
2006  1 1  0 0 1 -1 -1 421  152 175 91 3 0 0 0
2007  1 1  0 0 1 -1 -1 532  119 185 182 43 3 0 0
2008  1 1  0 0 1 -1 -1 445  67 104 172 89 13 0 0
2009  1 1  0 0 1 -1 -1 402  268 28 48 37 21 0 0
2010  1 1  0 0 1 -1 -1 442  371 45 4 11 11 0 0
2011  1 1  0 0 1 -1 -1 434  174 229 31 0 0 0 0
2012  1 1  0 0 1 -1 -1 370  93 134 133 10 0 0 0
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

