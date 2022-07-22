#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Jul 22 11:15:33 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1658502933 first rand#: -0.572569
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
-999 1 1 126461 0.05
1985 1 1 141473 0.05
1986 1 1 136412 0.05
1987 1 1 26119.5 0.05
1988 1 1 1976.4 0.05
1989 1 1 3254.69 0.05
1990 1 1 17123.1 0.05
1991 1 1 27316.7 0.05
1992 1 1 68682.6 0.05
1993 1 1 136991 0.05
1994 1 1 23763.6 0.05
1995 1 1 4290.31 0.05
1996 1 1 13231.7 0.05
1997 1 1 54042.6 0.05
1998 1 1 154696 0.05
1999 1 1 125958 0.05
2000 1 1 217270 0.05
2001 1 1 132931 0.05
2002 1 1 12924.1 0.05
2003 1 1 58287.7 0.05
2004 1 1 163814 0.05
2005 1 1 669559 0.05
2006 1 1 3.04745e+06 0.05
2007 1 1 2.28983e+06 0.05
2008 1 1 266480 0.05
2009 1 1 340098 0.05
2010 1 1 543624 0.05
2011 1 1 944121 0.05
2012 1 1 961612 0.05
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
1990 10 2 820842 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.82015e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 4.04058e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 2.03749e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.92818e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.17724e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 971023 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 1.90032e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 3.45214e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 6.77527e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 3.03418e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.27914e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 2.38756e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 1.13581e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 2.39663e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 1.33016e+07 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 1.36563e+07 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 5.34141e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 3.01122e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 1.11459e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 2.43445e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 6.05768e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 3.22585e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 899781 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 809978 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 732824 0.1 #_orig_obs: 572537 survey2
1988 4 3 401618 0.1 #_orig_obs: 204010 survey2
1989 4 3 434198 0.1 #_orig_obs: 253977 survey2
1990 4 3 306678 0.1 #_orig_obs: 250505 survey2
1991 4 3 501407 0.1 #_orig_obs: 315253 survey2
1992 4 3 1.4908e+06 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 1.76752e+06 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 590159 0.1 #_orig_obs: 418617 survey2
1995 4 3 563098 0.1 #_orig_obs: 310064 survey2
1996 4 3 447752 0.1 #_orig_obs: 381408 survey2
1997 4 3 384002 0.1 #_orig_obs: 452433 survey2
1998 4 3 627290 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.37324e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 1.69273e+06 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 1.04997e+06 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 829596 0.1 #_orig_obs: 577555 survey2
2003 4 3 915605 0.1 #_orig_obs: 821136 survey2
2004 4 3 531793 0.1 #_orig_obs: 375379 survey2
2005 4 3 1.27091e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 3.71753e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 3.28469e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 1.45365e+06 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 975567 0.1 #_orig_obs: 624374 survey2
2010 4 3 473346 0.1 #_orig_obs: 227348 survey2
2011 4 3 932513 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 1.54752e+06 0.1 #_orig_obs: 2.40226e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 0 0 2 3 4 10 4 6 6 3 2 4 5 10 4 10 3 2 6 4 3 2 2 0 3 4 3 3 1 0 3 2 1 0 2 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 2 0 0 3 0 3 1 6 2 4 4 2 6 2 3 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 6 5 3 7 5 12 10 6 7 12 7 6 8 8 3 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 3 8 7 5 9 12 3 5 6 8 6 8 6 0 2 6 1 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 2 2 1 3 6 4 1 3 3 2 2 2 0 2 2 1 2 0 2 1 3 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 1 0 1 1 1 1 5 3 4 9 14 8 14 12 11 12 18 14 14 14 9 8 10 7 12 8 5 6 39 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 1 1 1 4 4 2 1 5 4 8 9 7 14 12 6 6 7 11 13 8 5 6 6 5 6 4 6 8 3 4 4 2 1 3 2 0 2 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 0 0 3 3 3 3 1 5 4 7 5 4 11 15 5 10 8 4 1 1 2 0 1 0 1 3 1 1 1 1 2 1 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 1 0 1 2 3 1 1 6 9 3 5 4 18 10 12 18 19 12 11 10 8 5 2 5 1 1 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 3 1 7 8 14 12 20 25 29 42 43 42 42 38 32 34 22 17 15 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33 14 28 32 24 34 27 25 36 24 27 29 16 24 15 19 7 13 7 9 8 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 0 1 0 0 1 1 8 1 1 12 13 13 20 19 9 12 14 18 8 16 12 8 11 5 8 4 15 6 8 7 5 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 0 1 3 3 4 8 10 20 36 32 48 58 47 46 49 39 26 23 24 22 13 8 82 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 1 0 1 1 0 2 0 3 1 0 1 2 1 1 1 1 1 5 1 2 5 3 0 9 0 2 2 1 1 1 1 2 1 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 1 3 4 5 8 20 17 13 10 7 13 21 16 12 14 22 22 15 11 9 8 3 2 2 5 4 1 0 3 2 3 7 2 2 2 2 1 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 1 1 1 5 5 7 12 18 22 36 34 39 51 61 83 81 64 44 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 14 8 9 21 21 22 29 25 38 30 28 17 10 20 8 8 5 5 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 0 2 0 1 3 2 8 12 9 20 31 34 46 43 52 49 45 28 32 27 26 15 12 15 6 7 10 5 2 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 10 26 14 16 26 30 20 18 18 13 23 18 14 12 10 10 7 8 3 4 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 0 0 1 2 0 2 3 5 1 3 2 4 3 3 5 8 11 7 4 4 7 9 13 4 7 5 4 8 5 3 2 2 5 0 2 1 2 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 0 0 1 3 3 8 3 5 7 7 7 9 10 12 12 16 13 13 7 6 6 6 2 2 4 2 0 0 0 1 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 0 0 0 0 33 15 18 25 43 74 74 85 90 106 79 61 65 41 26 20 9 6 8 3 2 1 1 1 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 6 4 5 11 17 18 22 32 35 48 27 30 38 31 25 26 18 18 10 43 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 0 7 0 1 1 4 5 7 16 23 15 25 32 35 34 41 43 58 52 77 65 53 61 54 54 51 30 33 18 21 22 17 10 8 7 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 10 11 13 18 27 30 36 26 41 46 50 58 62 67 67 67 57 40 52 30 23 26 19 20 24 15 20 11 9 6 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 2 5 0 1 0 0 0 4 1 8 8 16 19 31 29 51 57 62 61 74 67 57 69 64 46 41 37 35 20 22 19 20 16 11 10 8 7 6 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 1 1 0 3 2 4 3 7 7 12 18 23 27 27 22 24 31 36 50 51 50 62 57 43 46 45 45 42 36 39 35 33 12 25 22 10 16 33 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 4 0 0 0 1 3 2 4 14 15 19 26 27 33 32 59 64 57 47 64 60 54 56 47 37 36 37 28 23 22 14 14 20 16 15 18 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 3 6 13 10 5 1 2 0 3 2 5 9 15 21 24 25 30 31 31 50 39 35 48 39 51 53 48 54 50 32 37 33 26 25 26 17 18 16 14 14 13 5 3 2 4 1 2 2 1 3 1 0 1 0 1 0 0 0
 1991 4 3 0 0 1000  0 0 0 3 1 10 1 1 2 13 21 29 40 47 84 78 92 66 59 43 38 26 35 24 33 27 33 22 17 13 15 12 15 11 15 8 15 12 2 10 10 6 4 2 3 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 2 0 3 5 7 15 25 27 37 39 55 48 45 73 67 70 83 80 83 51 40 44 22 79 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 7 2 11 7 14 21 26 40 47 50 77 63 70 77 70 66 78 49 52 38 33 23 22 14 10 14 6 2 1 3 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 0 0 1 0 0 1 3 10 7 15 12 14 16 23 24 24 27 33 26 39 59 54 66 57 67 54 57 51 40 40 40 30 33 18 14 11 11 6 3 5 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 1 0 0 0 0 0 0 3 1 10 7 13 17 17 30 31 50 33 54 56 44 49 52 56 39 45 52 36 30 38 28 23 38 24 26 19 16 18 6 9 9 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 2 2 2 0 0 0 4 0 1 5 8 14 10 19 28 26 33 41 56 52 46 65 57 38 53 45 50 47 34 33 13 26 22 25 28 26 16 13 14 8 6 7 10 4 11 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 0 6 9 4 6 0 1 5 11 13 20 16 39 37 34 34 40 40 39 32 35 34 34 33 37 49 42 31 30 35 32 33 22 20 19 26 22 16 12 12 6 9 6 5 1 3 4 0 3 0 1 0 0 0 0 1 0 1
 1998 4 3 0 0 1000  0 0 0 0 14 12 7 0 1 2 9 14 24 32 40 55 61 49 56 56 54 54 59 56 51 49 45 33 21 22 13 7 23 14 12 6 7 6 6 7 3 5 10 0 1 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 3 1 0 3 3 9 13 27 30 41 48 53 46 69 55 56 56 61 66 58 50 52 39 42 20 21 14 11 19 6 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 4 3 0 5 15 17 14 21 24 40 52 70 62 79 84 89 79 49 71 45 50 28 27 13 14 13 6 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 0 1 1 0 1 0 0 1 3 5 11 11 15 20 23 38 28 46 44 41 54 63 64 56 53 63 53 44 42 43 37 30 28 18 19 10 12 9 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 0 1 0 0 0 0 0 6 12 15 20 16 29 28 22 29 30 45 31 46 42 51 40 66 55 54 37 55 48 38 32 31 17 26 20 58 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 2 2 2 2 0 0 1 1 1 6 5 12 7 18 26 30 52 55 73 59 72 69 64 54 52 54 34 40 29 22 24 20 21 7 19 10 13 9 10 8 15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 5 12 18 29 15 5 3 0 10 13 15 13 32 37 30 34 26 21 20 22 27 29 34 41 49 49 54 37 38 35 30 32 31 32 15 14 21 14 12 11 8 6 5 2 4 7 2 0 0 1 0 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 6 11 11 5 2 5 7 17 33 49 69 77 91 102 76 60 47 32 38 30 30 26 24 19 19 19 19 8 6 9 5 5 5 5 8 5 5 2 1 1 2 4 1 0 1 1 2 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 5 1 2 7 8 13 16 24 23 46 45 48 61 66 66 77 73 68 73 66 46 53 39 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 2 0 0 1 2 4 5 13 16 18 24 30 30 60 52 69 61 75 74 89 80 64 49 39 35 31 11 16 13 13 7 6 2 3 1 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 2 3 7 16 6 14 23 27 41 52 60 58 65 73 67 66 78 61 59 38 29 31 26 22 19 16 41 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 1 1 1 2 0 1 1 2 4 3 9 11 11 12 16 26 36 45 44 54 57 66 62 75 54 46 54 44 43 45 23 24 24 26 22 14 17 8 7 1 3 1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 3 8 11 17 10 2 4 1 16 16 21 30 35 47 40 47 37 40 29 25 31 33 33 26 44 35 44 32 24 33 29 29 29 22 21 24 16 10 12 8 9 3 10 2 0 0 1 1 0 0 0 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 0 7 0 0 6 10 17 30 44 53 74 86 78 68 59 60 56 35 42 48 40 25 29 26 21 16 10 12 3 10 5 4 3 23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 0 1 0 0 0 1 4 3 8 15 9 22 30 42 52 52 73 78 96 98 65 81 61 57 40 30 23 16 18 8 6 2 3 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 -1 -1 852  431 230 128 51 8 4 0
