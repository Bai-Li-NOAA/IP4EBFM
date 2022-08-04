#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 04 15:06:44 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659640004 first rand#: -0.592835
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
-999 1 1 192427 0.05
1985 1 1 145101 0.05
1986 1 1 126970 0.05
1987 1 1 35305.7 0.05
1988 1 1 2232.17 0.05
1989 1 1 921.851 0.05
1990 1 1 7275.4 0.05
1991 1 1 25667.6 0.05
1992 1 1 49127.3 0.05
1993 1 1 110676 0.05
1994 1 1 27328.3 0.05
1995 1 1 7730.31 0.05
1996 1 1 21726.4 0.05
1997 1 1 60129.2 0.05
1998 1 1 211598 0.05
1999 1 1 200273 0.05
2000 1 1 195545 0.05
2001 1 1 119786 0.05
2002 1 1 12566.7 0.05
2003 1 1 58283.6 0.05
2004 1 1 151786 0.05
2005 1 1 540144 0.05
2006 1 1 2.92696e+06 0.05
2007 1 1 2.01542e+06 0.05
2008 1 1 357419 0.05
2009 1 1 439806 0.05
2010 1 1 562132 0.05
2011 1 1 966300 0.05
2012 1 1 906754 0.05
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
1990 10 2 3.34873e+06 0.1 #_orig_obs: 661143 survey1
1991 10 2 2.80947e+06 0.1 #_orig_obs: 4.52286e+06 survey1
1992 10 2 1.27316e+06 0.1 #_orig_obs: 6.7024e+06 survey1
1993 10 2 1.63807e+06 0.1 #_orig_obs: 1.57378e+06 survey1
1994 10 2 1.52129e+06 0.1 #_orig_obs: 1.08989e+06 survey1
1995 10 2 1.12297e+06 0.1 #_orig_obs: 1.70713e+06 survey1
1996 10 2 3.70832e+06 0.1 #_orig_obs: 1.37675e+06 survey1
1997 10 2 5.65493e+06 0.1 #_orig_obs: 1.8355e+06 survey1
1998 10 2 3.81064e+06 0.1 #_orig_obs: 1.2999e+07 survey1
1999 10 2 2.71305e+06 0.1 #_orig_obs: 6.17151e+06 survey1
2000 10 2 2.27621e+06 0.1 #_orig_obs: 2.9689e+06 survey1
2001 10 2 2.46391e+06 0.1 #_orig_obs: 1.35378e+06 survey1
2002 10 2 1.40464e+06 0.1 #_orig_obs: 1.73694e+06 survey1
2003 10 2 2.59673e+06 0.1 #_orig_obs: 1.6412e+06 survey1
2004 10 2 9.15388e+06 0.1 #_orig_obs: 1.44056e+06 survey1
2005 10 2 7.80697e+06 0.1 #_orig_obs: 1.33767e+07 survey1
2006 10 2 4.51021e+06 0.1 #_orig_obs: 1.61603e+07 survey1
2007 10 2 1.98525e+06 0.1 #_orig_obs: 2.98429e+06 survey1
2008 10 2 1.54442e+06 0.1 #_orig_obs: 4.39754e+06 survey1
2009 10 2 3.54452e+06 0.1 #_orig_obs: 1.13145e+06 survey1
2010 10 2 4.62041e+06 0.1 #_orig_obs: 1.82551e+06 survey1
2011 10 2 3.47157e+06 0.1 #_orig_obs: 6.29915e+06 survey1
2012 10 2 2.46707e+06 0.1 #_orig_obs: 2.7229e+06 survey1
1985 4 3 1.16679e+06 0.1 #_orig_obs: 1.49352e+06 survey2
1986 4 3 552769 0.1 #_orig_obs: 1.44274e+06 survey2
1987 4 3 302206 0.1 #_orig_obs: 872326 survey2
1988 4 3 227104 0.1 #_orig_obs: 205219 survey2
1989 4 3 443659 0.1 #_orig_obs: 151078 survey2
1990 4 3 1.19154e+06 0.1 #_orig_obs: 139356 survey2
1991 4 3 884226 0.1 #_orig_obs: 533665 survey2
1992 4 3 506600 0.1 #_orig_obs: 2.07828e+06 survey2
1993 4 3 573959 0.1 #_orig_obs: 1.31668e+06 survey2
1994 4 3 586219 0.1 #_orig_obs: 456402 survey2
1995 4 3 391753 0.1 #_orig_obs: 570570 survey2
1996 4 3 1.25753e+06 0.1 #_orig_obs: 632183 survey2
1997 4 3 1.97519e+06 0.1 #_orig_obs: 433557 survey2
1998 4 3 1.32466e+06 0.1 #_orig_obs: 1.55374e+06 survey2
1999 4 3 923440 0.1 #_orig_obs: 4.95153e+06 survey2
2000 4 3 828946 0.1 #_orig_obs: 1.77116e+06 survey2
2001 4 3 718319 0.1 #_orig_obs: 747600 survey2
2002 4 3 466318 0.1 #_orig_obs: 506065 survey2
2003 4 3 1.02711e+06 0.1 #_orig_obs: 676836 survey2
2004 4 3 2.58886e+06 0.1 #_orig_obs: 434581 survey2
2005 4 3 2.74485e+06 0.1 #_orig_obs: 1.58913e+06 survey2
2006 4 3 1.91194e+06 0.1 #_orig_obs: 6.80618e+06 survey2
2007 4 3 1.30507e+06 0.1 #_orig_obs: 2.03217e+06 survey2
2008 4 3 544158 0.1 #_orig_obs: 1.1362e+06 survey2
2009 4 3 1.26753e+06 0.1 #_orig_obs: 834352 survey2
2010 4 3 2.17465e+06 0.1 #_orig_obs: 316508 survey2
2011 4 3 1.27883e+06 0.1 #_orig_obs: 1.28707e+06 survey2
2012 4 3 717543 0.1 #_orig_obs: 1.69517e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  355 226 125 62 20 9 3
1986  1 1  0 0 1 -1 -1 800  122 331 232 85 23 6 1
1987  1 1  0 0 1 -1 -1 800  207 102 311 131 35 9 5
1988  1 1  0 0 1 -1 -1 800  250 171 93 206 58 16 6
1989  1 1  0 0 1 -1 -1 800  439 135 108 37 56 18 7
1990  1 1  0 0 1 -1 -1 800  634 104 31 15 6 9 1
1991  1 1  0 0 1 -1 -1 800  359 348 63 19 6 2 3
1992  1 1  0 0 1 -1 -1 800  166 288 300 40 4 0 2
1993  1 1  0 0 1 -1 -1 800  326 113 197 144 11 1 8
1994  1 1  0 0 1 -1 -1 800  379 208 79 85 44 2 3
1995  1 1  0 0 1 -1 -1 800  271 250 159 51 43 26 0
1996  1 1  0 0 1 -1 -1 800  592 78 80 35 4 7 4
1997  1 1  0 0 1 -1 -1 800  507 223 34 23 9 3 1
1998  1 1  0 0 1 -1 -1 800  311 329 137 12 8 2 1
1999  1 1  0 0 1 -1 -1 800  243 231 246 72 7 1 0
2000  1 1  0 0 1 -1 -1 800  271 163 176 146 38 3 3
2001  1 1  0 0 1 -1 -1 800  401 147 116 83 45 7 1
2002  1 1  0 0 1 -1 -1 800  193 317 153 70 43 20 4
2003  1 1  0 0 1 -1 -1 800  526 78 120 55 11 8 2
2004  1 1  0 0 1 -1 -1 800  637 118 16 24 4 0 1
2005  1 1  0 0 1 -1 -1 800  386 334 71 4 3 2 0
2006  1 1  0 0 1 -1 -1 800  344 246 182 24 1 2 1
2007  1 1  0 0 1 -1 -1 800  317 274 139 57 13 0 0
2008  1 1  0 0 1 -1 -1 800  178 285 241 79 15 2 0
2009  1 1  0 0 1 -1 -1 800  590 69 88 40 9 4 0
2010  1 1  0 0 1 -1 -1 800  512 234 24 19 8 2 1
2011  1 1  0 0 1 -1 -1 800  326 325 127 12 10 0 0
2012  1 1  0 0 1 -1 -1 800  274 264 202 56 4 0 0
1990  10 2  0 0 1 -1 -1 800  729 55 10 2 3 1 0
1991  10 2  0 0 1 -1 -1 800  502 274 24 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  360 279 150 11 0 0 0
1993  10 2  0 0 1 -1 -1 800  567 96 84 52 1 0 0
1994  10 2  0 0 1 -1 -1 800  569 157 34 26 14 0 0
1995  10 2  0 0 1 -1 -1 800  489 231 59 11 7 3 0
1996  10 2  0 0 1 -1 -1 800  728 35 28 7 2 0 0
1997  10 2  0 0 1 -1 -1 800  648 134 13 5 0 0 0
1998  10 2  0 0 1 -1 -1 800  483 265 47 4 1 0 0
1999  10 2  0 0 1 -1 -1 800  454 209 108 29 0 0 0
2000  10 2  0 0 1 -1 -1 800  492 158 96 50 4 0 0
2001  10 2  0 0 1 -1 -1 800  594 126 51 16 11 2 0
2002  10 2  0 0 1 -1 -1 800  395 294 78 15 14 4 0
2003  10 2  0 0 1 -1 -1 800  700 57 31 10 0 1 1
2004  10 2  0 0 1 -1 -1 800  724 62 9 3 2 0 0
2005  10 2  0 0 1 -1 -1 800  564 213 23 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  557 175 63 5 0 0 0
2007  10 2  0 0 1 -1 -1 800  525 205 50 20 0 0 0
2008  10 2  0 0 1 -1 -1 800  366 274 129 25 6 0 0
2009  10 2  0 0 1 -1 -1 800  722 30 34 11 2 1 0
2010  10 2  0 0 1 -1 -1 800  644 147 6 3 0 0 0
2011  10 2  0 0 1 -1 -1 800  526 219 48 7 0 0 0
2012  10 2  0 0 1 -1 -1 800  488 208 94 10 0 0 0
1985  4 3  0 0 1 -1 -1 800  612 144 28 10 5 0 1
1986  4 3  0 0 1 -1 -1 800  336 317 102 29 13 3 0
1987  4 3  0 0 1 -1 -1 800  498 112 137 44 8 0 1
1988  4 3  0 0 1 -1 -1 800  557 147 35 47 12 0 2
1989  4 3  0 0 1 -1 -1 800  671 75 32 8 11 2 1
1990  4 3  0 0 1 -1 -1 800  731 58 5 4 2 0 0
1991  4 3  0 0 1 -1 -1 800  540 227 30 2 0 0 1
1992  4 3  0 0 1 -1 -1 800  396 247 142 11 1 3 0
1993  4 3  0 0 1 -1 -1 800  618 84 59 34 2 3 0
1994  4 3  0 0 1 -1 -1 800  620 134 16 17 13 0 0
1995  4 3  0 0 1 -1 -1 800  491 211 69 14 6 9 0
1996  4 3  0 0 1 -1 -1 800  746 29 13 8 4 0 0
1997  4 3  0 0 1 -1 -1 800  668 116 16 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  510 238 50 1 1 0 0
1999  4 3  0 0 1 -1 -1 800  483 199 100 18 0 0 0
2000  4 3  0 0 1 -1 -1 800  551 132 76 32 8 0 1
2001  4 3  0 0 1 -1 -1 800  606 126 35 18 15 0 0
2002  4 3  0 0 1 -1 -1 800  408 274 73 24 12 9 0
2003  4 3  0 0 1 -1 -1 800  693 49 40 11 3 3 1
2004  4 3  0 0 1 -1 -1 800  737 52 6 5 0 0 0
2005  4 3  0 0 1 -1 -1 800  577 208 14 0 1 0 0
2006  4 3  0 0 1 -1 -1 800  577 169 45 7 1 1 0
2007  4 3  0 0 1 -1 -1 800  526 195 64 15 0 0 0
2008  4 3  0 0 1 -1 -1 800  393 287 90 20 10 0 0
2009  4 3  0 0 1 -1 -1 800  728 29 31 12 0 0 0
2010  4 3  0 0 1 -1 -1 800  664 113 13 10 0 0 0
2011  4 3  0 0 1 -1 -1 800  542 218 33 4 3 0 0
2012  4 3  0 0 1 -1 -1 800  529 179 82 10 0 0 0
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

