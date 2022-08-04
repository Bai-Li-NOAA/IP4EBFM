#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 04 15:27:27 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1659641247 first rand#: -0.334319
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
-999 1 1 182860 0.05
1985 1 1 159912 0.05
1986 1 1 140817 0.05
1987 1 1 32922 0.05
1988 1 1 2177.77 0.05
1989 1 1 810.103 0.05
1990 1 1 6944.34 0.05
1991 1 1 27763.3 0.05
1992 1 1 51376.6 0.05
1993 1 1 112384 0.05
1994 1 1 25651.2 0.05
1995 1 1 6746.6 0.05
1996 1 1 23254.3 0.05
1997 1 1 60033.3 0.05
1998 1 1 210710 0.05
1999 1 1 201997 0.05
2000 1 1 177152 0.05
2001 1 1 117308 0.05
2002 1 1 13273.4 0.05
2003 1 1 66883.5 0.05
2004 1 1 153751 0.05
2005 1 1 585726 0.05
2006 1 1 2.79766e+06 0.05
2007 1 1 2.08509e+06 0.05
2008 1 1 333622 0.05
2009 1 1 399178 0.05
2010 1 1 591354 0.05
2011 1 1 1.0152e+06 0.05
2012 1 1 779188 0.05
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
1990 10 2 3.09317e+06 0.1 #_orig_obs: 661143 survey1
1991 10 2 2.15645e+06 0.1 #_orig_obs: 4.52286e+06 survey1
1992 10 2 1.48128e+06 0.1 #_orig_obs: 6.7024e+06 survey1
1993 10 2 1.46156e+06 0.1 #_orig_obs: 1.57378e+06 survey1
1994 10 2 1.34193e+06 0.1 #_orig_obs: 1.08989e+06 survey1
1995 10 2 1.10722e+06 0.1 #_orig_obs: 1.70713e+06 survey1
1996 10 2 3.23879e+06 0.1 #_orig_obs: 1.37675e+06 survey1
1997 10 2 6.21408e+06 0.1 #_orig_obs: 1.8355e+06 survey1
1998 10 2 4.12489e+06 0.1 #_orig_obs: 1.2999e+07 survey1
1999 10 2 2.5505e+06 0.1 #_orig_obs: 6.17151e+06 survey1
2000 10 2 2.06685e+06 0.1 #_orig_obs: 2.9689e+06 survey1
2001 10 2 2.38969e+06 0.1 #_orig_obs: 1.35378e+06 survey1
2002 10 2 1.25639e+06 0.1 #_orig_obs: 1.73694e+06 survey1
2003 10 2 2.39564e+06 0.1 #_orig_obs: 1.6412e+06 survey1
2004 10 2 8.2384e+06 0.1 #_orig_obs: 1.44056e+06 survey1
2005 10 2 6.94138e+06 0.1 #_orig_obs: 1.33767e+07 survey1
2006 10 2 5.53566e+06 0.1 #_orig_obs: 1.61603e+07 survey1
2007 10 2 2.95889e+06 0.1 #_orig_obs: 2.98429e+06 survey1
2008 10 2 1.24662e+06 0.1 #_orig_obs: 4.39754e+06 survey1
2009 10 2 3.20683e+06 0.1 #_orig_obs: 1.13145e+06 survey1
2010 10 2 4.28016e+06 0.1 #_orig_obs: 1.82551e+06 survey1
2011 10 2 3.55938e+06 0.1 #_orig_obs: 6.29915e+06 survey1
2012 10 2 2.01184e+06 0.1 #_orig_obs: 2.7229e+06 survey1
1985 4 3 1.13362e+06 0.1 #_orig_obs: 1.49352e+06 survey2
1986 4 3 341180 0.1 #_orig_obs: 1.44274e+06 survey2
1987 4 3 311611 0.1 #_orig_obs: 872326 survey2
1988 4 3 247299 0.1 #_orig_obs: 205219 survey2
1989 4 3 481039 0.1 #_orig_obs: 151078 survey2
1990 4 3 1.08019e+06 0.1 #_orig_obs: 139356 survey2
1991 4 3 885017 0.1 #_orig_obs: 533665 survey2
1992 4 3 471224 0.1 #_orig_obs: 2.07828e+06 survey2
1993 4 3 471820 0.1 #_orig_obs: 1.31668e+06 survey2
1994 4 3 514144 0.1 #_orig_obs: 456402 survey2
1995 4 3 395721 0.1 #_orig_obs: 570570 survey2
1996 4 3 1.22691e+06 0.1 #_orig_obs: 632183 survey2
1997 4 3 1.76391e+06 0.1 #_orig_obs: 433557 survey2
1998 4 3 1.45267e+06 0.1 #_orig_obs: 1.55374e+06 survey2
1999 4 3 1.01886e+06 0.1 #_orig_obs: 4.95153e+06 survey2
2000 4 3 737695 0.1 #_orig_obs: 1.77116e+06 survey2
2001 4 3 915575 0.1 #_orig_obs: 747600 survey2
2002 4 3 457641 0.1 #_orig_obs: 506065 survey2
2003 4 3 947109 0.1 #_orig_obs: 676836 survey2
2004 4 3 2.9146e+06 0.1 #_orig_obs: 434581 survey2
2005 4 3 2.67777e+06 0.1 #_orig_obs: 1.58913e+06 survey2
2006 4 3 1.7523e+06 0.1 #_orig_obs: 6.80618e+06 survey2
2007 4 3 1.26871e+06 0.1 #_orig_obs: 2.03217e+06 survey2
2008 4 3 464427 0.1 #_orig_obs: 1.1362e+06 survey2
2009 4 3 1.31436e+06 0.1 #_orig_obs: 834352 survey2
2010 4 3 1.88695e+06 0.1 #_orig_obs: 316508 survey2
2011 4 3 1.32667e+06 0.1 #_orig_obs: 1.28707e+06 survey2
2012 4 3 802164 0.1 #_orig_obs: 1.69517e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  360 239 124 57 13 5 2
1986  1 1  0 0 1 -1 -1 800  154 331 206 76 24 5 4
1987  1 1  0 0 1 -1 -1 800  201 109 321 116 36 10 7
1988  1 1  0 0 1 -1 -1 800  250 160 110 193 57 21 9
1989  1 1  0 0 1 -1 -1 800  468 133 79 40 59 17 4
1990  1 1  0 0 1 -1 -1 800  646 89 31 15 8 6 5
1991  1 1  0 0 1 -1 -1 800  356 351 68 16 4 3 2
1992  1 1  0 0 1 -1 -1 800  175 259 316 43 5 2 0
1993  1 1  0 0 1 -1 -1 800  322 108 199 149 19 1 2
1994  1 1  0 0 1 -1 -1 800  390 191 84 82 48 4 1
1995  1 1  0 0 1 -1 -1 800  300 249 154 40 41 16 0
1996  1 1  0 0 1 -1 -1 800  608 64 82 32 6 5 3
1997  1 1  0 0 1 -1 -1 800  518 207 33 28 9 2 3
1998  1 1  0 0 1 -1 -1 800  303 332 138 14 7 5 1
1999  1 1  0 0 1 -1 -1 800  219 230 253 84 6 6 2
2000  1 1  0 0 1 -1 -1 800  273 163 202 141 18 1 2
2001  1 1  0 0 1 -1 -1 800  387 178 100 80 41 12 2
2002  1 1  0 0 1 -1 -1 800  192 333 140 76 45 13 1
2003  1 1  0 0 1 -1 -1 800  523 71 127 39 24 5 11
2004  1 1  0 0 1 -1 -1 800  641 116 17 20 5 0 1
2005  1 1  0 0 1 -1 -1 800  361 352 70 4 10 3 0
2006  1 1  0 0 1 -1 -1 800  326 259 187 26 1 1 0
2007  1 1  0 0 1 -1 -1 800  288 278 157 68 9 0 0
2008  1 1  0 0 1 -1 -1 800  178 265 250 89 14 4 0
2009  1 1  0 0 1 -1 -1 800  573 66 92 56 9 4 0
2010  1 1  0 0 1 -1 -1 800  533 209 22 24 11 1 0
2011  1 1  0 0 1 -1 -1 800  345 309 123 15 8 0 0
2012  1 1  0 0 1 -1 -1 800  278 251 215 52 4 0 0
1990  10 2  0 0 1 -1 -1 800  713 75 9 2 0 1 0
1991  10 2  0 0 1 -1 -1 800  516 251 33 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  360 264 163 9 2 0 2
1993  10 2  0 0 1 -1 -1 800  579 93 76 47 4 0 1
1994  10 2  0 0 1 -1 -1 800  579 152 30 27 12 0 0
1995  10 2  0 0 1 -1 -1 800  506 188 78 12 10 6 0
1996  10 2  0 0 1 -1 -1 800  725 48 18 8 1 0 0
1997  10 2  0 0 1 -1 -1 800  660 129 6 5 0 0 0
1998  10 2  0 0 1 -1 -1 800  486 242 63 8 1 0 0
1999  10 2  0 0 1 -1 -1 800  443 213 117 27 0 0 0
2000  10 2  0 0 1 -1 -1 800  524 146 79 43 8 0 0
2001  10 2  0 0 1 -1 -1 800  596 130 35 19 16 4 0
2002  10 2  0 0 1 -1 -1 800  325 340 80 38 11 6 0
2003  10 2  0 0 1 -1 -1 800  701 50 37 7 0 4 1
2004  10 2  0 0 1 -1 -1 800  726 62 5 6 1 0 0
2005  10 2  0 0 1 -1 -1 800  544 233 23 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  546 175 69 10 0 0 0
2007  10 2  0 0 1 -1 -1 800  526 201 48 25 0 0 0
2008  10 2  0 0 1 -1 -1 800  390 274 114 15 7 0 0
2009  10 2  0 0 1 -1 -1 800  732 35 22 10 0 1 0
2010  10 2  0 0 1 -1 -1 800  655 127 7 11 0 0 0
2011  10 2  0 0 1 -1 -1 800  523 224 46 7 0 0 0
2012  10 2  0 0 1 -1 -1 800  499 202 84 15 0 0 0
1985  4 3  0 0 1 -1 -1 800  583 144 47 18 6 1 1
1986  4 3  0 0 1 -1 -1 800  332 325 100 32 8 2 1
1987  4 3  0 0 1 -1 -1 800  522 112 116 37 9 2 2
1988  4 3  0 0 1 -1 -1 800  541 134 41 60 18 4 2
1989  4 3  0 0 1 -1 -1 800  672 72 31 6 16 2 1
1990  4 3  0 0 1 -1 -1 800  723 64 7 2 2 2 0
1991  4 3  0 0 1 -1 -1 800  537 247 14 1 1 0 0
1992  4 3  0 0 1 -1 -1 800  413 250 126 9 2 0 0
1993  4 3  0 0 1 -1 -1 800  596 99 61 40 3 1 0
1994  4 3  0 0 1 -1 -1 800  618 131 21 17 13 0 0
1995  4 3  0 0 1 -1 -1 800  538 195 45 9 6 7 0
1996  4 3  0 0 1 -1 -1 800  725 43 21 7 4 0 0
1997  4 3  0 0 1 -1 -1 800  684 107 9 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  561 200 33 3 2 0 1
1999  4 3  0 0 1 -1 -1 800  480 207 92 21 0 0 0
2000  4 3  0 0 1 -1 -1 800  545 134 66 43 9 3 0
2001  4 3  0 0 1 -1 -1 800  628 103 32 20 17 0 0
2002  4 3  0 0 1 -1 -1 800  415 281 70 24 7 3 0
2003  4 3  0 0 1 -1 -1 800  700 41 39 12 5 2 1
2004  4 3  0 0 1 -1 -1 800  737 53 3 7 0 0 0
2005  4 3  0 0 1 -1 -1 800  593 183 23 1 0 0 0
2006  4 3  0 0 1 -1 -1 800  568 160 65 6 0 1 0
2007  4 3  0 0 1 -1 -1 800  554 177 55 14 0 0 0
2008  4 3  0 0 1 -1 -1 800  416 262 95 23 4 0 0
2009  4 3  0 0 1 -1 -1 800  736 29 25 8 2 0 0
2010  4 3  0 0 1 -1 -1 800  659 129 7 5 0 0 0
2011  4 3  0 0 1 -1 -1 800  569 191 36 1 3 0 0
2012  4 3  0 0 1 -1 -1 800  509 208 74 9 0 0 0
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

