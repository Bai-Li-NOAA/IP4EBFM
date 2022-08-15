#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 15 09:26:45 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1660570005 first rand#: 0.550592
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
-999 1 1 134767 0.05
1985 1 1 633860 0.05
1986 1 1 298544 0.05
1987 1 1 419948 0.05
1988 1 1 438958 0.05
1989 1 1 472191 0.05
1990 1 1 491820 0.05
1991 1 1 481729 0.05
1992 1 1 306511 0.05
1993 1 1 229462 0.05
1994 1 1 230127 0.05
1995 1 1 354003 0.05
1996 1 1 259184 0.05
1997 1 1 393826 0.05
1998 1 1 392898 0.05
1999 1 1 289202 0.05
2000 1 1 201050 0.05
2001 1 1 240340 0.05
2002 1 1 239652 0.05
2003 1 1 232692 0.05
2004 1 1 216275 0.05
2005 1 1 242858 0.05
2006 1 1 260474 0.05
2007 1 1 208347 0.05
2008 1 1 159071 0.05
2009 1 1 190866 0.05
2010 1 1 264367 0.05
2011 1 1 218340 0.05
2012 1 1 166615 0.05
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
1990 10 2 1.09837e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 177971 0.75 #_orig_obs: 457211 survey1
1992 10 2 307730 0.76 #_orig_obs: 654267 survey1
1993 10 2 563946 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 758149 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 3.93908e+06 0.74 #_orig_obs: 765889 survey1
1996 10 2 393298 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 916439 0.59 #_orig_obs: 798920 survey1
1998 10 2 375712 0.88 #_orig_obs: 467336 survey1
1999 10 2 756652 0.61 #_orig_obs: 762429 survey1
2000 10 2 820277 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 2.30653e+06 0.83 #_orig_obs: 181093 survey1
2002 10 2 635222 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 1.4317e+06 0.68 #_orig_obs: 433759 survey1
2004 10 2 488725 0.73 #_orig_obs: 655693 survey1
2005 10 2 513086 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 1.42322e+06 0.67 #_orig_obs: 848202 survey1
2007 10 2 1.81647e+06 0.59 #_orig_obs: 853227 survey1
2008 10 2 1.74351e+06 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 701588 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 1.3589e+06 0.8 #_orig_obs: 704446 survey1
2011 10 2 1.30536e+06 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 585666 0.59 #_orig_obs: 472946 survey1
1985 4 3 1.73698e+07 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 3.93842e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 2.03515e+06 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 991556 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 1.24988e+07 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 1.74975e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 1.05649e+07 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 2.00821e+06 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 2.17148e+06 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 499398 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 2.51653e+06 1.13 #_orig_obs: 489338 survey2
1996 4 3 1.03216e+06 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 2.61936e+06 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 2.25326e+06 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 801198 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 1.39473e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 1.70277e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 2.12708e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.33416e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 2.22579e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 3.75928e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 1.32932e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 2.48114e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 2.90847e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 2.10312e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 1.51911e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 1.10496e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 869727 0.44 #_orig_obs: 2.47554e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  58 236 372 107 18 9 0
1986  1 1  0 0 1 -1 -1 800  47 255 384 90 13 11 0
1987  1 1  0 0 1 -1 -1 800  59 200 418 103 15 4 1
1988  1 1  0 0 1 -1 -1 800  98 264 326 83 21 3 5
1989  1 1  0 0 1 -1 -1 800  65 350 328 46 8 2 1
1990  1 1  0 0 1 -1 -1 800  57 234 449 54 5 1 0
1991  1 1  0 0 1 -1 -1 800  37 200 448 99 13 3 0
1992  1 1  0 0 1 -1 -1 800  57 159 443 116 23 1 1
1993  1 1  0 0 1 -1 -1 800  50 214 367 136 27 6 0
1994  1 1  0 0 1 -1 -1 800  76 228 380 84 26 6 0
1995  1 1  0 0 1 -1 -1 800  75 256 360 85 17 7 0
1996  1 1  0 0 1 -1 -1 800  66 256 401 62 13 2 0
1997  1 1  0 0 1 -1 -1 800  47 243 405 87 10 8 0
1998  1 1  0 0 1 -1 -1 800  45 243 395 103 12 2 0
1999  1 1  0 0 1 -1 -1 800  69 198 436 80 16 1 0
2000  1 1  0 0 1 -1 -1 800  64 217 382 103 28 6 0
2001  1 1  0 0 1 -1 -1 800  64 239 375 100 18 4 0
2002  1 1  0 0 1 -1 -1 800  62 244 387 91 13 2 1
2003  1 1  0 0 1 -1 -1 800  69 226 411 85 9 0 0
2004  1 1  0 0 1 -1 -1 800  58 226 401 93 15 7 0
2005  1 1  0 0 1 -1 -1 800  52 256 379 90 21 2 0
2006  1 1  0 0 1 -1 -1 800  49 196 439 87 19 10 0
2007  1 1  0 0 1 -1 -1 800  61 230 373 108 21 7 0
2008  1 1  0 0 1 -1 -1 800  56 215 411 88 24 6 0
2009  1 1  0 0 1 -1 -1 800  58 240 399 85 12 6 0
2010  1 1  0 0 1 -1 -1 800  39 215 415 99 24 8 0
2011  1 1  0 0 1 -1 -1 800  39 206 419 108 20 8 0
2012  1 1  0 0 1 -1 -1 800  47 186 417 115 28 3 4
1990  10 2  0 0 1 -1 -1 800  586 169 37 5 3 0 0
1991  10 2  0 0 1 -1 -1 800  541 187 53 17 2 0 0
1992  10 2  0 0 1 -1 -1 800  618 124 38 15 5 0 0
1993  10 2  0 0 1 -1 -1 800  621 134 30 13 2 0 0
1994  10 2  0 0 1 -1 -1 800  661 110 22 3 4 0 0
1995  10 2  0 0 1 -1 -1 800  659 121 17 2 0 1 0
1996  10 2  0 0 1 -1 -1 800  605 149 39 3 1 3 0
1997  10 2  0 0 1 -1 -1 800  606 149 40 5 0 0 0
1998  10 2  0 0 1 -1 -1 800  602 173 14 9 2 0 0
1999  10 2  0 0 1 -1 -1 800  633 119 34 8 3 3 0
2000  10 2  0 0 1 -1 -1 800  646 127 20 4 2 0 1
2001  10 2  0 0 1 -1 -1 800  648 132 14 4 2 0 0
2002  10 2  0 0 1 -1 -1 800  634 123 35 6 2 0 0
2003  10 2  0 0 1 -1 -1 800  621 139 29 8 2 1 0
2004  10 2  0 0 1 -1 -1 800  658 110 25 5 2 0 0
2005  10 2  0 0 1 -1 -1 800  573 180 35 10 2 0 0
2006  10 2  0 0 1 -1 -1 800  636 114 37 12 1 0 0
2007  10 2  0 0 1 -1 -1 800  601 158 27 12 2 0 0
2008  10 2  0 0 1 -1 -1 800  628 131 36 2 3 0 0
2009  10 2  0 0 1 -1 -1 800  620 140 29 8 3 0 0
2010  10 2  0 0 1 -1 -1 800  583 161 44 8 3 1 0
2011  10 2  0 0 1 -1 -1 800  572 177 36 11 3 1 0
2012  10 2  0 0 1 -1 -1 800  598 147 38 11 5 0 1
1985  4 3  0 0 1 -1 -1 800  628 138 25 9 0 0 0
1986  4 3  0 0 1 -1 -1 800  620 145 27 5 1 2 0
1987  4 3  0 0 1 -1 -1 800  648 112 33 5 2 0 0
1988  4 3  0 0 1 -1 -1 800  702 78 15 3 1 1 0
1989  4 3  0 0 1 -1 -1 800  626 151 19 3 1 0 0
1990  4 3  0 0 1 -1 -1 800  606 155 35 4 0 0 0
1991  4 3  0 0 1 -1 -1 800  565 185 38 12 0 0 0
1992  4 3  0 0 1 -1 -1 800  625 118 44 9 4 0 0
1993  4 3  0 0 1 -1 -1 800  621 137 34 8 0 0 0
1994  4 3  0 0 1 -1 -1 800  663 108 22 5 2 0 0
1995  4 3  0 0 1 -1 -1 800  646 126 19 7 1 1 0
1996  4 3  0 0 1 -1 -1 800  627 142 28 3 0 0 0
1997  4 3  0 0 1 -1 -1 800  612 128 54 5 0 0 1
1998  4 3  0 0 1 -1 -1 800  597 155 34 10 4 0 0
1999  4 3  0 0 1 -1 -1 800  634 116 38 9 2 1 0
2000  4 3  0 0 1 -1 -1 800  647 115 30 7 1 0 0
2001  4 3  0 0 1 -1 -1 800  657 118 19 5 1 0 0
2002  4 3  0 0 1 -1 -1 800  633 116 40 11 0 0 0
2003  4 3  0 0 1 -1 -1 800  629 130 31 10 0 0 0
2004  4 3  0 0 1 -1 -1 800  662 100 31 4 3 0 0
2005  4 3  0 0 1 -1 -1 800  620 138 32 10 0 0 0
2006  4 3  0 0 1 -1 -1 800  641 112 38 7 1 1 0
2007  4 3  0 0 1 -1 -1 800  624 136 29 6 4 1 0
2008  4 3  0 0 1 -1 -1 800  618 140 25 14 2 0 1
2009  4 3  0 0 1 -1 -1 800  617 142 29 9 3 0 0
2010  4 3  0 0 1 -1 -1 800  609 147 34 7 3 0 0
2011  4 3  0 0 1 -1 -1 800  595 143 43 14 5 0 0
2012  4 3  0 0 1 -1 -1 800  589 150 42 13 4 2 0
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

