#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 04 14:39:41 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659638381 first rand#: 0.190003
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1.00001 #_spawn_month
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
-999 1 1 141236 0.05
1985 1 1 200181 0.05
1986 1 1 166526 0.05
1987 1 1 92146.9 0.05
1988 1 1 25601.4 0.05
1989 1 1 55109.8 0.05
1990 1 1 63876.4 0.05
1991 1 1 74548.2 0.05
1992 1 1 123680 0.05
1993 1 1 209008 0.05
1994 1 1 89436.1 0.05
1995 1 1 45046.6 0.05
1996 1 1 126874 0.05
1997 1 1 94856.2 0.05
1998 1 1 194886 0.05
1999 1 1 149802 0.05
2000 1 1 236356 0.05
2001 1 1 227277 0.05
2002 1 1 223318 0.05
2003 1 1 340605 0.05
2004 1 1 611283 0.05
2005 1 1 737527 0.05
2006 1 1 1.51907e+06 0.05
2007 1 1 835530 0.05
2008 1 1 447501 0.05
2009 1 1 490906 0.05
2010 1 1 493241 0.05
2011 1 1 416329 0.05
2012 1 1 660055 0.05
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
1990 10 2 3.01657e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.34106e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.18245e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.30514e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.47143e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.10512e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.97344e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.27596e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.95457e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.43786e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 1.91803e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.57425e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.10031e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.79456e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.07479e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.96666e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.54392e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 4.07859e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.67898e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.72276e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 4.49421e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.37129e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.78557e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 1.15009e+06 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 492825 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 346321 0.1 #_orig_obs: 954308 survey2
1988 4 3 243627 0.1 #_orig_obs: 245537 survey2
1989 4 3 447612 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.24839e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 972095 0.1 #_orig_obs: 527308 survey2
1992 4 3 418779 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 572318 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 541741 0.1 #_orig_obs: 375877 survey2
1995 4 3 352078 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.13529e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.67803e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.51898e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 879733 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 748342 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 928948 0.1 #_orig_obs: 689461 survey2
2002 4 3 455474 0.1 #_orig_obs: 525909 survey2
2003 4 3 820431 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.02171e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.51916e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.42726e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.19516e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 631325 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.33957e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.95083e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.85364e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.69505e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  121 294 333 43 7 2 0
1986  1 1  0 0 1 -1 -1 800  40 302 378 65 11 4 0
1987  1 1  0 0 1 -1 -1 800  53 103 536 89 15 4 0
1988  1 1  0 0 1 -1 -1 800  83 236 252 189 36 4 0
1989  1 1  0 0 1 -1 -1 800  216 213 282 52 32 5 0
1990  1 1  0 0 1 -1 -1 800  352 268 136 37 7 0 0
1991  1 1  0 0 1 -1 -1 800  127 456 196 20 1 0 0
1992  1 1  0 0 1 -1 -1 800  48 231 481 38 2 0 0
1993  1 1  0 0 1 -1 -1 800  125 140 369 162 4 0 0
1994  1 1  0 0 1 -1 -1 800  181 329 177 83 23 7 0
1995  1 1  0 0 1 -1 -1 800  71 321 360 36 10 2 0
1996  1 1  0 0 1 -1 -1 800  301 121 319 54 5 0 0
1997  1 1  0 0 1 -1 -1 800  274 388 92 36 10 0 0
1998  1 1  0 0 1 -1 -1 800  107 356 324 11 2 0 0
1999  1 1  0 0 1 -1 -1 800  72 219 442 65 2 0 0
2000  1 1  0 0 1 -1 -1 800  73 210 378 133 6 0 0
2001  1 1  0 0 1 -1 -1 800  163 269 262 85 18 3 0
2002  1 1  0 0 1 -1 -1 800  55 397 285 42 15 6 0
2003  1 1  0 0 1 -1 -1 800  204 123 403 60 8 1 1
2004  1 1  0 0 1 -1 -1 800  394 274 80 50 2 0 0
2005  1 1  0 0 1 -1 -1 800  157 507 130 6 0 0 0
2006  1 1  0 0 1 -1 -1 800  117 256 406 21 0 0 0
2007  1 1  0 0 1 -1 -1 800  146 289 310 55 0 0 0
2008  1 1  0 0 1 -1 -1 800  85 360 314 35 6 0 0
2009  1 1  0 0 1 -1 -1 800  231 138 381 43 6 1 0
2010  1 1  0 0 1 -1 -1 800  249 385 129 33 4 0 0
2011  1 1  0 0 1 -1 -1 800  166 369 247 15 3 0 0
2012  1 1  0 0 1 -1 -1 800  126 289 355 30 0 0 0
1990  10 2  0 0 1 -1 -1 800  738 52 7 1 2 0 0
1991  10 2  0 0 1 -1 -1 800  505 257 38 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  379 260 145 16 0 0 0
1993  10 2  0 0 1 -1 -1 800  622 81 56 31 10 0 0
1994  10 2  0 0 1 -1 -1 800  605 151 19 14 11 0 0
1995  10 2  0 0 1 -1 -1 800  471 218 85 11 7 8 0
1996  10 2  0 0 1 -1 -1 800  716 46 34 4 0 0 0
1997  10 2  0 0 1 -1 -1 800  671 115 7 4 3 0 0
1998  10 2  0 0 1 -1 -1 800  506 235 53 5 0 0 1
1999  10 2  0 0 1 -1 -1 800  497 182 101 19 0 1 0
2000  10 2  0 0 1 -1 -1 800  548 151 56 38 6 1 0
2001  10 2  0 0 1 -1 -1 800  605 133 36 13 7 6 0
2002  10 2  0 0 1 -1 -1 800  397 307 65 13 15 1 2
2003  10 2  0 0 1 -1 -1 800  680 66 54 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  739 61 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  559 224 17 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  569 179 50 2 0 0 0
2007  10 2  0 0 1 -1 -1 800  619 146 24 9 2 0 0
2008  10 2  0 0 1 -1 -1 800  444 281 60 14 1 0 0
2009  10 2  0 0 1 -1 -1 800  690 67 35 7 1 0 0
2010  10 2  0 0 1 -1 -1 800  675 115 4 6 0 0 0
2011  10 2  0 0 1 -1 -1 800  601 168 28 3 0 0 0
2012  10 2  0 0 1 -1 -1 800  573 174 49 4 0 0 0
1985  4 3  0 0 1 -1 -1 800  612 136 27 17 8 0 0
1986  4 3  0 0 1 -1 -1 800  360 328 74 24 8 3 3
1987  4 3  0 0 1 -1 -1 800  562 94 102 24 10 3 5
1988  4 3  0 0 1 -1 -1 800  542 156 40 43 14 2 3
1989  4 3  0 0 1 -1 -1 800  684 71 20 5 11 5 4
1990  4 3  0 0 1 -1 -1 800  735 51 8 6 0 0 0
1991  4 3  0 0 1 -1 -1 800  556 216 21 7 0 0 0
1992  4 3  0 0 1 -1 -1 800  419 254 119 8 0 0 0
1993  4 3  0 0 1 -1 -1 800  659 61 46 29 5 0 0
1994  4 3  0 0 1 -1 -1 800  636 124 22 10 8 0 0
1995  4 3  0 0 1 -1 -1 800  515 213 61 8 2 1 0
1996  4 3  0 0 1 -1 -1 800  745 25 21 8 0 0 1
1997  4 3  0 0 1 -1 -1 800  684 106 7 3 0 0 0
1998  4 3  0 0 1 -1 -1 800  562 192 37 9 0 0 0
1999  4 3  0 0 1 -1 -1 800  536 162 83 16 3 0 0
2000  4 3  0 0 1 -1 -1 800  577 134 52 27 10 0 0
2001  4 3  0 0 1 -1 -1 800  662 102 21 8 7 0 0
2002  4 3  0 0 1 -1 -1 800  416 304 53 12 9 6 0
2003  4 3  0 0 1 -1 -1 800  698 47 48 5 2 0 0
2004  4 3  0 0 1 -1 -1 800  738 50 6 2 2 1 1
2005  4 3  0 0 1 -1 -1 800  587 196 17 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  599 149 47 5 0 0 0
2007  4 3  0 0 1 -1 -1 800  625 122 42 11 0 0 0
2008  4 3  0 0 1 -1 -1 800  505 223 56 10 6 0 0
2009  4 3  0 0 1 -1 -1 800  712 51 31 5 1 0 0
2010  4 3  0 0 1 -1 -1 800  680 110 7 3 0 0 0
2011  4 3  0 0 1 -1 -1 800  606 155 35 2 2 0 0
2012  4 3  0 0 1 -1 -1 800  589 161 40 10 0 0 0
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

