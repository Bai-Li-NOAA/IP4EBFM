#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Jul 29 16:15:40 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659125740 first rand#: 1.54314
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
-999 1 1 341089 0.05
1985 1 1 185794 0.05
1986 1 1 183326 0.05
1987 1 1 89749.5 0.05
1988 1 1 23425.2 0.05
1989 1 1 47469.9 0.05
1990 1 1 72341.8 0.05
1991 1 1 73043.9 0.05
1992 1 1 137081 0.05
1993 1 1 213406 0.05
1994 1 1 90272.5 0.05
1995 1 1 50899.9 0.05
1996 1 1 119149 0.05
1997 1 1 97636.7 0.05
1998 1 1 181705 0.05
1999 1 1 169330 0.05
2000 1 1 234833 0.05
2001 1 1 248778 0.05
2002 1 1 204508 0.05
2003 1 1 321827 0.05
2004 1 1 606308 0.05
2005 1 1 823525 0.05
2006 1 1 1.54074e+06 0.05
2007 1 1 865968 0.05
2008 1 1 444974 0.05
2009 1 1 524443 0.05
2010 1 1 479638 0.05
2011 1 1 411460 0.05
2012 1 1 680022 0.05
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
1990 10 2 1.00119e+06 0.1 #_orig_obs: 677965 survey1
1991 10 2 4.15183e+06 0.1 #_orig_obs: 3.25479e+06 survey1
1992 10 2 2.97502e+06 0.1 #_orig_obs: 6.60786e+06 survey1
1993 10 2 1.85814e+06 0.1 #_orig_obs: 1.70994e+06 survey1
1994 10 2 1.48064e+06 0.1 #_orig_obs: 1.00865e+06 survey1
1995 10 2 1.36368e+06 0.1 #_orig_obs: 1.85517e+06 survey1
1996 10 2 804050 0.1 #_orig_obs: 1.83768e+06 survey1
1997 10 2 1.50531e+06 0.1 #_orig_obs: 1.42472e+06 survey1
1998 10 2 4.21783e+06 0.1 #_orig_obs: 1.42479e+07 survey1
1999 10 2 4.54941e+06 0.1 #_orig_obs: 6.43402e+06 survey1
2000 10 2 3.68882e+06 0.1 #_orig_obs: 2.39328e+06 survey1
2001 10 2 1.99097e+06 0.1 #_orig_obs: 1.40284e+06 survey1
2002 10 2 2.35228e+06 0.1 #_orig_obs: 1.56085e+06 survey1
2003 10 2 984444 0.1 #_orig_obs: 1.26877e+06 survey1
2004 10 2 1.72589e+06 0.1 #_orig_obs: 1.01914e+06 survey1
2005 10 2 8.25303e+06 0.1 #_orig_obs: 5.88313e+06 survey1
2006 10 2 7.07454e+06 0.1 #_orig_obs: 8.04381e+06 survey1
2007 10 2 3.92384e+06 0.1 #_orig_obs: 3.18229e+06 survey1
2008 10 2 5.00777e+06 0.1 #_orig_obs: 3.52945e+06 survey1
2009 10 2 1.81957e+06 0.1 #_orig_obs: 2.39792e+06 survey1
2010 10 2 2.613e+06 0.1 #_orig_obs: 2.36562e+06 survey1
2011 10 2 6.77661e+06 0.1 #_orig_obs: 9.48175e+06 survey1
2012 10 2 6.2006e+06 0.1 #_orig_obs: 5.71121e+06 survey1
1985 4 3 779934 0.1 #_orig_obs: 1.61884e+06 survey2
1986 4 3 936659 0.1 #_orig_obs: 1.46524e+06 survey2
1987 4 3 901664 0.1 #_orig_obs: 915472 survey2
1988 4 3 536902 0.1 #_orig_obs: 222973 survey2
1989 4 3 480805 0.1 #_orig_obs: 205454 survey2
1990 4 3 218833 0.1 #_orig_obs: 156818 survey2
1991 4 3 393781 0.1 #_orig_obs: 342837 survey2
1992 4 3 1.51528e+06 0.1 #_orig_obs: 2.04686e+06 survey2
1993 4 3 1.15142e+06 0.1 #_orig_obs: 1.5609e+06 survey2
1994 4 3 557140 0.1 #_orig_obs: 363365 survey2
1995 4 3 803811 0.1 #_orig_obs: 572808 survey2
1996 4 3 584846 0.1 #_orig_obs: 543406 survey2
1997 4 3 261769 0.1 #_orig_obs: 331752 survey2
1998 4 3 702388 0.1 #_orig_obs: 1.63648e+06 survey2
1999 4 3 1.81331e+06 0.1 #_orig_obs: 4.12363e+06 survey2
2000 4 3 2.05211e+06 0.1 #_orig_obs: 1.70526e+06 survey2
2001 4 3 944812 0.1 #_orig_obs: 701033 survey2
2002 4 3 799639 0.1 #_orig_obs: 430437 survey2
2003 4 3 743725 0.1 #_orig_obs: 702960 survey2
2004 4 3 283601 0.1 #_orig_obs: 254914 survey2
2005 4 3 914226 0.1 #_orig_obs: 1.12405e+06 survey2
2006 4 3 2.92819e+06 0.1 #_orig_obs: 4.11092e+06 survey2
2007 4 3 2.16519e+06 0.1 #_orig_obs: 2.01791e+06 survey2
2008 4 3 1.46232e+06 0.1 #_orig_obs: 1.30826e+06 survey2
2009 4 3 1.11545e+06 0.1 #_orig_obs: 1.66939e+06 survey2
2010 4 3 455818 0.1 #_orig_obs: 469887 survey2
2011 4 3 984201 0.1 #_orig_obs: 1.63082e+06 survey2
2012 4 3 2.35701e+06 0.1 #_orig_obs: 2.72819e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 0 1 0 1 3 1 0 1 5 5 7 6 6 13 9 11 7 7 3 5 0 2 1 0 0 3 3 1 1 3 2 2 3 0 1 1 1 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 1 5 5 7 0 4 4 2 3 1 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 5 8 9 11 2 7 9 3 9 5 5 10 6 8 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 2 6 7 6 5 5 6 5 11 8 9 4 5 4 4 7 2 9 2 2 3 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 6 2 1 1 3 2 1 1 1 3 2 2 5 5 1 1 1 2 1 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 0 0 3 2 2 0 8 3 10 13 18 14 20 19 11 12 21 13 8 9 10 11 9 6 39 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 1 1 1 1 2 4 1 1 3 3 2 6 6 8 4 11 7 5 7 12 7 9 8 12 6 7 8 8 3 8 2 5 5 3 2 4 2 2 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 0 0 2 3 1 1 6 2 6 8 9 8 12 14 6 8 8 3 2 4 0 0 0 0 1 1 2 0 0 0 0 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 0 0 0 0 0 0 9 6 10 6 16 20 17 19 13 15 9 9 7 4 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 0 4 0 6 6 21 14 23 40 43 43 40 33 36 30 34 24 98 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 1 2 1 1 2 5 7 3 11 14 16 22 25 25 38 27 23 17 33 26 33 30 20 15 18 13 10 8 6 3 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 0 0 0 2 3 1 5 5 5 6 11 12 13 19 16 15 15 6 16 18 7 8 11 6 8 9 10 8 8 4 4 3 7 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 1 3 3 5 5 15 19 28 29 36 49 39 35 43 30 32 33 28 14 23 14 17 101 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 2 7 1 0 0 3 2 5 4 5 3 3 1 1 2 3 2 3 2 1 1 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 2 1 5 10 10 12 10 9 12 17 18 15 28 17 26 27 23 10 9 5 5 4 0 2 0 2 1 4 0 2 1 2 2 0 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 0 1 2 3 6 14 15 17 27 48 55 73 90 91 65 66 48 46 29 13 11 8 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 0 23 9 12 12 24 16 27 29 26 21 23 17 17 9 9 13 8 9 12 5 5 5 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 0 2 1 4 5 5 9 11 15 20 32 41 55 38 37 41 36 33 26 24 22 22 8 14 6 10 11 9 6 2 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 9 13 17 23 21 37 22 17 16 32 25 20 16 17 10 12 6 1 4 7 6 3 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 0 0 0 0 2 0 2 3 2 3 3 4 4 6 10 6 8 13 6 5 5 10 10 2 6 5 4 6 3 4 2 2 3 2 2 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 0 0 1 1 1 4 3 5 7 6 6 12 12 12 20 14 13 12 13 5 6 2 2 0 1 1 3 1 0 0 3 2 1 0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 0 2 1 1 8 7 18 21 30 53 68 77 93 71 69 92 72 43 47 28 26 11 14 5 9 10 5 2 1 1 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 5 4 5 5 6 10 31 21 35 29 35 38 34 28 39 31 17 15 13 11 18 34 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 1 0 0 0 2 3 4 13 14 14 24 26 40 48 52 56 65 68 61 83 68 60 54 45 34 32 23 21 11 11 17 16 9 7 4 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 7 7 9 23 20 30 37 39 40 62 59 86 63 71 79 63 56 51 40 28 33 21 18 11 6 9 5 4 5 5 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 0 6 3 6 15 27 31 30 39 49 52 64 100 72 81 56 70 56 42 38 27 31 18 19 11 10 10 8 9 4 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 1 0 0 1 1 1 1 1 2 7 9 10 11 24 26 30 36 44 48 55 59 69 63 66 52 73 33 48 37 45 25 23 21 24 14 15 6 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 0 0 2 0 0 0 1 2 4 2 5 10 19 24 26 20 40 35 50 53 48 59 58 57 44 55 44 47 46 36 20 26 30 24 21 15 19 18 40 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 0 9 8 11 6 0 2 1 4 5 15 7 27 33 23 28 35 30 33 31 47 51 42 41 36 22 32 53 36 36 36 46 38 24 25 22 18 25 11 14 11 8 6 4 2 1 3 1 0 1 0 0 0 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 0 2 2 0 2 5 6 11 19 23 39 54 65 71 56 50 39 49 62 56 53 52 47 31 28 35 24 16 14 10 10 9 11 5 9 9 3 5 3 2 6 3 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 1 1 2 2 10 7 19 13 20 35 33 53 74 81 77 87 64 98 53 74 47 49 29 19 14 10 4 6 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 0 1 1 5 10 4 9 11 25 27 41 60 57 82 57 64 73 68 65 61 59 36 37 35 28 27 14 12 14 3 7 2 2 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 3 1 1 1 3 2 2 3 8 16 14 19 15 23 21 25 25 36 41 54 49 44 51 62 65 53 48 52 39 48 22 23 29 26 11 15 17 11 8 3 2 4 5 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 0 0 0 0 0 1 1 3 4 8 13 25 21 28 38 36 52 51 65 59 72 58 52 50 49 37 36 36 29 26 24 17 17 17 13 13 12 13 8 2 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 0 0 6 2 2 0 1 1 0 1 5 4 10 15 22 22 27 44 53 65 63 60 66 60 56 57 32 37 38 43 29 23 32 22 13 12 22 5 10 10 7 10 3 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 3 4 10 15 4 2 1 5 8 18 33 24 33 36 38 29 37 23 30 23 37 23 35 30 36 36 46 49 35 35 32 31 27 18 25 31 19 14 15 16 4 7 2 9 4 5 2 1 0 0 0 0 0 0 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 0 5 4 5 3 3 4 17 18 25 36 62 49 52 57 65 56 60 62 78 49 56 43 38 33 27 12 10 10 9 6 9 3 9 5 5 6 4 2 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 2 0 0 0 3 2 7 16 14 25 26 36 43 63 72 67 75 81 86 60 59 76 45 39 34 20 14 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 5 2 5 9 12 19 20 32 40 52 63 65 73 69 67 71 68 55 50 45 38 33 25 18 13 14 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 0 2 2 2 1 0 0 3 5 6 5 10 10 16 17 12 24 30 32 48 45 38 60 58 53 75 55 47 53 38 47 40 32 30 18 21 19 20 4 9 6 3 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 0 0 1 1 2 0 2 2 4 10 15 27 29 26 35 31 49 40 60 56 61 57 58 50 29 41 29 35 36 27 31 29 19 18 17 16 57 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 2 1 3 3 0 0 1 1 3 5 6 14 11 21 30 54 45 66 63 74 72 74 56 63 61 43 29 22 30 18 20 22 14 15 10 9 5 5 8 5 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 8 16 32 25 14 5 2 4 12 13 18 28 29 41 40 34 37 21 28 24 32 30 28 31 29 45 36 26 36 36 25 22 30 25 26 17 19 24 11 12 10 3 4 3 1 0 2 1 0 0 1 1 2 1 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 0 5 5 3 1 3 6 21 26 55 58 64 65 88 74 66 45 54 49 45 51 33 32 37 23 18 11 16 5 6 6 7 1 1 3 1 0 4 2 2 1 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 2 0 3 2 4 6 8 15 19 23 33 55 56 66 71 83 104 79 74 89 60 44 35 21 16 13 2 8 3 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 0 1 1 0 0 1 5 2 5 17 21 17 29 38 40 54 59 65 70 67 80 64 69 62 43 35 37 34 12 15 15 10 8 6 7 4 4 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 1 0 0 0 2 2 8 15 24 15 23 36 43 40 62 55 55 64 67 64 63 58 48 56 41 34 13 34 15 13 16 33 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 0 2 2 2 2 0 1 0 5 3 5 18 19 26 43 41 57 46 74 83 67 62 59 63 53 44 33 32 31 26 15 13 22 9 9 8 4 6 6 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 0 5 8 9 4 3 2 3 5 22 22 24 37 35 30 33 48 31 31 26 33 41 39 42 56 41 34 36 48 42 27 19 20 23 25 21 16 13 11 7 7 6 5 4 1 2 1 0 2 0 0 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 7 1 3 1 4 3 10 21 24 28 43 53 45 59 60 68 64 58 67 57 50 57 55 29 28 20 6 6 12 4 10 2 9 7 6 3 3 3 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 1 0 0 1 0 2 2 6 8 16 29 35 30 36 52 45 69 76 78 77 80 71 73 48 42 33 19 16 15 4 6 6 4 4 2 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 -1 -1 852  144 341 341 24 2 0 0
1986  1 1  0 0 1 -1 -1 583  31 247 275 28 1 1 0
1987  1 1  0 0 1 -1 -1 762  45 125 528 55 9 0 0
1988  1 1  0 0 1 -1 -1 737  51 216 261 195 13 1 0
1989  1 1  0 0 1 -1 -1 692  131 136 333 58 33 1 0
1990  1 1  0 0 1 -1 -1 684  430 164 62 25 3 0 0
1991  1 1  0 0 1 -1 -1 777  101 543 130 3 0 0 0
1992  1 1  0 0 1 -1 -1 568  13 169 378 8 0 0 0
1993  1 1  0 0 1 -1 -1 548  65 61 291 126 5 0 0
1994  1 1  0 0 1 -1 -1 526  80 264 106 52 24 0 0
1995  1 1  0 0 1 -1 -1 500  10 148 314 16 9 3 0
1996  1 1  0 0 1 -1 -1 463  158 37 214 53 1 0 0
1997  1 1  0 0 1 -1 -1 454  241 181 22 7 3 0 0
1998  1 1  0 0 1 -1 -1 459  89 271 98 1 0 0 0
1999  1 1  0 0 1 -1 -1 428  9 178 230 11 0 0 0
2000  1 1  0 0 1 -1 -1 366  25 42 256 41 2 0 0
2001  1 1  0 0 1 -1 -1 501  126 175 86 92 21 1 0
2002  1 1  0 0 1 -1 -1 439  8 237 166 20 6 2 0
2003  1 1  0 0 1 -1 -1 402  110 27 238 22 2 3 0
2004  1 1  0 0 1 -1 -1 459  296 143 10 8 2 0 0
2005  1 1  0 0 1 -1 -1 394  48 311 35 0 0 0 0
2006  1 1  0 0 1 -1 -1 421  37 118 266 0 0 0 0
2007  1 1  0 0 1 -1 -1 532  72 186 222 52 0 0 0
2008  1 1  0 0 1 -1 -1 445  13 185 223 23 1 0 0
2009  1 1  0 0 1 -1 -1 402  82 27 256 35 2 0 0
2010  1 1  0 0 1 -1 -1 442  216 178 28 14 6 0 0
2011  1 1  0 0 1 -1 -1 434  78 248 106 1 1 0 0
2012  1 1  0 0 1 -1 -1 370  26 132 202 10 0 0 0
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

