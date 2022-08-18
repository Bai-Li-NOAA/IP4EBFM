#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 18 16:25:30 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660854330 first rand#: -0.463686
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
-999 1 1 136675 0.05
1985 1 1 184969 0.05
1986 1 1 179118 0.05
1987 1 1 91436 0.05
1988 1 1 25032.4 0.05
1989 1 1 54052.7 0.05
1990 1 1 61519.5 0.05
1991 1 1 76425.9 0.05
1992 1 1 128358 0.05
1993 1 1 205538 0.05
1994 1 1 89678.5 0.05
1995 1 1 46808.9 0.05
1996 1 1 117659 0.05
1997 1 1 89958.1 0.05
1998 1 1 187719 0.05
1999 1 1 147923 0.05
2000 1 1 227247 0.05
2001 1 1 211693 0.05
2002 1 1 196883 0.05
2003 1 1 340124 0.05
2004 1 1 595082 0.05
2005 1 1 767924 0.05
2006 1 1 1.42877e+06 0.05
2007 1 1 837966 0.05
2008 1 1 423803 0.05
2009 1 1 500184 0.05
2010 1 1 499035 0.05
2011 1 1 395996 0.05
2012 1 1 684677 0.05
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
1990 10 2 3.16942e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.28174e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.5012e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.71855e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.46786e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 1.11988e+06 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.10158e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 4.80721e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 3.51469e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.2345e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.05369e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.65173e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.31984e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.3237e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 4.89439e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.2796e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.34074e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.4709e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 2.23358e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 3.43504e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.06979e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 4.96826e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.2725e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 955592 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 435507 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 318656 0.1 #_orig_obs: 954308 survey2
1988 4 3 252035 0.1 #_orig_obs: 245537 survey2
1989 4 3 487405 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.28159e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 923589 0.1 #_orig_obs: 527308 survey2
1992 4 3 419690 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 487437 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 483449 0.1 #_orig_obs: 375877 survey2
1995 4 3 388994 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.21593e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.68269e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.28259e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 761514 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 896850 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 971663 0.1 #_orig_obs: 689461 survey2
2002 4 3 468817 0.1 #_orig_obs: 525909 survey2
2003 4 3 891260 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.8111e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.60094e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.32242e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.25173e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 688711 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.49002e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.91435e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.69043e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.33881e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  139 267 327 55 11 1 0
1986  1 1  0 0 1 -1 -1 800  46 300 374 68 9 3 0
1987  1 1  0 0 1 -1 -1 800  67 102 516 95 18 2 0
1988  1 1  0 0 1 -1 -1 800  92 225 260 205 17 1 0
1989  1 1  0 0 1 -1 -1 800  214 237 268 48 30 2 1
1990  1 1  0 0 1 -1 -1 800  377 250 147 19 7 0 0
1991  1 1  0 0 1 -1 -1 800  125 472 185 17 1 0 0
1992  1 1  0 0 1 -1 -1 800  53 214 500 32 1 0 0
1993  1 1  0 0 1 -1 -1 800  127 127 397 143 6 0 0
1994  1 1  0 0 1 -1 -1 800  163 350 184 79 24 0 0
1995  1 1  0 0 1 -1 -1 800  71 310 376 34 6 3 0
1996  1 1  0 0 1 -1 -1 800  314 129 291 60 5 1 0
1997  1 1  0 0 1 -1 -1 800  273 384 96 45 2 0 0
1998  1 1  0 0 1 -1 -1 800  112 352 316 15 5 0 0
1999  1 1  0 0 1 -1 -1 800  71 196 480 51 2 0 0
2000  1 1  0 0 1 -1 -1 800  108 202 357 115 18 0 0
2001  1 1  0 0 1 -1 -1 800  173 244 280 89 13 1 0
2002  1 1  0 0 1 -1 -1 800  64 379 296 44 12 5 0
2003  1 1  0 0 1 -1 -1 800  215 114 404 56 7 3 1
2004  1 1  0 0 1 -1 -1 800  409 279 65 45 2 0 0
2005  1 1  0 0 1 -1 -1 800  150 506 136 8 0 0 0
2006  1 1  0 0 1 -1 -1 800  112 285 389 14 0 0 0
2007  1 1  0 0 1 -1 -1 800  139 303 311 46 1 0 0
2008  1 1  0 0 1 -1 -1 800  60 365 314 49 12 0 0
2009  1 1  0 0 1 -1 -1 800  206 140 389 55 10 0 0
2010  1 1  0 0 1 -1 -1 800  248 383 112 47 10 0 0
2011  1 1  0 0 1 -1 -1 800  149 359 273 16 3 0 0
2012  1 1  0 0 1 -1 -1 800  139 305 323 32 1 0 0
1990  10 2  0 0 1 -1 -1 800  703 85 7 3 2 0 0
1991  10 2  0 0 1 -1 -1 800  530 236 34 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  399 256 125 20 0 0 0
1993  10 2  0 0 1 -1 -1 800  618 85 57 33 7 0 0
1994  10 2  0 0 1 -1 -1 800  594 151 22 18 15 0 0
1995  10 2  0 0 1 -1 -1 800  453 243 84 10 5 5 0
1996  10 2  0 0 1 -1 -1 800  729 26 39 6 0 0 0
1997  10 2  0 0 1 -1 -1 800  673 116 4 3 4 0 0
1998  10 2  0 0 1 -1 -1 800  523 225 44 4 3 0 1
1999  10 2  0 0 1 -1 -1 800  467 201 111 19 0 2 0
2000  10 2  0 0 1 -1 -1 800  538 145 71 36 10 0 0
2001  10 2  0 0 1 -1 -1 800  619 126 32 12 9 2 0
2002  10 2  0 0 1 -1 -1 800  380 326 59 20 12 2 1
2003  10 2  0 0 1 -1 -1 800  699 52 49 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  743 57 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  546 236 18 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  581 164 49 6 0 0 0
2007  10 2  0 0 1 -1 -1 800  637 123 27 10 3 0 0
2008  10 2  0 0 1 -1 -1 800  469 270 41 17 3 0 0
2009  10 2  0 0 1 -1 -1 800  698 58 32 8 2 2 0
2010  10 2  0 0 1 -1 -1 800  683 94 14 9 0 0 0
2011  10 2  0 0 1 -1 -1 800  579 185 30 6 0 0 0
2012  10 2  0 0 1 -1 -1 800  579 160 45 11 4 0 1
1985  4 3  0 0 1 -1 -1 800  618 131 36 9 6 0 0
1986  4 3  0 0 1 -1 -1 800  370 306 86 24 12 2 0
1987  4 3  0 0 1 -1 -1 800  547 104 100 36 6 5 2
1988  4 3  0 0 1 -1 -1 800  563 138 38 45 12 2 2
1989  4 3  0 0 1 -1 -1 800  692 65 23 8 8 2 2
1990  4 3  0 0 1 -1 -1 800  733 54 6 7 0 0 0
1991  4 3  0 0 1 -1 -1 800  529 239 26 6 0 0 0
1992  4 3  0 0 1 -1 -1 800  412 242 131 15 0 0 0
1993  4 3  0 0 1 -1 -1 800  647 70 44 33 6 0 0
1994  4 3  0 0 1 -1 -1 800  615 150 17 10 8 0 0
1995  4 3  0 0 1 -1 -1 800  507 206 73 4 4 6 0
1996  4 3  0 0 1 -1 -1 800  755 25 14 5 1 0 0
1997  4 3  0 0 1 -1 -1 800  693 99 4 4 0 0 0
1998  4 3  0 0 1 -1 -1 800  562 194 39 5 0 0 0
1999  4 3  0 0 1 -1 -1 800  518 172 87 22 1 0 0
2000  4 3  0 0 1 -1 -1 800  575 137 54 22 12 0 0
2001  4 3  0 0 1 -1 -1 800  657 97 21 11 11 3 0
2002  4 3  0 0 1 -1 -1 800  422 301 55 13 8 1 0
2003  4 3  0 0 1 -1 -1 800  691 52 46 10 0 1 0
2004  4 3  0 0 1 -1 -1 800  743 46 5 4 1 0 1
2005  4 3  0 0 1 -1 -1 800  576 208 16 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  604 142 48 6 0 0 0
2007  4 3  0 0 1 -1 -1 800  647 112 31 10 0 0 0
2008  4 3  0 0 1 -1 -1 800  487 236 67 5 5 0 0
2009  4 3  0 0 1 -1 -1 800  725 45 24 5 1 0 0
2010  4 3  0 0 1 -1 -1 800  666 122 6 5 1 0 0
2011  4 3  0 0 1 -1 -1 800  606 161 26 1 6 0 0
2012  4 3  0 0 1 -1 -1 800  604 141 40 15 0 0 0
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

