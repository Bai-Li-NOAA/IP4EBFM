#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Nov 07 10:13:53 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1667834033 first rand#: 0.224412
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2008 #_EndYr
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
-999 1 1 73476.6 0.05
1985 1 1 13445 0.05
1986 1 1 12476.5 0.05
1987 1 1 6909.87 0.05
1988 1 1 1822.17 0.05
1989 1 1 3708.69 0.05
1990 1 1 80332.2 0.05
1991 1 1 124698 0.05
1992 1 1 235691 0.05
1993 1 1 378730 0.05
1994 1 1 211841 0.05
1995 1 1 135210 0.05
1996 1 1 379241 0.05
1997 1 1 321808 0.05
1998 1 1 814429 0.05
1999 1 1 615462 0.05
2000 1 1 480553 0.05
2001 1 1 347728 0.05
2002 1 1 369246 0.05
2003 1 1 396051 0.05
2004 1 1 425774 0.05
2005 1 1 360152 0.05
2006 1 1 738272 0.05
2007 1 1 314550 0.05
2008 1 1 317012 0.05
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
1990 10 2 2.36433e+06 0.2 #_orig_obs: 565246 survey1
1991 10 2 1.67783e+06 0.2 #_orig_obs: 3.17686e+06 survey1
1992 10 2 1.05229e+06 0.2 #_orig_obs: 6.37058e+06 survey1
1993 10 2 991013 0.2 #_orig_obs: 1.31436e+06 survey1
1994 10 2 1.13728e+06 0.2 #_orig_obs: 702016 survey1
1995 10 2 1.01451e+06 0.2 #_orig_obs: 1.44464e+06 survey1
1996 10 2 1.73692e+06 0.2 #_orig_obs: 819120 survey1
1997 10 2 2.22715e+06 0.2 #_orig_obs: 956532 survey1
1998 10 2 977968 0.2 #_orig_obs: 5.72099e+06 survey1
1999 10 2 804135 0.2 #_orig_obs: 1.80107e+06 survey1
2000 10 2 1.08247e+06 0.2 #_orig_obs: 939122 survey1
2001 10 2 1.20034e+06 0.2 #_orig_obs: 582386 survey1
2002 10 2 566086 0.2 #_orig_obs: 1.16078e+06 survey1
2003 10 2 844635 0.2 #_orig_obs: 315524 survey1
2004 10 2 1.64185e+06 0.2 #_orig_obs: 216162 survey1
2005 10 2 1.06897e+06 0.2 #_orig_obs: 1.39021e+06 survey1
2006 10 2 957957 0.2 #_orig_obs: 1.09307e+06 survey1
2007 10 2 1.64845e+06 0.2 #_orig_obs: 747254 survey1
2008 10 2 1.05153e+06 0.2 #_orig_obs: 3.34384e+06 survey1
1985 4 3 583289 0.2 #_orig_obs: 1.6165e+06 survey2
1986 4 3 240006 0.2 #_orig_obs: 1.81081e+06 survey2
1987 4 3 139921 0.2 #_orig_obs: 798204 survey2
1988 4 3 147330 0.2 #_orig_obs: 203427 survey2
1989 4 3 353292 0.2 #_orig_obs: 202875 survey2
1990 4 3 957490 0.2 #_orig_obs: 113055 survey2
1991 4 3 795518 0.2 #_orig_obs: 381334 survey2
1992 4 3 322179 0.2 #_orig_obs: 2.33967e+06 survey2
1993 4 3 456399 0.2 #_orig_obs: 990740 survey2
1994 4 3 427029 0.2 #_orig_obs: 322724 survey2
1995 4 3 362867 0.2 #_orig_obs: 429031 survey2
1996 4 3 597135 0.2 #_orig_obs: 555860 survey2
1997 4 3 753149 0.2 #_orig_obs: 278987 survey2
1998 4 3 496652 0.2 #_orig_obs: 856773 survey2
1999 4 3 282180 0.2 #_orig_obs: 1.86496e+06 survey2
2000 4 3 386736 0.2 #_orig_obs: 656768 survey2
2001 4 3 539040 0.2 #_orig_obs: 158660 survey2
2002 4 3 362809 0.2 #_orig_obs: 243983 survey2
2003 4 3 499981 0.2 #_orig_obs: 219397 survey2
2004 4 3 654922 0.2 #_orig_obs: 38808.9 survey2
2005 4 3 435151 0.2 #_orig_obs: 146939 survey2
2006 4 3 549049 0.2 #_orig_obs: 647377 survey2
2007 4 3 734096 0.2 #_orig_obs: 313413 survey2
2008 4 3 566844 0.2 #_orig_obs: 594616 survey2
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
1985  1 1  0 0 1 -1 -1 800  129 276 311 71 12 1 0
1986  1 1  0 0 1 -1 -1 800  23 278 401 81 16 1 0
1987  1 1  0 0 1 -1 -1 800  32 112 525 107 23 1 0
1988  1 1  0 0 1 -1 -1 800  75 193 279 214 34 5 0
1989  1 1  0 0 1 -1 -1 800  217 171 300 70 33 7 2
1990  1 1  0 0 1 -1 -1 800  403 254 102 28 8 3 2
1991  1 1  0 0 1 -1 -1 800  95 513 174 13 5 0 0
1992  1 1  0 0 1 -1 -1 800  31 195 547 25 2 0 0
1993  1 1  0 0 1 -1 -1 800  145 115 363 170 6 0 1
1994  1 1  0 0 1 -1 -1 800  174 377 165 56 28 0 0
1995  1 1  0 0 1 -1 -1 800  80 327 365 19 7 2 0
1996  1 1  0 0 1 -1 -1 800  340 150 270 40 0 0 0
1997  1 1  0 0 1 -1 -1 800  232 460 88 17 3 0 0
1998  1 1  0 0 1 -1 -1 800  76 415 295 11 3 0 0
1999  1 1  0 0 1 -1 -1 800  63 235 446 54 1 1 0
2000  1 1  0 0 1 -1 -1 800  186 228 307 73 6 0 0
2001  1 1  0 0 1 -1 -1 800  257 382 130 24 6 1 0
2002  1 1  0 0 1 -1 -1 800  90 444 257 6 2 0 1
2003  1 1  0 0 1 -1 -1 800  217 192 360 30 1 0 0
2004  1 1  0 0 1 -1 -1 800  343 375 66 14 1 0 1
2005  1 1  0 0 1 -1 -1 800  101 524 173 2 0 0 0
2006  1 1  0 0 1 -1 -1 800  186 254 350 10 0 0 0
2007  1 1  0 0 1 -1 -1 800  281 392 116 11 0 0 0
2008  1 1  0 0 1 -1 -1 800  87 461 240 12 0 0 0
1990  10 2  0 0 1 -1 -1 800  742 51 6 0 1 0 0
1991  10 2  0 0 1 -1 -1 800  475 283 32 4 2 2 2
1992  10 2  0 0 1 -1 -1 800  330 240 206 17 3 4 0
1993  10 2  0 0 1 -1 -1 800  619 73 55 46 7 0 0
1994  10 2  0 0 1 -1 -1 800  630 131 12 14 11 2 0
1995  10 2  0 0 1 -1 -1 800  455 278 57 3 4 3 0
1996  10 2  0 0 1 -1 -1 800  721 48 19 12 0 0 0
1997  10 2  0 0 1 -1 -1 800  647 153 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  483 253 64 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  463 216 100 20 1 0 0
2000  10 2  0 0 1 -1 -1 800  700 75 14 8 3 0 0
2001  10 2  0 0 1 -1 -1 800  655 129 12 1 3 0 0
2002  10 2  0 0 1 -1 -1 800  459 307 32 2 0 0 0
2003  10 2  0 0 1 -1 -1 800  717 61 22 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  716 84 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  470 307 23 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  700 74 26 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  708 78 8 6 0 0 0
2008  10 2  0 0 1 -1 -1 800  442 319 35 3 1 0 0
1985  4 3  0 0 1 -1 -1 800  617 118 45 11 9 0 0
1986  4 3  0 0 1 -1 -1 800  362 289 103 37 5 4 0
1987  4 3  0 0 1 -1 -1 800  462 115 138 44 28 11 2
1988  4 3  0 0 1 -1 -1 800  520 136 44 67 20 9 4
1989  4 3  0 0 1 -1 -1 800  699 55 18 9 11 6 2
1990  4 3  0 0 1 -1 -1 800  735 48 11 4 1 1 0
1991  4 3  0 0 1 -1 -1 800  501 275 24 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  380 244 158 16 2 0 0
1993  4 3  0 0 1 -1 -1 800  658 62 37 41 2 0 0
1994  4 3  0 0 1 -1 -1 800  673 93 15 9 10 0 0
1995  4 3  0 0 1 -1 -1 800  508 230 48 4 5 5 0
1996  4 3  0 0 1 -1 -1 800  737 35 18 10 0 0 0
1997  4 3  0 0 1 -1 -1 800  675 115 8 0 2 0 0
1998  4 3  0 0 1 -1 -1 800  450 275 71 3 1 0 0
1999  4 3  0 0 1 -1 -1 800  496 184 101 16 2 0 1
2000  4 3  0 0 1 -1 -1 800  687 82 17 10 4 0 0
2001  4 3  0 0 1 -1 -1 800  667 121 8 3 1 0 0
2002  4 3  0 0 1 -1 -1 800  469 283 41 4 1 2 0
2003  4 3  0 0 1 -1 -1 800  728 39 25 7 0 0 1
2004  4 3  0 0 1 -1 -1 800  717 73 8 2 0 0 0
2005  4 3  0 0 1 -1 -1 800  513 271 16 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  684 83 31 2 0 0 0
2007  4 3  0 0 1 -1 -1 800  703 91 6 0 0 0 0
2008  4 3  0 0 1 -1 -1 800  497 274 29 0 0 0 0
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

