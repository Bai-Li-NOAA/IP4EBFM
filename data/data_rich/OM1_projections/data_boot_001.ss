#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 13 10:44:49 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1663080289 first rand#: -0.319661
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
-999 1 1 124520 0.05
1985 1 1 621255 0.05
1986 1 1 287704 0.05
1987 1 1 374463 0.05
1988 1 1 484951 0.05
1989 1 1 490039 0.05
1990 1 1 451175 0.05
1991 1 1 432999 0.05
1992 1 1 333664 0.05
1993 1 1 251047 0.05
1994 1 1 230559 0.05
1995 1 1 370710 0.05
1996 1 1 263210 0.05
1997 1 1 349731 0.05
1998 1 1 375611 0.05
1999 1 1 278048 0.05
2000 1 1 177931 0.05
2001 1 1 266298 0.05
2002 1 1 251342 0.05
2003 1 1 214146 0.05
2004 1 1 233063 0.05
2005 1 1 244196 0.05
2006 1 1 254660 0.05
2007 1 1 210156 0.05
2008 1 1 182331 0.05
2009 1 1 197316 0.05
2010 1 1 274589 0.05
2011 1 1 203537 0.05
2012 1 1 159750 0.05
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
1990 10 2 3.72948e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 1.65672e+06 0.75 #_orig_obs: 457211 survey1
1992 10 2 644770 0.76 #_orig_obs: 654267 survey1
1993 10 2 1.01453e+06 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 1.55855e+06 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 2.10391e+06 0.74 #_orig_obs: 765889 survey1
1996 10 2 989745 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 982895 0.59 #_orig_obs: 798920 survey1
1998 10 2 595987 0.88 #_orig_obs: 467336 survey1
1999 10 2 776328 0.61 #_orig_obs: 762429 survey1
2000 10 2 2.64468e+06 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 444662 0.83 #_orig_obs: 181093 survey1
2002 10 2 2.76155e+06 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 1.1631e+06 0.68 #_orig_obs: 433759 survey1
2004 10 2 1.80923e+06 0.73 #_orig_obs: 655693 survey1
2005 10 2 351350 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 349345 0.67 #_orig_obs: 848202 survey1
2007 10 2 1.11573e+06 0.59 #_orig_obs: 853227 survey1
2008 10 2 337374 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 1.02478e+06 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 1.67544e+06 0.8 #_orig_obs: 704446 survey1
2011 10 2 396965 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 932833 0.59 #_orig_obs: 472946 survey1
1985 4 3 2.12084e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 2.78547e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 597136 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 2.43609e+06 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 1.74513e+06 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 1.29448e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 4.08568e+06 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 661637 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 8.80762e+06 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 93034.2 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 1.20778e+07 1.13 #_orig_obs: 489338 survey2
1996 4 3 580064 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 3.9899e+06 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 972355 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 963221 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 3.69498e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 1.52194e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 1.22791e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.75802e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 2.10463e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 2.58595e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 5.58002e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 3.06113e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 4.61387e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 3.51059e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 1.40654e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 2.62951e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 627256 0.44 #_orig_obs: 2.47554e+06 survey2
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
50 # maximum size in the population (lower edge of last bin) 
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
1985  1 1  0 0 1 -1 -1 800  65 241 360 107 19 3 5
1986  1 1  0 0 1 -1 -1 800  47 257 394 82 14 6 0
1987  1 1  0 0 1 -1 -1 800  55 187 442 90 15 4 7
1988  1 1  0 0 1 -1 -1 800  112 276 318 77 15 2 0
1989  1 1  0 0 1 -1 -1 800  64 357 318 39 15 5 2
1990  1 1  0 0 1 -1 -1 800  37 253 463 46 1 0 0
1991  1 1  0 0 1 -1 -1 800  33 216 423 117 9 2 0
1992  1 1  0 0 1 -1 -1 800  46 159 441 124 28 2 0
1993  1 1  0 0 1 -1 -1 800  61 244 336 118 33 8 0
1994  1 1  0 0 1 -1 -1 800  76 235 383 75 28 3 0
1995  1 1  0 0 1 -1 -1 800  60 245 378 98 12 7 0
1996  1 1  0 0 1 -1 -1 800  72 233 405 74 14 2 0
1997  1 1  0 0 1 -1 -1 800  63 204 422 94 13 4 0
1998  1 1  0 0 1 -1 -1 800  44 246 388 100 15 7 0
1999  1 1  0 0 1 -1 -1 800  63 215 401 96 19 6 0
2000  1 1  0 0 1 -1 -1 800  87 225 378 92 12 6 0
2001  1 1  0 0 1 -1 -1 800  61 247 390 79 19 3 1
2002  1 1  0 0 1 -1 -1 800  59 247 393 76 17 5 3
2003  1 1  0 0 1 -1 -1 800  76 231 390 81 22 0 0
2004  1 1  0 0 1 -1 -1 800  66 222 404 88 14 6 0
2005  1 1  0 0 1 -1 -1 800  53 265 368 86 19 9 0
2006  1 1  0 0 1 -1 -1 800  54 193 448 86 14 5 0
2007  1 1  0 0 1 -1 -1 800  59 236 353 127 18 7 0
2008  1 1  0 0 1 -1 -1 800  62 201 419 95 15 8 0
2009  1 1  0 0 1 -1 -1 800  61 234 364 115 21 5 0
2010  1 1  0 0 1 -1 -1 800  36 218 428 98 16 4 0
2011  1 1  0 0 1 -1 -1 800  39 201 416 118 22 4 0
2012  1 1  0 0 1 -1 -1 800  54 174 405 127 30 6 4
1990  10 2  0 0 1 -1 -1 800  584 163 49 2 2 0 0
1991  10 2  0 0 1 -1 -1 800  556 179 50 11 4 0 0
1992  10 2  0 0 1 -1 -1 800  636 114 34 14 2 0 0
1993  10 2  0 0 1 -1 -1 800  620 138 25 12 5 0 0
1994  10 2  0 0 1 -1 -1 800  645 110 37 5 3 0 0
1995  10 2  0 0 1 -1 -1 800  656 120 16 6 1 1 0
1996  10 2  0 0 1 -1 -1 800  614 155 23 5 2 1 0
1997  10 2  0 0 1 -1 -1 800  617 151 25 7 0 0 0
1998  10 2  0 0 1 -1 -1 800  591 165 36 5 3 0 0
1999  10 2  0 0 1 -1 -1 800  630 132 29 6 3 0 0
2000  10 2  0 0 1 -1 -1 800  652 103 32 12 1 0 0
2001  10 2  0 0 1 -1 -1 800  646 130 15 8 1 0 0
2002  10 2  0 0 1 -1 -1 800  613 156 21 8 2 0 0
2003  10 2  0 0 1 -1 -1 800  633 127 35 3 2 0 0
2004  10 2  0 0 1 -1 -1 800  664 98 29 6 3 0 0
2005  10 2  0 0 1 -1 -1 800  573 180 36 7 3 1 0
2006  10 2  0 0 1 -1 -1 800  622 130 35 9 4 0 0
2007  10 2  0 0 1 -1 -1 800  621 133 27 12 7 0 0
2008  10 2  0 0 1 -1 -1 800  637 122 30 6 5 0 0
2009  10 2  0 0 1 -1 -1 800  615 140 31 12 1 1 0
2010  10 2  0 0 1 -1 -1 800  575 165 40 12 6 2 0
2011  10 2  0 0 1 -1 -1 800  587 156 41 10 4 2 0
2012  10 2  0 0 1 -1 -1 800  613 127 46 11 2 1 0
1985  4 3  0 0 1 -1 -1 800  629 132 26 13 0 0 0
1986  4 3  0 0 1 -1 -1 800  614 148 28 7 2 1 0
1987  4 3  0 0 1 -1 -1 800  658 101 31 7 2 1 0
1988  4 3  0 0 1 -1 -1 800  692 88 13 3 3 1 0
1989  4 3  0 0 1 -1 -1 800  641 136 18 3 2 0 0
1990  4 3  0 0 1 -1 -1 800  589 157 46 8 0 0 0
1991  4 3  0 0 1 -1 -1 800  595 162 38 5 0 0 0
1992  4 3  0 0 1 -1 -1 800  641 105 37 13 4 0 0
1993  4 3  0 0 1 -1 -1 800  652 109 26 11 2 0 0
1994  4 3  0 0 1 -1 -1 800  662 111 22 3 2 0 0
1995  4 3  0 0 1 -1 -1 800  640 136 20 3 1 0 0
1996  4 3  0 0 1 -1 -1 800  643 131 20 5 1 0 0
1997  4 3  0 0 1 -1 -1 800  615 139 41 4 1 0 0
1998  4 3  0 0 1 -1 -1 800  575 173 38 10 4 0 0
1999  4 3  0 0 1 -1 -1 800  644 116 31 7 1 1 0
2000  4 3  0 0 1 -1 -1 800  661 109 20 6 2 2 0
2001  4 3  0 0 1 -1 -1 800  651 119 27 2 1 0 0
2002  4 3  0 0 1 -1 -1 800  627 135 33 5 0 0 0
2003  4 3  0 0 1 -1 -1 800  630 125 32 13 0 0 0
2004  4 3  0 0 1 -1 -1 800  677 94 20 5 4 0 0
2005  4 3  0 0 1 -1 -1 800  574 188 28 8 2 0 0
2006  4 3  0 0 1 -1 -1 800  624 123 41 6 5 1 0
2007  4 3  0 0 1 -1 -1 800  639 124 29 6 1 1 0
2008  4 3  0 0 1 -1 -1 800  639 122 31 6 2 0 0
2009  4 3  0 0 1 -1 -1 800  629 131 30 8 2 0 0
2010  4 3  0 0 1 -1 -1 800  602 161 26 8 3 0 0
2011  4 3  0 0 1 -1 -1 800  580 171 39 7 3 0 0
2012  4 3  0 0 1 -1 -1 800  602 133 51 10 3 1 0
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

