#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Dec 07 11:59:21 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1670432361 first rand#: -0.656751
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
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
-999 1 1 122146 0.05
1985 1 1 13527.6 0.05
1986 1 1 12961.5 0.05
1987 1 1 6876 0.05
1988 1 1 1897.16 0.05
1989 1 1 3652.66 0.05
1990 1 1 76122.8 0.05
1991 1 1 121423 0.05
1992 1 1 256478 0.05
1993 1 1 432095 0.05
1994 1 1 237018 0.05
1995 1 1 148987 0.05
1996 1 1 415968 0.05
1997 1 1 338954 0.05
1998 1 1 1.02477e+06 0.05
1999 1 1 616196 0.05
2000 1 1 484369 0.05
2001 1 1 300758 0.05
2002 1 1 310380 0.05
2003 1 1 180614 0.05
2004 1 1 170274 0.05
2005 1 1 131424 0.05
2006 1 1 194523 0.05
2007 1 1 102375 0.05
2008 1 1 137500 0.05
2009 1 1 172397 0.05
2010 1 1 131417 0.05
2011 1 1 236450 0.05
2012 1 1 376782 0.05
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
1990 10 2 606128 0.1 #_orig_obs: 559970 survey1
1991 10 2 2.41127e+06 0.1 #_orig_obs: 4.1271e+06 survey1
1992 10 2 8.01077e+06 0.1 #_orig_obs: 7.13121e+06 survey1
1993 10 2 3.20126e+06 0.1 #_orig_obs: 1.66483e+06 survey1
1994 10 2 871489 0.1 #_orig_obs: 613678 survey1
1995 10 2 1.70252e+06 0.1 #_orig_obs: 1.43796e+06 survey1
1996 10 2 1.01433e+06 0.1 #_orig_obs: 845940 survey1
1997 10 2 710253 0.1 #_orig_obs: 770676 survey1
1998 10 2 2.35272e+06 0.1 #_orig_obs: 5.12954e+06 survey1
1999 10 2 2.08069e+06 0.1 #_orig_obs: 1.39835e+06 survey1
2000 10 2 451018 0.1 #_orig_obs: 494764 survey1
2001 10 2 206538 0.1 #_orig_obs: 377871 survey1
2002 10 2 261096 0.1 #_orig_obs: 325152 survey1
2003 10 2 79645.7 0.1 #_orig_obs: 58372.8 survey1
2004 10 2 40735.3 0.1 #_orig_obs: 37164.9 survey1
2005 10 2 164696 0.1 #_orig_obs: 162458 survey1
2006 10 2 178270 0.1 #_orig_obs: 169167 survey1
2007 10 2 195993 0.1 #_orig_obs: 183701 survey1
2008 10 2 655320 0.1 #_orig_obs: 744596 survey1
2009 10 2 395220 0.1 #_orig_obs: 276588 survey1
2010 10 2 341632 0.1 #_orig_obs: 354944 survey1
2011 10 2 1.66631e+06 0.1 #_orig_obs: 2.18964e+06 survey1
2012 10 2 1.53859e+06 0.1 #_orig_obs: 1.09137e+06 survey1
1985 4 3 857566 0.1 #_orig_obs: 1.90597e+06 survey2
1986 4 3 962220 0.1 #_orig_obs: 2.21911e+06 survey2
1987 4 3 808173 0.1 #_orig_obs: 1.05381e+06 survey2
1988 4 3 311750 0.1 #_orig_obs: 192092 survey2
1989 4 3 206195 0.1 #_orig_obs: 179548 survey2
1990 4 3 167094 0.1 #_orig_obs: 129115 survey2
1991 4 3 691118 0.1 #_orig_obs: 328697 survey2
1992 4 3 2.00195e+06 0.1 #_orig_obs: 2.00105e+06 survey2
1993 4 3 648941 0.1 #_orig_obs: 1.03349e+06 survey2
1994 4 3 264219 0.1 #_orig_obs: 250591 survey2
1995 4 3 371231 0.1 #_orig_obs: 515878 survey2
1996 4 3 299993 0.1 #_orig_obs: 419123 survey2
1997 4 3 306922 0.1 #_orig_obs: 211584 survey2
1998 4 3 791979 0.1 #_orig_obs: 852235 survey2
1999 4 3 724166 0.1 #_orig_obs: 1.03369e+06 survey2
2000 4 3 261425 0.1 #_orig_obs: 333299 survey2
2001 4 3 108095 0.1 #_orig_obs: 100039 survey2
2002 4 3 133363 0.1 #_orig_obs: 179415 survey2
2003 4 3 51723.8 0.1 #_orig_obs: 72751 survey2
2004 4 3 25919.5 0.1 #_orig_obs: 8396.46 survey2
2005 4 3 66638.1 0.1 #_orig_obs: 29003.8 survey2
2006 4 3 101045 0.1 #_orig_obs: 95924.2 survey2
2007 4 3 75134.5 0.1 #_orig_obs: 43712.8 survey2
2008 4 3 177618 0.1 #_orig_obs: 132667 survey2
2009 4 3 128156 0.1 #_orig_obs: 174806 survey2
2010 4 3 103095 0.1 #_orig_obs: 63441.7 survey2
2011 4 3 404991 0.1 #_orig_obs: 289129 survey2
2012 4 3 473601 0.1 #_orig_obs: 706797 survey2
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
1985  1 1  0 0 1 -1 -1 800  121 286 326 58 8 1 0
1986  1 1  0 0 1 -1 -1 800  33 301 384 72 9 0 1
1987  1 1  0 0 1 -1 -1 800  42 97 523 125 12 1 0
1988  1 1  0 0 1 -1 -1 800  43 212 268 230 37 7 3
1989  1 1  0 0 1 -1 -1 800  289 119 281 65 43 3 0
1990  1 1  0 0 1 -1 -1 800  452 254 63 25 1 4 1
1991  1 1  0 0 1 -1 -1 800  88 572 134 5 1 0 0
1992  1 1  0 0 1 -1 -1 800  22 172 577 27 2 0 0
1993  1 1  0 0 1 -1 -1 800  112 130 360 194 4 0 0
1994  1 1  0 0 1 -1 -1 800  177 343 178 63 38 1 0
1995  1 1  0 0 1 -1 -1 800  60 367 337 22 9 5 0
1996  1 1  0 0 1 -1 -1 800  376 115 266 38 5 0 0
1997  1 1  0 0 1 -1 -1 800  214 512 61 13 0 0 0
1998  1 1  0 0 1 -1 -1 800  69 419 304 8 0 0 0
1999  1 1  0 0 1 -1 -1 800  50 254 457 39 0 0 0
2000  1 1  0 0 1 -1 -1 800  207 229 275 87 2 0 0
2001  1 1  0 0 1 -1 -1 800  151 503 118 19 9 0 0
2002  1 1  0 0 1 -1 -1 800  45 448 300 6 1 0 0
2003  1 1  0 0 1 -1 -1 800  316 165 304 15 0 0 0
2004  1 1  0 0 1 -1 -1 800  356 400 37 6 1 0 0
2005  1 1  0 0 1 -1 -1 800  108 538 154 0 0 0 0
2006  1 1  0 0 1 -1 -1 800  306 203 282 9 0 0 0
2007  1 1  0 0 1 -1 -1 800  190 496 101 13 0 0 0
2008  1 1  0 0 1 -1 -1 800  54 388 346 10 2 0 0
2009  1 1  0 0 1 -1 -1 800  378 102 283 35 2 0 0
2010  1 1  0 0 1 -1 -1 800  275 459 51 14 1 0 0
2011  1 1  0 0 1 -1 -1 800  96 423 276 5 0 0 0
2012  1 1  0 0 1 -1 -1 800  128 230 399 43 0 0 0
1990  10 2  0 0 1 -1 -1 800  36 232 443 88 1 0 0
1991  10 2  0 0 1 -1 -1 800  6 197 584 13 0 0 0
1992  10 2  0 0 1 -1 -1 800  0 31 752 17 0 0 0
1993  10 2  0 0 1 -1 -1 800  0 31 558 211 0 0 0
1994  10 2  0 0 1 -1 -1 800  10 137 530 117 6 0 0
1995  10 2  0 0 1 -1 -1 800  0 93 687 20 0 0 0
1996  10 2  0 0 1 -1 -1 800  15 33 677 75 0 0 0
1997  10 2  0 0 1 -1 -1 800  18 370 353 59 0 0 0
1998  10 2  0 0 1 -1 -1 800  3 112 678 7 0 0 0
1999  10 2  0 0 1 -1 -1 800  0 48 711 41 0 0 0
2000  10 2  0 0 1 -1 -1 800  7 84 608 100 1 0 0
2001  10 2  0 0 1 -1 -1 800  15 340 406 39 0 0 0
2002  10 2  0 0 1 -1 -1 800  3 183 604 10 0 0 0
2003  10 2  0 0 1 -1 -1 800  22 90 660 28 0 0 0
2004  10 2  0 0 1 -1 -1 800  63 554 159 24 0 0 0
2005  10 2  0 0 1 -1 -1 800  3 322 475 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  9 109 671 11 0 0 0
2007  10 2  0 0 1 -1 -1 800  12 292 470 26 0 0 0
2008  10 2  0 0 1 -1 -1 800  0 103 687 10 0 0 0
2009  10 2  0 0 1 -1 -1 800  18 40 697 45 0 0 0
2010  10 2  0 0 1 -1 -1 800  30 394 321 55 0 0 0
2011  10 2  0 0 1 -1 -1 800  2 118 677 3 0 0 0
2012  10 2  0 0 1 -1 -1 800  4 58 708 30 0 0 0
1985  4 3  0 0 1 -1 -1 800  0 128 580 92 0 0 0
1986  4 3  0 0 1 -1 -1 800  0 114 605 81 0 0 0
1987  4 3  0 0 1 -1 -1 800  0 39 660 101 0 0 0
1988  4 3  0 0 1 -1 -1 800  0 76 426 296 2 0 0
1989  4 3  0 0 1 -1 -1 800  0 60 609 129 2 0 0
1990  4 3  0 0 1 -1 -1 800  0 358 349 93 0 0 0
1991  4 3  0 0 1 -1 -1 800  1 324 464 11 0 0 0
1992  4 3  0 0 1 -1 -1 800  0 39 731 30 0 0 0
1993  4 3  0 0 1 -1 -1 800  0 41 544 215 0 0 0
1994  4 3  0 0 1 -1 -1 800  0 208 451 139 2 0 0
1995  4 3  0 0 1 -1 -1 800  0 138 628 34 0 0 0
1996  4 3  0 0 1 -1 -1 800  0 49 678 73 0 0 0
1997  4 3  0 0 1 -1 -1 800  1 498 247 54 0 0 0
1998  4 3  0 0 1 -1 -1 800  0 170 623 7 0 0 0
1999  4 3  0 0 1 -1 -1 800  0 79 671 50 0 0 0
2000  4 3  0 0 1 -1 -1 800  0 86 600 114 0 0 0
2001  4 3  0 0 1 -1 -1 800  0 338 420 42 0 0 0
2002  4 3  0 0 1 -1 -1 800  0 145 643 12 0 0 0
2003  4 3  0 0 1 -1 -1 800  0 59 712 29 0 0 0
2004  4 3  0 0 1 -1 -1 800  0 543 235 22 0 0 0
2005  4 3  0 0 1 -1 -1 800  0 359 441 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  0 102 680 18 0 0 0
2007  4 3  0 0 1 -1 -1 800  0 380 386 34 0 0 0
2008  4 3  0 0 1 -1 -1 800  0 167 622 11 0 0 0
2009  4 3  0 0 1 -1 -1 800  0 43 702 55 0 0 0
2010  4 3  0 0 1 -1 -1 800  0 488 242 70 0 0 0
2011  4 3  0 0 1 -1 -1 800  1 199 589 11 0 0 0
2012  4 3  0 0 1 -1 -1 800  0 74 681 45 0 0 0
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

