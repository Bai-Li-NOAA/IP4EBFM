#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Sat May 25 13:42:40 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1716658960 first rand#: 0.496396
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
-999 1 1 149264 0.05
1985 1 1 143440 0.05
1986 1 1 122134 0.05
1987 1 1 34220.6 0.05
1988 1 1 2440.82 0.05
1989 1 1 932.628 0.05
1990 1 1 7669.4 0.05
1991 1 1 25090.6 0.05
1992 1 1 50898.4 0.05
1993 1 1 106588 0.05
1994 1 1 25609.1 0.05
1995 1 1 8842.96 0.05
1996 1 1 23662.7 0.05
1997 1 1 62387.9 0.05
1998 1 1 208923 0.05
1999 1 1 222562 0.05
2000 1 1 181427 0.05
2001 1 1 116295 0.05
2002 1 1 11949.6 0.05
2003 1 1 64493.6 0.05
2004 1 1 134685 0.05
2005 1 1 515942 0.05
2006 1 1 2.64981e+06 0.05
2007 1 1 2.4796e+06 0.05
2008 1 1 387394 0.05
2009 1 1 453539 0.05
2010 1 1 577007 0.05
2011 1 1 852903 0.05
2012 1 1 842561 0.05
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
1990 10 2 620824 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.47431e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 5.73283e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 2.907e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.07261e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.63411e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.63191e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.47994e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 8.60667e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 8.8763e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 3.92349e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.70516e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.63036e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 2.11117e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.697e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 6.71266e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.3878e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.9562e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.31793e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.64466e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.40099e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 4.55385e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.62914e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.44017e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.38127e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 616475 0.1 #_orig_obs: 854127 survey2
1988 4 3 177627 0.1 #_orig_obs: 239407 survey2
1989 4 3 196630 0.1 #_orig_obs: 185762 survey2
1990 4 3 180332 0.1 #_orig_obs: 137981 survey2
1991 4 3 733995 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.42521e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 921929 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 328621 0.1 #_orig_obs: 539130 survey2
1995 4 3 497819 0.1 #_orig_obs: 564396 survey2
1996 4 3 577640 0.1 #_orig_obs: 610556 survey2
1997 4 3 479294 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.75695e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.35563e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.25998e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 648898 0.1 #_orig_obs: 715021 survey2
2002 4 3 550262 0.1 #_orig_obs: 568480 survey2
2003 4 3 598668 0.1 #_orig_obs: 836482 survey2
2004 4 3 446161 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.23738e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.98461e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.41193e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.11021e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 803530 0.1 #_orig_obs: 638168 survey2
2010 4 3 386076 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.91613e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.74187e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  74 57 52 7 10 0 0
1986  1 1  0 0 1 -1 -1 200  30 43 100 12 12 1 2
1987  1 1  0 0 1 -1 -1 200  63 23 65 26 19 2 2
1988  1 1  0 0 1 -1 -1 200  73 38 25 20 29 4 11
1989  1 1  0 0 1 -1 -1 200  161 16 17 1 3 1 1
1990  1 1  0 0 1 -1 -1 200  186 9 5 0 0 0 0
1991  1 1  0 0 1 -1 -1 200  104 72 19 0 1 4 0
1992  1 1  0 0 1 -1 -1 200  36 35 121 5 0 1 2
1993  1 1  0 0 1 -1 -1 200  91 18 55 25 11 0 0
1994  1 1  0 0 1 -1 -1 200  102 34 29 17 16 2 0
1995  1 1  0 0 1 -1 -1 200  57 52 69 6 7 9 0
1996  1 1  0 0 1 -1 -1 200  175 8 12 3 1 0 1
1997  1 1  0 0 1 -1 -1 200  146 43 5 3 3 0 0
1998  1 1  0 0 1 -1 -1 200  68 73 58 1 0 0 0
1999  1 1  0 0 1 -1 -1 200  51 32 100 15 0 2 0
2000  1 1  0 0 1 -1 -1 200  66 29 58 25 22 0 0
2001  1 1  0 0 1 -1 -1 200  96 31 33 13 23 4 0
2002  1 1  0 0 1 -1 -1 200  53 68 51 6 10 10 2
2003  1 1  0 0 1 -1 -1 200  162 6 25 3 1 0 3
2004  1 1  0 0 1 -1 -1 200  184 11 3 2 0 0 0
2005  1 1  0 0 1 -1 -1 200  80 96 24 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  57 46 95 2 0 0 0
2007  1 1  0 0 1 -1 -1 200  62 65 65 8 0 0 0
2008  1 1  0 0 1 -1 -1 200  43 36 110 5 6 0 0
2009  1 1  0 0 1 -1 -1 200  157 15 22 3 3 0 0
2010  1 1  0 0 1 -1 -1 200  148 43 6 2 1 0 0
2011  1 1  0 0 1 -1 -1 200  69 64 67 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  59 45 89 7 0 0 0
1990  10 2  0 0 1 -1 -1 200  12 56 118 14 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 57 140 3 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 193 7 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 9 149 42 0 0 0
1994  10 2  0 0 1 -1 -1 200  3 21 132 42 2 0 0
1995  10 2  0 0 1 -1 -1 200  0 19 163 18 0 0 0
1996  10 2  0 0 1 -1 -1 200  6 8 165 21 0 0 0
1997  10 2  0 0 1 -1 -1 200  6 99 79 16 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 37 163 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 10 186 4 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 4 139 57 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 14 147 38 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 25 150 25 0 0 0
2003  10 2  0 0 1 -1 -1 200  2 7 175 15 1 0 0
2004  10 2  0 0 1 -1 -1 200  18 80 73 29 0 0 0
2005  10 2  0 0 1 -1 -1 200  2 58 140 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 18 178 4 0 0 0
2007  10 2  0 0 1 -1 -1 200  1 23 151 25 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 6 184 10 0 0 0
2009  10 2  0 0 1 -1 -1 200  6 3 161 30 0 0 0
2010  10 2  0 0 1 -1 -1 200  4 92 89 15 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 37 160 3 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 9 176 15 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 19 158 23 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 8 165 27 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 7 150 43 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 12 114 74 0 0 0
1989  4 3  0 0 1 -1 -1 200  2 8 167 20 3 0 0
1990  4 3  0 0 1 -1 -1 200  8 46 119 27 0 0 0
1991  4 3  0 0 1 -1 -1 200  4 52 141 3 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 5 185 10 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 5 139 56 0 0 0
1994  4 3  0 0 1 -1 -1 200  3 12 130 54 1 0 0
1995  4 3  0 0 1 -1 -1 200  1 13 174 12 0 0 0
1996  4 3  0 0 1 -1 -1 200  3 10 163 24 0 0 0
1997  4 3  0 0 1 -1 -1 200  5 86 75 33 1 0 0
1998  4 3  0 0 1 -1 -1 200  0 14 182 4 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 6 174 20 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 3 146 51 0 0 0
2001  4 3  0 0 1 -1 -1 200  1 13 139 47 0 0 0
2002  4 3  0 0 1 -1 -1 200  1 25 147 27 0 0 0
2003  4 3  0 0 1 -1 -1 200  3 6 177 14 0 0 0
2004  4 3  0 0 1 -1 -1 200  8 71 81 40 0 0 0
2005  4 3  0 0 1 -1 -1 200  0 43 154 3 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 10 186 4 0 0 0
2007  4 3  0 0 1 -1 -1 200  0 11 164 25 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 5 180 15 0 0 0
2009  4 3  0 0 1 -1 -1 200  2 2 150 46 0 0 0
2010  4 3  0 0 1 -1 -1 200  4 71 86 39 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 14 186 0 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 8 182 10 0 0 0
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

