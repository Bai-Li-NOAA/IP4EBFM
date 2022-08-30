#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:12:36 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661865156 first rand#: -0.652731
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
-999 1 1 220445 0.05
1985 1 1 137962 0.05
1986 1 1 134042 0.05
1987 1 1 28145.5 0.05
1988 1 1 1981.75 0.05
1989 1 1 2991.35 0.05
1990 1 1 18995.3 0.05
1991 1 1 27183.3 0.05
1992 1 1 67385.8 0.05
1993 1 1 153337 0.05
1994 1 1 24893.1 0.05
1995 1 1 4354.08 0.05
1996 1 1 13431.8 0.05
1997 1 1 54884.7 0.05
1998 1 1 163392 0.05
1999 1 1 127870 0.05
2000 1 1 224975 0.05
2001 1 1 138813 0.05
2002 1 1 12681.5 0.05
2003 1 1 51531.1 0.05
2004 1 1 174115 0.05
2005 1 1 639108 0.05
2006 1 1 3.10556e+06 0.05
2007 1 1 2.13939e+06 0.05
2008 1 1 238067 0.05
2009 1 1 316501 0.05
2010 1 1 468384 0.05
2011 1 1 900076 0.05
2012 1 1 1.06384e+06 0.05
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
1990 10 2 3.67545e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 3.79122e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.70797e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.47492e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 960008 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.14449e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.77474e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 3.97426e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 5.20496e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.3793e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.70038e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.36417e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.45621e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.58411e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 5.74604e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 8.73164e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.66583e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 3.11131e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.40504e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.06098e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 5.36036e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 3.79826e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 2.77899e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 995630 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 532260 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 445695 0.1 #_orig_obs: 572537 survey2
1988 4 3 449624 0.1 #_orig_obs: 204010 survey2
1989 4 3 374901 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.37534e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.49793e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 549048 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 446478 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 333101 0.1 #_orig_obs: 418617 survey2
1995 4 3 498948 0.1 #_orig_obs: 310064 survey2
1996 4 3 775859 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.31062e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.84364e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.25036e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 813159 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 842212 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 673386 0.1 #_orig_obs: 577555 survey2
2003 4 3 1.05087e+06 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.41488e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.72706e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.60986e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.01594e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 401807 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 840113 0.1 #_orig_obs: 624374 survey2
2010 4 3 2.01009e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.76382e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 922834 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  392 235 138 55 27 2 3
1986  1 1  0 0 1 -1 -1 583  130 220 137 65 24 6 1
1987  1 1  0 0 1 -1 -1 762  282 110 232 93 26 14 5
1988  1 1  0 0 1 -1 -1 737  296 186 76 112 54 9 4
1989  1 1  0 0 1 -1 -1 692  246 212 131 29 60 12 2
1990  1 1  0 0 1 -1 -1 684  553 42 57 19 6 6 1
1991  1 1  0 0 1 -1 -1 777  411 310 26 22 5 0 3
1992  1 1  0 0 1 -1 -1 568  110 243 182 21 6 6 0
1993  1 1  0 0 1 -1 -1 548  168 70 195 110 3 1 1
1994  1 1  0 0 1 -1 -1 526  180 113 67 115 48 3 0
1995  1 1  0 0 1 -1 -1 500  236 111 80 26 34 12 1
1996  1 1  0 0 1 -1 -1 463  272 93 57 25 4 8 4
1997  1 1  0 0 1 -1 -1 454  342 80 23 5 2 1 1
1998  1 1  0 0 1 -1 -1 459  279 129 43 4 4 0 0
1999  1 1  0 0 1 -1 -1 428  153 162 91 16 2 2 2
2000  1 1  0 0 1 -1 -1 366  110 88 109 50 7 2 0
2001  1 1  0 0 1 -1 -1 501  219 91 81 87 19 2 2
2002  1 1  0 0 1 -1 -1 439  138 166 71 39 20 4 1
2003  1 1  0 0 1 -1 -1 402  209 65 83 23 10 8 4
2004  1 1  0 0 1 -1 -1 459  358 49 19 23 7 2 1
2005  1 1  0 0 1 -1 -1 394  210 143 32 5 4 0 0
2006  1 1  0 0 1 -1 -1 421  168 148 88 17 0 0 0
2007  1 1  0 0 1 -1 -1 532  213 157 110 42 10 0 0
2008  1 1  0 0 1 -1 -1 445  92 153 131 53 16 0 0
2009  1 1  0 0 1 -1 -1 402  235 46 64 40 17 0 0
2010  1 1  0 0 1 -1 -1 442  331 74 15 16 6 0 0
2011  1 1  0 0 1 -1 -1 434  158 216 52 5 3 0 0
2012  1 1  0 0 1 -1 -1 370  130 92 113 27 8 0 0
1990  10 2  0 0 1 -1 -1 118  107 11 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  24 14 2 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  30 61 28 2 1 0 0
1993  10 2  0 0 1 -1 -1 119  70 14 30 5 0 0 0
1994  10 2  0 0 1 -1 -1 53  30 23 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  181 48 22 4 6 0 0
1996  10 2  0 0 1 -1 -1 192  145 31 10 6 0 0 0
1997  10 2  0 0 1 -1 -1 110  93 17 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  122 47 7 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  236 180 67 12 0 0 0
2000  10 2  0 0 1 -1 -1 464  241 125 76 19 3 0 0
2001  10 2  0 0 1 -1 -1 268  184 47 24 11 2 0 0
2002  10 2  0 0 1 -1 -1 602  260 236 59 36 9 2 0
2003  10 2  0 0 1 -1 -1 56  43 9 4 0 0 0 0
2004  10 2  0 0 1 -1 -1 294  255 39 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  493 225 19 2 0 1 0
2006  10 2  0 0 1 -1 -1 335  196 84 52 3 0 0 0
2007  10 2  0 0 1 -1 -1 553  295 173 68 16 1 0 0
2008  10 2  0 0 1 -1 -1 344  127 145 57 15 0 0 0
2009  10 2  0 0 1 -1 -1 149  119 15 15 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  134 38 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  465 375 44 2 2 1 0
2012  10 2  0 0 1 -1 -1 464  264 125 68 7 0 0 0
1985  4 3  0 0 1 -1 -1 1000  730 179 71 14 4 2 0
1986  4 3  0 0 1 -1 -1 1000  457 377 110 39 12 5 0
1987  4 3  0 0 1 -1 -1 1000  702 119 129 36 13 1 0
1988  4 3  0 0 1 -1 -1 1000  735 174 32 37 10 8 4
1989  4 3  0 0 1 -1 -1 1000  659 241 66 13 16 3 2
1990  4 3  0 0 1 -1 -1 1000  928 45 22 5 0 0 0
1991  4 3  0 0 1 -1 -1 1000  739 238 14 6 3 0 0
1992  4 3  0 0 1 -1 -1 1000  392 426 163 9 7 3 0
1993  4 3  0 0 1 -1 -1 1000  654 119 157 70 0 0 0
1994  4 3  0 0 1 -1 -1 1000  667 210 39 60 24 0 0
1995  4 3  0 0 1 -1 -1 1000  762 152 57 11 12 6 0
1996  4 3  0 0 1 -1 -1 1000  827 136 22 9 2 3 1
1997  4 3  0 0 1 -1 -1 1000  895 89 12 4 0 0 0
1998  4 3  0 0 1 -1 -1 1000  771 203 20 6 0 0 0
1999  4 3  0 0 1 -1 -1 1000  644 268 76 11 1 0 0
2000  4 3  0 0 1 -1 -1 1000  675 175 121 24 2 3 0
2001  4 3  0 0 1 -1 -1 1000  770 138 49 32 11 0 0
2002  4 3  0 0 1 -1 -1 1000  574 306 74 29 11 6 0
2003  4 3  0 0 1 -1 -1 1000  820 102 60 13 3 1 1
2004  4 3  0 0 1 -1 -1 1000  907 75 10 6 2 0 0
2005  4 3  0 0 1 -1 -1 1000  762 214 21 1 2 0 0
2006  4 3  0 0 1 -1 -1 1000  674 242 78 6 0 0 0
2007  4 3  0 0 1 -1 -1 1000  665 231 79 25 0 0 0
2008  4 3  0 0 1 -1 -1 1000  532 303 123 34 8 0 0
2009  4 3  0 0 1 -1 -1 1000  882 57 37 18 4 2 0
2010  4 3  0 0 1 -1 -1 1000  903 97 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  630 326 38 6 0 0 0
2012  4 3  0 0 1 -1 -1 1000  683 186 115 16 0 0 0
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

