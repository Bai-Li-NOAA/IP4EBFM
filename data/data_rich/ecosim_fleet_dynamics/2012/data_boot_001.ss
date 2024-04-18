#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Apr 18 13:51:19 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1713462679 first rand#: -0.394062
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
-999 1 1 145093 0.05
1985 1 1 138456 0.05
1986 1 1 118337 0.05
1987 1 1 35354.4 0.05
1988 1 1 2353.62 0.05
1989 1 1 891.411 0.05
1990 1 1 7585.98 0.05
1991 1 1 26121.4 0.05
1992 1 1 44203.5 0.05
1993 1 1 105911 0.05
1994 1 1 26680.7 0.05
1995 1 1 8402.11 0.05
1996 1 1 22512.4 0.05
1997 1 1 57654.4 0.05
1998 1 1 215869 0.05
1999 1 1 203647 0.05
2000 1 1 172610 0.05
2001 1 1 121710 0.05
2002 1 1 11336.8 0.05
2003 1 1 72076.6 0.05
2004 1 1 121060 0.05
2005 1 1 503973 0.05
2006 1 1 2.69831e+06 0.05
2007 1 1 2.43904e+06 0.05
2008 1 1 376425 0.05
2009 1 1 474667 0.05
2010 1 1 587756 0.05
2011 1 1 803060 0.05
2012 1 1 828059 0.05
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
1990 10 2 586936 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.34586e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 7.67115e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 3.3392e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.21012e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.4669e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.44906e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.58421e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 7.44632e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 1.02918e+07 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.16327e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.40829e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.69463e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 2.33271e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.40224e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 7.07412e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.16326e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.81148e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.75098e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.72481e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.62849e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 4.25075e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.71958e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.42358e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.34238e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 735656 0.1 #_orig_obs: 854127 survey2
1988 4 3 194801 0.1 #_orig_obs: 239407 survey2
1989 4 3 197521 0.1 #_orig_obs: 185762 survey2
1990 4 3 200153 0.1 #_orig_obs: 137981 survey2
1991 4 3 652257 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.32877e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 1.09524e+06 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 470018 0.1 #_orig_obs: 539130 survey2
1995 4 3 415817 0.1 #_orig_obs: 564396 survey2
1996 4 3 445650 0.1 #_orig_obs: 610556 survey2
1997 4 3 498791 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.54535e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.10435e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.44316e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 735110 0.1 #_orig_obs: 715021 survey2
2002 4 3 529803 0.1 #_orig_obs: 568480 survey2
2003 4 3 656601 0.1 #_orig_obs: 836482 survey2
2004 4 3 445407 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.22782e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.86304e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.21934e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.2959e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 588249 0.1 #_orig_obs: 638168 survey2
2010 4 3 422899 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.74711e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.66602e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  61 55 59 14 11 0 0
1986  1 1  0 0 1 -1 -1 200  19 41 110 18 9 1 2
1987  1 1  0 0 1 -1 -1 200  50 13 72 31 24 2 8
1988  1 1  0 0 1 -1 -1 200  76 31 28 13 37 6 9
1989  1 1  0 0 1 -1 -1 200  148 10 18 4 8 3 9
1990  1 1  0 0 1 -1 -1 200  173 17 7 3 0 0 0
1991  1 1  0 0 1 -1 -1 200  73 98 24 1 3 1 0
1992  1 1  0 0 1 -1 -1 200  44 31 121 4 0 0 0
1993  1 1  0 0 1 -1 -1 200  100 14 47 29 10 0 0
1994  1 1  0 0 1 -1 -1 200  109 33 28 7 21 0 2
1995  1 1  0 0 1 -1 -1 200  59 56 67 5 5 8 0
1996  1 1  0 0 1 -1 -1 200  174 9 12 1 3 0 1
1997  1 1  0 0 1 -1 -1 200  139 49 6 3 3 0 0
1998  1 1  0 0 1 -1 -1 200  55 74 69 0 2 0 0
1999  1 1  0 0 1 -1 -1 200  55 42 91 9 1 1 1
2000  1 1  0 0 1 -1 -1 200  76 23 61 24 16 0 0
2001  1 1  0 0 1 -1 -1 200  109 32 28 8 19 4 0
2002  1 1  0 0 1 -1 -1 200  52 58 60 6 13 8 3
2003  1 1  0 0 1 -1 -1 200  155 6 26 4 5 2 2
2004  1 1  0 0 1 -1 -1 200  187 10 3 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  111 77 12 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  72 38 87 3 0 0 0
2007  1 1  0 0 1 -1 -1 200  65 62 56 17 0 0 0
2008  1 1  0 0 1 -1 -1 200  49 46 87 6 12 0 0
2009  1 1  0 0 1 -1 -1 200  164 6 22 3 4 1 0
2010  1 1  0 0 1 -1 -1 200  136 57 2 0 5 0 0
2011  1 1  0 0 1 -1 -1 200  72 55 73 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  73 39 76 12 0 0 0
1990  10 2  0 0 1 -1 -1 200  15 49 119 17 0 0 0
1991  10 2  0 0 1 -1 -1 200  1 58 137 4 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 188 12 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 0 138 62 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 24 129 43 3 0 0
1995  10 2  0 0 1 -1 -1 200  0 19 167 14 0 0 0
1996  10 2  0 0 1 -1 -1 200  5 10 166 19 0 0 0
1997  10 2  0 0 1 -1 -1 200  7 95 76 22 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 25 175 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 10 171 19 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 9 150 41 0 0 0
2001  10 2  0 0 1 -1 -1 200  0 19 139 42 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 25 153 22 0 0 0
2003  10 2  0 0 1 -1 -1 200  3 5 172 19 1 0 0
2004  10 2  0 0 1 -1 -1 200  20 83 67 30 0 0 0
2005  10 2  0 0 1 -1 -1 200  2 67 131 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 19 176 5 0 0 0
2007  10 2  0 0 1 -1 -1 200  1 21 145 33 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 9 178 13 0 0 0
2009  10 2  0 0 1 -1 -1 200  2 7 153 38 0 0 0
2010  10 2  0 0 1 -1 -1 200  6 98 70 26 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 30 168 2 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 20 166 14 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 11 174 15 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 7 166 27 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 4 151 45 0 0 0
1988  4 3  0 0 1 -1 -1 200  1 12 123 61 3 0 0
1989  4 3  0 0 1 -1 -1 200  5 7 166 20 2 0 0
1990  4 3  0 0 1 -1 -1 200  7 48 121 24 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 54 141 5 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 6 190 4 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 3 143 54 0 0 0
1994  4 3  0 0 1 -1 -1 200  1 18 127 53 1 0 0
1995  4 3  0 0 1 -1 -1 200  1 14 171 14 0 0 0
1996  4 3  0 0 1 -1 -1 200  2 11 164 23 0 0 0
1997  4 3  0 0 1 -1 -1 200  3 91 74 31 1 0 0
1998  4 3  0 0 1 -1 -1 200  0 18 182 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 6 177 17 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 9 146 45 0 0 0
2001  4 3  0 0 1 -1 -1 200  2 19 137 41 1 0 0
2002  4 3  0 0 1 -1 -1 200  0 16 155 29 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 7 168 23 2 0 0
2004  4 3  0 0 1 -1 -1 200  15 65 72 48 0 0 0
2005  4 3  0 0 1 -1 -1 200  1 58 141 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 6 191 3 0 0 0
2007  4 3  0 0 1 -1 -1 200  1 11 161 27 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 13 169 18 0 0 0
2009  4 3  0 0 1 -1 -1 200  0 8 152 40 0 0 0
2010  4 3  0 0 1 -1 -1 200  4 69 97 30 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 22 174 4 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 3 181 16 0 0 0
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

