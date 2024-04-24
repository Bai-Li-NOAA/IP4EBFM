#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Apr 24 09:07:50 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1713964070 first rand#: 0.567228
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
-999 1 1 164774 0.05
1985 1 1 129804 0.05
1986 1 1 127487 0.05
1987 1 1 34117.6 0.05
1988 1 1 2256.77 0.05
1989 1 1 865.757 0.05
1990 1 1 7082.66 0.05
1991 1 1 23229 0.05
1992 1 1 45964.1 0.05
1993 1 1 104522 0.05
1994 1 1 26764.1 0.05
1995 1 1 8609.5 0.05
1996 1 1 24600.5 0.05
1997 1 1 64473.3 0.05
1998 1 1 215356 0.05
1999 1 1 209288 0.05
2000 1 1 179166 0.05
2001 1 1 117036 0.05
2002 1 1 12302.1 0.05
2003 1 1 72350.7 0.05
2004 1 1 120841 0.05
2005 1 1 548727 0.05
2006 1 1 2.77131e+06 0.05
2007 1 1 2.31926e+06 0.05
2008 1 1 360143 0.05
2009 1 1 430250 0.05
2010 1 1 563658 0.05
2011 1 1 853348 0.05
2012 1 1 830062 0.05
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
1990 10 2 630337 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.46209e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 6.22165e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 3.07581e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.39442e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.73946e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.49305e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.76131e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 6.66129e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 9.51045e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.56025e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.71609e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.72892e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 2.33943e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.37912e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 6.04659e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.19475e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 4.08481e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.48062e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.96191e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.16991e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 3.72985e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.44194e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.39389e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.34838e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 638845 0.1 #_orig_obs: 854127 survey2
1988 4 3 204452 0.1 #_orig_obs: 239407 survey2
1989 4 3 197561 0.1 #_orig_obs: 185762 survey2
1990 4 3 204876 0.1 #_orig_obs: 137981 survey2
1991 4 3 698884 0.1 #_orig_obs: 393067 survey2
1992 4 3 1.95862e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 967314 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 406692 0.1 #_orig_obs: 539130 survey2
1995 4 3 468224 0.1 #_orig_obs: 564396 survey2
1996 4 3 416324 0.1 #_orig_obs: 610556 survey2
1997 4 3 433566 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.39779e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.2495e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.36218e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 703766 0.1 #_orig_obs: 715021 survey2
2002 4 3 575964 0.1 #_orig_obs: 568480 survey2
2003 4 3 676595 0.1 #_orig_obs: 836482 survey2
2004 4 3 434700 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.35237e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.30611e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.56167e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.4668e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 614268 0.1 #_orig_obs: 638168 survey2
2010 4 3 454104 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.53951e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.98957e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  66 57 58 10 9 0 0
1986  1 1  0 0 1 -1 -1 200  26 51 95 11 13 2 2
1987  1 1  0 0 1 -1 -1 200  56 19 70 30 16 4 5
1988  1 1  0 0 1 -1 -1 200  69 25 33 13 42 6 12
1989  1 1  0 0 1 -1 -1 200  158 12 15 1 9 1 4
1990  1 1  0 0 1 -1 -1 200  176 18 3 3 0 0 0
1991  1 1  0 0 1 -1 -1 200  76 99 22 0 2 1 0
1992  1 1  0 0 1 -1 -1 200  40 39 117 3 0 0 1
1993  1 1  0 0 1 -1 -1 200  99 23 50 24 4 0 0
1994  1 1  0 0 1 -1 -1 200  108 35 25 12 19 0 1
1995  1 1  0 0 1 -1 -1 200  44 67 69 5 10 5 0
1996  1 1  0 0 1 -1 -1 200  176 6 12 4 1 0 1
1997  1 1  0 0 1 -1 -1 200  153 37 8 0 2 0 0
1998  1 1  0 0 1 -1 -1 200  75 70 52 0 3 0 0
1999  1 1  0 0 1 -1 -1 200  48 30 102 16 1 1 2
2000  1 1  0 0 1 -1 -1 200  66 29 62 24 19 0 0
2001  1 1  0 0 1 -1 -1 200  96 33 34 11 21 5 0
2002  1 1  0 0 1 -1 -1 200  64 61 47 8 9 7 4
2003  1 1  0 0 1 -1 -1 200  159 6 24 5 3 0 3
2004  1 1  0 0 1 -1 -1 200  182 18 0 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  101 80 19 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  58 52 86 4 0 0 0
2007  1 1  0 0 1 -1 -1 200  67 51 64 18 0 0 0
2008  1 1  0 0 1 -1 -1 200  54 39 90 8 9 0 0
2009  1 1  0 0 1 -1 -1 200  173 9 12 5 0 1 0
2010  1 1  0 0 1 -1 -1 200  155 38 5 2 0 0 0
2011  1 1  0 0 1 -1 -1 200  64 83 53 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  66 41 83 10 0 0 0
1990  10 2  0 0 1 -1 -1 200  7 56 116 21 0 0 0
1991  10 2  0 0 1 -1 -1 200  1 63 131 5 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 194 6 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 6 147 47 0 0 0
1994  10 2  0 0 1 -1 -1 200  3 34 125 32 6 0 0
1995  10 2  0 0 1 -1 -1 200  0 19 165 16 0 0 0
1996  10 2  0 0 1 -1 -1 200  4 13 155 28 0 0 0
1997  10 2  0 0 1 -1 -1 200  7 93 68 32 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 27 173 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 4 180 16 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 8 156 36 0 0 0
2001  10 2  0 0 1 -1 -1 200  0 14 149 37 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 26 161 13 0 0 0
2003  10 2  0 0 1 -1 -1 200  5 5 175 15 0 0 0
2004  10 2  0 0 1 -1 -1 200  16 77 69 38 0 0 0
2005  10 2  0 0 1 -1 -1 200  3 76 121 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 19 173 8 0 0 0
2007  10 2  0 0 1 -1 -1 200  0 25 146 29 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 18 171 11 0 0 0
2009  10 2  0 0 1 -1 -1 200  2 8 163 27 0 0 0
2010  10 2  0 0 1 -1 -1 200  8 96 76 20 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 37 163 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 18 170 12 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 19 161 20 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 12 168 20 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 5 161 34 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 20 108 70 2 0 0
1989  4 3  0 0 1 -1 -1 200  2 11 173 14 0 0 0
1990  4 3  0 0 1 -1 -1 200  12 47 114 27 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 54 143 3 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 6 187 7 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 4 139 57 0 0 0
1994  4 3  0 0 1 -1 -1 200  2 16 122 59 1 0 0
1995  4 3  0 0 1 -1 -1 200  0 12 173 15 0 0 0
1996  4 3  0 0 1 -1 -1 200  1 6 161 32 0 0 0
1997  4 3  0 0 1 -1 -1 200  10 78 84 28 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 17 182 1 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 5 176 19 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 7 145 48 0 0 0
2001  4 3  0 0 1 -1 -1 200  2 12 146 40 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 24 150 26 0 0 0
2003  4 3  0 0 1 -1 -1 200  2 5 178 15 0 0 0
2004  4 3  0 0 1 -1 -1 200  14 73 77 36 0 0 0
2005  4 3  0 0 1 -1 -1 200  2 42 155 1 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 10 187 3 0 0 0
2007  4 3  0 0 1 -1 -1 200  1 11 156 32 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 9 176 15 0 0 0
2009  4 3  0 0 1 -1 -1 200  4 14 159 23 0 0 0
2010  4 3  0 0 1 -1 -1 200  5 72 90 33 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 16 181 3 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 5 176 19 0 0 0
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

