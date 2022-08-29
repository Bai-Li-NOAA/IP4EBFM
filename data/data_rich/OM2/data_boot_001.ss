#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 29 11:41:55 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661787715 first rand#: -0.501457
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
-999 1 1 11885.9 0.05
1985 1 1 195476 0.05
1986 1 1 167737 0.05
1987 1 1 99769.5 0.05
1988 1 1 26549 0.05
1989 1 1 46770.2 0.05
1990 1 1 65631.2 0.05
1991 1 1 76722 0.05
1992 1 1 142412 0.05
1993 1 1 195216 0.05
1994 1 1 93771 0.05
1995 1 1 49636 0.05
1996 1 1 119436 0.05
1997 1 1 97008.8 0.05
1998 1 1 187142 0.05
1999 1 1 161946 0.05
2000 1 1 251607 0.05
2001 1 1 205793 0.05
2002 1 1 202894 0.05
2003 1 1 198833 0.05
2004 1 1 214184 0.05
2005 1 1 420105 0.05
2006 1 1 419582 0.05
2007 1 1 306852 0.05
2008 1 1 221039 0.05
2009 1 1 181586 0.05
2010 1 1 180694 0.05
2011 1 1 205389 0.05
2012 1 1 158930 0.05
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
1990 10 2 3.99102e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 3.63586e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.80392e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.4501e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.55409e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 875438 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 2.90775e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 6.6279e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.65438e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 3.42451e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 3.06625e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 3.29559e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 1.33127e+06 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 1.98087e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 5.88789e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 5.81799e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.58363e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 3.26166e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 1.47541e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.55767e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 3.09784e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 1.70199e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 1.02883e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 998173 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 352072 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 275073 0.1 #_orig_obs: 954308 survey2
1988 4 3 184871 0.1 #_orig_obs: 245537 survey2
1989 4 3 404220 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.80264e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.27655e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 608106 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 615824 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 704990 0.1 #_orig_obs: 375877 survey2
1995 4 3 383465 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.32699e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 2.3995e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.68544e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.20821e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 1.34603e+06 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 1.41662e+06 0.1 #_orig_obs: 689461 survey2
2002 4 3 495549 0.1 #_orig_obs: 525909 survey2
2003 4 3 833896 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.74413e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.6004e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.60852e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.07217e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 447637 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.0554e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 949292 0.1 #_orig_obs: 552500 survey2
2011 4 3 739859 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 346234 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  123 150 223 176 63 65 0
1986  1 1  0 0 1 -1 -1 800  36 302 332 109 19 0 2
1987  1 1  0 0 1 -1 -1 800  97 90 480 132 1 0 0
1988  1 1  0 0 1 -1 -1 800  87 185 218 299 11 0 0
1989  1 1  0 0 1 -1 -1 800  320 162 220 76 22 0 0
1990  1 1  0 0 1 -1 -1 800  549 179 55 16 1 0 0
1991  1 1  0 0 1 -1 -1 800  192 467 128 11 2 0 0
1992  1 1  0 0 1 -1 -1 800  57 196 487 58 2 0 0
1993  1 1  0 0 1 -1 -1 800  118 86 331 257 8 0 0
1994  1 1  0 0 1 -1 -1 800  173 291 180 146 10 0 0
1995  1 1  0 0 1 -1 -1 800  80 263 397 53 6 1 0
1996  1 1  0 0 1 -1 -1 800  436 80 208 73 3 0 0
1997  1 1  0 0 1 -1 -1 800  365 354 53 28 0 0 0
1998  1 1  0 0 1 -1 -1 800  160 356 265 18 1 0 0
1999  1 1  0 0 1 -1 -1 800  84 173 449 94 0 0 0
2000  1 1  0 0 1 -1 -1 800  122 152 308 202 16 0 0
2001  1 1  0 0 1 -1 -1 800  194 245 238 111 12 0 0
2002  1 1  0 0 1 -1 -1 800  58 376 322 43 1 0 0
2003  1 1  0 0 1 -1 -1 800  280 101 383 36 0 0 0
2004  1 1  0 0 1 -1 -1 800  543 225 26 6 0 0 0
2005  1 1  0 0 1 -1 -1 800  218 477 104 1 0 0 0
2006  1 1  0 0 1 -1 -1 800  165 261 370 4 0 0 0
2007  1 1  0 0 1 -1 -1 800  261 293 219 27 0 0 0
2008  1 1  0 0 1 -1 -1 800  97 426 253 24 0 0 0
2009  1 1  0 0 1 -1 -1 800  347 126 307 20 0 0 0
2010  1 1  0 0 1 -1 -1 800  334 360 86 20 0 0 0
2011  1 1  0 0 1 -1 -1 800  149 396 251 4 0 0 0
2012  1 1  0 0 1 -1 -1 800  107 292 378 23 0 0 0
1990  10 2  0 0 1 -1 -1 800  745 53 2 0 0 0 0
1991  10 2  0 0 1 -1 -1 800  528 255 17 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  280 328 189 3 0 0 0
1993  10 2  0 0 1 -1 -1 800  621 104 64 11 0 0 0
1994  10 2  0 0 1 -1 -1 800  579 204 15 2 0 0 0
1995  10 2  0 0 1 -1 -1 800  400 301 96 3 0 0 0
1996  10 2  0 0 1 -1 -1 800  752 35 13 0 0 0 0
1997  10 2  0 0 1 -1 -1 800  665 131 4 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  535 240 25 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  471 221 102 6 0 0 0
2000  10 2  0 0 1 -1 -1 800  554 178 62 6 0 0 0
2001  10 2  0 0 1 -1 -1 800  621 143 31 4 1 0 0
2002  10 2  0 0 1 -1 -1 800  326 431 43 0 0 0 0
2003  10 2  0 0 1 -1 -1 800  720 60 20 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  728 72 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  541 255 4 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  592 182 26 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  623 160 17 0 0 0 0
2008  10 2  0 0 1 -1 -1 800  428 344 28 0 0 0 0
2009  10 2  0 0 1 -1 -1 800  722 66 12 0 0 0 0
2010  10 2  0 0 1 -1 -1 800  629 167 4 0 0 0 0
2011  10 2  0 0 1 -1 -1 800  509 272 19 0 0 0 0
2012  10 2  0 0 1 -1 -1 800  504 257 39 0 0 0 0
1985  4 3  0 0 1 -1 -1 800  584 146 53 8 9 0 0
1986  4 3  0 0 1 -1 -1 800  340 362 86 11 1 0 0
1987  4 3  0 0 1 -1 -1 800  581 99 111 9 0 0 0
1988  4 3  0 0 1 -1 -1 800  569 169 39 23 0 0 0
1989  4 3  0 0 1 -1 -1 800  708 69 20 3 0 0 0
1990  4 3  0 0 1 -1 -1 800  750 43 6 1 0 0 0
1991  4 3  0 0 1 -1 -1 800  565 223 12 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  351 278 161 10 0 0 0
1993  4 3  0 0 1 -1 -1 800  657 58 59 25 1 0 0
1994  4 3  0 0 1 -1 -1 800  615 158 22 5 0 0 0
1995  4 3  0 0 1 -1 -1 800  447 251 97 5 0 0 0
1996  4 3  0 0 1 -1 -1 800  762 23 14 1 0 0 0
1997  4 3  0 0 1 -1 -1 800  690 103 6 1 0 0 0
1998  4 3  0 0 1 -1 -1 800  534 238 27 1 0 0 0
1999  4 3  0 0 1 -1 -1 800  523 190 84 3 0 0 0
2000  4 3  0 0 1 -1 -1 800  587 134 64 15 0 0 0
2001  4 3  0 0 1 -1 -1 800  627 138 28 7 0 0 0
2002  4 3  0 0 1 -1 -1 800  353 371 74 2 0 0 0
2003  4 3  0 0 1 -1 -1 800  713 48 39 0 0 0 0
2004  4 3  0 0 1 -1 -1 800  763 36 1 0 0 0 0
2005  4 3  0 0 1 -1 -1 800  577 215 8 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  598 166 36 0 0 0 0
2007  4 3  0 0 1 -1 -1 800  637 143 18 2 0 0 0
2008  4 3  0 0 1 -1 -1 800  435 317 47 1 0 0 0
2009  4 3  0 0 1 -1 -1 800  728 48 24 0 0 0 0
2010  4 3  0 0 1 -1 -1 800  639 154 5 2 0 0 0
2011  4 3  0 0 1 -1 -1 800  543 216 41 0 0 0 0
2012  4 3  0 0 1 -1 -1 800  545 192 62 1 0 0 0
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

