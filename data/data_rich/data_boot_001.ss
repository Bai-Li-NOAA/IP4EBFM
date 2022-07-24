#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Sun Jul 24 14:10:13 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1658686213 first rand#: 1.57329
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
-999 1 1 127167 0.05
1985 1 1 144454 0.05
1986 1 1 134323 0.05
1987 1 1 26166 0.05
1988 1 1 1880.41 0.05
1989 1 1 3148.11 0.05
1990 1 1 18573.5 0.05
1991 1 1 28679.1 0.05
1992 1 1 64546.4 0.05
1993 1 1 141199 0.05
1994 1 1 23968 0.05
1995 1 1 4646.29 0.05
1996 1 1 13971.9 0.05
1997 1 1 58941.8 0.05
1998 1 1 152265 0.05
1999 1 1 136236 0.05
2000 1 1 205155 0.05
2001 1 1 145457 0.05
2002 1 1 13874.1 0.05
2003 1 1 55799.9 0.05
2004 1 1 169954 0.05
2005 1 1 622606 0.05
2006 1 1 3.37195e+06 0.05
2007 1 1 2.02997e+06 0.05
2008 1 1 240018 0.05
2009 1 1 311784 0.05
2010 1 1 543102 0.05
2011 1 1 868890 0.05
2012 1 1 1.09064e+06 0.05
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
1990 10 2 769649 0.1 #_orig_obs: 676462 survey1
1991 10 2 4.54342e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 4.72923e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 2.10056e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 1.803e+06 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.30875e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.04138e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 1.66926e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 3.51865e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 6.10261e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 3.26545e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 1.96727e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 2.96967e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 1.22536e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 2.50465e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 1.49405e+07 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 1.04911e+07 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 5.3379e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 2.75198e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 1.19243e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 2.61245e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 7.03813e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 3.10713e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 718080 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 725082 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 698568 0.1 #_orig_obs: 572537 survey2
1988 4 3 409987 0.1 #_orig_obs: 204010 survey2
1989 4 3 441339 0.1 #_orig_obs: 253977 survey2
1990 4 3 230998 0.1 #_orig_obs: 250505 survey2
1991 4 3 476954 0.1 #_orig_obs: 315253 survey2
1992 4 3 1.66885e+06 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 1.43599e+06 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 765475 0.1 #_orig_obs: 418617 survey2
1995 4 3 519494 0.1 #_orig_obs: 310064 survey2
1996 4 3 505853 0.1 #_orig_obs: 381408 survey2
1997 4 3 364776 0.1 #_orig_obs: 452433 survey2
1998 4 3 785113 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.33675e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 1.91283e+06 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 1.08568e+06 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 897501 0.1 #_orig_obs: 577555 survey2
2003 4 3 688290 0.1 #_orig_obs: 821136 survey2
2004 4 3 551886 0.1 #_orig_obs: 375379 survey2
2005 4 3 1.75361e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 4.68257e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 2.78472e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 1.48406e+06 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 751316 0.1 #_orig_obs: 624374 survey2
2010 4 3 484023 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.09384e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 1.78172e+06 0.1 #_orig_obs: 2.40226e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 1 0 0 0 0 3 5 11 5 4 5 3 2 6 4 5 10 6 3 3 3 3 4 3 1 2 2 7 2 1 4 2 0 0 4 0 0 0 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 0 0 0 1 4 1 4 5 1 2 7 4 5 1 1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 6 2 5 5 7 7 9 11 15 9 7 3 8 4 2 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 15 2 3 4 8 4 4 7 9 10 10 8 6 6 3 5 5 2 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 3 3 3 7 1 3 3 2 2 1 2 3 0 0 2 1 6 2 2 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 1 1 0 1 2 3 0 2 8 8 11 15 13 18 14 18 20 13 9 13 6 6 7 2 5 4 6 3 52 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 1 1 1 4 2 1 2 6 5 5 8 11 8 16 13 7 5 14 8 6 6 5 7 8 11 6 3 4 1 2 2 5 2 2 0 0 0 0 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 0 1 4 0 2 2 5 5 4 0 10 4 9 12 11 7 11 3 5 5 3 2 1 2 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 1 0 2 1 2 3 8 1 4 5 17 17 18 23 10 12 8 14 8 7 4 1 1 3 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 5 3 5 9 10 15 18 25 30 40 46 47 58 37 30 27 20 12 13 45 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 50 14 25 30 29 26 31 41 22 20 17 25 31 18 12 14 10 14 5 12 4 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 0 0 1 1 4 3 2 5 5 6 4 14 15 23 13 18 12 10 15 13 14 15 8 11 9 3 8 8 5 8 5 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 2 0 2 2 10 7 13 19 30 27 42 44 54 37 43 30 30 30 18 22 23 13 104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 1 2 2 3 3 5 2 2 4 1 2 2 3 2 6 5 2 1 0 0 2 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 1 3 9 11 14 11 17 8 8 10 14 18 10 32 27 14 16 14 11 5 2 1 2 5 4 3 1 0 5 7 1 0 1 1 0 1 2 0 1 1 1 0 2 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 1 2 6 4 8 17 17 19 30 26 59 62 74 70 79 59 62 145 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 14 4 13 15 18 13 22 37 27 37 28 26 19 17 13 4 4 7 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 0 0 1 1 1 2 4 9 12 21 33 38 31 46 47 54 42 40 32 22 30 12 17 12 7 11 5 4 6 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 27 10 16 20 25 24 17 22 17 25 20 11 17 17 10 14 4 9 6 6 7 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 1 0 1 1 1 0 3 1 5 3 0 2 3 8 8 12 1 2 5 10 4 10 4 10 10 4 11 2 4 4 1 4 4 2 2 2 2 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 1 1 4 2 2 4 6 8 5 4 4 11 10 14 11 14 13 12 9 6 5 8 4 2 1 0 1 1 1 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 0 0 0 0 29 13 19 37 44 57 60 77 92 102 87 62 62 42 32 21 18 13 5 2 1 1 4 1 1 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 0 0 7 6 4 13 16 16 27 43 31 43 32 28 36 36 23 20 16 10 15 42 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 0 8 0 1 1 2 3 10 12 15 17 23 22 38 38 39 56 60 63 69 60 58 50 58 42 42 37 21 26 26 11 22 12 12 7 39 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 7 7 8 20 36 35 31 37 48 46 41 65 57 74 54 51 52 54 45 39 34 18 31 20 23 14 7 12 5 7 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 1 4 0 0 0 0 3 4 6 8 12 15 27 26 29 46 52 56 67 70 66 63 68 51 61 39 41 33 23 24 20 18 14 13 15 4 1 8 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 2 0 0 0 0 2 6 3 17 17 21 23 22 25 21 33 24 44 35 52 56 47 55 56 48 41 54 53 46 37 35 30 28 14 16 11 7 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 0 1 0 0 1 0 6 5 6 17 12 21 27 28 43 47 57 58 62 68 55 49 58 54 33 35 29 24 29 39 23 14 15 17 21 12 34 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 0 3 7 17 10 1 2 3 0 5 7 11 16 24 20 20 25 24 27 36 42 50 50 56 54 48 52 40 39 39 37 37 34 38 19 20 22 12 5 13 11 6 6 4 4 3 1 0 0 0 0 0 0 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 3 6 1 3 1 2 13 14 30 35 66 70 78 94 71 65 44 41 35 23 21 26 29 25 30 21 12 18 17 10 14 11 14 11 5 4 8 3 5 1 5 3 8 3 1 0 0 0 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 3 0 3 7 7 16 23 29 30 43 45 65 63 72 70 66 68 71 58 57 43 50 32 79 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 5 3 4 7 12 17 28 27 55 56 66 72 65 85 74 64 71 56 52 34 39 29 17 22 10 9 8 6 1 1 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 0 4 0 0 1 1 2 2 8 15 13 8 17 19 17 26 32 24 32 51 40 46 54 53 70 59 60 60 52 51 42 32 24 20 16 16 8 8 5 3 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 1 1 0 0 1 1 0 1 5 10 15 16 18 11 29 24 37 32 56 49 51 49 54 46 58 51 49 46 38 35 31 27 19 29 19 20 21 9 10 8 11 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 0 2 2 0 1 1 1 3 5 8 5 8 10 14 23 29 29 41 39 56 65 53 54 59 60 48 39 37 33 32 38 24 23 27 20 17 21 19 11 13 7 2 6 4 11 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 3 4 12 11 3 0 4 3 5 19 16 30 38 32 36 36 33 38 26 32 35 37 41 46 40 41 32 26 34 38 35 31 33 19 23 19 11 14 8 14 7 8 11 2 2 2 6 0 2 0 0 1 0 1 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 9 10 5 2 2 4 12 14 32 41 49 44 61 56 50 43 43 36 57 53 50 45 46 37 31 29 26 18 13 10 11 10 12 7 6 8 2 3 2 2 2 3 4 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 0 3 0 2 4 10 22 25 25 47 49 49 54 55 46 44 64 60 63 66 61 59 39 38 32 20 12 15 9 6 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 2 1 4 5 6 5 19 23 36 47 46 50 73 68 67 84 73 78 68 52 46 26 27 21 14 18 12 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 1 3 2 0 1 2 2 0 8 5 9 15 23 10 21 23 24 55 43 53 59 70 70 54 59 50 51 39 38 40 26 28 23 20 15 12 17 7 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 0 0 0 0 1 1 0 3 5 11 21 20 22 33 32 47 34 41 44 47 47 39 44 57 55 50 48 35 40 35 27 29 24 17 16 75 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 0 1 1 1 0 0 1 0 3 0 2 11 20 25 29 39 46 38 63 50 68 61 66 71 48 53 40 38 29 18 20 30 16 22 20 14 5 18 6 7 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 3 11 18 29 13 1 2 4 2 9 18 29 27 29 34 30 28 25 16 21 28 29 37 41 37 45 40 47 37 39 41 37 38 26 26 22 11 17 15 3 7 7 7 4 2 4 2 1 1 0 0 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 9 4 8 2 3 2 10 22 34 51 68 77 95 102 90 63 53 42 28 38 16 24 17 20 23 20 18 10 5 7 6 3 7 5 4 2 2 2 1 2 1 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 7 1 1 3 9 13 18 22 31 48 57 53 61 59 51 60 63 98 63 56 62 44 37 83 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 1 0 1 0 1 4 8 13 16 16 20 29 50 37 56 67 75 71 95 74 62 84 49 41 34 27 15 16 11 9 5 7 4 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 0 1 0 0 5 0 6 9 13 24 27 24 42 48 57 45 79 56 82 77 78 43 55 43 39 33 31 21 15 19 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 1 3 9 0 3 0 1 0 2 7 7 16 12 14 26 17 35 39 34 55 60 65 55 66 53 63 53 50 45 38 24 29 32 18 16 15 14 7 3 3 3 4 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 5 8 16 23 11 4 3 8 7 16 32 31 39 49 54 45 36 30 30 20 27 22 32 34 37 28 27 35 25 35 33 26 29 28 24 14 21 7 13 12 11 3 5 3 2 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 0 11 2 2 6 15 12 30 34 57 70 81 78 91 68 48 35 46 42 36 35 35 26 31 23 20 18 6 8 5 1 6 2 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 1 7 11 9 12 23 25 39 40 37 57 70 84 88 93 74 65 68 49 48 25 25 22 9 3 5 4 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 -1 -1 852  405 252 110 60 17 4 4
1986  1 1  0 0 1 -1 -1 583  113 266 135 50 15 2 2
1987  1 1  0 0 1 -1 -1 762  323 117 209 88 19 5 1
1988  1 1  0 0 1 -1 -1 737  190 246 87 158 41 13 2
1989  1 1  0 0 1 -1 -1 692  246 138 179 56 49 20 4
1990  1 1  0 0 1 -1 -1 684  619 31 11 14 2 5 2
1991  1 1  0 0 1 -1 -1 777  429 314 23 4 4 0 3
1992  1 1  0 0 1 -1 -1 568  72 266 208 10 5 7 0
1993  1 1  0 0 1 -1 -1 548  182 39 223 99 3 2 0
1994  1 1  0 0 1 -1 -1 526  177 129 28 142 47 3 0
1995  1 1  0 0 1 -1 -1 500  134 141 119 25 55 25 1
1996  1 1  0 0 1 -1 -1 463  299 43 63 30 10 12 6
1997  1 1  0 0 1 -1 -1 454  336 86 11 17 2 1 1
1998  1 1  0 0 1 -1 -1 459  312 117 27 2 1 0 0
1999  1 1  0 0 1 -1 -1 428  118 201 83 24 1 0 1
2000  1 1  0 0 1 -1 -1 366  94 83 139 39 9 2 0
2001  1 1  0 0 1 -1 -1 501  230 98 60 94 15 3 1
2002  1 1  0 0 1 -1 -1 439  38 216 87 50 38 10 0
2003  1 1  0 0 1 -1 -1 402  239 18 96 30 10 9 0
2004  1 1  0 0 1 -1 -1 459  424 19 3 9 3 0 1
2005  1 1  0 0 1 -1 -1 394  259 128 6 0 1 0 0
2006  1 1  0 0 1 -1 -1 421  143 200 77 1 0 0 0
2007  1 1  0 0 1 -1 -1 532  120 190 174 45 3 0 0
2008  1 1  0 0 1 -1 -1 445  51 124 178 83 9 0 0
2009  1 1  0 0 1 -1 -1 402  250 22 47 65 18 0 0
2010  1 1  0 0 1 -1 -1 442  396 40 2 3 1 0 0
2011  1 1  0 0 1 -1 -1 434  178 228 26 1 1 0 0
2012  1 1  0 0 1 -1 -1 370  93 123 144 9 1 0 0
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

