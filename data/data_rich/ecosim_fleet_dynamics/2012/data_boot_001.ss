#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Jun 20 12:12:04 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1718899924 first rand#: 0.598499
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
-999 1 1 152338 0.05
1985 1 1 154283 0.05
1986 1 1 124180 0.05
1987 1 1 32091.2 0.05
1988 1 1 2187.12 0.05
1989 1 1 949.159 0.05
1990 1 1 7453.37 0.05
1991 1 1 25419.5 0.05
1992 1 1 39831.7 0.05
1993 1 1 103408 0.05
1994 1 1 24925.2 0.05
1995 1 1 8695.07 0.05
1996 1 1 24909.2 0.05
1997 1 1 62277.8 0.05
1998 1 1 217264 0.05
1999 1 1 212832 0.05
2000 1 1 176317 0.05
2001 1 1 121390 0.05
2002 1 1 12170 0.05
2003 1 1 70193 0.05
2004 1 1 121928 0.05
2005 1 1 516562 0.05
2006 1 1 2.66722e+06 0.05
2007 1 1 2.361e+06 0.05
2008 1 1 368479 0.05
2009 1 1 406319 0.05
2010 1 1 572532 0.05
2011 1 1 896268 0.05
2012 1 1 768225 0.05
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
1990 10 2 562998 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.18516e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 6.17939e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 2.7268e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.34369e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.5043e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.71358e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.6042e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 8.10721e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 9.94495e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.45698e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 2.25443e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.9693e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 1.88261e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.39485e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 5.83228e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.2395e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 4.24883e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 3.4331e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.96742e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.47147e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 3.77784e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.60634e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.40356e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.67181e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 618584 0.1 #_orig_obs: 854127 survey2
1988 4 3 203011 0.1 #_orig_obs: 239407 survey2
1989 4 3 179550 0.1 #_orig_obs: 185762 survey2
1990 4 3 172165 0.1 #_orig_obs: 137981 survey2
1991 4 3 705991 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.09469e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 864920 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 337002 0.1 #_orig_obs: 539130 survey2
1995 4 3 519652 0.1 #_orig_obs: 564396 survey2
1996 4 3 573795 0.1 #_orig_obs: 610556 survey2
1997 4 3 465979 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.68926e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 4.04127e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.43431e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 601897 0.1 #_orig_obs: 715021 survey2
2002 4 3 490200 0.1 #_orig_obs: 568480 survey2
2003 4 3 721422 0.1 #_orig_obs: 836482 survey2
2004 4 3 534322 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.52756e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.30397e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.50152e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.21334e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 711200 0.1 #_orig_obs: 638168 survey2
2010 4 3 460852 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.85987e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.77074e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  62 68 52 9 9 0 0
1986  1 1  0 0 1 -1 -1 200  20 36 112 19 8 1 4
1987  1 1  0 0 1 -1 -1 200  50 17 77 26 19 5 6
1988  1 1  0 0 1 -1 -1 200  59 37 28 21 38 8 9
1989  1 1  0 0 1 -1 -1 200  149 18 13 1 9 3 7
1990  1 1  0 0 1 -1 -1 200  183 12 4 1 0 0 0
1991  1 1  0 0 1 -1 -1 200  85 88 23 3 1 0 0
1992  1 1  0 0 1 -1 -1 200  46 41 104 7 2 0 0
1993  1 1  0 0 1 -1 -1 200  87 16 59 30 8 0 0
1994  1 1  0 0 1 -1 -1 200  101 36 30 10 20 3 0
1995  1 1  0 0 1 -1 -1 200  44 67 65 4 12 8 0
1996  1 1  0 0 1 -1 -1 200  183 7 6 0 0 1 3
1997  1 1  0 0 1 -1 -1 200  148 44 3 4 1 0 0
1998  1 1  0 0 1 -1 -1 200  74 76 48 0 2 0 0
1999  1 1  0 0 1 -1 -1 200  41 41 103 13 1 0 1
2000  1 1  0 0 1 -1 -1 200  79 39 50 19 13 0 0
2001  1 1  0 0 1 -1 -1 200  109 24 33 15 17 2 0
2002  1 1  0 0 1 -1 -1 200  57 64 46 10 14 8 1
2003  1 1  0 0 1 -1 -1 200  158 7 30 2 2 0 1
2004  1 1  0 0 1 -1 -1 200  180 19 0 0 1 0 0
2005  1 1  0 0 1 -1 -1 200  88 84 28 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  75 48 74 3 0 0 0
2007  1 1  0 0 1 -1 -1 200  63 60 61 16 0 0 0
2008  1 1  0 0 1 -1 -1 200  49 48 81 7 15 0 0
2009  1 1  0 0 1 -1 -1 200  171 5 20 2 1 1 0
2010  1 1  0 0 1 -1 -1 200  131 56 7 3 3 0 0
2011  1 1  0 0 1 -1 -1 200  82 53 65 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  69 41 83 7 0 0 0
1990  10 2  0 0 1 -1 -1 200  14 62 103 21 0 0 0
1991  10 2  0 0 1 -1 -1 200  3 65 128 4 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 193 7 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 9 144 47 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 23 135 40 1 0 0
1995  10 2  0 0 1 -1 -1 200  0 15 173 12 0 0 0
1996  10 2  0 0 1 -1 -1 200  5 4 167 24 0 0 0
1997  10 2  0 0 1 -1 -1 200  10 91 75 24 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 33 167 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 7 179 14 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 11 144 45 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 19 146 34 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 27 154 19 0 0 0
2003  10 2  0 0 1 -1 -1 200  4 7 177 12 0 0 0
2004  10 2  0 0 1 -1 -1 200  15 91 72 22 0 0 0
2005  10 2  0 0 1 -1 -1 200  2 66 132 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 18 177 5 0 0 0
2007  10 2  0 0 1 -1 -1 200  2 38 138 22 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 15 176 9 0 0 0
2009  10 2  0 0 1 -1 -1 200  5 6 159 30 0 0 0
2010  10 2  0 0 1 -1 -1 200  6 91 81 22 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 40 158 2 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 10 179 11 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 14 165 21 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 7 173 20 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 2 150 48 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 13 113 71 3 0 0
1989  4 3  0 0 1 -1 -1 200  5 11 163 20 1 0 0
1990  4 3  0 0 1 -1 -1 200  12 53 111 24 0 0 0
1991  4 3  0 0 1 -1 -1 200  1 61 133 5 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 6 187 7 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 6 134 60 0 0 0
1994  4 3  0 0 1 -1 -1 200  3 18 123 55 1 0 0
1995  4 3  0 0 1 -1 -1 200  0 17 173 10 0 0 0
1996  4 3  0 0 1 -1 -1 200  4 3 167 26 0 0 0
1997  4 3  0 0 1 -1 -1 200  5 79 83 33 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 24 174 2 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 5 180 15 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 11 142 47 0 0 0
2001  4 3  0 0 1 -1 -1 200  0 20 137 42 1 0 0
2002  4 3  0 0 1 -1 -1 200  1 15 161 22 1 0 0
2003  4 3  0 0 1 -1 -1 200  4 3 172 21 0 0 0
2004  4 3  0 0 1 -1 -1 200  14 64 80 42 0 0 0
2005  4 3  0 0 1 -1 -1 200  1 55 140 4 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 10 184 6 0 0 0
2007  4 3  0 0 1 -1 -1 200  0 10 156 34 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 8 178 14 0 0 0
2009  4 3  0 0 1 -1 -1 200  3 6 159 32 0 0 0
2010  4 3  0 0 1 -1 -1 200  3 80 91 26 0 0 0
2011  4 3  0 0 1 -1 -1 200  1 21 172 6 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 4 187 9 0 0 0
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

