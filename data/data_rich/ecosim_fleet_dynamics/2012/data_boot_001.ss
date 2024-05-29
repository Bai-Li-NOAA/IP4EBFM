#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue May 28 17:20:37 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1716931237 first rand#: -0.539628
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
-999 1 1 152650 0.05
1985 1 1 132113 0.05
1986 1 1 128801 0.05
1987 1 1 34993.5 0.05
1988 1 1 2096.33 0.05
1989 1 1 956.914 0.05
1990 1 1 8396.82 0.05
1991 1 1 23412.9 0.05
1992 1 1 42122.8 0.05
1993 1 1 109670 0.05
1994 1 1 26062.5 0.05
1995 1 1 8108.13 0.05
1996 1 1 23881 0.05
1997 1 1 62090.1 0.05
1998 1 1 242064 0.05
1999 1 1 235957 0.05
2000 1 1 166434 0.05
2001 1 1 116641 0.05
2002 1 1 12671.9 0.05
2003 1 1 73306.2 0.05
2004 1 1 127900 0.05
2005 1 1 491667 0.05
2006 1 1 2.6518e+06 0.05
2007 1 1 2.29059e+06 0.05
2008 1 1 336732 0.05
2009 1 1 406534 0.05
2010 1 1 564562 0.05
2011 1 1 872833 0.05
2012 1 1 798883 0.05
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
1990 10 2 651716 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.31621e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 7.36329e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 2.68408e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.36845e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.8252e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.76468e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.58559e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 8.24235e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 8.42007e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.29683e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.53919e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.79123e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 2.30042e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.77876e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 7.23652e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.00614e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.9148e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.5624e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.95303e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.42963e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 3.91714e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.9954e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.39772e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.26922e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 824610 0.1 #_orig_obs: 854127 survey2
1988 4 3 206930 0.1 #_orig_obs: 239407 survey2
1989 4 3 187839 0.1 #_orig_obs: 185762 survey2
1990 4 3 210235 0.1 #_orig_obs: 137981 survey2
1991 4 3 664391 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.30307e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 1.23186e+06 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 417558 0.1 #_orig_obs: 539130 survey2
1995 4 3 569731 0.1 #_orig_obs: 564396 survey2
1996 4 3 669830 0.1 #_orig_obs: 610556 survey2
1997 4 3 420857 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.1338e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.23216e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.45873e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 593417 0.1 #_orig_obs: 715021 survey2
2002 4 3 607687 0.1 #_orig_obs: 568480 survey2
2003 4 3 825408 0.1 #_orig_obs: 836482 survey2
2004 4 3 400040 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.13853e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.9083e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 1.94217e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.14116e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 635034 0.1 #_orig_obs: 638168 survey2
2010 4 3 434530 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.92266e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.70909e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  58 74 50 9 9 0 0
1986  1 1  0 0 1 -1 -1 200  21 45 107 11 13 1 2
1987  1 1  0 0 1 -1 -1 200  53 14 80 21 23 3 6
1988  1 1  0 0 1 -1 -1 200  57 49 30 24 30 6 4
1989  1 1  0 0 1 -1 -1 200  157 12 16 1 9 1 4
1990  1 1  0 0 1 -1 -1 200  180 11 6 3 0 0 0
1991  1 1  0 0 1 -1 -1 200  75 99 22 3 1 0 0
1992  1 1  0 0 1 -1 -1 200  42 32 121 2 2 1 0
1993  1 1  0 0 1 -1 -1 200  82 28 59 21 10 0 0
1994  1 1  0 0 1 -1 -1 200  113 40 15 15 16 0 1
1995  1 1  0 0 1 -1 -1 200  55 51 70 4 10 9 1
1996  1 1  0 0 1 -1 -1 200  175 5 15 3 1 1 0
1997  1 1  0 0 1 -1 -1 200  157 41 2 0 0 0 0
1998  1 1  0 0 1 -1 -1 200  71 76 47 0 6 0 0
1999  1 1  0 0 1 -1 -1 200  46 37 102 14 1 0 0
2000  1 1  0 0 1 -1 -1 200  71 23 63 30 13 0 0
2001  1 1  0 0 1 -1 -1 200  110 33 33 6 16 2 0
2002  1 1  0 0 1 -1 -1 200  61 64 48 7 12 6 2
2003  1 1  0 0 1 -1 -1 200  161 5 27 3 3 1 0
2004  1 1  0 0 1 -1 -1 200  174 21 3 1 1 0 0
2005  1 1  0 0 1 -1 -1 200  103 77 20 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  68 48 83 1 0 0 0
2007  1 1  0 0 1 -1 -1 200  66 46 66 22 0 0 0
2008  1 1  0 0 1 -1 -1 200  41 46 95 6 12 0 0
2009  1 1  0 0 1 -1 -1 200  160 6 22 8 4 0 0
2010  1 1  0 0 1 -1 -1 200  136 53 5 2 4 0 0
2011  1 1  0 0 1 -1 -1 200  69 79 52 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  72 42 75 11 0 0 0
1990  10 2  0 0 1 -1 -1 200  11 60 110 19 0 0 0
1991  10 2  0 0 1 -1 -1 200  2 53 141 4 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 192 8 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 9 154 37 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 29 139 27 4 0 0
1995  10 2  0 0 1 -1 -1 200  0 18 169 13 0 0 0
1996  10 2  0 0 1 -1 -1 200  6 6 163 25 0 0 0
1997  10 2  0 0 1 -1 -1 200  9 95 78 18 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 32 168 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 4 186 10 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 9 146 45 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 8 148 43 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 27 154 19 0 0 0
2003  10 2  0 0 1 -1 -1 200  2 8 179 11 0 0 0
2004  10 2  0 0 1 -1 -1 200  10 68 88 34 0 0 0
2005  10 2  0 0 1 -1 -1 200  3 71 126 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 16 181 3 0 0 0
2007  10 2  0 0 1 -1 -1 200  0 28 150 22 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 17 175 8 0 0 0
2009  10 2  0 0 1 -1 -1 200  2 5 162 31 0 0 0
2010  10 2  0 0 1 -1 -1 200  6 90 75 29 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 29 167 4 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 17 171 12 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 18 156 26 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 6 169 25 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 5 144 51 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 22 110 64 4 0 0
1989  4 3  0 0 1 -1 -1 200  0 9 168 22 1 0 0
1990  4 3  0 0 1 -1 -1 200  10 51 114 25 0 0 0
1991  4 3  0 0 1 -1 -1 200  2 48 148 2 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 7 189 4 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 6 146 48 0 0 0
1994  4 3  0 0 1 -1 -1 200  1 16 135 48 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 10 178 12 0 0 0
1996  4 3  0 0 1 -1 -1 200  3 2 164 31 0 0 0
1997  4 3  0 0 1 -1 -1 200  9 81 77 32 1 0 0
1998  4 3  0 0 1 -1 -1 200  0 19 181 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 4 177 19 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 3 141 56 0 0 0
2001  4 3  0 0 1 -1 -1 200  0 14 142 39 5 0 0
2002  4 3  0 0 1 -1 -1 200  1 11 163 25 0 0 0
2003  4 3  0 0 1 -1 -1 200  3 7 176 14 0 0 0
2004  4 3  0 0 1 -1 -1 200  8 60 94 38 0 0 0
2005  4 3  0 0 1 -1 -1 200  1 46 151 2 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 10 182 8 0 0 0
2007  4 3  0 0 1 -1 -1 200  1 10 159 30 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 11 176 13 0 0 0
2009  4 3  0 0 1 -1 -1 200  0 8 158 34 0 0 0
2010  4 3  0 0 1 -1 -1 200  4 71 100 25 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 20 178 2 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 8 179 13 0 0 0
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

