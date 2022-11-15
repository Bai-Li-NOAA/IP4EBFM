#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 20 12:15:36 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1663690536 first rand#: -0.648548
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2002 #_EndYr
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
-999 1 1 79332.1 0.05
1985 1 1 193442 0.05
1986 1 1 175914 0.05
1987 1 1 92450.2 0.05
1988 1 1 26301.7 0.05
1989 1 1 50523.9 0.05
1990 1 1 105056 0.05
1991 1 1 141766 0.05
1992 1 1 355341 0.05
1993 1 1 484367 0.05
1994 1 1 236686 0.05
1995 1 1 155741 0.05
1996 1 1 358682 0.05
1997 1 1 285070 0.05
1998 1 1 771687 0.05
1999 1 1 520315 0.05
2000 1 1 401288 0.05
2001 1 1 253714 0.05
2002 1 1 295170 0.05
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
1990 10 2 2.88683e+06 0.1 #_orig_obs: 753778 survey1
1991 10 2 1.80748e+06 0.1 #_orig_obs: 3.03948e+06 survey1
1992 10 2 1.01053e+06 0.1 #_orig_obs: 5.01039e+06 survey1
1993 10 2 1.02061e+06 0.1 #_orig_obs: 1.02921e+06 survey1
1994 10 2 1.31415e+06 0.1 #_orig_obs: 538085 survey1
1995 10 2 718083 0.1 #_orig_obs: 1.35469e+06 survey1
1996 10 2 2.21986e+06 0.1 #_orig_obs: 855800 survey1
1997 10 2 3.43243e+06 0.1 #_orig_obs: 1.08518e+06 survey1
1998 10 2 1.40682e+06 0.1 #_orig_obs: 6.31316e+06 survey1
1999 10 2 919407 0.1 #_orig_obs: 2.35408e+06 survey1
2000 10 2 1.19826e+06 0.1 #_orig_obs: 1.0043e+06 survey1
2001 10 2 1.49768e+06 0.1 #_orig_obs: 599574 survey1
2002 10 2 774639 0.1 #_orig_obs: 1.47872e+06 survey1
1985 4 3 980900 0.1 #_orig_obs: 1.73725e+06 survey2
1986 4 3 351035 0.1 #_orig_obs: 1.74265e+06 survey2
1987 4 3 261623 0.1 #_orig_obs: 887516 survey2
1988 4 3 227067 0.1 #_orig_obs: 173052 survey2
1989 4 3 368834 0.1 #_orig_obs: 179095 survey2
1990 4 3 1.1699e+06 0.1 #_orig_obs: 122240 survey2
1991 4 3 743774 0.1 #_orig_obs: 495675 survey2
1992 4 3 430694 0.1 #_orig_obs: 2.07029e+06 survey2
1993 4 3 481676 0.1 #_orig_obs: 984464 survey2
1994 4 3 488588 0.1 #_orig_obs: 288569 survey2
1995 4 3 282847 0.1 #_orig_obs: 592388 survey2
1996 4 3 968396 0.1 #_orig_obs: 369457 survey2
1997 4 3 1.18255e+06 0.1 #_orig_obs: 205217 survey2
1998 4 3 756640 0.1 #_orig_obs: 753599 survey2
1999 4 3 421082 0.1 #_orig_obs: 1.54452e+06 survey2
2000 4 3 655408 0.1 #_orig_obs: 517081 survey2
2001 4 3 696260 0.1 #_orig_obs: 229964 survey2
2002 4 3 357828 0.1 #_orig_obs: 344393 survey2
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
1985  1 1  0 0 1 -1 -1 800  131 260 338 61 9 1 0
1986  1 1  0 0 1 -1 -1 800  42 326 336 80 15 1 0
1987  1 1  0 0 1 -1 -1 800  74 122 494 90 14 6 0
1988  1 1  0 0 1 -1 -1 800  81 223 283 192 16 5 0
1989  1 1  0 0 1 -1 -1 800  197 197 305 59 38 4 0
1990  1 1  0 0 1 -1 -1 800  377 247 139 29 4 4 0
1991  1 1  0 0 1 -1 -1 800  131 462 192 11 3 1 0
1992  1 1  0 0 1 -1 -1 800  46 230 496 28 0 0 0
1993  1 1  0 0 1 -1 -1 800  156 157 366 111 8 2 0
1994  1 1  0 0 1 -1 -1 800  176 384 191 35 13 0 1
1995  1 1  0 0 1 -1 -1 800  96 357 324 18 3 2 0
1996  1 1  0 0 1 -1 -1 800  356 143 260 35 6 0 0
1997  1 1  0 0 1 -1 -1 800  251 434 96 19 0 0 0
1998  1 1  0 0 1 -1 -1 800  87 381 324 8 0 0 0
1999  1 1  0 0 1 -1 -1 800  88 218 459 33 2 0 0
2000  1 1  0 0 1 -1 -1 800  235 236 258 64 7 0 0
2001  1 1  0 0 1 -1 -1 800  248 383 152 14 3 0 0
2002  1 1  0 0 1 -1 -1 800  87 395 301 17 0 0 0
1990  10 2  0 0 1 -1 -1 800  717 72 9 0 0 2 0
1991  10 2  0 0 1 -1 -1 800  485 275 30 5 5 0 0
1992  10 2  0 0 1 -1 -1 800  372 257 154 16 1 0 0
1993  10 2  0 0 1 -1 -1 800  610 91 55 36 7 0 1
1994  10 2  0 0 1 -1 -1 800  599 169 14 6 12 0 0
1995  10 2  0 0 1 -1 -1 800  470 260 60 6 2 2 0
1996  10 2  0 0 1 -1 -1 800  742 35 15 6 2 0 0
1997  10 2  0 0 1 -1 -1 800  662 133 5 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  458 299 40 1 2 0 0
1999  10 2  0 0 1 -1 -1 800  455 233 99 13 0 0 0
2000  10 2  0 0 1 -1 -1 800  700 74 17 7 2 0 0
2001  10 2  0 0 1 -1 -1 800  614 164 13 5 2 2 0
2002  10 2  0 0 1 -1 -1 800  434 308 53 4 0 1 0
1985  4 3  0 0 1 -1 -1 800  607 132 42 13 6 0 0
1986  4 3  0 0 1 -1 -1 800  359 309 89 31 6 5 1
1987  4 3  0 0 1 -1 -1 800  519 118 114 30 15 3 1
1988  4 3  0 0 1 -1 -1 800  531 151 36 66 10 2 4
1989  4 3  0 0 1 -1 -1 800  678 64 34 7 15 1 1
1990  4 3  0 0 1 -1 -1 800  749 45 2 4 0 0 0
1991  4 3  0 0 1 -1 -1 800  560 216 24 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  442 211 132 15 0 0 0
1993  4 3  0 0 1 -1 -1 800  662 65 38 30 5 0 0
1994  4 3  0 0 1 -1 -1 800  618 146 23 5 8 0 0
1995  4 3  0 0 1 -1 -1 800  529 196 68 4 2 1 0
1996  4 3  0 0 1 -1 -1 800  738 43 15 3 0 1 0
1997  4 3  0 0 1 -1 -1 800  687 111 2 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  518 238 44 0 0 0 0
1999  4 3  0 0 1 -1 -1 800  532 174 85 7 1 0 1
2000  4 3  0 0 1 -1 -1 800  686 74 31 7 2 0 0
2001  4 3  0 0 1 -1 -1 800  686 101 7 3 3 0 0
2002  4 3  0 0 1 -1 -1 800  470 270 57 3 0 0 0
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

