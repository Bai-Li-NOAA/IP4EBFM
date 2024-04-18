#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Apr 18 13:50:36 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1713462636 first rand#: 0.0950011
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
-999 1 1 50380.6 0.05
1985 1 1 13653.1 0.05
1986 1 1 12443 0.05
1987 1 1 6793.18 0.05
1988 1 1 1980.41 0.05
1989 1 1 3574.81 0.05
1990 1 1 73031.1 0.05
1991 1 1 118514 0.05
1992 1 1 286199 0.05
1993 1 1 445829 0.05
1994 1 1 242833 0.05
1995 1 1 161757 0.05
1996 1 1 385417 0.05
1997 1 1 351207 0.05
1998 1 1 932308 0.05
1999 1 1 649340 0.05
2000 1 1 449355 0.05
2001 1 1 302469 0.05
2002 1 1 319892 0.05
2003 1 1 172600 0.05
2004 1 1 167838 0.05
2005 1 1 136319 0.05
2006 1 1 170038 0.05
2007 1 1 106690 0.05
2008 1 1 157861 0.05
2009 1 1 182680 0.05
2010 1 1 145307 0.05
2011 1 1 220808 0.05
2012 1 1 368686 0.05
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
1990 10 2 580642 0.1 #_orig_obs: 547420 survey1
1991 10 2 2.14427e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 7.20557e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.46825e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 717264 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.42657e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.50449e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 935450 0.1 #_orig_obs: 870120 survey1
1998 10 2 3.21726e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.70978e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 703195 0.1 #_orig_obs: 512338 survey1
2001 10 2 344982 0.1 #_orig_obs: 291699 survey1
2002 10 2 199145 0.1 #_orig_obs: 364967 survey1
2003 10 2 106528 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 35958.7 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 110347 0.1 #_orig_obs: 197600 survey1
2006 10 2 179195 0.1 #_orig_obs: 152760 survey1
2007 10 2 167251 0.1 #_orig_obs: 210482 survey1
2008 10 2 509665 0.1 #_orig_obs: 788883 survey1
2009 10 2 428955 0.1 #_orig_obs: 218864 survey1
2010 10 2 249504 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.42624e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 2.19043e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 663008 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 559090 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 464002 0.1 #_orig_obs: 846626 survey2
1988 4 3 192595 0.1 #_orig_obs: 194950 survey2
1989 4 3 107937 0.1 #_orig_obs: 153912 survey2
1990 4 3 146365 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 607879 0.1 #_orig_obs: 375629 survey2
1992 4 3 2.03047e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 655278 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 221710 0.1 #_orig_obs: 365721 survey2
1995 4 3 394532 0.1 #_orig_obs: 410270 survey2
1996 4 3 372433 0.1 #_orig_obs: 386093 survey2
1997 4 3 211491 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.22347e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 772692 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 277355 0.1 #_orig_obs: 286601 survey2
2001 4 3 139761 0.1 #_orig_obs: 121367 survey2
2002 4 3 158135 0.1 #_orig_obs: 174609 survey2
2003 4 3 58165.4 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 28935.2 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 59376.7 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 83138 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 82647.1 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 158702 0.1 #_orig_obs: 129808 survey2
2009 4 3 139144 0.1 #_orig_obs: 166268 survey2
2010 4 3 97481.4 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 369455 0.1 #_orig_obs: 347709 survey2
2012 4 3 542585 0.1 #_orig_obs: 617787 survey2
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
1985  1 1  0 0 1 -1 -1 200  22 71 88 19 0 0 0
1986  1 1  0 0 1 -1 -1 200  8 63 111 14 4 0 0
1987  1 1  0 0 1 -1 -1 200  14 27 123 29 7 0 0
1988  1 1  0 0 1 -1 -1 200  18 72 59 38 11 1 1
1989  1 1  0 0 1 -1 -1 200  79 33 74 5 5 4 0
1990  1 1  0 0 1 -1 -1 200  122 58 17 3 0 0 0
1991  1 1  0 0 1 -1 -1 200  10 151 39 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  6 46 138 10 0 0 0
1993  1 1  0 0 1 -1 -1 200  30 25 93 52 0 0 0
1994  1 1  0 0 1 -1 -1 200  37 95 47 9 12 0 0
1995  1 1  0 0 1 -1 -1 200  13 87 92 5 2 1 0
1996  1 1  0 0 1 -1 -1 200  90 41 52 17 0 0 0
1997  1 1  0 0 1 -1 -1 200  39 145 10 6 0 0 0
1998  1 1  0 0 1 -1 -1 200  12 104 79 5 0 0 0
1999  1 1  0 0 1 -1 -1 200  21 47 123 9 0 0 0
2000  1 1  0 0 1 -1 -1 200  77 49 56 14 4 0 0
2001  1 1  0 0 1 -1 -1 200  14 150 32 4 0 0 0
2002  1 1  0 0 1 -1 -1 200  10 86 102 2 0 0 0
2003  1 1  0 0 1 -1 -1 200  74 54 70 2 0 0 0
2004  1 1  0 0 1 -1 -1 200  82 112 6 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  27 141 32 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  80 68 52 0 0 0 0
2007  1 1  0 0 1 -1 -1 200  38 139 23 0 0 0 0
2008  1 1  0 0 1 -1 -1 200  17 110 73 0 0 0 0
2009  1 1  0 0 1 -1 -1 200  98 22 76 4 0 0 0
2010  1 1  0 0 1 -1 -1 200  61 125 11 3 0 0 0
2011  1 1  0 0 1 -1 -1 200  17 108 73 1 1 0 0
2012  1 1  0 0 1 -1 -1 200  37 72 87 4 0 0 0
1990  10 2  0 0 1 -1 -1 200  14 49 116 21 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 53 147 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 2 195 3 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 7 146 47 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 24 134 39 2 0 0
1995  10 2  0 0 1 -1 -1 200  0 15 180 5 0 0 0
1996  10 2  0 0 1 -1 -1 200  3 6 179 12 0 0 0
1997  10 2  0 0 1 -1 -1 200  5 96 85 14 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 24 176 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 12 180 8 0 0 0
2000  10 2  0 0 1 -1 -1 200  7 11 156 26 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 93 97 9 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 40 160 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  3 28 167 2 0 0 0
2004  10 2  0 0 1 -1 -1 200  11 165 22 2 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 88 112 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  2 32 165 1 0 0 0
2007  10 2  0 0 1 -1 -1 200  2 94 96 8 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 13 187 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  4 9 176 11 0 0 0
2010  10 2  0 0 1 -1 -1 200  4 109 74 13 0 0 0
2011  10 2  0 0 1 -1 -1 200  1 37 162 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  1 16 179 4 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 14 164 22 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 14 157 29 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 3 165 32 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 7 113 78 2 0 0
1989  4 3  0 0 1 -1 -1 200  3 11 158 27 1 0 0
1990  4 3  0 0 1 -1 -1 200  14 50 98 38 0 0 0
1991  4 3  0 0 1 -1 -1 200  1 60 136 3 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 5 190 5 0 0 0
1993  4 3  0 0 1 -1 -1 200  1 3 126 70 0 0 0
1994  4 3  0 0 1 -1 -1 200  1 30 126 43 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 15 177 8 0 0 0
1996  4 3  0 0 1 -1 -1 200  6 10 168 16 0 0 0
1997  4 3  0 0 1 -1 -1 200  6 87 82 25 0 0 0
1998  4 3  0 0 1 -1 -1 200  1 13 186 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 13 175 12 0 0 0
2000  4 3  0 0 1 -1 -1 200  6 11 161 22 0 0 0
2001  4 3  0 0 1 -1 -1 200  2 77 116 5 0 0 0
2002  4 3  0 0 1 -1 -1 200  1 12 187 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 18 174 8 0 0 0
2004  4 3  0 0 1 -1 -1 200  11 95 82 12 0 0 0
2005  4 3  0 0 1 -1 -1 200  5 52 143 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  2 9 185 4 0 0 0
2007  4 3  0 0 1 -1 -1 200  1 53 134 12 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 15 185 0 0 0 0
2009  4 3  0 0 1 -1 -1 200  6 5 171 18 0 0 0
2010  4 3  0 0 1 -1 -1 200  7 99 77 17 0 0 0
2011  4 3  0 0 1 -1 -1 200  1 31 168 0 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 12 175 13 0 0 0
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

