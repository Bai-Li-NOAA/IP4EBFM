#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Jul 12 09:05:55 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1657631155 first rand#: -0.617562
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
-999 1 1 515760 0.05
1985 1 1 323992 0.05
1986 1 1 297399 0.05
1987 1 1 180852 0.05
1988 1 1 54963 0.05
1989 1 1 114582 0.05
1990 1 1 165474 0.05
1991 1 1 212911 0.05
1992 1 1 348333 0.05
1993 1 1 509971 0.05
1994 1 1 230744 0.05
1995 1 1 160317 0.05
1996 1 1 322803 0.05
1997 1 1 253798 0.05
1998 1 1 582210 0.05
1999 1 1 410936 0.05
2000 1 1 269471 0.05
2001 1 1 222656 0.05
2002 1 1 236842 0.05
2003 1 1 313005 0.05
2004 1 1 479727 0.05
2005 1 1 527472 0.05
2006 1 1 1.13331e+06 0.05
2007 1 1 720780 0.05
2008 1 1 366985 0.05
2009 1 1 377619 0.05
2010 1 1 288944 0.05
2011 1 1 298473 0.05
2012 1 1 561076 0.05
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
1990 10 2 997640 0.1 #_orig_obs: 620583 survey1
1991 10 2 3.89103e+06 0.1 #_orig_obs: 2.25444e+06 survey1
1992 10 2 2.75541e+06 0.1 #_orig_obs: 3.93978e+06 survey1
1993 10 2 952835 0.1 #_orig_obs: 800501 survey1
1994 10 2 1.48147e+06 0.1 #_orig_obs: 563145 survey1
1995 10 2 1.37188e+06 0.1 #_orig_obs: 1.37751e+06 survey1
1996 10 2 399041 0.1 #_orig_obs: 615720 survey1
1997 10 2 1.22214e+06 0.1 #_orig_obs: 779499 survey1
1998 10 2 3.3557e+06 0.1 #_orig_obs: 5.1232e+06 survey1
1999 10 2 2.0508e+06 0.1 #_orig_obs: 1.93078e+06 survey1
2000 10 2 1.0678e+06 0.1 #_orig_obs: 1.15403e+06 survey1
2001 10 2 1.19625e+06 0.1 #_orig_obs: 787517 survey1
2002 10 2 2.0665e+06 0.1 #_orig_obs: 2.80103e+06 survey1
2003 10 2 975790 0.1 #_orig_obs: 1.36701e+06 survey1
2004 10 2 880056 0.1 #_orig_obs: 1.0018e+06 survey1
2005 10 2 4.99305e+06 0.1 #_orig_obs: 7.04252e+06 survey1
2006 10 2 4.18332e+06 0.1 #_orig_obs: 9.45764e+06 survey1
2007 10 2 3.45389e+06 0.1 #_orig_obs: 3.77389e+06 survey1
2008 10 2 4.11566e+06 0.1 #_orig_obs: 4.90291e+06 survey1
2009 10 2 1.60318e+06 0.1 #_orig_obs: 2.17647e+06 survey1
2010 10 2 2.90341e+06 0.1 #_orig_obs: 1.76555e+06 survey1
2011 10 2 1.02177e+07 0.1 #_orig_obs: 1.07738e+07 survey1
2012 10 2 9.7007e+06 0.1 #_orig_obs: 6.84971e+06 survey1
1985 4 3 578453 0.1 #_orig_obs: 1.50791e+06 survey2
1986 4 3 723100 0.1 #_orig_obs: 1.50531e+06 survey2
1987 4 3 699941 0.1 #_orig_obs: 598400 survey2
1988 4 3 411114 0.1 #_orig_obs: 152326 survey2
1989 4 3 386973 0.1 #_orig_obs: 172805 survey2
1990 4 3 282121 0.1 #_orig_obs: 114774 survey2
1991 4 3 455155 0.1 #_orig_obs: 368602 survey2
1992 4 3 1.31782e+06 0.1 #_orig_obs: 1.43515e+06 survey2
1993 4 3 653306 0.1 #_orig_obs: 586460 survey2
1994 4 3 352928 0.1 #_orig_obs: 222666 survey2
1995 4 3 530342 0.1 #_orig_obs: 451631 survey2
1996 4 3 325326 0.1 #_orig_obs: 469418 survey2
1997 4 3 172704 0.1 #_orig_obs: 209121 survey2
1998 4 3 600986 0.1 #_orig_obs: 706947 survey2
1999 4 3 969449 0.1 #_orig_obs: 1.84632e+06 survey2
2000 4 3 730289 0.1 #_orig_obs: 743953 survey2
2001 4 3 321165 0.1 #_orig_obs: 214779 survey2
2002 4 3 500867 0.1 #_orig_obs: 388707 survey2
2003 4 3 777547 0.1 #_orig_obs: 759560 survey2
2004 4 3 321999 0.1 #_orig_obs: 244046 survey2
2005 4 3 532479 0.1 #_orig_obs: 752300 survey2
2006 4 3 1.98229e+06 0.1 #_orig_obs: 4.13359e+06 survey2
2007 4 3 1.57157e+06 0.1 #_orig_obs: 2.61824e+06 survey2
2008 4 3 1.29649e+06 0.1 #_orig_obs: 1.74936e+06 survey2
2009 4 3 1.49004e+06 0.1 #_orig_obs: 1.52436e+06 survey2
2010 4 3 779616 0.1 #_orig_obs: 622555 survey2
2011 4 3 1.75308e+06 0.1 #_orig_obs: 1.68226e+06 survey2
2012 4 3 2.92184e+06 0.1 #_orig_obs: 3.1908e+06 survey2
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
 1990 10 2 0 0 118  0 0 0 0 0 0 0 1 2 2 1 3 2 2 4 3 5 10 7 9 6 10 12 5 6 6 3 4 1 0 0 2 3 1 1 2 0 0 1 0 1 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1991 10 2 0 0 40  0 0 0 0 0 0 0 0 0 0 0 3 0 1 1 0 1 5 2 3 6 3 2 0 2 5 2 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1992 10 2 0 0 122  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 13 4 4 11 3 11 15 8 2 9 9 3 7 2 4 4 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 10 2 0 0 119  0 0 0 0 0 0 0 0 0 1 2 0 1 1 2 2 5 2 7 2 8 6 5 5 3 8 7 3 6 3 5 5 5 2 7 4 5 1 3 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1994 10 2 0 0 53  0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 2 1 1 8 3 8 4 4 3 1 2 1 2 2 1 0 1 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1995 10 2 0 0 261  0 0 0 0 0 0 0 0 0 0 0 3 2 3 6 4 12 11 13 21 22 23 20 20 14 13 14 11 4 4 13 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 10 2 0 0 192  0 0 0 0 0 0 0 1 0 6 2 5 5 4 5 5 1 2 5 5 12 10 10 7 9 6 6 9 8 7 9 3 9 5 8 4 1 7 1 3 2 6 0 2 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 10 2 0 0 110  0 0 0 0 0 0 0 0 0 2 1 4 4 2 5 4 7 8 10 11 7 8 10 5 3 3 4 2 3 0 1 2 2 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1998 10 2 0 0 176  0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 10 8 11 16 17 10 21 16 9 10 10 9 5 1 2 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 10 2 0 0 495  0 0 0 0 0 0 0 0 0 0 0 2 2 8 5 18 17 28 27 44 37 36 33 34 36 30 17 25 17 21 12 46 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 10 2 0 0 464  0 0 0 0 0 0 0 0 0 4 0 2 2 7 5 9 3 9 9 12 26 24 22 16 15 30 29 31 35 24 28 24 9 14 28 14 7 10 4 1 0 5 4 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 10 2 0 0 268  0 0 0 0 0 0 1 1 4 1 4 5 5 9 4 9 10 9 9 17 25 23 18 11 15 13 8 14 5 2 3 3 1 8 2 3 3 3 3 7 2 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2002 10 2 0 0 602  0 0 0 0 0 0 0 0 1 2 3 5 6 13 11 24 35 61 32 49 58 61 49 43 34 23 18 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 10 2 0 0 56  0 0 0 0 0 0 0 0 0 2 0 0 1 0 0 1 1 0 2 3 0 2 2 2 1 1 5 4 4 4 8 2 1 4 1 1 0 1 0 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 10 2 0 0 294  0 0 0 0 0 0 3 1 8 6 13 8 13 10 9 14 15 9 19 18 23 20 15 16 11 8 4 8 5 4 5 3 6 2 0 3 4 3 2 0 1 2 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
 2005 10 2 0 0 740  0 0 0 0 0 0 0 1 2 6 8 7 12 11 36 27 43 56 63 80 69 72 67 49 48 19 19 11 34 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2006 10 2 0 0 335  0 0 0 0 0 0 0 0 0 0 0 0 0 22 10 14 17 15 28 22 24 22 21 24 23 26 14 12 12 7 3 5 3 3 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 10 2 0 0 553  0 0 0 0 0 0 1 3 1 3 3 7 3 10 9 16 25 33 36 39 34 44 33 25 32 30 23 16 24 12 16 17 13 9 36 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 10 2 0 0 344  0 0 0 0 0 0 0 0 0 0 0 0 0 15 5 14 11 26 27 24 29 25 18 24 15 20 11 11 9 9 6 8 5 5 27 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 10 2 0 0 149  0 0 0 0 0 0 0 0 0 1 1 3 1 1 2 4 2 0 3 5 6 5 7 6 9 8 4 9 9 6 12 5 5 8 11 5 5 2 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 10 2 0 0 172  0 0 0 0 0 0 0 0 0 3 0 5 3 4 4 4 7 11 6 13 16 19 18 17 9 2 5 2 3 3 4 0 4 1 2 1 1 1 1 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2011 10 2 0 0 889  0 0 0 0 0 0 1 2 1 1 10 9 16 15 34 33 38 65 73 69 70 79 77 58 58 49 36 19 17 10 10 7 6 5 5 4 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 10 2 0 0 464  0 0 0 0 0 0 0 0 0 2 2 2 2 11 8 17 18 23 41 38 40 36 31 25 34 26 18 14 17 59 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1985 4 3 0 0 1000  0 0 0 0 3 4 2 0 2 6 4 6 11 21 24 28 42 36 43 49 64 57 80 69 51 66 57 62 53 37 25 19 14 8 8 11 4 10 4 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1986 4 3 0 0 1000  0 0 0 0 0 0 0 0 0 0 8 15 13 6 17 29 27 40 37 56 51 70 53 66 65 57 64 72 48 45 32 27 21 21 13 10 6 6 4 5 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1987 4 3 0 0 1000  0 0 0 0 0 0 1 0 1 2 2 3 4 7 6 16 19 22 36 34 62 56 66 56 70 72 78 56 59 45 45 35 21 26 20 15 13 14 10 8 7 4 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1988 4 3 0 0 1000  0 0 0 0 3 0 0 1 0 1 1 7 5 13 14 17 22 21 22 25 31 34 46 36 62 52 62 59 65 59 60 55 42 34 24 34 21 15 11 13 10 5 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1989 4 3 0 0 1000  0 0 0 1 3 2 1 0 1 0 1 2 8 7 5 16 19 26 24 30 36 53 56 46 56 56 55 46 53 50 42 38 33 38 33 25 21 22 16 18 15 46 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1990 4 3 0 0 1000  0 0 0 8 13 13 7 0 2 0 7 14 9 13 20 27 42 26 30 33 37 42 38 35 41 44 46 46 34 45 44 33 31 34 24 20 28 16 20 9 13 10 8 8 9 6 1 4 3 2 2 1 2 0 0 0 0 0 0 0
 1991 4 3 0 0 1000  0 0 0 0 4 4 2 2 3 8 16 21 20 45 40 51 58 57 45 53 46 47 45 44 41 52 41 40 30 26 24 23 19 12 7 11 8 6 7 9 4 5 4 5 4 4 4 1 0 2 0 0 0 0 0 0 0 0 0 0
 1992 4 3 0 0 1000  0 0 0 0 0 0 0 1 0 2 1 3 4 12 14 18 28 41 53 48 57 72 89 82 78 76 78 59 39 41 31 16 14 10 6 3 24 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1993 4 3 0 0 1000  0 0 0 1 4 2 0 0 0 1 3 2 2 2 10 14 25 14 27 29 34 56 55 60 66 55 80 78 59 56 44 34 44 23 33 30 12 10 8 9 7 3 4 1 1 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0
 1994 4 3 0 0 1000  0 0 0 0 5 2 3 1 1 3 7 10 12 22 38 31 30 27 38 40 32 31 45 43 37 43 52 38 57 31 33 35 29 41 33 23 29 19 19 12 13 9 6 3 6 1 4 2 1 0 3 0 0 0 0 0 0 0 0 0
 1995 4 3 0 0 1000  0 0 0 0 0 1 0 2 0 1 2 4 5 14 16 22 21 29 45 54 63 59 62 75 78 56 60 69 56 41 30 17 7 17 7 12 11 7 12 11 4 30 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1996 4 3 0 0 1000  0 0 1 5 2 5 1 1 1 0 1 1 0 1 6 8 19 22 23 35 38 55 74 65 73 78 60 50 56 60 35 38 34 24 26 16 7 19 14 16 6 7 4 7 2 1 3 0 0 0 0 0 0 0 0 0 0 0 0 0
 1997 4 3 0 0 1000  0 0 2 3 14 13 10 7 4 4 11 25 36 46 47 59 55 43 51 42 23 24 32 23 26 25 28 23 35 24 31 28 28 18 28 19 19 18 11 12 9 12 9 2 10 2 4 1 1 0 0 0 1 1 0 1 0 0 0 0
 1998 4 3 0 0 1000  0 0 0 0 0 7 1 1 2 10 11 27 28 30 42 58 61 56 53 34 63 63 67 52 53 53 43 44 29 22 20 11 13 11 5 5 2 2 1 2 1 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 1999 4 3 0 0 1000  0 0 0 0 0 0 0 0 2 2 4 6 9 11 15 22 34 37 39 56 57 72 85 78 68 68 89 59 49 30 28 25 18 9 7 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2000 4 3 0 0 1000  0 0 0 0 1 0 0 0 0 1 1 2 4 3 6 15 19 24 35 33 44 57 73 60 75 72 64 58 58 59 37 43 31 33 20 17 15 12 7 3 4 5 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2001 4 3 0 0 1000  0 0 1 3 6 8 3 0 2 1 4 6 7 11 18 28 21 25 29 27 34 27 32 35 49 49 39 49 35 57 50 42 46 38 41 31 27 29 14 21 13 14 14 5 1 2 2 1 3 0 0 0 0 0 0 0 0 0 0 0
 2002 4 3 0 0 1000  0 0 0 1 0 0 1 4 2 7 2 8 26 24 36 38 56 45 49 54 52 46 48 38 47 54 46 39 37 31 26 38 22 21 9 16 15 9 14 39 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2003 4 3 0 0 1000  0 0 0 0 3 0 1 0 0 1 1 4 4 5 9 21 17 24 26 46 63 64 74 84 99 80 81 46 50 41 31 27 29 13 9 11 3 5 3 5 6 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2004 4 3 0 0 1000  0 0 4 10 17 12 8 2 3 3 3 8 5 18 13 21 17 33 26 13 29 38 30 33 47 41 48 46 50 43 48 45 53 33 31 30 26 27 17 14 10 9 11 5 5 8 1 1 0 2 1 2 0 0 0 0 0 0 0 0
 2005 4 3 0 0 1000  0 0 0 4 5 10 4 2 4 12 18 29 31 50 64 71 74 69 70 48 61 47 42 28 36 36 31 28 24 17 17 6 11 3 8 8 2 3 5 1 3 6 3 0 4 1 2 1 0 1 0 0 0 0 0 0 0 0 0 0
 2006 4 3 0 0 1000  0 0 0 0 0 0 3 1 1 2 5 10 17 16 23 39 30 33 51 45 61 60 70 78 65 79 74 54 50 39 29 21 10 11 5 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2007 4 3 0 0 1000  0 0 0 0 3 4 1 0 0 0 3 4 12 12 15 16 29 32 40 43 46 66 70 64 74 62 60 74 52 35 37 35 28 18 14 15 6 8 5 6 1 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2008 4 3 0 0 1000  0 0 0 0 0 0 1 0 2 1 6 8 6 18 16 22 22 34 33 47 48 67 50 57 70 55 57 57 53 51 44 38 24 23 20 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2009 4 3 0 0 1000  0 0 0 2 0 1 0 0 0 1 1 2 0 4 10 10 15 16 35 37 43 44 56 65 79 56 69 73 60 56 48 32 37 32 21 24 15 15 8 8 6 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2010 4 3 0 0 1000  0 0 0 7 9 13 4 0 1 3 6 4 12 19 31 22 31 29 24 34 29 20 25 31 33 33 27 51 38 60 55 41 36 46 43 31 27 21 18 11 22 15 9 9 5 2 5 4 2 1 0 0 1 0 0 0 0 0 0 0
 2011 4 3 0 0 1000  0 0 0 0 9 4 0 1 2 6 8 14 25 28 46 44 53 62 56 45 51 51 48 55 64 53 46 33 39 32 21 16 11 14 8 8 10 10 0 3 5 1 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 2012 4 3 0 0 1000  0 0 0 0 2 1 2 1 2 1 3 11 13 10 16 20 44 42 41 56 54 63 62 70 75 79 68 65 48 27 30 20 23 7 12 5 3 4 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
