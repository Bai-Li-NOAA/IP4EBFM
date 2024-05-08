#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon May 06 13:14:33 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1715015673 first rand#: 0.0442398
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
-999 1 1 49595.8 0.05
1985 1 1 14257.9 0.05
1986 1 1 12259.8 0.05
1987 1 1 6914.26 0.05
1988 1 1 2040.04 0.05
1989 1 1 3138.82 0.05
1990 1 1 81139.6 0.05
1991 1 1 119011 0.05
1992 1 1 267116 0.05
1993 1 1 444543 0.05
1994 1 1 215531 0.05
1995 1 1 146341 0.05
1996 1 1 373374 0.05
1997 1 1 370187 0.05
1998 1 1 989351 0.05
1999 1 1 718063 0.05
2000 1 1 491938 0.05
2001 1 1 320791 0.05
2002 1 1 310019 0.05
2003 1 1 161601 0.05
2004 1 1 165284 0.05
2005 1 1 136266 0.05
2006 1 1 192097 0.05
2007 1 1 101499 0.05
2008 1 1 149274 0.05
2009 1 1 180350 0.05
2010 1 1 127200 0.05
2011 1 1 232314 0.05
2012 1 1 349896 0.05
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
1990 10 2 539479 0.1 #_orig_obs: 547420 survey1
1991 10 2 1.93849e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 6.36686e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 1.79242e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 775699 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.17867e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.27132e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 853930 0.1 #_orig_obs: 870120 survey1
1998 10 2 2.65012e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.77219e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 661082 0.1 #_orig_obs: 512338 survey1
2001 10 2 282147 0.1 #_orig_obs: 291699 survey1
2002 10 2 149117 0.1 #_orig_obs: 364967 survey1
2003 10 2 120787 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 38303.5 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 98052.5 0.1 #_orig_obs: 197600 survey1
2006 10 2 152411 0.1 #_orig_obs: 152760 survey1
2007 10 2 133050 0.1 #_orig_obs: 210482 survey1
2008 10 2 486547 0.1 #_orig_obs: 788883 survey1
2009 10 2 414338 0.1 #_orig_obs: 218864 survey1
2010 10 2 287825 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.47797e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 1.83488e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 581949 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 501272 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 406280 0.1 #_orig_obs: 846626 survey2
1988 4 3 230705 0.1 #_orig_obs: 194950 survey2
1989 4 3 145534 0.1 #_orig_obs: 153912 survey2
1990 4 3 145898 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 561941 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.68421e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 632500 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 197646 0.1 #_orig_obs: 365721 survey2
1995 4 3 363493 0.1 #_orig_obs: 410270 survey2
1996 4 3 328257 0.1 #_orig_obs: 386093 survey2
1997 4 3 271675 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.154e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 736531 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 252347 0.1 #_orig_obs: 286601 survey2
2001 4 3 167246 0.1 #_orig_obs: 121367 survey2
2002 4 3 181588 0.1 #_orig_obs: 174609 survey2
2003 4 3 53450.6 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 29418.5 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 67795.2 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 75179.3 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 76037.8 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 156123 0.1 #_orig_obs: 129808 survey2
2009 4 3 130383 0.1 #_orig_obs: 166268 survey2
2010 4 3 101498 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 471061 0.1 #_orig_obs: 347709 survey2
2012 4 3 655179 0.1 #_orig_obs: 617787 survey2
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
1985  1 1  0 0 1 -1 -1 200  25 69 88 18 0 0 0
1986  1 1  0 0 1 -1 -1 200  7 88 93 9 3 0 0
1987  1 1  0 0 1 -1 -1 200  11 39 118 23 9 0 0
1988  1 1  0 0 1 -1 -1 200  21 63 69 38 9 0 0
1989  1 1  0 0 1 -1 -1 200  76 30 72 10 8 4 0
1990  1 1  0 0 1 -1 -1 200  96 81 17 4 0 1 1
1991  1 1  0 0 1 -1 -1 200  15 156 29 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  7 51 139 3 0 0 0
1993  1 1  0 0 1 -1 -1 200  26 35 89 48 2 0 0
1994  1 1  0 0 1 -1 -1 200  39 93 38 19 11 0 0
1995  1 1  0 0 1 -1 -1 200  15 83 92 8 2 0 0
1996  1 1  0 0 1 -1 -1 200  117 26 45 12 0 0 0
1997  1 1  0 0 1 -1 -1 200  45 139 13 2 1 0 0
1998  1 1  0 0 1 -1 -1 200  13 106 80 1 0 0 0
1999  1 1  0 0 1 -1 -1 200  16 57 120 7 0 0 0
2000  1 1  0 0 1 -1 -1 200  66 43 76 13 2 0 0
2001  1 1  0 0 1 -1 -1 200  16 157 24 3 0 0 0
2002  1 1  0 0 1 -1 -1 200  19 65 115 1 0 0 0
2003  1 1  0 0 1 -1 -1 200  83 52 58 7 0 0 0
2004  1 1  0 0 1 -1 -1 200  65 124 11 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  26 139 35 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  88 65 46 1 0 0 0
2007  1 1  0 0 1 -1 -1 200  41 133 25 1 0 0 0
2008  1 1  0 0 1 -1 -1 200  12 101 87 0 0 0 0
2009  1 1  0 0 1 -1 -1 200  104 22 66 8 0 0 0
2010  1 1  0 0 1 -1 -1 200  67 127 4 2 0 0 0
2011  1 1  0 0 1 -1 -1 200  30 114 55 1 0 0 0
2012  1 1  0 0 1 -1 -1 200  42 69 83 6 0 0 0
1990  10 2  0 0 1 -1 -1 200  7 46 124 23 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 50 150 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 3 196 1 0 0 0
1993  10 2  0 0 1 -1 -1 200  1 5 140 54 0 0 0
1994  10 2  0 0 1 -1 -1 200  0 32 139 29 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 19 176 5 0 0 0
1996  10 2  0 0 1 -1 -1 200  3 11 171 15 0 0 0
1997  10 2  0 0 1 -1 -1 200  5 98 74 23 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 23 177 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 10 180 10 0 0 0
2000  10 2  0 0 1 -1 -1 200  2 20 152 26 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 88 99 12 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 41 159 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  3 27 166 4 0 0 0
2004  10 2  0 0 1 -1 -1 200  25 154 19 2 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 84 116 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  6 22 170 2 0 0 0
2007  10 2  0 0 1 -1 -1 200  6 81 105 8 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 19 181 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  1 9 179 11 0 0 0
2010  10 2  0 0 1 -1 -1 200  5 113 65 17 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 18 182 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  1 10 180 9 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 18 165 17 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 16 157 27 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 5 159 36 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 15 116 69 0 0 0
1989  4 3  0 0 1 -1 -1 200  6 9 154 29 2 0 0
1990  4 3  0 0 1 -1 -1 200  15 45 105 35 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 60 137 3 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 8 188 4 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 5 138 57 0 0 0
1994  4 3  0 0 1 -1 -1 200  1 27 124 48 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 12 176 12 0 0 0
1996  4 3  0 0 1 -1 -1 200  7 9 162 22 0 0 0
1997  4 3  0 0 1 -1 -1 200  3 90 80 27 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 17 183 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 7 178 15 0 0 0
2000  4 3  0 0 1 -1 -1 200  3 19 156 22 0 0 0
2001  4 3  0 0 1 -1 -1 200  2 65 122 11 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 19 181 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 12 181 7 0 0 0
2004  4 3  0 0 1 -1 -1 200  8 108 79 5 0 0 0
2005  4 3  0 0 1 -1 -1 200  3 56 141 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  1 14 183 2 0 0 0
2007  4 3  0 0 1 -1 -1 200  4 80 109 7 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 24 175 1 0 0 0
2009  4 3  0 0 1 -1 -1 200  7 4 176 13 0 0 0
2010  4 3  0 0 1 -1 -1 200  6 94 78 22 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 29 167 4 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 6 179 15 0 0 0
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

