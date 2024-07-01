#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Jul 01 11:16:25 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1719846985 first rand#: 0.0804382
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
-999 1 1 49418.2 0.05
1985 1 1 13660.5 0.05
1986 1 1 11917 0.05
1987 1 1 7538.5 0.05
1988 1 1 1907.88 0.05
1989 1 1 3395.45 0.05
1990 1 1 72522.8 0.05
1991 1 1 120490 0.05
1992 1 1 283849 0.05
1993 1 1 454398 0.05
1994 1 1 216172 0.05
1995 1 1 160896 0.05
1996 1 1 409397 0.05
1997 1 1 365631 0.05
1998 1 1 920877 0.05
1999 1 1 623687 0.05
2000 1 1 480647 0.05
2001 1 1 337586 0.05
2002 1 1 302541 0.05
2003 1 1 176367 0.05
2004 1 1 150095 0.05
2005 1 1 131955 0.05
2006 1 1 197213 0.05
2007 1 1 105635 0.05
2008 1 1 138439 0.05
2009 1 1 176251 0.05
2010 1 1 132626 0.05
2011 1 1 228499 0.05
2012 1 1 349067 0.05
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
1990 10 2 501480 0.1 #_orig_obs: 547420 survey1
1991 10 2 1.92078e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 6.3897e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.29701e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 886545 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.3657e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.41747e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 704822 0.1 #_orig_obs: 870120 survey1
1998 10 2 2.80705e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.98262e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 683148 0.1 #_orig_obs: 512338 survey1
2001 10 2 276342 0.1 #_orig_obs: 291699 survey1
2002 10 2 173730 0.1 #_orig_obs: 364967 survey1
2003 10 2 121292 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 41387 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 103427 0.1 #_orig_obs: 197600 survey1
2006 10 2 211439 0.1 #_orig_obs: 152760 survey1
2007 10 2 155842 0.1 #_orig_obs: 210482 survey1
2008 10 2 508419 0.1 #_orig_obs: 788883 survey1
2009 10 2 411291 0.1 #_orig_obs: 218864 survey1
2010 10 2 305070 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.59342e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 1.74621e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 602656 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 571665 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 350206 0.1 #_orig_obs: 846626 survey2
1988 4 3 194957 0.1 #_orig_obs: 194950 survey2
1989 4 3 162101 0.1 #_orig_obs: 153912 survey2
1990 4 3 127462 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 584725 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.69489e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 689324 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 233275 0.1 #_orig_obs: 365721 survey2
1995 4 3 367111 0.1 #_orig_obs: 410270 survey2
1996 4 3 334820 0.1 #_orig_obs: 386093 survey2
1997 4 3 288964 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.2392e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 797967 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 254825 0.1 #_orig_obs: 286601 survey2
2001 4 3 153045 0.1 #_orig_obs: 121367 survey2
2002 4 3 200872 0.1 #_orig_obs: 174609 survey2
2003 4 3 61550.4 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 26883.5 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 67104.7 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 79749 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 64537.3 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 156869 0.1 #_orig_obs: 129808 survey2
2009 4 3 138280 0.1 #_orig_obs: 166268 survey2
2010 4 3 93507.4 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 444806 0.1 #_orig_obs: 347709 survey2
2012 4 3 636364 0.1 #_orig_obs: 617787 survey2
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
1985  1 1  0 0 1 -1 -1 200  22 86 84 8 0 0 0
1986  1 1  0 0 1 -1 -1 200  14 72 89 23 2 0 0
1987  1 1  0 0 1 -1 -1 200  6 35 137 22 0 0 0
1988  1 1  0 0 1 -1 -1 200  19 65 58 48 9 1 0
1989  1 1  0 0 1 -1 -1 200  93 33 58 10 4 2 0
1990  1 1  0 0 1 -1 -1 200  105 79 10 4 1 1 0
1991  1 1  0 0 1 -1 -1 200  15 144 41 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  3 43 147 7 0 0 0
1993  1 1  0 0 1 -1 -1 200  34 39 87 36 4 0 0
1994  1 1  0 0 1 -1 -1 200  35 96 48 13 8 0 0
1995  1 1  0 0 1 -1 -1 200  15 102 79 1 2 1 0
1996  1 1  0 0 1 -1 -1 200  106 37 52 5 0 0 0
1997  1 1  0 0 1 -1 -1 200  40 143 13 3 1 0 0
1998  1 1  0 0 1 -1 -1 200  7 97 96 0 0 0 0
1999  1 1  0 0 1 -1 -1 200  11 60 123 6 0 0 0
2000  1 1  0 0 1 -1 -1 200  68 50 60 18 4 0 0
2001  1 1  0 0 1 -1 -1 200  17 156 23 4 0 0 0
2002  1 1  0 0 1 -1 -1 200  10 76 113 1 0 0 0
2003  1 1  0 0 1 -1 -1 200  84 57 57 2 0 0 0
2004  1 1  0 0 1 -1 -1 200  64 127 9 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  34 136 30 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  86 67 45 2 0 0 0
2007  1 1  0 0 1 -1 -1 200  33 142 25 0 0 0 0
2008  1 1  0 0 1 -1 -1 200  13 110 77 0 0 0 0
2009  1 1  0 0 1 -1 -1 200  98 31 62 9 0 0 0
2010  1 1  0 0 1 -1 -1 200  52 138 8 1 1 0 0
2011  1 1  0 0 1 -1 -1 200  21 115 64 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  51 74 69 6 0 0 0
1990  10 2  0 0 1 -1 -1 200  14 57 108 21 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 69 131 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 4 190 6 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 8 136 56 0 0 0
1994  10 2  0 0 1 -1 -1 200  2 30 130 38 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 13 181 6 0 0 0
1996  10 2  0 0 1 -1 -1 200  3 9 175 13 0 0 0
1997  10 2  0 0 1 -1 -1 200  3 105 72 20 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 19 181 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 10 182 8 0 0 0
2000  10 2  0 0 1 -1 -1 200  3 16 160 21 0 0 0
2001  10 2  0 0 1 -1 -1 200  2 95 93 10 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 36 164 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  6 22 167 5 0 0 0
2004  10 2  0 0 1 -1 -1 200  14 165 16 5 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 87 113 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  6 23 169 2 0 0 0
2007  10 2  0 0 1 -1 -1 200  5 96 90 9 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 26 174 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  6 7 168 19 0 0 0
2010  10 2  0 0 1 -1 -1 200  10 109 67 14 0 0 0
2011  10 2  0 0 1 -1 -1 200  1 33 166 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 11 182 7 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 12 167 21 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 14 152 34 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 6 154 40 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 11 119 69 1 0 0
1989  4 3  0 0 1 -1 -1 200  4 5 169 22 0 0 0
1990  4 3  0 0 1 -1 -1 200  23 55 100 22 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 49 149 2 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 6 188 6 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 5 121 74 0 0 0
1994  4 3  0 0 1 -1 -1 200  2 28 123 47 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 21 170 9 0 0 0
1996  4 3  0 0 1 -1 -1 200  5 9 172 14 0 0 0
1997  4 3  0 0 1 -1 -1 200  2 91 89 18 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 25 175 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 6 181 13 0 0 0
2000  4 3  0 0 1 -1 -1 200  2 10 158 30 0 0 0
2001  4 3  0 0 1 -1 -1 200  2 77 107 14 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 19 181 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 18 174 8 0 0 0
2004  4 3  0 0 1 -1 -1 200  10 111 76 3 0 0 0
2005  4 3  0 0 1 -1 -1 200  0 54 146 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  5 14 180 1 0 0 0
2007  4 3  0 0 1 -1 -1 200  5 45 137 13 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 17 177 6 0 0 0
2009  4 3  0 0 1 -1 -1 200  2 5 179 14 0 0 0
2010  4 3  0 0 1 -1 -1 200  6 94 79 21 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 22 178 0 0 0 0
2012  4 3  0 0 1 -1 -1 200  2 12 173 13 0 0 0
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

