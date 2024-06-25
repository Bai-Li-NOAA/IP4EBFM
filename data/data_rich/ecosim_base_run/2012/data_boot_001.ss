#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Jun 20 10:45:43 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1718894743 first rand#: -0.358364
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
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
-999 1 1 107607 0.05
1985 1 1 17096.6 0.05
1986 1 1 16707.5 0.05
1987 1 1 16506 0.05
1988 1 1 12632.8 0.05
1989 1 1 24793.8 0.05
1990 1 1 304725 0.05
1991 1 1 255009 0.05
1992 1 1 346243 0.05
1993 1 1 602858 0.05
1994 1 1 696569 0.05
1995 1 1 554188 0.05
1996 1 1 877660 0.05
1997 1 1 816595 0.05
1998 1 1 809649 0.05
1999 1 1 930042 0.05
2000 1 1 922747 0.05
2001 1 1 889854 0.05
2002 1 1 935830 0.05
2003 1 1 423468 0.05
2004 1 1 299967 0.05
2005 1 1 70532.6 0.05
2006 1 1 63026.8 0.05
2007 1 1 35912.1 0.05
2008 1 1 41242.2 0.05
2009 1 1 36803.5 0.05
2010 1 1 41136.9 0.05
2011 1 1 46691 0.05
2012 1 1 96636.5 0.05
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
1990 10 2 5.27271e+06 0.1 #_orig_obs: 4.80559e+06 survey1
1991 10 2 5.22801e+06 0.1 #_orig_obs: 4.48145e+06 survey1
1992 10 2 5.94142e+06 0.1 #_orig_obs: 3.71027e+06 survey1
1993 10 2 4.87893e+06 0.1 #_orig_obs: 3.99854e+06 survey1
1994 10 2 4.03162e+06 0.1 #_orig_obs: 3.71786e+06 survey1
1995 10 2 4.29295e+06 0.1 #_orig_obs: 3.64541e+06 survey1
1996 10 2 3.74255e+06 0.1 #_orig_obs: 3.00776e+06 survey1
1997 10 2 3.26434e+06 0.1 #_orig_obs: 2.8157e+06 survey1
1998 10 2 2.79647e+06 0.1 #_orig_obs: 2.91494e+06 survey1
1999 10 2 2.55393e+06 0.1 #_orig_obs: 2.35383e+06 survey1
2000 10 2 1.46247e+06 0.1 #_orig_obs: 1.26764e+06 survey1
2001 10 2 1.2412e+06 0.1 #_orig_obs: 1.16742e+06 survey1
2002 10 2 292945 0.1 #_orig_obs: 420712 survey1
2003 10 2 220366 0.1 #_orig_obs: 259467 survey1
2004 10 2 48034.2 0.1 #_orig_obs: 69499.5 survey1
2005 10 2 78713.4 0.1 #_orig_obs: 88295.7 survey1
2006 10 2 64470.2 0.1 #_orig_obs: 62110.2 survey1
2007 10 2 69098.3 0.1 #_orig_obs: 74899.2 survey1
2008 10 2 101982 0.1 #_orig_obs: 94886.5 survey1
2009 10 2 99446.1 0.1 #_orig_obs: 80962.6 survey1
2010 10 2 117948 0.1 #_orig_obs: 145920 survey1
2011 10 2 195387 0.1 #_orig_obs: 208996 survey1
2012 10 2 255437 0.1 #_orig_obs: 234805 survey1
1985 4 3 1.19158e+06 0.1 #_orig_obs: 2.24436e+06 survey2
1986 4 3 1.35213e+06 0.1 #_orig_obs: 1.82735e+06 survey2
1987 4 3 1.6146e+06 0.1 #_orig_obs: 1.92059e+06 survey2
1988 4 3 2.11063e+06 0.1 #_orig_obs: 2.54638e+06 survey2
1989 4 3 1.83198e+06 0.1 #_orig_obs: 2.18369e+06 survey2
1990 4 3 1.46204e+06 0.1 #_orig_obs: 1.80311e+06 survey2
1991 4 3 1.12323e+06 0.1 #_orig_obs: 1.5341e+06 survey2
1992 4 3 1.34266e+06 0.1 #_orig_obs: 1.83772e+06 survey2
1993 4 3 1.33709e+06 0.1 #_orig_obs: 1.8809e+06 survey2
1994 4 3 1.32619e+06 0.1 #_orig_obs: 1.38271e+06 survey2
1995 4 3 1.10032e+06 0.1 #_orig_obs: 1.44713e+06 survey2
1996 4 3 1.11272e+06 0.1 #_orig_obs: 1.34622e+06 survey2
1997 4 3 1.01375e+06 0.1 #_orig_obs: 1.0623e+06 survey2
1998 4 3 831228 0.1 #_orig_obs: 1.12452e+06 survey2
1999 4 3 876785 0.1 #_orig_obs: 800049 survey2
2000 4 3 665919 0.1 #_orig_obs: 582640 survey2
2001 4 3 539801 0.1 #_orig_obs: 477674 survey2
2002 4 3 290576 0.1 #_orig_obs: 255773 survey2
2003 4 3 172647 0.1 #_orig_obs: 112183 survey2
2004 4 3 59202.4 0.1 #_orig_obs: 38993.6 survey2
2005 4 3 39859.2 0.1 #_orig_obs: 26002.5 survey2
2006 4 3 30684.1 0.1 #_orig_obs: 34241.2 survey2
2007 4 3 31397.8 0.1 #_orig_obs: 17224 survey2
2008 4 3 40260.4 0.1 #_orig_obs: 31879.1 survey2
2009 4 3 38554 0.1 #_orig_obs: 35098.3 survey2
2010 4 3 44854 0.1 #_orig_obs: 37313.3 survey2
2011 4 3 62712.1 0.1 #_orig_obs: 61124.2 survey2
2012 4 3 92191.7 0.1 #_orig_obs: 86872 survey2
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
0 # use length composition data (0/1)
# see manual for format of length composition data 
#
7 #_N_age_bins
 0 1 2 3 4 5 6
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
1985  1 1  0 0 1 -1 -1 200  40 77 66 14 3 0 0
1986  1 1  0 0 1 -1 -1 200  50 80 61 7 2 0 0
1987  1 1  0 0 1 -1 -1 200  41 77 72 8 1 1 0
1988  1 1  0 0 1 -1 -1 200  24 70 92 12 2 0 0
1989  1 1  0 0 1 -1 -1 200  20 65 93 22 0 0 0
1990  1 1  0 0 1 -1 -1 200  29 76 74 16 5 0 0
1991  1 1  0 0 1 -1 -1 200  34 76 67 13 9 0 1
1992  1 1  0 0 1 -1 -1 200  23 90 74 13 0 0 0
1993  1 1  0 0 1 -1 -1 200  36 93 58 12 1 0 0
1994  1 1  0 0 1 -1 -1 200  42 81 70 7 0 0 0
1995  1 1  0 0 1 -1 -1 200  30 95 69 6 0 0 0
1996  1 1  0 0 1 -1 -1 200  37 92 65 6 0 0 0
1997  1 1  0 0 1 -1 -1 200  42 99 52 7 0 0 0
1998  1 1  0 0 1 -1 -1 200  31 102 62 5 0 0 0
1999  1 1  0 0 1 -1 -1 200  42 80 72 6 0 0 0
2000  1 1  0 0 1 -1 -1 200  34 95 66 2 1 2 0
2001  1 1  0 0 1 -1 -1 200  26 105 62 7 0 0 0
2002  1 1  0 0 1 -1 -1 200  21 103 67 9 0 0 0
2003  1 1  0 0 1 -1 -1 200  12 126 62 0 0 0 0
2004  1 1  0 0 1 -1 -1 200  37 97 66 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  28 117 55 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  51 82 64 3 0 0 0
2007  1 1  0 0 1 -1 -1 200  40 101 56 3 0 0 0
2008  1 1  0 0 1 -1 -1 200  42 95 60 3 0 0 0
2009  1 1  0 0 1 -1 -1 200  47 107 45 1 0 0 0
2010  1 1  0 0 1 -1 -1 200  51 107 38 4 0 0 0
2011  1 1  0 0 1 -1 -1 200  47 96 57 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  53 94 49 4 0 0 0
1990  10 2  0 0 1 -1 -1 200  1 8 165 26 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 7 178 15 0 0 0
1992  10 2  0 0 1 -1 -1 200  3 6 177 14 0 0 0
1993  10 2  0 0 1 -1 -1 200  1 18 172 9 0 0 0
1994  10 2  0 0 1 -1 -1 200  0 12 176 12 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 9 185 6 0 0 0
1996  10 2  0 0 1 -1 -1 200  1 10 172 17 0 0 0
1997  10 2  0 0 1 -1 -1 200  2 24 163 11 0 0 0
1998  10 2  0 0 1 -1 -1 200  1 23 160 16 0 0 0
1999  10 2  0 0 1 -1 -1 200  1 17 172 10 0 0 0
2000  10 2  0 0 1 -1 -1 200  2 32 158 8 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 29 165 5 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 60 138 2 0 0 0
2003  10 2  0 0 1 -1 -1 200  1 49 150 0 0 0 0
2004  10 2  0 0 1 -1 -1 200  3 65 132 0 0 0 0
2005  10 2  0 0 1 -1 -1 200  4 34 162 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  2 21 170 7 0 0 0
2007  10 2  0 0 1 -1 -1 200  4 29 164 3 0 0 0
2008  10 2  0 0 1 -1 -1 200  2 23 171 4 0 0 0
2009  10 2  0 0 1 -1 -1 200  2 16 168 14 0 0 0
2010  10 2  0 0 1 -1 -1 200  2 32 161 5 0 0 0
2011  10 2  0 0 1 -1 -1 200  1 30 162 7 0 0 0
2012  10 2  0 0 1 -1 -1 200  3 24 168 5 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 17 163 20 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 26 157 17 0 0 0
1987  4 3  0 0 1 -1 -1 200  2 23 165 10 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 22 165 13 0 0 0
1989  4 3  0 0 1 -1 -1 200  0 10 157 30 3 0 0
1990  4 3  0 0 1 -1 -1 200  0 12 157 31 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 23 148 27 2 0 0
1992  4 3  0 0 1 -1 -1 200  0 22 153 25 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 20 162 18 0 0 0
1994  4 3  0 0 1 -1 -1 200  1 14 167 18 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 19 175 6 0 0 0
1996  4 3  0 0 1 -1 -1 200  2 14 172 12 0 0 0
1997  4 3  0 0 1 -1 -1 200  0 27 157 16 0 0 0
1998  4 3  0 0 1 -1 -1 200  2 22 168 8 0 0 0
1999  4 3  0 0 1 -1 -1 200  1 15 178 6 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 23 158 19 0 0 0
2001  4 3  0 0 1 -1 -1 200  3 33 160 4 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 28 167 5 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 33 167 0 0 0 0
2004  4 3  0 0 1 -1 -1 200  0 27 170 3 0 0 0
2005  4 3  0 0 1 -1 -1 200  1 40 158 1 0 0 0
2006  4 3  0 0 1 -1 -1 200  1 21 175 3 0 0 0
2007  4 3  0 0 1 -1 -1 200  3 24 168 5 0 0 0
2008  4 3  0 0 1 -1 -1 200  2 29 163 6 0 0 0
2009  4 3  0 0 1 -1 -1 200  3 22 167 8 0 0 0
2010  4 3  0 0 1 -1 -1 200  0 33 160 7 0 0 0
2011  4 3  0 0 1 -1 -1 200  1 27 169 3 0 0 0
2012  4 3  0 0 1 -1 -1 200  2 27 159 12 0 0 0
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

