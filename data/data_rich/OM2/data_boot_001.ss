#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Sep 06 09:10:36 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662469836 first rand#: -0.138295
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
-999 1 1 121004 0.05
1985 1 1 191531 0.05
1986 1 1 164527 0.05
1987 1 1 88321.9 0.05
1988 1 1 24378.9 0.05
1989 1 1 52206.7 0.05
1990 1 1 64652.3 0.05
1991 1 1 76489.7 0.05
1992 1 1 137423 0.05
1993 1 1 206338 0.05
1994 1 1 99353 0.05
1995 1 1 45820.2 0.05
1996 1 1 117182 0.05
1997 1 1 98655.1 0.05
1998 1 1 184520 0.05
1999 1 1 148984 0.05
2000 1 1 233748 0.05
2001 1 1 221054 0.05
2002 1 1 202716 0.05
2003 1 1 344392 0.05
2004 1 1 579568 0.05
2005 1 1 769521 0.05
2006 1 1 1.48166e+06 0.05
2007 1 1 813128 0.05
2008 1 1 380665 0.05
2009 1 1 527532 0.05
2010 1 1 469137 0.05
2011 1 1 426555 0.05
2012 1 1 681889 0.05
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
1990 10 2 3.17884e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 2.15427e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.31148e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.60578e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.51574e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 866023 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.94233e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 5.00223e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 2.96242e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.28622e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 1.88256e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.23941e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.18985e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 1.99736e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.2721e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 4.66705e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.29402e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.67401e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.87384e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 4.08063e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 5.01751e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 5.2954e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 4.22168e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 893506 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 481810 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 384240 0.1 #_orig_obs: 954308 survey2
1988 4 3 261177 0.1 #_orig_obs: 245537 survey2
1989 4 3 373890 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.09957e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 817937 0.1 #_orig_obs: 527308 survey2
1992 4 3 503276 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 516433 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 572202 0.1 #_orig_obs: 375877 survey2
1995 4 3 310565 0.1 #_orig_obs: 528242 survey2
1996 4 3 957190 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.85428e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.1955e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 721315 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 772873 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 854586 0.1 #_orig_obs: 689461 survey2
2002 4 3 483691 0.1 #_orig_obs: 525909 survey2
2003 4 3 995694 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.16301e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.35669e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.33288e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.33169e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 657897 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.47255e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.83095e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 1.93581e+06 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 1.49408e+06 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  126 278 317 66 11 2 0
1986  1 1  0 0 1 -1 -1 800  38 299 376 83 4 0 0
1987  1 1  0 0 1 -1 -1 800  62 116 502 104 11 5 0
1988  1 1  0 0 1 -1 -1 800  74 243 259 202 16 6 0
1989  1 1  0 0 1 -1 -1 800  228 192 296 47 32 3 2
1990  1 1  0 0 1 -1 -1 800  377 256 125 31 11 0 0
1991  1 1  0 0 1 -1 -1 800  125 457 197 18 2 1 0
1992  1 1  0 0 1 -1 -1 800  29 239 501 30 1 0 0
1993  1 1  0 0 1 -1 -1 800  131 124 398 145 2 0 0
1994  1 1  0 0 1 -1 -1 800  178 345 169 84 21 3 0
1995  1 1  0 0 1 -1 -1 800  72 297 386 28 14 3 0
1996  1 1  0 0 1 -1 -1 800  338 129 276 54 1 1 1
1997  1 1  0 0 1 -1 -1 800  240 386 122 42 10 0 0
1998  1 1  0 0 1 -1 -1 800  103 369 316 11 1 0 0
1999  1 1  0 0 1 -1 -1 800  68 214 448 67 3 0 0
2000  1 1  0 0 1 -1 -1 800  121 188 386 96 9 0 0
2001  1 1  0 0 1 -1 -1 800  184 285 244 69 17 1 0
2002  1 1  0 0 1 -1 -1 800  40 381 308 57 11 3 0
2003  1 1  0 0 1 -1 -1 800  192 132 419 47 7 3 0
2004  1 1  0 0 1 -1 -1 800  400 275 77 42 6 0 0
2005  1 1  0 0 1 -1 -1 800  157 456 172 15 0 0 0
2006  1 1  0 0 1 -1 -1 800  110 275 401 14 0 0 0
2007  1 1  0 0 1 -1 -1 800  179 271 310 39 1 0 0
2008  1 1  0 0 1 -1 -1 800  72 356 324 41 7 0 0
2009  1 1  0 0 1 -1 -1 800  227 142 382 42 5 2 0
2010  1 1  0 0 1 -1 -1 800  235 385 130 43 7 0 0
2011  1 1  0 0 1 -1 -1 800  157 356 268 17 2 0 0
2012  1 1  0 0 1 -1 -1 800  138 269 356 37 0 0 0
1990  10 2  0 0 1 -1 -1 800  729 59 9 3 0 0 0
1991  10 2  0 0 1 -1 -1 800  505 263 32 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  373 268 136 23 0 0 0
1993  10 2  0 0 1 -1 -1 800  617 87 57 36 3 0 0
1994  10 2  0 0 1 -1 -1 800  590 157 21 18 14 0 0
1995  10 2  0 0 1 -1 -1 800  472 235 65 16 9 3 0
1996  10 2  0 0 1 -1 -1 800  729 33 24 14 0 0 0
1997  10 2  0 0 1 -1 -1 800  655 129 10 6 0 0 0
1998  10 2  0 0 1 -1 -1 800  501 249 42 4 2 2 0
1999  10 2  0 0 1 -1 -1 800  474 182 114 27 1 2 0
2000  10 2  0 0 1 -1 -1 800  561 147 56 32 2 2 0
2001  10 2  0 0 1 -1 -1 800  644 105 30 8 12 1 0
2002  10 2  0 0 1 -1 -1 800  386 313 61 19 10 8 3
2003  10 2  0 0 1 -1 -1 800  696 57 47 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  734 66 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  541 238 21 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  594 158 44 4 0 0 0
2007  10 2  0 0 1 -1 -1 800  619 134 34 12 1 0 0
2008  10 2  0 0 1 -1 -1 800  418 308 59 12 3 0 0
2009  10 2  0 0 1 -1 -1 800  690 63 38 6 2 1 0
2010  10 2  0 0 1 -1 -1 800  667 117 10 6 0 0 0
2011  10 2  0 0 1 -1 -1 800  587 172 33 8 0 0 0
2012  10 2  0 0 1 -1 -1 800  571 173 49 7 0 0 0
1985  4 3  0 0 1 -1 -1 800  643 108 32 13 4 0 0
1986  4 3  0 0 1 -1 -1 800  379 306 84 23 6 0 2
1987  4 3  0 0 1 -1 -1 800  510 106 124 41 11 4 4
1988  4 3  0 0 1 -1 -1 800  558 151 44 34 5 5 3
1989  4 3  0 0 1 -1 -1 800  689 60 33 9 7 1 1
1990  4 3  0 0 1 -1 -1 800  742 43 10 5 0 0 0
1991  4 3  0 0 1 -1 -1 800  541 229 24 6 0 0 0
1992  4 3  0 0 1 -1 -1 800  434 233 115 18 0 0 0
1993  4 3  0 0 1 -1 -1 800  668 56 53 21 2 0 0
1994  4 3  0 0 1 -1 -1 800  614 138 20 17 11 0 0
1995  4 3  0 0 1 -1 -1 800  521 202 61 5 5 6 0
1996  4 3  0 0 1 -1 -1 800  749 31 16 1 3 0 0
1997  4 3  0 0 1 -1 -1 800  689 101 6 4 0 0 0
1998  4 3  0 0 1 -1 -1 800  524 221 50 5 0 0 0
1999  4 3  0 0 1 -1 -1 800  534 162 80 23 1 0 0
2000  4 3  0 0 1 -1 -1 800  597 125 38 32 8 0 0
2001  4 3  0 0 1 -1 -1 800  650 102 28 12 4 3 1
2002  4 3  0 0 1 -1 -1 800  416 299 53 14 7 11 0
2003  4 3  0 0 1 -1 -1 800  719 37 38 4 1 1 0
2004  4 3  0 0 1 -1 -1 800  736 56 3 5 0 0 0
2005  4 3  0 0 1 -1 -1 800  571 210 17 0 0 1 1
2006  4 3  0 0 1 -1 -1 800  585 164 47 4 0 0 0
2007  4 3  0 0 1 -1 -1 800  631 119 40 10 0 0 0
2008  4 3  0 0 1 -1 -1 800  498 238 52 7 5 0 0
2009  4 3  0 0 1 -1 -1 800  726 52 15 5 0 2 0
2010  4 3  0 0 1 -1 -1 800  686 100 13 1 0 0 0
2011  4 3  0 0 1 -1 -1 800  609 159 28 2 2 0 0
2012  4 3  0 0 1 -1 -1 800  607 140 41 12 0 0 0
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