1986  1 1  0 0 1 -1 -1 583  110 262 125 63 20 3 0
1987  1 1  0 0 1 -1 -1 762  331 94 220 85 25 6 1
1988  1 1  0 0 1 -1 -1 737  180 266 80 156 44 8 3
1989  1 1  0 0 1 -1 -1 692  245 140 189 43 60 12 3
1990  1 1  0 0 1 -1 -1 684  615 31 17 15 1 4 1
1991  1 1  0 0 1 -1 -1 777  459 294 11 8 3 1 1
1992  1 1  0 0 1 -1 -1 568  64 291 199 10 1 3 0
1993  1 1  0 0 1 -1 -1 548  180 42 198 118 5 2 3
1994  1 1  0 0 1 -1 -1 526  162 154 41 116 53 0 0
1995  1 1  0 0 1 -1 -1 500  133 125 132 27 61 21 1
1996  1 1  0 0 1 -1 -1 463  304 41 57 41 7 11 2
1997  1 1  0 0 1 -1 -1 454  353 69 10 16 4 0 2
1998  1 1  0 0 1 -1 -1 459  311 114 30 4 0 0 0
1999  1 1  0 0 1 -1 -1 428  119 226 70 13 0 0 0
2000  1 1  0 0 1 -1 -1 366  90 69 153 42 9 3 0
2001  1 1  0 0 1 -1 -1 501  241 75 82 85 13 5 0
2002  1 1  0 0 1 -1 -1 439  29 217 86 51 49 6 1
2003  1 1  0 0 1 -1 -1 402  231 17 97 28 9 16 4
2004  1 1  0 0 1 -1 -1 459  410 34 3 8 2 1 1
2005  1 1  0 0 1 -1 -1 394  260 120 8 1 5 0 0
2006  1 1  0 0 1 -1 -1 421  155 179 82 5 0 0 0
2007  1 1  0 0 1 -1 -1 532  123 194 180 34 1 0 0
2008  1 1  0 0 1 -1 -1 445  51 125 154 95 20 0 0
2009  1 1  0 0 1 -1 -1 402  257 24 56 47 18 0 0
2010  1 1  0 0 1 -1 -1 442  373 59 3 3 4 0 0
2011  1 1  0 0 1 -1 -1 434  179 229 23 1 2 0 0
2012  1 1  0 0 1 -1 -1 370  84 123 150 12 1 0 0
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

