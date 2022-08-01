#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Jul 29 09:57:46 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659103066 first rand#: -2.04826
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
-999 1 1 662161 0.05
1985 1 1 140849 0.05
1986 1 1 130618 0.05
1987 1 1 28536.2 0.05
1988 1 1 2094.64 0.05
1989 1 1 3182.34 0.05
1990 1 1 17939 0.05
1991 1 1 29933.1 0.05
1992 1 1 69661.5 0.05
1993 1 1 144941 0.05
1994 1 1 23919.6 0.05
1995 1 1 4811.03 0.05
1996 1 1 13467.1 0.05
1997 1 1 54875.7 0.05
1998 1 1 158255 0.05
1999 1 1 140624 0.05
2000 1 1 218107 0.05
2001 1 1 148253 0.05
2002 1 1 11985.2 0.05
2003 1 1 57236.3 0.05
2004 1 1 172000 0.05
2005 1 1 661412 0.05
2006 1 1 3.41294e+06 0.05
2007 1 1 1.92939e+06 0.05
2008 1 1 244310 0.05
2009 1 1 321823 0.05
2010 1 1 520385 0.05
2011 1 1 947304 0.05
2012 1 1 1.11869e+06 0.05
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
1990 10 2 300.077 0.1 #_orig_obs: 676462 survey1
1991 10 2 282.284 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 224.4 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 269.635 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 250.383 0.1 #_orig_obs: 607064 survey1
1995 10 2 277.337 0.1 #_orig_obs: 980024 survey1
1996 10 2 261.382 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 260.379 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 281.49 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 264.411 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 242.362 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 249.944 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 325.73 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 311.275 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 251.995 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 192.92 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 54.1911 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 18.366 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 72.5251 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 124.098 0.1 #_orig_obs: 928010 survey1
2010 10 2 83.6995 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 41.6018 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 25.3702 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 692.27 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 760.068 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 675.659 0.1 #_orig_obs: 572537 survey2
1988 4 3 626.413 0.1 #_orig_obs: 204010 survey2
1989 4 3 734.008 0.1 #_orig_obs: 253977 survey2
1990 4 3 812.665 0.1 #_orig_obs: 250505 survey2
1991 4 3 678.807 0.1 #_orig_obs: 315253 survey2
1992 4 3 740.077 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 658.092 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 906.998 0.1 #_orig_obs: 418617 survey2
1995 4 3 996.81 0.1 #_orig_obs: 310064 survey2
1996 4 3 713.188 0.1 #_orig_obs: 381408 survey2
1997 4 3 665.885 0.1 #_orig_obs: 452433 survey2
1998 4 3 678.883 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 823.645 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 679.927 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 681.134 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 655.971 0.1 #_orig_obs: 577555 survey2
2003 4 3 868.115 0.1 #_orig_obs: 821136 survey2
2004 4 3 777.194 0.1 #_orig_obs: 375379 survey2
2005 4 3 845.332 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 429.677 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 150.139 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 229.741 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 443.916 0.1 #_orig_obs: 624374 survey2
2010 4 3 247.598 0.1 #_orig_obs: 227348 survey2
2011 4 3 210.572 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 162.572 0.1 #_orig_obs: 2.40226e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 1 0 1 0 1 4 2 1 2 3 3 6 6 7 13 10 6 13 5 11 3 3 5 5 1 2 1 2 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 4 1 0 2 0 1 2 5 4 2 0 1 4 1 3 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 11 4 14 8 5 3 10 9 12 11 10 8 5 0 4 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 45 9 8 11 6 5 8 8 5 4 3 1 2 1 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 3 4 5 4 4 6 6 5 2 2 1 0 1 0 1 0 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 1 2 0 2 2 3 5 4 6 4 13 15 23 13 21 23 18 18 23 17 12 12 10 5 2 1 2 0 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 1 1 0 0 1 1 2 4 6 7 7 8 3 11 20 19 22 15 13 9 6 7 6 5 2 3 6 3 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 2 1 1 1 2 5 2 5 4 3 6 7 12 8 9 6 5 8 7 3 4 1 1 1 2 2 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 1 1 2 3 2 6 2 6 15 6 12 17 15 17 11 12 9 9 5 6 5 6 1 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 16 7 5 4 16 22 15 28 39 38 56 25 33 37 29 28 20 17 13 47 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 80 22 27 45 45 29 43 38 29 24 22 14 10 13 5 6 5 3 3 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 1 0 1 0 4 6 6 5 12 3 9 12 11 15 20 22 26 23 20 16 12 10 9 9 4 5 3 2 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 11 4 11 10 8 14 20 27 29 39 39 47 58 47 40 34 30 28 23 24 16 12 31 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 2 1 0 1 1 3 4 3 3 3 4 2 4 5 4 2 3 1 2 1 1 2 1 0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 0 1 1 3 4 2 1 8 10 10 17 22 20 29 24 21 20 28 19 8 5 7 11 5 9 2 3 0 2 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 3 3 7 8 9 16 16 15 29 41 36 54 48 49 62 54 54 236 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 50 14 18 15 16 14 21 20 22 19 20 19 9 13 14 17 10 5 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 1 7 20 22 30 36 37 58 36 28 21 23 26 25 18 20 23 26 20 19 13 9 11 6 7 4 2 1 2 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 93 30 21 34 35 31 26 22 13 11 11 6 6 1 2 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 0 0 0 0 0 3 1 1 5 3 5 7 12 12 19 8 15 6 14 7 7 8 5 3 3 1 1 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 0 1 1 2 1 2 6 5 4 7 6 8 9 8 10 11 17 14 9 9 6 17 7 1 3 1 2 3 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 0 0 0 0 127 30 32 38 42 41 63 51 50 62 62 63 44 41 45 25 21 14 11 5 9 4 3 1 3 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 80 21 16 17 18 24 28 34 35 41 36 25 18 18 14 11 6 5 6 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 0 66 21 12 15 18 27 40 52 76 92 86 84 80 72 55 52 32 31 22 16 10 21 1 6 5 3 4 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 131 46 53 69 72 99 100 78 63 59 47 37 32 22 25 13 13 13 7 9 3 0 8 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 35 15 17 9 11 20 25 58 61 62 93 89 75 84 66 56 45 47 35 18 14 15 10 12 10 6 3 2 3 2 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 40 17 22 15 9 15 32 49 53 80 72 91 70 94 52 68 48 37 31 21 14 22 10 10 5 11 7 3 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 54 9 14 12 19 24 46 51 79 82 76 81 83 71 57 59 36 24 31 23 17 17 13 7 3 6 2 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 9 9 19 22 14 6 17 23 34 44 55 62 72 100 88 81 65 59 47 37 26 27 19 15 15 11 7 6 4 3 2 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 16 20 19 12 9 13 15 28 41 64 71 85 92 82 90 91 55 48 31 30 19 12 16 9 8 10 2 7 3 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 87 9 19 42 31 49 61 85 99 89 89 61 56 42 28 40 18 24 16 16 11 13 6 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 188 54 78 91 93 86 83 58 44 41 36 25 17 34 19 18 7 8 7 4 4 2 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 0 70 22 7 13 10 22 48 50 66 88 96 99 78 68 61 38 26 27 28 14 14 16 17 6 6 4 1 2 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 22 25 18 14 11 11 20 18 43 56 68 89 98 85 70 75 59 50 39 26 17 23 15 12 9 6 13 6 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 15 20 18 14 11 6 21 25 42 62 68 85 94 94 82 71 56 38 44 19 30 18 26 10 12 8 2 3 2 2 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 5 5 26 19 15 14 10 11 38 38 50 84 81 97 93 78 67 60 41 34 28 28 17 14 7 12 10 8 2 0 3 1 1 0 2 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 35 20 19 8 13 14 27 42 58 74 70 100 94 85 58 67 47 30 27 18 30 16 14 8 8 5 6 2 2 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 60 14 6 15 20 22 51 60 75 71 94 81 92 60 63 50 35 24 25 21 18 12 8 6 7 1 4 3 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 105 26 42 61 70 72 94 86 90 83 66 36 37 29 13 20 15 11 10 11 4 9 2 2 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 21 24 25 17 13 10 16 26 41 59 72 73 93 97 72 70 56 47 33 28 22 20 12 14 13 5 9 2 4 1 2 2 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 13 8 17 12 9 9 9 19 24 46 53 73 83 94 80 85 69 63 46 42 25 30 25 19 9 13 10 7 1 3 1 0 2 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 2 6 16 19 24 21 9 10 21 36 37 48 62 75 103 101 73 69 69 51 21 13 26 21 15 14 14 6 6 4 4 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 4 9 17 26 11 11 13 13 27 30 57 77 105 99 86 86 66 53 49 30 22 22 14 27 13 14 5 4 2 3 1 2 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 21 24 27 10 11 15 22 25 33 74 72 75 78 84 81 62 50 50 43 26 19 15 18 19 9 13 7 5 3 3 4 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 132 10 11 21 22 39 48 75 85 77 93 71 70 58 42 24 28 18 17 11 15 13 5 15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 170 51 24 15 20 29 29 55 65 79 88 73 65 67 58 34 25 12 12 10 8 3 2 0 1 1 1 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 0 132 19 24 34 45 68 85 86 114 102 63 73 48 47 20 15 12 7 2 1 0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 12 16 25 11 12 12 22 36 34 70 67 75 87 93 97 89 63 49 27 29 18 10 9 13 10 4 5 3 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 9 12 24 37 24 12 10 12 26 41 56 56 66 74 77 72 69 68 52 38 32 34 19 16 24 11 9 11 4 3 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 0 125 27 15 7 11 28 37 47 86 79 103 92 90 54 52 40 30 20 12 11 9 4 7 2 3 2 2 4 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 0 128 18 22 17 14 39 50 63 71 88 96 83 89 74 48 42 21 17 5 3 2 3 2 0 3 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 -1 -1 852  404 383 53 8 2 1 1
1986  1 1  0 0 1 -1 -1 583  237 286 49 9 2 0 0
1987  1 1  0 0 1 -1 -1 762  379 307 63 10 1 2 0
1988  1 1  0 0 1 -1 -1 737  367 293 66 8 3 0 0
1989  1 1  0 0 1 -1 -1 692  338 279 58 12 4 1 0
1990  1 1  0 0 1 -1 -1 684  340 279 59 5 1 0 0
1991  1 1  0 0 1 -1 -1 777  370 325 63 16 2 0 1
1992  1 1  0 0 1 -1 -1 568  235 269 52 12 0 0 0
1993  1 1  0 0 1 -1 -1 548  273 224 40 8 3 0 0
1994  1 1  0 0 1 -1 -1 526  260 216 42 7 0 1 0
1995  1 1  0 0 1 -1 -1 500  254 198 44 3 1 0 0
1996  1 1  0 0 1 -1 -1 463  235 185 38 5 0 0 0
1997  1 1  0 0 1 -1 -1 454  229 182 31 8 4 0 0
1998  1 1  0 0 1 -1 -1 459  236 176 36 9 2 0 0
1999  1 1  0 0 1 -1 -1 428  216 173 30 7 2 0 0
2000  1 1  0 0 1 -1 -1 366  174 152 31 6 2 1 0
2001  1 1  0 0 1 -1 -1 501  262 199 34 3 1 1 1
2002  1 1  0 0 1 -1 -1 439  207 187 41 2 2 0 0
2003  1 1  0 0 1 -1 -1 402  177 177 37 9 1 0 1
2004  1 1  0 0 1 -1 -1 459  235 168 50 3 2 1 0
2005  1 1  0 0 1 -1 -1 394  201 151 40 2 0 0 0
2006  1 1  0 0 1 -1 -1 421  271 119 25 6 0 0 0
2007  1 1  0 0 1 -1 -1 532  417 110 3 0 2 0 0
2008  1 1  0 0 1 -1 -1 445  292 149 4 0 0 0 0
2009  1 1  0 0 1 -1 -1 402  149 222 31 0 0 0 0
2010  1 1  0 0 1 -1 -1 442  227 161 48 6 0 0 0
2011  1 1  0 0 1 -1 -1 434  294 127 7 6 0 0 0
2012  1 1  0 0 1 -1 -1 370  275 89 5 1 0 0 0
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

