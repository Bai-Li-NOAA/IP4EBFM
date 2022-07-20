#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Jul 20 12:55:38 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1658336138 first rand#: -0.448549
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
-999 1 1 133667 0.05
1985 1 1 139491 0.05
1986 1 1 131903 0.05
1987 1 1 28126.5 0.05
1988 1 1 2010.77 0.05
1989 1 1 3311.61 0.05
1990 1 1 18380.2 0.05
1991 1 1 30257.9 0.05
1992 1 1 62856.9 0.05
1993 1 1 146527 0.05
1994 1 1 23392.2 0.05
1995 1 1 4787.6 0.05
1996 1 1 13527.9 0.05
1997 1 1 54517.4 0.05
1998 1 1 149045 0.05
1999 1 1 131683 0.05
2000 1 1 210660 0.05
2001 1 1 137703 0.05
2002 1 1 13410.9 0.05
2003 1 1 58265.1 0.05
2004 1 1 163035 0.05
2005 1 1 654514 0.05
2006 1 1 3.21205e+06 0.05
2007 1 1 2.1792e+06 0.05
2008 1 1 255778 0.05
2009 1 1 318927 0.05
2010 1 1 558414 0.05
2011 1 1 916609 0.05
2012 1 1 1.14236e+06 0.05
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
1990 10 2 944545 0.1 #_orig_obs: 676462 survey1
1991 10 2 4.08029e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 4.34093e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 2.41197e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.78679e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.39874e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 907135 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 1.68755e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 3.46784e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 5.71807e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 3.30103e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.51246e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 2.43986e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 1.26914e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 2.5748e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 1.31049e+07 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 1.25202e+07 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 6.49514e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 2.74517e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 1.22853e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 2.79229e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 7.1176e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 3.03213e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 777935 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 742611 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 799517 0.1 #_orig_obs: 572537 survey2
1988 4 3 461155 0.1 #_orig_obs: 204010 survey2
1989 4 3 404544 0.1 #_orig_obs: 253977 survey2
1990 4 3 345359 0.1 #_orig_obs: 250505 survey2
1991 4 3 519662 0.1 #_orig_obs: 315253 survey2
1992 4 3 1.45428e+06 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 1.28483e+06 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 642662 0.1 #_orig_obs: 418617 survey2
1995 4 3 600687 0.1 #_orig_obs: 310064 survey2
1996 4 3 498807 0.1 #_orig_obs: 381408 survey2
1997 4 3 352441 0.1 #_orig_obs: 452433 survey2
1998 4 3 729257 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.54902e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 1.94939e+06 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 1.07584e+06 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 850076 0.1 #_orig_obs: 577555 survey2
2003 4 3 732643 0.1 #_orig_obs: 821136 survey2
2004 4 3 513087 0.1 #_orig_obs: 375379 survey2
2005 4 3 1.2051e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 3.64995e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 3.18933e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 1.40844e+06 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 877310 0.1 #_orig_obs: 624374 survey2
2010 4 3 483877 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.00739e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 1.76225e+06 0.1 #_orig_obs: 2.40226e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 0 1 0 2 6 3 7 6 3 5 5 3 7 6 4 5 5 7 5 1 3 3 5 2 1 1 1 2 1 3 0 4 1 3 0 2 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 2 6 2 0 6 2 5 3 4 1 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 2 3 5 2 10 10 11 11 9 6 8 5 9 8 4 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 17 1 3 4 12 8 10 6 8 6 7 6 2 4 4 6 5 2 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 2 6 4 1 4 2 2 3 0 1 2 0 1 4 3 2 1 0 2 1 1 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 0 0 2 1 3 4 7 3 16 9 24 12 14 25 12 10 12 10 10 4 8 8 9 8 4 6 40 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 0 2 3 5 2 4 1 2 2 5 10 6 10 11 8 12 8 7 9 5 9 6 8 4 10 4 6 3 2 2 8 3 6 0 5 1 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 0 1 3 2 1 4 3 1 3 5 7 9 8 12 7 10 10 10 1 4 0 1 2 2 0 1 1 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 2 0 2 3 6 2 4 5 4 14 14 12 18 18 16 14 5 12 6 3 2 5 1 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 4 1 4 4 8 21 24 26 45 43 49 54 32 50 28 16 13 14 11 48 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 40 11 19 28 41 29 27 34 24 26 26 15 25 17 18 13 17 13 9 11 4 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 0 0 2 2 2 3 4 5 10 4 8 15 17 14 18 15 12 14 8 9 12 10 7 12 6 12 11 5 9 2 3 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 3 2 3 2 6 8 14 19 38 40 49 40 55 41 35 34 24 34 14 13 21 8 99 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 1 2 3 2 1 1 2 1 2 1 5 3 5 2 1 1 6 1 2 2 1 3 0 1 1 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 3 4 4 11 7 12 7 12 8 14 10 17 16 18 24 21 15 9 9 9 2 4 4 5 5 6 6 5 9 4 2 1 2 5 1 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 1 4 2 6 12 12 12 12 29 34 57 66 58 79 88 51 63 154 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 19 10 12 13 25 19 22 28 40 39 20 22 11 20 9 7 1 5 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 0 1 0 2 3 3 9 15 10 30 27 34 46 42 51 45 32 33 30 25 15 19 18 11 11 10 5 11 6 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 30 7 21 23 23 30 18 17 23 17 18 20 16 16 12 13 11 3 7 6 5 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 0 0 0 1 5 4 6 2 2 2 4 1 3 6 7 9 4 6 8 10 8 4 13 8 6 7 4 2 2 4 1 1 2 0 2 0 2 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 1 0 3 2 4 6 5 9 6 8 4 12 10 9 14 12 9 12 7 10 5 4 4 0 4 0 0 0 2 2 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 0 0 0 0 35 16 23 24 50 67 57 73 77 89 88 73 75 54 27 19 10 9 6 3 5 4 1 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 5 3 8 8 13 20 35 32 39 40 33 40 39 26 22 15 13 16 14 43 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 0 8 2 0 1 2 4 8 11 28 26 30 30 38 41 45 63 55 66 53 48 45 58 54 42 41 20 39 26 24 16 15 16 7 10 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 12 8 15 24 27 27 35 36 43 52 56 40 62 47 64 59 64 45 40 49 34 20 21 26 16 14 15 8 10 4 27 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 1 1 0 0 1 2 4 3 10 6 13 11 23 18 41 35 53 68 70 73 77 62 78 61 52 32 28 34 23 25 23 11 12 10 8 8 6 4 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 0 1 0 1 2 1 2 5 12 15 16 20 19 35 27 34 36 36 38 38 51 51 48 56 50 42 54 58 37 41 26 34 14 19 24 14 10 33 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 2 0 1 0 0 0 3 5 10 7 9 21 21 27 38 54 57 60 68 55 63 53 63 44 41 40 27 33 36 24 23 13 19 21 25 8 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 1 9 16 11 10 5 0 2 2 5 9 11 17 22 21 26 25 36 25 38 42 44 49 47 40 40 49 39 42 42 35 35 32 30 19 24 23 23 12 9 7 5 4 7 2 4 1 1 0 0 1 0 1 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 4 9 8 3 1 7 9 17 36 39 46 76 84 73 79 63 47 37 31 33 33 24 25 21 12 21 16 15 17 11 19 16 10 10 8 12 6 1 3 3 4 2 2 2 2 2 0 1 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 1 2 4 5 6 14 20 32 22 29 45 46 62 61 81 85 83 80 80 61 41 30 30 80 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 3 4 7 8 15 17 26 38 41 56 68 86 74 66 63 63 76 59 48 41 36 29 16 16 11 11 8 2 2 2 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 0 2 0 0 1 3 2 4 13 9 7 19 24 13 30 23 26 32 33 44 33 51 43 62 51 70 51 55 58 46 39 38 28 29 18 8 11 9 4 5 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 0 1 1 0 0 1 0 2 3 7 13 8 15 21 29 31 35 43 40 50 50 52 60 50 60 52 41 27 39 31 31 31 22 25 22 35 15 11 11 11 5 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 2 1 2 1 0 0 0 3 3 9 7 5 10 17 28 21 45 37 49 63 46 54 64 56 47 40 38 28 40 35 40 24 27 22 20 18 22 15 12 12 6 10 12 2 7 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 1 1 8 6 3 1 1 3 4 15 20 32 40 47 37 39 26 24 35 37 31 50 34 49 40 34 35 34 36 31 27 36 18 18 29 26 17 12 17 10 11 3 9 6 4 1 0 0 0 1 0 0 1 0 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 13 9 4 2 3 3 9 16 28 43 44 40 57 67 39 48 58 59 55 43 53 49 36 33 34 24 20 20 17 12 9 7 6 9 9 5 2 0 1 7 0 1 6 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 0 0 2 1 5 8 12 20 38 40 49 42 51 52 53 61 49 67 55 60 57 52 47 30 29 27 23 21 10 7 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 2 1 4 6 5 18 15 21 42 47 39 80 76 69 82 74 89 69 53 48 35 26 25 19 13 15 4 23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 3 1 1 3 1 2 1 2 3 8 7 13 9 20 15 19 27 42 37 60 59 57 64 70 62 71 57 49 45 38 43 28 23 14 14 8 8 6 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 1 0 1 0 1 1 2 2 7 9 22 23 20 25 35 34 31 38 32 36 43 53 53 52 46 51 49 41 29 37 32 29 30 30 22 15 68 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 3 3 0 0 0 0 0 0 3 6 7 6 18 18 20 41 39 32 63 62 71 75 68 58 51 47 44 39 24 29 17 24 18 20 21 17 13 12 9 7 15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 4 14 28 19 12 2 2 6 7 12 17 18 32 30 25 27 37 28 29 25 26 29 32 45 34 44 48 45 45 30 46 34 33 28 23 14 16 12 12 3 8 3 2 4 5 0 2 1 0 2 0 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 9 8 9 7 1 6 14 25 33 58 65 78 83 88 63 66 49 54 32 25 35 26 25 18 24 14 13 15 8 10 4 7 5 3 4 4 0 3 2 2 1 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 2 1 4 1 4 11 23 32 47 56 56 58 50 43 60 80 49 82 60 65 52 42 32 90 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 1 0 0 0 1 4 5 10 17 25 24 34 34 39 69 61 78 77 74 65 81 68 55 40 35 26 21 15 17 10 6 2 0 2 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 0 2 0 3 1 2 8 19 18 27 33 26 22 30 57 57 69 69 84 57 66 70 58 47 45 27 24 22 10 14 33 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 0 7 3 1 0 0 0 1 2 2 4 9 11 14 26 30 27 47 55 52 69 46 80 54 54 51 51 47 48 35 39 20 21 20 13 17 15 8 7 1 5 1 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 2 9 14 18 10 1 0 6 10 13 30 36 43 54 53 53 42 34 30 22 19 23 29 44 36 28 42 36 28 34 30 17 26 29 11 10 18 18 12 11 6 3 2 2 2 0 2 1 1 0 0 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 0 7 1 1 4 7 21 35 35 49 68 75 83 72 69 61 44 42 42 39 39 35 42 34 23 18 15 4 8 4 3 3 3 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 0 1 1 1 3 0 2 2 9 22 19 26 26 38 45 54 77 79 88 77 70 87 79 53 42 21 30 19 6 3 8 4 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 1 -1 852  400 231 147 52 18 2 2
1986  1 1  0 0 1 1 -1 583  106 268 138 54 10 6 1
1987  1 1  0 0 1 1 -1 762  307 114 211 88 33 7 2
1988  1 1  0 0 1 1 -1 737  167 248 85 163 52 15 7
1989  1 1  0 0 1 1 -1 692  241 133 201 43 58 10 6
1990  1 1  0 0 1 1 -1 684  623 21 20 16 1 3 0
1991  1 1  0 0 1 1 -1 777  443 301 18 6 5 1 3
1992  1 1  0 0 1 1 -1 568  76 280 203 5 1 3 0
1993  1 1  0 0 1 1 -1 548  184 46 212 101 4 0 1
1994  1 1  0 0 1 1 -1 526  181 141 36 122 46 0 0
1995  1 1  0 0 1 1 -1 500  131 147 123 20 59 18 2
1996  1 1  0 0 1 1 -1 463  312 38 61 35 3 12 2
1997  1 1  0 0 1 1 -1 454  342 80 12 16 4 0 0
1998  1 1  0 0 1 1 -1 459  323 96 33 5 2 0 0
1999  1 1  0 0 1 1 -1 428  121 234 59 9 1 3 1
2000  1 1  0 0 1 1 -1 366  94 60 171 38 3 0 0
2001  1 1  0 0 1 1 -1 501  256 81 65 81 16 2 0
2002  1 1  0 0 1 1 -1 439  47 202 83 36 61 6 4
2003  1 1  0 0 1 1 -1 402  239 20 94 19 12 16 2
2004  1 1  0 0 1 1 -1 459  416 30 0 10 2 0 1
2005  1 1  0 0 1 1 -1 394  257 125 10 1 1 0 0
2006  1 1  0 0 1 1 -1 421  156 192 71 2 0 0 0
2007  1 1  0 0 1 1 -1 532  128 186 169 47 2 0 0
2008  1 1  0 0 1 1 -1 445  56 109 189 81 10 0 0
2009  1 1  0 0 1 1 -1 402  273 22 45 41 21 0 0
2010  1 1  0 0 1 1 -1 442  380 48 3 8 3 0 0
2011  1 1  0 0 1 1 -1 434  183 220 31 0 0 0 0
2012  1 1  0 0 1 1 -1 370  95 124 141 10 0 0 0
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

