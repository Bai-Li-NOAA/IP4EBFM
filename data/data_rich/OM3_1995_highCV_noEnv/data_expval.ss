#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Dec 07 12:00:40 2022
#_expected_values
#C data file for simple example
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
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 44298 0.05
1985 1 1 16205.2 0.2
1986 1 1 14453 0.2
1987 1 1 7331.58 0.2
1988 1 1 1834.92 0.2
1989 1 1 3238.65 0.2
1990 1 1 61217.6 0.2
1991 1 1 104584 0.2
1992 1 1 289335 0.2
1993 1 1 468283 0.2
1994 1 1 234039 0.2
1995 1 1 119105 0.2
-9999 0 0 0 0
#
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
1990 10 2 782310 0.5 #_orig_obs: 615377 survey1
1991 10 2 3.28775e+06 0.5 #_orig_obs: 5.72451e+06 survey1
1992 10 2 9.56998e+06 0.5 #_orig_obs: 1.15449e+07 survey1
1993 10 2 3.36655e+06 0.5 #_orig_obs: 4.1733e+06 survey1
1994 10 2 1.20155e+06 0.5 #_orig_obs: 437096 survey1
1995 10 2 2.1989e+06 0.5 #_orig_obs: 2.95117e+06 survey1
1985 4 3 761844 0.5 #_orig_obs: 2.4376e+06 survey2
1986 4 3 777257 0.5 #_orig_obs: 4.48772e+06 survey2
1987 4 3 721969 0.5 #_orig_obs: 1.93581e+06 survey2
1988 4 3 293095 0.5 #_orig_obs: 88146.9 survey2
1989 4 3 215654 0.5 #_orig_obs: 208560 survey2
1990 4 3 211525 0.5 #_orig_obs: 223337 survey2
1991 4 3 883419 0.5 #_orig_obs: 227198 survey2
1992 4 3 2.45758e+06 0.5 #_orig_obs: 1.89336e+06 survey2
1993 4 3 1.11532e+06 0.5 #_orig_obs: 672533 survey2
1994 4 3 405494 0.5 #_orig_obs: 142457 survey2
1995 4 3 603832 0.5 #_orig_obs: 945722 survey2
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
1985  1 1  0 0 1 -1 -1 800  101.417 261.789 350.115 72.5314 11.4828 2.66503 0
1986  1 1  0 0 1 -1 -1 800  29.7842 284.445 385.893 83.9944 12.9556 2.17165 0.756412
1987  1 1  0 0 1 -1 -1 800  41.7873 102.792 518.439 114.455 18.4924 4.03387 0
1988  1 1  0 0 1 -1 -1 800  51.8772 208.011 271.531 223.843 36.5123 6.21396 2.01109
1989  1 1  0 0 1 -1 -1 800  276.468 133.651 283.466 60.8787 37.0704 6.36153 2.10456
1990  1 1  0 0 1 -1 -1 800  442.773 266.034 61.782 22.4105 3.72949 2.44118 0.829905
1991  1 1  0 0 1 -1 -1 800  84.9294 547.547 159.815 5.40229 2.30682 0 0
1992  1 1  0 0 1 -1 -1 800  26.2615 181.571 564.927 26.0989 1.14157 0 0
1993  1 1  0 0 1 -1 -1 800  98.8196 131.278 372.343 189.395 7.63303 0.237772 0.2936
1994  1 1  0 0 1 -1 -1 800  142.655 368.004 185.803 67.1029 34.346 2.08843 0
1995  1 1  0 0 1 -1 -1 800  80.4446 324.617 360.933 21.3737 7.37603 5.25617 0
1990  10 2  0 0 1 -1 -1 800  56.8416 246.844 396.342 98.9494 1.02239 0 0
1991  10 2  0 0 1 -1 -1 800  5.34904 252.009 530.372 12.2697 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 34.4861 742.138 23.3761 0 0 0
1993  10 2  0 0 1 -1 -1 800  3.47753 32.3104 554.59 209.087 0.535725 0 0
1994  10 2  0 0 1 -1 -1 800  9.06249 162.975 491.129 132.491 4.34238 0 0
1995  10 2  0 0 1 -1 -1 800  0 92.3309 679.23 28.4389 0 0 0
1985  4 3  0 0 1 -1 -1 800  0.0113462 87.1995 610.472 102.318 0 0 0
1986  4 3  0 0 1 -1 -1 800  0.0030691 85.5843 607.452 106.961 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 24.9629 657.457 117.58 0 0 0
1988  4 3  0 0 1 -1 -1 800  0.0054683 64.7309 440.728 290.505 4.03002 0 0
1989  4 3  0 0 1 -1 -1 800  0.0392856 56.806 629.544 108.021 5.58974 0 0
1990  4 3  0 0 1 -1 -1 800  0.167978 304.981 383.759 111.091 0 0 0
1991  4 3  0 0 1 -1 -1 800  0.0159579 308.124 478.714 13.1458 0 0 0
1992  4 3  0 0 1 -1 -1 800  0.00217209 43.6399 729.684 26.6737 0 0 0
1993  4 3  0 0 1 -1 -1 800  0.00849559 34.2206 548.709 217.062 0 0 0
1994  4 3  0 0 1 -1 -1 800  0.021618 170.268 487.662 136.39 5.65927 0 0
1995  4 3  0 0 1 -1 -1 800  0.00900727 109.021 659.39 30.6779 0.90198 0 0
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

