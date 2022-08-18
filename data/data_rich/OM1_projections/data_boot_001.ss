#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 18 15:57:43 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660852663 first rand#: -1.37474
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
-999 1 1 127978 0.05
1985 1 1 581265 0.05
1986 1 1 297631 0.05
1987 1 1 400128 0.05
1988 1 1 429253 0.05
1989 1 1 439444 0.05
1990 1 1 494719 0.05
1991 1 1 441208 0.05
1992 1 1 342891 0.05
1993 1 1 250224 0.05
1994 1 1 250346 0.05
1995 1 1 334954 0.05
1996 1 1 263601 0.05
1997 1 1 417483 0.05
1998 1 1 404718 0.05
1999 1 1 294340 0.05
2000 1 1 179926 0.05
2001 1 1 266616 0.05
2002 1 1 250352 0.05
2003 1 1 243767 0.05
2004 1 1 259030 0.05
2005 1 1 234388 0.05
2006 1 1 255351 0.05
2007 1 1 209500 0.05
2008 1 1 179967 0.05
2009 1 1 189315 0.05
2010 1 1 275987 0.05
2011 1 1 204492 0.05
2012 1 1 173759 0.05
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
1990 10 2 1.21437e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 1.43168e+06 0.75 #_orig_obs: 457211 survey1
1992 10 2 981355 0.76 #_orig_obs: 654267 survey1
1993 10 2 1.19393e+06 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 844689 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 2.1358e+06 0.74 #_orig_obs: 765889 survey1
1996 10 2 1.16394e+06 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 2.10844e+06 0.59 #_orig_obs: 798920 survey1
1998 10 2 736330 0.88 #_orig_obs: 467336 survey1
1999 10 2 534215 0.61 #_orig_obs: 762429 survey1
2000 10 2 439189 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 1.67465e+06 0.83 #_orig_obs: 181093 survey1
2002 10 2 1.58618e+06 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 1.68263e+06 0.68 #_orig_obs: 433759 survey1
2004 10 2 2.1202e+06 0.73 #_orig_obs: 655693 survey1
2005 10 2 411014 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 4.15105e+06 0.67 #_orig_obs: 848202 survey1
2007 10 2 2.02869e+06 0.59 #_orig_obs: 853227 survey1
2008 10 2 837474 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 916998 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 1.1843e+06 0.8 #_orig_obs: 704446 survey1
2011 10 2 769739 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 1.13366e+06 0.59 #_orig_obs: 472946 survey1
1985 4 3 3.75063e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 2.26073e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 8.01068e+06 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 7.99894e+06 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 3.61736e+06 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 229950 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 1.18411e+07 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 3.28464e+06 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 943362 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 6.35728e+06 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 9.21814e+06 1.13 #_orig_obs: 489338 survey2
1996 4 3 7.63504e+06 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 1.52112e+07 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 1.49412e+06 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 1.52655e+06 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 2.04532e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 2.33289e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 2.83148e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.21588e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 2.51386e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 1.18973e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 1.0464e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 1.35788e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 4.90184e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 1.35857e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 2.40914e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 1.55503e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 1.1897e+06 0.44 #_orig_obs: 2.47554e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  57 249 372 94 21 5 2
1986  1 1  0 0 1 -1 -1 800  48 254 391 84 12 11 0
1987  1 1  0 0 1 -1 -1 800  58 216 402 104 11 4 5
1988  1 1  0 0 1 -1 -1 800  103 285 299 99 12 2 0
1989  1 1  0 0 1 -1 -1 800  73 358 307 43 15 2 2
1990  1 1  0 0 1 -1 -1 800  47 213 489 38 9 4 0
1991  1 1  0 0 1 -1 -1 800  38 224 416 114 7 1 0
1992  1 1  0 0 1 -1 -1 800  51 164 435 120 27 2 1
1993  1 1  0 0 1 -1 -1 800  64 207 363 128 29 9 0
1994  1 1  0 0 1 -1 -1 800  80 219 399 81 15 6 0
1995  1 1  0 0 1 -1 -1 800  68 262 366 78 16 10 0
1996  1 1  0 0 1 -1 -1 800  62 268 376 77 11 6 0
1997  1 1  0 0 1 -1 -1 800  61 204 431 87 15 2 0
1998  1 1  0 0 1 -1 -1 800  51 253 368 103 15 10 0
1999  1 1  0 0 1 -1 -1 800  66 197 427 84 23 3 0
2000  1 1  0 0 1 -1 -1 800  55 222 402 101 13 7 0
2001  1 1  0 0 1 -1 -1 800  53 255 395 79 13 4 1
2002  1 1  0 0 1 -1 -1 800  58 235 415 72 16 4 0
2003  1 1  0 0 1 -1 -1 800  50 236 407 91 16 0 0
2004  1 1  0 0 1 -1 -1 800  78 259 360 85 13 5 0
2005  1 1  0 0 1 -1 -1 800  57 268 389 68 16 2 0
2006  1 1  0 0 1 -1 -1 800  63 183 444 88 18 4 0
2007  1 1  0 0 1 -1 -1 800  68 226 371 112 22 1 0
2008  1 1  0 0 1 -1 -1 800  53 209 405 90 31 12 0
2009  1 1  0 0 1 -1 -1 800  50 232 400 97 16 5 0
2010  1 1  0 0 1 -1 -1 800  44 207 419 104 20 6 0
2011  1 1  0 0 1 -1 -1 800  39 210 419 110 18 4 0
2012  1 1  0 0 1 -1 -1 800  53 196 426 98 24 2 1
1990  10 2  0 0 1 -1 -1 800  592 157 43 6 2 0 0
1991  10 2  0 0 1 -1 -1 800  534 198 50 15 3 0 0
1992  10 2  0 0 1 -1 -1 800  634 129 23 7 7 0 0
1993  10 2  0 0 1 -1 -1 800  616 138 28 13 5 0 0
1994  10 2  0 0 1 -1 -1 800  635 128 20 10 7 0 0
1995  10 2  0 0 1 -1 -1 800  645 138 14 3 0 0 0
1996  10 2  0 0 1 -1 -1 800  614 144 33 8 1 0 0
1997  10 2  0 0 1 -1 -1 800  617 143 33 7 0 0 0
1998  10 2  0 0 1 -1 -1 800  613 144 33 9 0 1 0
1999  10 2  0 0 1 -1 -1 800  626 132 34 8 0 0 0
2000  10 2  0 0 1 -1 -1 800  649 125 17 5 3 1 0
2001  10 2  0 0 1 -1 -1 800  619 139 36 5 1 0 0
2002  10 2  0 0 1 -1 -1 800  621 140 30 6 3 0 0
2003  10 2  0 0 1 -1 -1 800  621 130 40 6 2 1 0
2004  10 2  0 0 1 -1 -1 800  634 132 27 6 1 0 0
2005  10 2  0 0 1 -1 -1 800  589 173 28 6 3 1 0
2006  10 2  0 0 1 -1 -1 800  623 117 48 6 6 0 0
2007  10 2  0 0 1 -1 -1 800  615 150 26 7 2 0 0
2008  10 2  0 0 1 -1 -1 800  629 129 32 7 3 0 0
2009  10 2  0 0 1 -1 -1 800  606 149 33 7 4 1 0
2010  10 2  0 0 1 -1 -1 800  603 154 36 6 1 0 0
2011  10 2  0 0 1 -1 -1 800  575 159 42 20 4 0 0
2012  10 2  0 0 1 -1 -1 800  604 135 45 8 6 1 1
1985  4 3  0 0 1 -1 -1 800  646 110 37 7 0 0 0
1986  4 3  0 0 1 -1 -1 800  603 152 36 7 2 0 0
1987  4 3  0 0 1 -1 -1 800  663 104 29 4 0 0 0
1988  4 3  0 0 1 -1 -1 800  712 70 12 5 1 0 0
1989  4 3  0 0 1 -1 -1 800  634 143 18 3 2 0 0
1990  4 3  0 0 1 -1 -1 800  611 150 38 1 0 0 0
1991  4 3  0 0 1 -1 -1 800  542 194 52 12 0 0 0
1992  4 3  0 0 1 -1 -1 800  642 106 38 11 3 0 0
1993  4 3  0 0 1 -1 -1 800  618 131 38 9 4 0 0
1994  4 3  0 0 1 -1 -1 800  667 94 29 6 4 0 0
1995  4 3  0 0 1 -1 -1 800  632 138 17 11 2 0 0
1996  4 3  0 0 1 -1 -1 800  633 144 19 0 4 0 0
1997  4 3  0 0 1 -1 -1 800  636 123 35 6 0 0 0
1998  4 3  0 0 1 -1 -1 800  588 157 44 7 4 0 0
1999  4 3  0 0 1 -1 -1 800  653 107 32 6 1 1 0
2000  4 3  0 0 1 -1 -1 800  665 112 14 9 0 0 0
2001  4 3  0 0 1 -1 -1 800  652 123 21 3 1 0 0
2002  4 3  0 0 1 -1 -1 800  633 135 23 9 0 0 0
2003  4 3  0 0 1 -1 -1 800  644 120 25 11 0 0 0
2004  4 3  0 0 1 -1 -1 800  638 135 21 6 0 0 0
2005  4 3  0 0 1 -1 -1 800  598 166 25 8 3 0 0
2006  4 3  0 0 1 -1 -1 800  621 115 45 12 5 2 0
2007  4 3  0 0 1 -1 -1 800  608 145 28 16 2 1 0
2008  4 3  0 0 1 -1 -1 800  634 123 28 11 4 0 0
2009  4 3  0 0 1 -1 -1 800  619 133 34 10 4 0 0
2010  4 3  0 0 1 -1 -1 800  612 138 42 7 1 0 0
2011  4 3  0 0 1 -1 -1 800  577 160 48 13 2 0 0
2012  4 3  0 0 1 -1 -1 800  625 129 39 4 1 2 0
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

