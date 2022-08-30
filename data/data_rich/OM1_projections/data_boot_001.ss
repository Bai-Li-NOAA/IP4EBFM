#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Aug 30 09:08:33 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661864913 first rand#: 0.874822
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
-999 1 1 123432 0.05
1985 1 1 597865 0.05
1986 1 1 286241 0.05
1987 1 1 380658 0.05
1988 1 1 401693 0.05
1989 1 1 463044 0.05
1990 1 1 507834 0.05
1991 1 1 476614 0.05
1992 1 1 315121 0.05
1993 1 1 255893 0.05
1994 1 1 210624 0.05
1995 1 1 340964 0.05
1996 1 1 273996 0.05
1997 1 1 355333 0.05
1998 1 1 398475 0.05
1999 1 1 296089 0.05
2000 1 1 183578 0.05
2001 1 1 267642 0.05
2002 1 1 245043 0.05
2003 1 1 234304 0.05
2004 1 1 221190 0.05
2005 1 1 222950 0.05
2006 1 1 265213 0.05
2007 1 1 213009 0.05
2008 1 1 177120 0.05
2009 1 1 201296 0.05
2010 1 1 281054 0.05
2011 1 1 211381 0.05
2012 1 1 157854 0.05
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
1990 10 2 2.07104e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 297666 0.75 #_orig_obs: 457211 survey1
1992 10 2 1.02107e+06 0.76 #_orig_obs: 654267 survey1
1993 10 2 769307 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 1.02105e+06 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 349206 0.74 #_orig_obs: 765889 survey1
1996 10 2 758656 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 567154 0.59 #_orig_obs: 798920 survey1
1998 10 2 1.3874e+06 0.88 #_orig_obs: 467336 survey1
1999 10 2 1.41471e+06 0.61 #_orig_obs: 762429 survey1
2000 10 2 473284 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 418572 0.83 #_orig_obs: 181093 survey1
2002 10 2 817834 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 563895 0.68 #_orig_obs: 433759 survey1
2004 10 2 1.33791e+06 0.73 #_orig_obs: 655693 survey1
2005 10 2 602019 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 1.07442e+06 0.67 #_orig_obs: 848202 survey1
2007 10 2 707658 0.59 #_orig_obs: 853227 survey1
2008 10 2 1.36192e+06 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 913444 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 441543 0.8 #_orig_obs: 704446 survey1
2011 10 2 1.35442e+06 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 527371 0.59 #_orig_obs: 472946 survey1
1985 4 3 1.53365e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 3.68937e+07 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 1.84378e+07 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 9.58245e+06 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 833939 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 9.86961e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 2.3659e+06 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 946305 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 1.71034e+06 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 151600 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 532018 1.13 #_orig_obs: 489338 survey2
1996 4 3 5.71717e+06 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 258641 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 962111 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 1.95755e+06 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 3.13937e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 1.57763e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 1.22901e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 1.74752e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 1.14293e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 2.66253e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 2.07208e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 1.5194e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 1.68434e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 2.95879e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 946735 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 1.57048e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 907581 0.44 #_orig_obs: 2.47554e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  70 231 352 110 28 5 4
1986  1 1  0 0 1 -1 -1 800  47 250 394 86 13 10 0
1987  1 1  0 0 1 -1 -1 800  75 205 411 88 16 4 1
1988  1 1  0 0 1 -1 -1 800  119 250 330 80 14 2 5
1989  1 1  0 0 1 -1 -1 800  55 354 327 49 13 2 0
1990  1 1  0 0 1 -1 -1 800  53 236 452 47 6 6 0
1991  1 1  0 0 1 -1 -1 800  31 197 448 111 11 2 0
1992  1 1  0 0 1 -1 -1 800  48 159 445 116 25 5 2
1993  1 1  0 0 1 -1 -1 800  46 231 349 141 29 4 0
1994  1 1  0 0 1 -1 -1 800  74 211 405 84 20 6 0
1995  1 1  0 0 1 -1 -1 800  66 276 349 91 14 4 0
1996  1 1  0 0 1 -1 -1 800  68 240 407 65 12 8 0
1997  1 1  0 0 1 -1 -1 800  64 229 412 79 15 1 0
1998  1 1  0 0 1 -1 -1 800  49 241 411 81 16 2 0
1999  1 1  0 0 1 -1 -1 800  57 212 428 77 19 7 0
2000  1 1  0 0 1 -1 -1 800  73 238 364 107 15 3 0
2001  1 1  0 0 1 -1 -1 800  67 232 395 79 18 6 3
2002  1 1  0 0 1 -1 -1 800  65 258 372 88 13 2 2
2003  1 1  0 0 1 -1 -1 800  54 232 390 103 21 0 0
2004  1 1  0 0 1 -1 -1 800  72 215 406 81 20 6 0
2005  1 1  0 0 1 -1 -1 800  59 242 389 88 21 1 0
2006  1 1  0 0 1 -1 -1 800  62 170 456 89 20 3 0
2007  1 1  0 0 1 -1 -1 800  54 220 381 117 26 2 0
2008  1 1  0 0 1 -1 -1 800  64 229 396 84 22 5 0
2009  1 1  0 0 1 -1 -1 800  44 232 388 107 17 12 0
2010  1 1  0 0 1 -1 -1 800  53 223 423 88 10 3 0
2011  1 1  0 0 1 -1 -1 800  46 182 436 109 17 10 0
2012  1 1  0 0 1 -1 -1 800  46 171 415 133 29 3 3
1990  10 2  0 0 1 -1 -1 800  616 139 41 3 1 0 0
1991  10 2  0 0 1 -1 -1 800  572 169 47 11 1 0 0
1992  10 2  0 0 1 -1 -1 800  619 116 43 16 6 0 0
1993  10 2  0 0 1 -1 -1 800  618 152 17 10 3 0 0
1994  10 2  0 0 1 -1 -1 800  651 106 34 7 2 0 0
1995  10 2  0 0 1 -1 -1 800  650 122 20 6 2 0 0
1996  10 2  0 0 1 -1 -1 800  635 129 32 2 1 1 0
1997  10 2  0 0 1 -1 -1 800  621 135 34 10 0 0 0
1998  10 2  0 0 1 -1 -1 800  621 143 29 6 1 0 0
1999  10 2  0 0 1 -1 -1 800  645 121 28 3 2 1 0
2000  10 2  0 0 1 -1 -1 800  632 135 28 3 2 0 0
2001  10 2  0 0 1 -1 -1 800  623 141 28 3 5 0 0
2002  10 2  0 0 1 -1 -1 800  637 132 26 5 0 0 0
2003  10 2  0 0 1 -1 -1 800  626 132 28 8 3 3 0
2004  10 2  0 0 1 -1 -1 800  644 117 23 14 2 0 0
2005  10 2  0 0 1 -1 -1 800  585 174 32 5 3 1 0
2006  10 2  0 0 1 -1 -1 800  642 109 37 9 3 0 0
2007  10 2  0 0 1 -1 -1 800  617 135 36 8 4 0 0
2008  10 2  0 0 1 -1 -1 800  608 141 33 12 6 0 0
2009  10 2  0 0 1 -1 -1 800  621 127 35 12 3 1 1
2010  10 2  0 0 1 -1 -1 800  590 153 41 10 4 2 0
2011  10 2  0 0 1 -1 -1 800  588 155 39 11 3 3 1
2012  10 2  0 0 1 -1 -1 800  615 132 34 11 5 1 2
1985  4 3  0 0 1 -1 -1 800  630 132 26 12 0 0 0
1986  4 3  0 0 1 -1 -1 800  618 142 34 5 0 1 0
1987  4 3  0 0 1 -1 -1 800  660 104 29 6 1 0 0
1988  4 3  0 0 1 -1 -1 800  704 75 17 2 2 0 0
1989  4 3  0 0 1 -1 -1 800  630 148 14 5 3 0 0
1990  4 3  0 0 1 -1 -1 800  587 164 41 8 0 0 0
1991  4 3  0 0 1 -1 -1 800  582 152 53 13 0 0 0
1992  4 3  0 0 1 -1 -1 800  642 115 35 5 3 0 0
1993  4 3  0 0 1 -1 -1 800  642 108 38 10 2 0 0
1994  4 3  0 0 1 -1 -1 800  624 138 32 3 3 0 0
1995  4 3  0 0 1 -1 -1 800  651 116 26 5 1 1 0
1996  4 3  0 0 1 -1 -1 800  637 133 25 3 2 0 0
1997  4 3  0 0 1 -1 -1 800  628 124 39 9 0 0 0
1998  4 3  0 0 1 -1 -1 800  597 157 36 10 0 0 0
1999  4 3  0 0 1 -1 -1 800  663 106 26 5 0 0 0
2000  4 3  0 0 1 -1 -1 800  646 131 15 8 0 0 0
2001  4 3  0 0 1 -1 -1 800  648 122 21 8 1 0 0
2002  4 3  0 0 1 -1 -1 800  623 138 30 9 0 0 0
2003  4 3  0 0 1 -1 -1 800  622 127 39 12 0 0 0
2004  4 3  0 0 1 -1 -1 800  675 102 17 4 2 0 0
2005  4 3  0 0 1 -1 -1 800  583 185 24 5 3 0 0
2006  4 3  0 0 1 -1 -1 800  618 135 35 11 0 1 0
2007  4 3  0 0 1 -1 -1 800  640 120 33 4 3 0 0
2008  4 3  0 0 1 -1 -1 800  631 126 31 10 2 0 0
2009  4 3  0 0 1 -1 -1 800  619 131 33 13 4 0 0
2010  4 3  0 0 1 -1 -1 800  603 140 48 5 4 0 0
2011  4 3  0 0 1 -1 -1 800  582 151 50 15 2 0 0
2012  4 3  0 0 1 -1 -1 800  603 135 43 13 6 0 0
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