1985  1 1  0 0 1 1 -1 852  172 342 312 24 1 1 0
1986  1 1  0 0 1 1 -1 583  37 249 273 24 0 0 0
1987  1 1  0 0 1 1 -1 762  68 140 481 63 9 1 0
1988  1 1  0 0 1 1 -1 737  68 285 244 134 6 0 0
1989  1 1  0 0 1 1 -1 692  141 173 326 40 10 2 0
1990  1 1  0 0 1 1 -1 684  361 225 75 23 0 0 0
1991  1 1  0 0 1 1 -1 777  107 536 129 5 0 0 0
1992  1 1  0 0 1 1 -1 568  17 172 370 9 0 0 0
1993  1 1  0 0 1 1 -1 548  144 64 250 86 4 0 0
1994  1 1  0 0 1 1 -1 526  84 333 71 25 13 0 0
1995  1 1  0 0 1 1 -1 500  5 187 304 4 0 0 0
1996  1 1  0 0 1 1 -1 463  166 29 206 60 2 0 0
1997  1 1  0 0 1 1 -1 454  224 207 15 5 3 0 0
1998  1 1  0 0 1 1 -1 459  74 298 85 2 0 0 0
1999  1 1  0 0 1 1 -1 428  6 130 281 11 0 0 0
2000  1 1  0 0 1 1 -1 366  56 22 227 60 1 0 0
2001  1 1  0 0 1 1 -1 501  234 181 48 36 2 0 0
2002  1 1  0 0 1 1 -1 439  15 301 122 1 0 0 0
2003  1 1  0 0 1 1 -1 402  51 29 308 13 1 0 0
2004  1 1  0 0 1 1 -1 459  310 111 20 18 0 0 0
2005  1 1  0 0 1 1 -1 394  94 279 20 1 0 0 0
2006  1 1  0 0 1 1 -1 421  56 150 213 2 0 0 0
2007  1 1  0 0 1 1 -1 532  87 163 245 37 0 0 0
2008  1 1  0 0 1 1 -1 445  5 202 203 30 5 0 0
2009  1 1  0 0 1 1 -1 402  83 25 254 35 5 0 0
2010  1 1  0 0 1 1 -1 442  232 160 21 29 0 0 0
2011  1 1  0 0 1 1 -1 434  99 242 92 0 1 0 0
2012  1 1  0 0 1 1 -1 370  26 137 197 10 0 0 0
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

