#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Dec 06 18:24:53 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1670369093 first rand#: -1.9379
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
1995 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1.0001 #_spawn_month
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
-999 1 1 77361 0.05
1985 1 1 13393.1 0.05
1986 1 1 12973.4 0.05
1987 1 1 7123.18 0.05
1988 1 1 1978.11 0.05
1989 1 1 3458.35 0.05
1990 1 1 71671.6 0.05
1991 1 1 122593 0.05
1992 1 1 276504 0.05
1993 1 1 433943 0.05
1994 1 1 232501 0.05
1995 1 1 144935 0.05
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
1990 10 2 615658 0.1 #_orig_obs: 559970 survey1
1991 10 2 2.83583e+06 0.1 #_orig_obs: 4.1271e+06 survey1
1992 10 2 6.69611e+06 0.1 #_orig_obs: 7.13121e+06 survey1
1993 10 2 2.54983e+06 0.1 #_orig_obs: 1.66483e+06 survey1
1994 10 2 956505 0.1 #_orig_obs: 613678 survey1
1995 10 2 1.38055e+06 0.1 #_orig_obs: 1.43796e+06 survey1
1985 4 3 1.05946e+06 0.1 #_orig_obs: 1.90597e+06 survey2
1986 4 3 1.0046e+06 0.1 #_orig_obs: 2.21911e+06 survey2
1987 4 3 1.05755e+06 0.1 #_orig_obs: 1.05381e+06 survey2
1988 4 3 320246 0.1 #_orig_obs: 192092 survey2
1989 4 3 232090 0.1 #_orig_obs: 179548 survey2
1990 4 3 180072 0.1 #_orig_obs: 129115 survey2
1991 4 3 729225 0.1 #_orig_obs: 328697 survey2
1992 4 3 1.8101e+06 0.1 #_orig_obs: 2.00105e+06 survey2
1993 4 3 829799 0.1 #_orig_obs: 1.03349e+06 survey2
1994 4 3 326744 0.1 #_orig_obs: 250591 survey2
1995 4 3 379047 0.1 #_orig_obs: 515878 survey2
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
 1 2 3 4 5 6 7
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
1985  1 1  0 0 1 -1 -1 800  98 277 349 64 9 3 0
1986  1 1  0 0 1 -1 -1 800  23 281 388 91 11 3 3
1987  1 1  0 0 1 -1 -1 800  34 89 572 90 13 2 0
1988  1 1  0 0 1 -1 -1 800  46 175 280 250 40 6 3
1989  1 1  0 0 1 -1 -1 800  278 103 293 64 49 10 3
1990  1 1  0 0 1 -1 -1 800  424 280 70 20 5 1 0
1991  1 1  0 0 1 -1 -1 800  77 545 171 5 2 0 0
1992  1 1  0 0 1 -1 -1 800  16 214 542 27 1 0 0
1993  1 1  0 0 1 -1 -1 800  99 125 347 216 13 0 0
1994  1 1  0 0 1 -1 -1 800  159 407 145 57 27 5 0
1995  1 1  0 0 1 -1 -1 800  86 301 384 16 9 4 0
1990  10 2  0 0 1 -1 -1 800  50 225 422 102 1 0 0
1991  10 2  0 0 1 -1 -1 800  5 277 509 9 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 31 745 24 0 0 0
1993  10 2  0 0 1 -1 -1 800  2 33 566 198 1 0 0
1994  10 2  0 0 1 -1 -1 800  12 160 504 122 2 0 0
1995  10 2  0 0 1 -1 -1 800  0 90 687 23 0 0 0
1985  4 3  0 0 1 -1 -1 800  0 105 594 101 0 0 0
1986  4 3  0 0 1 -1 -1 800  0 88 612 100 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 12 674 114 0 0 0
1988  4 3  0 0 1 -1 -1 800  0 61 408 328 3 0 0
1989  4 3  0 0 1 -1 -1 800  0 49 642 105 4 0 0
1990  4 3  0 0 1 -1 -1 800  0 323 377 100 0 0 0
1991  4 3  0 0 1 -1 -1 800  1 329 462 8 0 0 0
1992  4 3  0 0 1 -1 -1 800  0 34 745 21 0 0 0
1993  4 3  0 0 1 -1 -1 800  0 41 565 194 0 0 0
1994  4 3  0 0 1 -1 -1 800  0 201 462 131 6 0 0
1995  4 3  0 0 1 -1 -1 800  0 111 661 27 1 0 0
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

