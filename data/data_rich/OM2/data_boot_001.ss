#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Jul 29 11:59:22 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659110362 first rand#: -0.301169
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
-999 1 1 316758 0.05
1985 1 1 194231 0.05
1986 1 1 186576 0.05
1987 1 1 92715.4 0.05
1988 1 1 24889.6 0.05
1989 1 1 48673.4 0.05
1990 1 1 65358.7 0.05
1991 1 1 78383.8 0.05
1992 1 1 131812 0.05
1993 1 1 210700 0.05
1994 1 1 94092.8 0.05
1995 1 1 48590.3 0.05
1996 1 1 118613 0.05
1997 1 1 105181 0.05
1998 1 1 194542 0.05
1999 1 1 172767 0.05
2000 1 1 226639 0.05
2001 1 1 209612 0.05
2002 1 1 216095 0.05
2003 1 1 320220 0.05
2004 1 1 609714 0.05
2005 1 1 740277 0.05
2006 1 1 1.54833e+06 0.05
2007 1 1 794059 0.05
2008 1 1 416559 0.05
2009 1 1 522130 0.05
2010 1 1 437378 0.05
2011 1 1 408418 0.05
2012 1 1 688261 0.05
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
1990 10 2 750816 0.1 #_orig_obs: 677965 survey1
1991 10 2 3.66729e+06 0.1 #_orig_obs: 3.25479e+06 survey1
1992 10 2 3.45914e+06 0.1 #_orig_obs: 6.60786e+06 survey1
1993 10 2 2.0109e+06 0.1 #_orig_obs: 1.70994e+06 survey1
1994 10 2 1.60038e+06 0.1 #_orig_obs: 1.00865e+06 survey1
1995 10 2 1.40947e+06 0.1 #_orig_obs: 1.85517e+06 survey1
1996 10 2 704810 0.1 #_orig_obs: 1.83768e+06 survey1
1997 10 2 1.44679e+06 0.1 #_orig_obs: 1.42472e+06 survey1
1998 10 2 4.57724e+06 0.1 #_orig_obs: 1.42479e+07 survey1
1999 10 2 5.41497e+06 0.1 #_orig_obs: 6.43402e+06 survey1
2000 10 2 3.05083e+06 0.1 #_orig_obs: 2.39328e+06 survey1
2001 10 2 1.98335e+06 0.1 #_orig_obs: 1.40284e+06 survey1
2002 10 2 2.78242e+06 0.1 #_orig_obs: 1.56085e+06 survey1
2003 10 2 1.04066e+06 0.1 #_orig_obs: 1.26877e+06 survey1
2004 10 2 1.65704e+06 0.1 #_orig_obs: 1.01914e+06 survey1
2005 10 2 9.83148e+06 0.1 #_orig_obs: 5.88313e+06 survey1
2006 10 2 6.10312e+06 0.1 #_orig_obs: 8.04381e+06 survey1
2007 10 2 4.06015e+06 0.1 #_orig_obs: 3.18229e+06 survey1
2008 10 2 4.39563e+06 0.1 #_orig_obs: 3.52945e+06 survey1
2009 10 2 1.62592e+06 0.1 #_orig_obs: 2.39792e+06 survey1
2010 10 2 2.13879e+06 0.1 #_orig_obs: 2.36562e+06 survey1
2011 10 2 4.68266e+06 0.1 #_orig_obs: 9.48175e+06 survey1
2012 10 2 5.62281e+06 0.1 #_orig_obs: 5.71121e+06 survey1
1985 4 3 632521 0.1 #_orig_obs: 1.61884e+06 survey2
1986 4 3 940374 0.1 #_orig_obs: 1.46524e+06 survey2
1987 4 3 875580 0.1 #_orig_obs: 915472 survey2
1988 4 3 512398 0.1 #_orig_obs: 222973 survey2
1989 4 3 400105 0.1 #_orig_obs: 205454 survey2
1990 4 3 222395 0.1 #_orig_obs: 156818 survey2
1991 4 3 494191 0.1 #_orig_obs: 342837 survey2
1992 4 3 1.52752e+06 0.1 #_orig_obs: 2.04686e+06 survey2
1993 4 3 1.267e+06 0.1 #_orig_obs: 1.5609e+06 survey2
1994 4 3 546301 0.1 #_orig_obs: 363365 survey2
1995 4 3 620090 0.1 #_orig_obs: 572808 survey2
1996 4 3 561225 0.1 #_orig_obs: 543406 survey2
1997 4 3 230135 0.1 #_orig_obs: 331752 survey2
1998 4 3 703719 0.1 #_orig_obs: 1.63648e+06 survey2
1999 4 3 2.10144e+06 0.1 #_orig_obs: 4.12363e+06 survey2
2000 4 3 1.72122e+06 0.1 #_orig_obs: 1.70526e+06 survey2
2001 4 3 879201 0.1 #_orig_obs: 701033 survey2
2002 4 3 853840 0.1 #_orig_obs: 430437 survey2
2003 4 3 835816 0.1 #_orig_obs: 702960 survey2
2004 4 3 364821 0.1 #_orig_obs: 254914 survey2
2005 4 3 873656 0.1 #_orig_obs: 1.12405e+06 survey2
2006 4 3 2.95894e+06 0.1 #_orig_obs: 4.11092e+06 survey2
2007 4 3 1.9514e+06 0.1 #_orig_obs: 2.01791e+06 survey2
2008 4 3 1.64718e+06 0.1 #_orig_obs: 1.30826e+06 survey2
2009 4 3 1.5394e+06 0.1 #_orig_obs: 1.66939e+06 survey2
2010 4 3 511658 0.1 #_orig_obs: 469887 survey2
2011 4 3 874538 0.1 #_orig_obs: 1.63082e+06 survey2
2012 4 3 2.13409e+06 0.1 #_orig_obs: 2.72819e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 0 1 1 0 3 2 2 3 2 2 8 10 6 3 11 8 9 2 4 6 3 3 3 1 1 6 2 3 1 4 1 1 0 2 1 0 0 1 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 0 0 2 2 3 2 2 4 2 7 5 1 2 2 0 4 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 1 2 6 7 9 6 9 13 13 5 4 6 5 3 25 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12 5 3 3 4 0 5 5 8 9 7 8 1 8 7 6 3 4 5 0 3 4 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 4 7 6 3 3 4 3 3 1 2 3 2 1 0 0 1 3 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 0 0 1 2 1 5 6 6 6 12 14 15 10 16 22 16 15 15 9 10 10 6 8 10 46 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 0 1 0 2 0 4 0 1 2 3 6 5 8 10 5 11 6 10 15 6 16 11 8 8 6 6 7 4 4 3 4 3 3 3 3 1 2 3 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 0 0 3 2 2 4 3 5 3 7 12 8 13 8 9 6 3 8 2 2 4 0 1 1 0 1 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 0 0 0 0 0 0 11 7 9 9 11 17 17 18 14 13 15 7 8 3 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 0 4 4 5 9 8 21 22 36 34 27 58 42 34 36 19 28 108 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 1 1 0 2 5 6 7 12 11 16 26 25 33 27 40 24 28 34 27 23 21 19 21 11 9 5 9 7 3 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 0 2 1 3 4 2 4 4 2 8 9 18 20 18 14 15 17 15 11 8 8 5 10 9 9 13 3 7 6 5 3 4 5 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 1 2 2 6 3 15 18 29 33 33 37 50 43 45 40 43 30 23 22 16 13 15 83 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 1 0 2 2 1 1 3 3 3 3 4 4 2 7 3 2 0 1 2 0 0 1 2 1 1 0 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 0 5 2 10 7 11 14 6 10 15 10 27 20 28 30 20 9 17 9 7 5 3 1 5 1 4 2 1 2 2 2 1 0 1 1 0 0 4 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 0 1 0 2 7 10 8 16 29 48 59 52 77 97 69 72 55 42 33 26 11 12 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 0 14 12 8 13 20 27 26 29 14 23 24 21 16 13 14 10 15 13 3 5 2 5 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 1 1 3 2 1 4 4 10 16 15 23 25 45 37 38 40 51 33 35 28 23 25 20 13 17 12 9 4 7 2 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 16 9 13 17 23 30 28 28 22 24 25 16 14 10 15 10 9 7 7 3 4 2 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 1 0 0 0 1 0 1 2 2 3 3 1 1 4 3 5 9 10 10 8 6 13 10 5 7 12 8 4 6 3 7 1 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 1 0 1 0 1 2 2 5 6 8 7 11 16 18 13 9 12 14 10 7 7 3 1 1 2 2 2 0 0 3 1 1 1 3 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 2 1 1 3 6 3 6 13 24 29 44 74 87 72 87 83 72 57 59 40 24 22 17 16 8 7 6 5 6 4 3 2 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 4 1 3 3 15 11 22 23 28 27 37 41 30 26 37 24 28 23 12 20 14 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 4 0 0 0 1 1 7 7 9 16 21 23 33 48 54 50 61 71 66 79 84 63 59 59 34 34 30 9 21 12 9 6 3 5 4 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 8 10 6 11 23 26 29 46 42 47 67 59 70 79 55 80 59 47 48 38 35 27 26 14 9 13 6 2 6 2 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 9 7 7 16 20 13 42 45 48 63 51 54 72 85 69 66 59 46 43 39 33 20 25 19 13 9 4 4 2 6 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 1 0 0 0 0 0 1 4 6 9 3 16 18 16 24 37 40 65 48 44 79 66 49 68 54 49 48 43 45 39 24 15 25 17 11 10 5 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 3 0 1 0 0 3 2 4 7 10 12 15 29 24 39 31 28 55 43 62 68 52 54 50 52 51 44 37 32 39 17 35 21 16 16 15 33 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 0 6 10 11 1 1 1 3 7 7 9 9 13 27 22 31 24 35 23 46 46 43 37 53 33 44 38 47 44 34 38 37 26 22 28 29 23 12 21 16 12 8 6 4 4 2 1 3 0 1 0 0 2 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 0 4 1 2 1 7 2 8 13 41 31 52 73 64 55 61 46 50 51 45 45 47 60 34 41 25 23 14 12 8 15 9 4 7 7 10 8 9 1 3 2 5 1 2 0 1 0 0 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 4 4 7 16 19 24 30 46 48 58 71 93 88 96 78 66 71 51 29 27 14 13 16 8 7 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 2 0 0 1 1 0 2 2 5 6 7 8 14 32 28 35 45 54 63 72 77 59 69 65 77 48 44 41 33 31 16 11 13 8 10 4 5 5 2 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 2 3 1 0 0 4 2 4 12 15 18 12 21 17 29 23 37 43 46 42 55 56 53 52 48 48 55 46 52 34 35 38 22 20 14 10 10 7 3 5 1 3 2 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 0 0 0 0 1 0 1 4 3 6 12 9 21 41 35 33 58 51 61 52 67 77 62 53 35 36 37 31 35 30 18 24 12 20 11 13 8 9 5 3 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 1 1 2 0 2 1 0 0 0 1 1 8 11 8 20 23 31 41 56 57 51 69 66 64 56 52 50 44 39 37 32 24 33 24 13 16 9 12 8 5 4 10 5 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 1 6 5 10 5 5 1 3 8 15 25 35 38 40 35 32 31 28 25 14 38 21 25 41 46 38 45 37 38 48 33 35 25 22 22 22 20 19 12 13 7 5 5 7 4 4 2 4 0 0 0 0 0 0 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 0 5 4 2 4 5 9 19 24 35 38 51 48 59 56 57 60 60 72 58 51 57 44 31 27 22 17 14 20 7 10 6 3 6 4 3 0 4 1 1 2 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 2 5 8 5 19 26 31 31 35 51 65 77 87 69 96 69 70 65 42 42 33 17 19 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 3 1 3 9 6 27 24 40 41 59 46 70 57 59 65 78 80 58 49 56 32 31 26 21 17 5 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 0 2 1 2 0 0 1 2 7 8 9 9 14 14 17 32 26 38 40 46 47 67 55 55 63 67 51 53 48 44 33 34 25 16 20 16 12 9 7 2 2 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 0 0 0 0 0 2 3 7 6 20 13 22 23 39 39 31 33 44 57 44 57 60 43 61 38 53 37 36 30 25 25 17 21 20 15 14 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 1 0 2 1 1 0 2 0 2 3 6 7 10 15 24 39 42 43 51 67 69 74 60 55 74 55 40 33 36 31 25 15 20 16 15 16 12 5 6 5 2 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 4 9 28 26 13 5 1 7 11 21 24 23 41 44 37 46 35 26 21 25 29 35 42 31 30 38 39 28 23 28 28 25 25 32 21 20 10 8 11 9 6 9 6 4 2 3 2 2 4 0 1 1 1 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 0 9 1 4 5 3 14 18 29 41 73 71 87 87 68 60 50 52 40 36 35 39 36 30 24 21 11 10 2 3 8 8 4 4 3 3 4 0 1 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 3 1 0 0 6 3 6 19 18 40 26 43 60 63 71 71 77 92 87 83 58 48 45 26 21 9 6 6 0 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 1 1 0 2 0 0 0 4 6 11 11 23 23 17 25 36 52 50 80 62 92 79 69 73 47 45 42 35 23 29 15 14 14 7 4 2 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 1 0 2 0 5 5 7 7 17 24 31 29 35 36 45 69 77 58 89 61 65 62 58 34 31 37 24 19 16 11 9 36 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 2 2 4 4 1 0 0 0 2 4 8 10 24 15 26 39 63 47 60 84 72 79 52 62 61 49 41 34 26 25 15 18 14 16 12 8 2 4 4 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 0 9 11 9 2 0 7 2 7 13 19 30 34 31 33 28 37 37 38 26 35 37 47 36 43 39 40 39 47 33 36 35 17 27 34 19 13 11 14 7 3 4 3 0 1 4 1 0 0 1 0 1 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 4 1 1 1 2 6 3 14 33 39 38 54 57 54 58 54 57 66 47 56 76 57 44 35 35 15 15 8 13 7 11 2 3 4 5 3 3 3 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 5 1 0 2 1 5 3 9 18 9 24 29 34 46 49 57 73 74 85 74 62 70 73 48 35 24 17 18 15 11 7 3 3 2 2 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 -1 -1 852  142 352 331 24 3 0 0
1986  1 1  0 0 1 -1 -1 583  22 238 287 36 0 0 0
1987  1 1  0 0 1 -1 -1 762  43 113 525 77 4 0 0
1988  1 1  0 0 1 -1 -1 737  41 208 297 168 20 3 0
1989  1 1  0 0 1 -1 -1 692  147 123 336 51 30 4 1
1990  1 1  0 0 1 -1 -1 684  409 175 70 23 7 0 0
1991  1 1  0 0 1 -1 -1 777  91 558 123 5 0 0 0
1992  1 1  0 0 1 -1 -1 568  2 154 403 9 0 0 0
1993  1 1  0 0 1 -1 -1 548  80 54 303 107 4 0 0
1994  1 1  0 0 1 -1 -1 526  65 261 112 70 18 0 0
1995  1 1  0 0 1 -1 -1 500  23 143 310 18 5 1 0
1996  1 1  0 0 1 -1 -1 463  145 26 213 77 2 0 0
1997  1 1  0 0 1 -1 -1 454  200 226 15 9 2 1 1
1998  1 1  0 0 1 -1 -1 459  101 242 114 1 1 0 0
1999  1 1  0 0 1 -1 -1 428  10 181 223 14 0 0 0
2000  1 1  0 0 1 -1 -1 366  27 36 246 54 3 0 0
2001  1 1  0 0 1 -1 -1 501  116 174 115 87 8 1 0
2002  1 1  0 0 1 -1 -1 439  10 238 165 7 16 3 0
2003  1 1  0 0 1 -1 -1 402  106 33 244 19 0 0 0
2004  1 1  0 0 1 -1 -1 459  314 132 6 7 0 0 0
2005  1 1  0 0 1 -1 -1 394  47 308 39 0 0 0 0
2006  1 1  0 0 1 -1 -1 421  36 119 262 4 0 0 0
2007  1 1  0 0 1 -1 -1 532  66 180 232 53 1 0 0
2008  1 1  0 0 1 -1 -1 445  10 199 208 24 4 0 0
2009  1 1  0 0 1 -1 -1 402  98 29 243 26 6 0 0
2010  1 1  0 0 1 -1 -1 442  197 191 40 14 0 0 0
2011  1 1  0 0 1 -1 -1 434  65 276 92 1 0 0 0
2012  1 1  0 0 1 -1 -1 370  30 154 179 7 0 0 0
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

