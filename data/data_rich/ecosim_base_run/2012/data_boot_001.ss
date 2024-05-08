#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon May 06 13:12:40 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1715015560 first rand#: 0.510009
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
-999 1 1 116791 0.05
1985 1 1 17253.8 0.05
1986 1 1 17110.8 0.05
1987 1 1 15538.2 0.05
1988 1 1 12973.5 0.05
1989 1 1 25708.1 0.05
1990 1 1 271194 0.05
1991 1 1 256037 0.05
1992 1 1 387992 0.05
1993 1 1 580397 0.05
1994 1 1 688144 0.05
1995 1 1 531665 0.05
1996 1 1 929716 0.05
1997 1 1 836114 0.05
1998 1 1 839616 0.05
1999 1 1 971195 0.05
2000 1 1 926036 0.05
2001 1 1 904699 0.05
2002 1 1 983789 0.05
2003 1 1 398840 0.05
2004 1 1 349529 0.05
2005 1 1 63969.2 0.05
2006 1 1 69729 0.05
2007 1 1 31047.5 0.05
2008 1 1 39324.5 0.05
2009 1 1 41046.6 0.05
2010 1 1 40512.1 0.05
2011 1 1 47606.7 0.05
2012 1 1 100425 0.05
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
1990 10 2 6.48184e+06 0.1 #_orig_obs: 4.80559e+06 survey1
1991 10 2 4.9419e+06 0.1 #_orig_obs: 4.48145e+06 survey1
1992 10 2 5.09261e+06 0.1 #_orig_obs: 3.71027e+06 survey1
1993 10 2 4.48377e+06 0.1 #_orig_obs: 3.99854e+06 survey1
1994 10 2 4.34143e+06 0.1 #_orig_obs: 3.71786e+06 survey1
1995 10 2 3.84338e+06 0.1 #_orig_obs: 3.64541e+06 survey1
1996 10 2 3.53299e+06 0.1 #_orig_obs: 3.00776e+06 survey1
1997 10 2 3.10466e+06 0.1 #_orig_obs: 2.8157e+06 survey1
1998 10 2 2.57043e+06 0.1 #_orig_obs: 2.91494e+06 survey1
1999 10 2 1.90491e+06 0.1 #_orig_obs: 2.35383e+06 survey1
2000 10 2 1.36938e+06 0.1 #_orig_obs: 1.26764e+06 survey1
2001 10 2 843281 0.1 #_orig_obs: 1.16742e+06 survey1
2002 10 2 331623 0.1 #_orig_obs: 420712 survey1
2003 10 2 242780 0.1 #_orig_obs: 259467 survey1
2004 10 2 47347.5 0.1 #_orig_obs: 69499.5 survey1
2005 10 2 82513.8 0.1 #_orig_obs: 88295.7 survey1
2006 10 2 63760.5 0.1 #_orig_obs: 62110.2 survey1
2007 10 2 72296.5 0.1 #_orig_obs: 74899.2 survey1
2008 10 2 94118.4 0.1 #_orig_obs: 94886.5 survey1
2009 10 2 77810 0.1 #_orig_obs: 80962.6 survey1
2010 10 2 117138 0.1 #_orig_obs: 145920 survey1
2011 10 2 216455 0.1 #_orig_obs: 208996 survey1
2012 10 2 215953 0.1 #_orig_obs: 234805 survey1
1985 4 3 1.50174e+06 0.1 #_orig_obs: 2.24436e+06 survey2
1986 4 3 1.13412e+06 0.1 #_orig_obs: 1.82735e+06 survey2
1987 4 3 1.57991e+06 0.1 #_orig_obs: 1.92059e+06 survey2
1988 4 3 2.02499e+06 0.1 #_orig_obs: 2.54638e+06 survey2
1989 4 3 1.73623e+06 0.1 #_orig_obs: 2.18369e+06 survey2
1990 4 3 1.6026e+06 0.1 #_orig_obs: 1.80311e+06 survey2
1991 4 3 1.38252e+06 0.1 #_orig_obs: 1.5341e+06 survey2
1992 4 3 1.20624e+06 0.1 #_orig_obs: 1.83772e+06 survey2
1993 4 3 1.03666e+06 0.1 #_orig_obs: 1.8809e+06 survey2
1994 4 3 1.55725e+06 0.1 #_orig_obs: 1.38271e+06 survey2
1995 4 3 1.23879e+06 0.1 #_orig_obs: 1.44713e+06 survey2
1996 4 3 1.26162e+06 0.1 #_orig_obs: 1.34622e+06 survey2
1997 4 3 973130 0.1 #_orig_obs: 1.0623e+06 survey2
1998 4 3 961663 0.1 #_orig_obs: 1.12452e+06 survey2
1999 4 3 807550 0.1 #_orig_obs: 800049 survey2
2000 4 3 705763 0.1 #_orig_obs: 582640 survey2
2001 4 3 576518 0.1 #_orig_obs: 477674 survey2
2002 4 3 287844 0.1 #_orig_obs: 255773 survey2
2003 4 3 165885 0.1 #_orig_obs: 112183 survey2
2004 4 3 79149.8 0.1 #_orig_obs: 38993.6 survey2
2005 4 3 37373.4 0.1 #_orig_obs: 26002.5 survey2
2006 4 3 34865.6 0.1 #_orig_obs: 34241.2 survey2
2007 4 3 26567 0.1 #_orig_obs: 17224 survey2
2008 4 3 39829.3 0.1 #_orig_obs: 31879.1 survey2
2009 4 3 33298.7 0.1 #_orig_obs: 35098.3 survey2
2010 4 3 35990.3 0.1 #_orig_obs: 37313.3 survey2
2011 4 3 65666.8 0.1 #_orig_obs: 61124.2 survey2
2012 4 3 87499.9 0.1 #_orig_obs: 86872 survey2
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
1985  1 1  0 0 1 -1 -1 200  44 72 64 18 2 0 0
1986  1 1  0 0 1 -1 -1 200  43 90 47 18 1 1 0
1987  1 1  0 0 1 -1 -1 200  30 85 73 8 3 1 0
1988  1 1  0 0 1 -1 -1 200  22 73 86 17 2 0 0
1989  1 1  0 0 1 -1 -1 200  23 69 93 15 0 0 0
1990  1 1  0 0 1 -1 -1 200  33 81 62 22 2 0 0
1991  1 1  0 0 1 -1 -1 200  24 85 75 8 5 1 2
1992  1 1  0 0 1 -1 -1 200  35 91 62 12 0 0 0
1993  1 1  0 0 1 -1 -1 200  29 84 74 8 5 0 0
1994  1 1  0 0 1 -1 -1 200  27 93 68 12 0 0 0
1995  1 1  0 0 1 -1 -1 200  27 83 84 6 0 0 0
1996  1 1  0 0 1 -1 -1 200  33 81 75 11 0 0 0
1997  1 1  0 0 1 -1 -1 200  37 86 68 7 1 1 0
1998  1 1  0 0 1 -1 -1 200  32 100 61 7 0 0 0
1999  1 1  0 0 1 -1 -1 200  41 94 63 2 0 0 0
2000  1 1  0 0 1 -1 -1 200  41 113 41 5 0 0 0
2001  1 1  0 0 1 -1 -1 200  25 113 61 1 0 0 0
2002  1 1  0 0 1 -1 -1 200  21 113 64 2 0 0 0
2003  1 1  0 0 1 -1 -1 200  18 131 51 0 0 0 0
2004  1 1  0 0 1 -1 -1 200  28 101 71 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  32 127 41 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  48 79 71 2 0 0 0
2007  1 1  0 0 1 -1 -1 200  39 110 49 2 0 0 0
2008  1 1  0 0 1 -1 -1 200  36 107 54 3 0 0 0
2009  1 1  0 0 1 -1 -1 200  52 104 43 1 0 0 0
2010  1 1  0 0 1 -1 -1 200  54 104 39 3 0 0 0
2011  1 1  0 0 1 -1 -1 200  41 111 44 4 0 0 0
2012  1 1  0 0 1 -1 -1 200  48 99 48 5 0 0 0
1990  10 2  0 0 1 -1 -1 200  0 3 173 24 0 0 0
1991  10 2  0 0 1 -1 -1 200  2 7 169 22 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 17 162 21 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 7 179 14 0 0 0
1994  10 2  0 0 1 -1 -1 200  0 11 180 9 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 15 176 9 0 0 0
1996  10 2  0 0 1 -1 -1 200  2 19 163 16 0 0 0
1997  10 2  0 0 1 -1 -1 200  2 13 177 8 0 0 0
1998  10 2  0 0 1 -1 -1 200  2 15 180 3 0 0 0
1999  10 2  0 0 1 -1 -1 200  1 25 171 3 0 0 0
2000  10 2  0 0 1 -1 -1 200  1 30 161 8 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 37 159 3 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 40 153 7 0 0 0
2003  10 2  0 0 1 -1 -1 200  1 51 148 0 0 0 0
2004  10 2  0 0 1 -1 -1 200  0 62 138 0 0 0 0
2005  10 2  0 0 1 -1 -1 200  2 28 170 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  2 17 177 4 0 0 0
2007  10 2  0 0 1 -1 -1 200  1 42 151 6 0 0 0
2008  10 2  0 0 1 -1 -1 200  4 19 173 4 0 0 0
2009  10 2  0 0 1 -1 -1 200  5 21 166 8 0 0 0
2010  10 2  0 0 1 -1 -1 200  3 34 160 3 0 0 0
2011  10 2  0 0 1 -1 -1 200  1 27 168 4 0 0 0
2012  10 2  0 0 1 -1 -1 200  4 26 164 6 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 20 164 16 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 22 156 22 0 0 0
1987  4 3  0 0 1 -1 -1 200  1 25 159 15 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 17 170 13 0 0 0
1989  4 3  0 0 1 -1 -1 200  0 9 169 21 1 0 0
1990  4 3  0 0 1 -1 -1 200  0 13 158 29 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 21 158 20 1 0 0
1992  4 3  0 0 1 -1 -1 200  0 15 155 30 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 22 165 13 0 0 0
1994  4 3  0 0 1 -1 -1 200  0 22 165 13 0 0 0
1995  4 3  0 0 1 -1 -1 200  1 12 175 12 0 0 0
1996  4 3  0 0 1 -1 -1 200  0 12 174 14 0 0 0
1997  4 3  0 0 1 -1 -1 200  0 18 162 20 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 20 169 11 0 0 0
1999  4 3  0 0 1 -1 -1 200  1 21 173 5 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 30 162 8 0 0 0
2001  4 3  0 0 1 -1 -1 200  0 29 166 5 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 33 160 7 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 32 168 0 0 0 0
2004  4 3  0 0 1 -1 -1 200  0 28 169 3 0 0 0
2005  4 3  0 0 1 -1 -1 200  2 30 167 1 0 0 0
2006  4 3  0 0 1 -1 -1 200  2 27 166 5 0 0 0
2007  4 3  0 0 1 -1 -1 200  2 35 154 9 0 0 0
2008  4 3  0 0 1 -1 -1 200  1 25 170 4 0 0 0
2009  4 3  0 0 1 -1 -1 200  2 26 165 7 0 0 0
2010  4 3  0 0 1 -1 -1 200  0 35 157 8 0 0 0
2011  4 3  0 0 1 -1 -1 200  2 31 161 6 0 0 0
2012  4 3  0 0 1 -1 -1 200  2 28 165 5 0 0 0
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

