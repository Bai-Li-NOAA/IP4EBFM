#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Jul 27 16:52:34 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1658955154 first rand#: -1.18539
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
-999 1 1 322145 0.05
1985 1 1 188522 0.05
1986 1 1 187023 0.05
1987 1 1 93311.8 0.05
1988 1 1 24977.3 0.05
1989 1 1 57342.9 0.05
1990 1 1 66526.6 0.05
1991 1 1 70711.6 0.05
1992 1 1 122291 0.05
1993 1 1 201857 0.05
1994 1 1 102979 0.05
1995 1 1 46720.4 0.05
1996 1 1 130362 0.05
1997 1 1 103341 0.05
1998 1 1 185788 0.05
1999 1 1 150337 0.05
2000 1 1 233282 0.05
2001 1 1 225984 0.05
2002 1 1 189935 0.05
2003 1 1 323652 0.05
2004 1 1 576768 0.05
2005 1 1 754593 0.05
2006 1 1 1.57384e+06 0.05
2007 1 1 822452 0.05
2008 1 1 459578 0.05
2009 1 1 509702 0.05
2010 1 1 472658 0.05
2011 1 1 428250 0.05
2012 1 1 720649 0.05
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
1990 10 2 1.07037e+06 0.1 #_orig_obs: 677965 survey1
1991 10 2 3.73571e+06 0.1 #_orig_obs: 3.25479e+06 survey1
1992 10 2 3.66606e+06 0.1 #_orig_obs: 6.60786e+06 survey1
1993 10 2 1.82074e+06 0.1 #_orig_obs: 1.70994e+06 survey1
1994 10 2 1.56982e+06 0.1 #_orig_obs: 1.00865e+06 survey1
1995 10 2 1.46717e+06 0.1 #_orig_obs: 1.85517e+06 survey1
1996 10 2 770437 0.1 #_orig_obs: 1.83768e+06 survey1
1997 10 2 1.58031e+06 0.1 #_orig_obs: 1.42472e+06 survey1
1998 10 2 4.46233e+06 0.1 #_orig_obs: 1.42479e+07 survey1
1999 10 2 5.95188e+06 0.1 #_orig_obs: 6.43402e+06 survey1
2000 10 2 3.60011e+06 0.1 #_orig_obs: 2.39328e+06 survey1
2001 10 2 2.39347e+06 0.1 #_orig_obs: 1.40284e+06 survey1
2002 10 2 2.9345e+06 0.1 #_orig_obs: 1.56085e+06 survey1
2003 10 2 1.12957e+06 0.1 #_orig_obs: 1.26877e+06 survey1
2004 10 2 1.95295e+06 0.1 #_orig_obs: 1.01914e+06 survey1
2005 10 2 1.09938e+07 0.1 #_orig_obs: 5.88313e+06 survey1
2006 10 2 6.57956e+06 0.1 #_orig_obs: 8.04381e+06 survey1
2007 10 2 4.82683e+06 0.1 #_orig_obs: 3.18229e+06 survey1
2008 10 2 4.52714e+06 0.1 #_orig_obs: 3.52945e+06 survey1
2009 10 2 1.78432e+06 0.1 #_orig_obs: 2.39792e+06 survey1
2010 10 2 2.69029e+06 0.1 #_orig_obs: 2.36562e+06 survey1
2011 10 2 6.26167e+06 0.1 #_orig_obs: 9.48175e+06 survey1
2012 10 2 6.89898e+06 0.1 #_orig_obs: 5.71121e+06 survey1
1985 4 3 730353 0.1 #_orig_obs: 1.61884e+06 survey2
1986 4 3 849526 0.1 #_orig_obs: 1.46524e+06 survey2
1987 4 3 923445 0.1 #_orig_obs: 915472 survey2
1988 4 3 598234 0.1 #_orig_obs: 222973 survey2
1989 4 3 362047 0.1 #_orig_obs: 205454 survey2
1990 4 3 265753 0.1 #_orig_obs: 156818 survey2
1991 4 3 523260 0.1 #_orig_obs: 342837 survey2
1992 4 3 1.47087e+06 0.1 #_orig_obs: 2.04686e+06 survey2
1993 4 3 1.10595e+06 0.1 #_orig_obs: 1.5609e+06 survey2
1994 4 3 628944 0.1 #_orig_obs: 363365 survey2
1995 4 3 605439 0.1 #_orig_obs: 572808 survey2
1996 4 3 604789 0.1 #_orig_obs: 543406 survey2
1997 4 3 271098 0.1 #_orig_obs: 331752 survey2
1998 4 3 718653 0.1 #_orig_obs: 1.63648e+06 survey2
1999 4 3 1.7835e+06 0.1 #_orig_obs: 4.12363e+06 survey2
2000 4 3 2.12352e+06 0.1 #_orig_obs: 1.70526e+06 survey2
2001 4 3 1.04385e+06 0.1 #_orig_obs: 701033 survey2
2002 4 3 822428 0.1 #_orig_obs: 430437 survey2
2003 4 3 772202 0.1 #_orig_obs: 702960 survey2
2004 4 3 332412 0.1 #_orig_obs: 254914 survey2
2005 4 3 974773 0.1 #_orig_obs: 1.12405e+06 survey2
2006 4 3 3.3627e+06 0.1 #_orig_obs: 4.11092e+06 survey2
2007 4 3 1.72178e+06 0.1 #_orig_obs: 2.01791e+06 survey2
2008 4 3 1.63404e+06 0.1 #_orig_obs: 1.30826e+06 survey2
2009 4 3 1.33702e+06 0.1 #_orig_obs: 1.66939e+06 survey2
2010 4 3 571895 0.1 #_orig_obs: 469887 survey2
2011 4 3 1.04216e+06 0.1 #_orig_obs: 1.63082e+06 survey2
2012 4 3 2.48998e+06 0.1 #_orig_obs: 2.72819e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 1 0 0 1 1 2 3 4 0 2 8 7 4 4 11 3 7 4 5 7 11 4 6 2 2 2 2 2 1 1 0 4 1 1 1 2 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 0 1 0 2 0 4 1 3 5 7 2 3 2 0 2 3 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 2 4 9 3 5 9 8 8 9 6 13 10 5 7 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 2 2 3 6 9 8 7 6 9 8 5 8 4 6 3 4 3 6 2 1 2 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 2 1 4 3 4 2 3 1 2 3 3 3 1 2 2 0 1 2 1 1 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 0 0 2 0 2 1 6 3 7 13 13 12 22 20 27 17 15 11 13 11 7 5 6 6 42 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 1 0 3 0 3 2 2 4 3 3 3 0 5 6 5 5 6 9 15 5 9 12 9 13 8 8 7 5 6 6 5 5 6 4 3 1 0 1 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 1 1 2 2 1 2 2 4 4 7 8 12 9 9 5 9 10 3 3 1 2 1 2 2 1 2 0 0 1 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 0 0 0 0 0 0 15 7 9 12 18 17 17 17 10 6 11 7 12 5 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 0 3 4 7 9 14 19 27 34 24 42 37 34 34 35 26 21 125 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 1 0 0 4 2 2 6 8 12 13 17 17 19 20 30 33 26 28 33 25 30 18 22 16 22 13 11 10 9 5 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 3 0 0 1 2 3 5 7 8 5 11 11 13 18 17 13 17 7 9 23 11 11 10 10 6 3 8 5 7 3 4 5 5 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 2 1 3 2 8 10 20 29 32 37 43 46 43 39 49 32 26 19 12 19 17 12 101 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 2 0 1 6 3 1 6 4 2 1 5 1 0 3 3 1 2 1 0 3 0 1 1 1 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 0 2 3 6 4 12 11 8 8 15 20 11 21 29 38 24 17 14 7 4 7 4 0 2 2 1 2 2 4 0 3 0 0 2 1 5 0 1 0 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 1 0 5 8 1 5 11 21 19 47 64 66 68 80 70 71 58 46 36 22 12 8 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 0 24 6 12 15 25 17 29 25 23 23 24 17 20 18 9 9 12 5 3 8 4 1 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 0 1 1 7 5 6 6 9 14 29 22 26 46 35 44 40 40 28 32 21 26 19 10 16 9 16 5 7 5 5 23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 12 8 11 22 20 29 36 30 17 30 27 19 15 15 7 7 7 4 9 8 1 2 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 0 0 0 0 1 4 0 2 2 1 1 3 8 4 3 4 7 10 9 9 12 8 10 6 6 9 3 5 3 3 2 7 1 2 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 0 0 1 1 3 2 4 4 3 6 10 15 12 11 6 17 13 12 8 11 3 4 5 2 2 1 1 0 4 1 3 0 1 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 1 0 0 0 0 3 5 10 13 29 39 32 68 77 93 88 78 89 57 48 33 24 24 14 15 13 7 5 4 4 1 5 1 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 2 4 5 7 3 15 16 23 28 41 30 39 37 32 29 32 25 16 15 12 16 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 4 3 1 1 1 2 2 9 11 17 19 27 31 41 48 53 75 64 75 81 85 58 59 54 40 26 20 15 25 6 11 4 8 5 7 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 9 5 16 22 16 33 38 35 46 63 63 63 76 57 64 58 58 43 47 42 30 29 21 17 10 11 4 4 6 5 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 8 5 4 6 15 23 30 36 48 57 73 60 74 82 86 63 77 59 28 41 35 18 15 15 6 6 10 7 4 3 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 1 1 2 5 6 16 15 15 28 20 30 52 48 57 55 55 70 57 54 59 48 47 42 41 29 30 22 21 17 17 8 7 24 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 1 1 1 0 4 0 1 2 7 10 19 10 21 28 29 36 40 47 54 46 57 53 57 46 39 41 45 50 42 37 23 29 28 23 19 15 39 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 0 7 12 13 6 1 1 3 4 7 12 17 26 21 18 28 40 20 24 35 27 27 48 52 38 45 42 36 39 45 35 45 29 28 25 20 21 14 21 13 9 9 7 11 4 5 3 2 2 1 0 1 1 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 0 3 4 3 1 4 13 6 17 20 48 45 59 69 58 58 60 47 32 58 49 52 46 30 38 27 21 18 17 11 8 9 10 3 8 9 11 8 2 4 2 2 1 2 2 2 0 1 2 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 0 0 6 6 12 19 23 43 37 46 59 61 78 93 102 83 72 68 44 38 20 25 23 11 9 5 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 1 1 1 0 0 2 5 5 4 8 18 18 21 34 49 53 52 53 79 82 70 59 71 55 55 41 27 37 21 25 16 13 7 2 7 4 3 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 2 0 0 0 2 1 6 3 5 6 18 27 21 23 22 27 36 34 35 35 53 53 51 48 53 53 51 68 49 36 43 31 28 28 9 10 8 11 1 5 4 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 0 0 2 0 0 1 2 5 5 8 13 13 27 20 34 32 41 51 76 62 59 67 61 66 52 36 37 34 32 15 26 15 20 18 9 12 10 5 5 10 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 0 2 0 2 0 1 0 1 1 3 5 8 8 17 18 25 27 41 52 72 67 66 79 68 58 37 49 36 44 36 26 26 19 23 13 12 11 10 9 6 4 5 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 2 8 7 7 4 1 2 4 10 10 17 32 38 40 38 41 27 27 35 29 28 32 22 40 44 60 36 35 33 39 35 26 30 22 30 22 19 13 17 9 10 5 4 5 1 1 1 0 2 0 0 0 0 0 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 0 14 2 0 3 2 17 18 36 25 37 51 45 42 54 49 71 64 68 63 65 47 42 49 29 26 18 12 12 6 2 1 9 6 4 3 3 1 1 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 2 0 1 4 1 7 4 10 16 15 22 28 46 61 68 68 69 78 75 84 62 67 57 47 28 13 16 51 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 2 2 4 9 8 17 27 29 35 48 54 56 77 78 77 66 85 48 55 41 36 38 21 32 12 10 33 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 0 2 1 1 1 0 1 5 5 4 8 17 11 10 26 15 29 37 33 44 51 56 68 67 68 45 49 48 60 41 39 41 28 28 16 12 8 4 10 4 1 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 4 4 7 9 15 21 18 35 42 41 45 40 53 59 52 62 49 57 41 35 28 45 30 24 28 29 26 12 16 16 57 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 0 1 1 2 0 0 0 3 6 5 5 9 17 25 30 39 45 64 72 72 79 77 66 55 35 40 38 39 33 21 20 18 16 11 4 5 16 10 7 6 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 4 13 23 18 11 3 5 3 6 19 23 29 37 46 33 38 22 29 22 30 22 25 30 33 26 45 45 38 36 40 29 25 30 26 23 19 19 13 14 4 11 11 6 4 3 1 3 1 2 2 0 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 0 7 3 2 2 7 7 18 32 44 70 66 78 87 68 57 62 38 49 37 40 31 36 27 27 26 17 17 4 7 0 2 5 3 5 4 4 2 4 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 5 1 0 0 6 7 10 10 19 22 45 42 43 78 75 79 77 79 76 72 78 61 46 22 16 10 10 6 3 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 3 3 1 0 2 1 4 4 8 14 28 18 23 38 51 54 52 73 68 80 68 64 64 62 58 43 31 22 18 17 9 5 5 4 1 3 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 2 0 1 1 2 3 11 12 18 17 22 32 35 45 49 62 69 79 61 60 70 54 55 35 48 30 17 20 21 19 9 41 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 0 2 2 1 4 10 15 21 24 53 50 65 58 82 82 67 59 66 57 49 42 41 30 26 13 12 14 8 11 10 5 10 1 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 0 7 6 6 6 4 3 2 2 13 18 27 37 48 23 32 44 26 32 25 25 44 44 34 45 50 46 42 47 43 29 28 31 22 17 21 19 13 10 8 1 7 5 2 2 0 2 1 0 1 0 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 5 3 1 0 5 9 14 15 32 38 42 48 61 61 52 53 50 53 59 65 66 62 51 25 30 14 11 16 11 7 7 3 4 3 1 4 3 3 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 4 2 1 1 2 2 4 4 8 17 25 33 24 54 58 61 61 79 89 71 87 63 64 48 34 29 22 10 9 6 7 8 3 1 2 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 -1 -1 852  161 353 310 26 2 0 0
1986  1 1  0 0 1 -1 -1 583  29 257 254 42 1 0 0
1987  1 1  0 0 1 -1 -1 762  51 107 528 68 7 1 0
1988  1 1  0 0 1 -1 -1 737  36 214 300 171 14 2 0
1989  1 1  0 0 1 -1 -1 692  155 139 302 64 30 1 1
1990  1 1  0 0 1 -1 -1 684  408 186 62 23 5 0 0
1991  1 1  0 0 1 -1 -1 777  111 521 139 4 1 1 0
1992  1 1  0 0 1 -1 -1 568  12 132 417 7 0 0 0
1993  1 1  0 0 1 -1 -1 548  69 57 301 119 2 0 0
1994  1 1  0 0 1 -1 -1 526  59 277 111 62 17 0 0
1995  1 1  0 0 1 -1 -1 500  12 161 300 18 8 1 0
1996  1 1  0 0 1 -1 -1 463  162 29 199 69 1 3 0
1997  1 1  0 0 1 -1 -1 454  215 206 13 13 6 0 1
1998  1 1  0 0 1 -1 -1 459  89 251 117 1 1 0 0
1999  1 1  0 0 1 -1 -1 428  11 172 230 15 0 0 0
2000  1 1  0 0 1 -1 -1 366  37 38 248 41 2 0 0
2001  1 1  0 0 1 -1 -1 501  119 180 96 89 17 0 0
2002  1 1  0 0 1 -1 -1 439  10 252 156 18 3 0 0
2003  1 1  0 0 1 -1 -1 402  124 23 228 26 0 0 1
2004  1 1  0 0 1 -1 -1 459  312 130 6 11 0 0 0
2005  1 1  0 0 1 -1 -1 394  69 288 37 0 0 0 0
2006  1 1  0 0 1 -1 -1 421  35 117 267 2 0 0 0
2007  1 1  0 0 1 -1 -1 532  73 186 224 49 0 0 0
2008  1 1  0 0 1 -1 -1 445  13 211 197 22 2 0 0
2009  1 1  0 0 1 -1 -1 402  85 43 239 29 5 1 0
2010  1 1  0 0 1 -1 -1 442  187 210 24 19 2 0 0
2011  1 1  0 0 1 -1 -1 434  92 241 100 1 0 0 0
2012  1 1  0 0 1 -1 -1 370  36 138 190 6 0 0 0
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

