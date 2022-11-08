#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Nov 07 10:31:24 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1667835084 first rand#: 0.804201
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2007 #_EndYr
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
-999 1 1 72318.5 0.05
1985 1 1 13736.1 0.05
1986 1 1 12179.7 0.05
1987 1 1 7387.93 0.05
1988 1 1 1825.5 0.05
1989 1 1 3528.62 0.05
1990 1 1 79067.2 0.05
1991 1 1 107365 0.05
1992 1 1 261545 0.05
1993 1 1 426379 0.05
1994 1 1 210633 0.05
1995 1 1 129025 0.05
1996 1 1 364539 0.05
1997 1 1 311991 0.05
1998 1 1 778247 0.05
1999 1 1 640231 0.05
2000 1 1 452829 0.05
2001 1 1 333891 0.05
2002 1 1 352169 0.05
2003 1 1 384590 0.05
2004 1 1 436912 0.05
2005 1 1 328207 0.05
2006 1 1 672197 0.05
2007 1 1 291051 0.05
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
1990 10 2 3.67205e+06 0.2 #_orig_obs: 565246 survey1
1991 10 2 1.9687e+06 0.2 #_orig_obs: 3.17686e+06 survey1
1992 10 2 635580 0.2 #_orig_obs: 6.37058e+06 survey1
1993 10 2 1.38914e+06 0.2 #_orig_obs: 1.31436e+06 survey1
1994 10 2 1.07758e+06 0.2 #_orig_obs: 702016 survey1
1995 10 2 642131 0.2 #_orig_obs: 1.44464e+06 survey1
1996 10 2 2.21807e+06 0.2 #_orig_obs: 819120 survey1
1997 10 2 2.88706e+06 0.2 #_orig_obs: 956532 survey1
1998 10 2 972445 0.2 #_orig_obs: 5.72099e+06 survey1
1999 10 2 668477 0.2 #_orig_obs: 1.80107e+06 survey1
2000 10 2 899281 0.2 #_orig_obs: 939122 survey1
2001 10 2 985658 0.2 #_orig_obs: 582386 survey1
2002 10 2 358530 0.2 #_orig_obs: 1.16078e+06 survey1
2003 10 2 535423 0.2 #_orig_obs: 315524 survey1
2004 10 2 1.43775e+06 0.2 #_orig_obs: 216162 survey1
2005 10 2 785927 0.2 #_orig_obs: 1.39021e+06 survey1
2006 10 2 751034 0.2 #_orig_obs: 1.09307e+06 survey1
2007 10 2 937784 0.2 #_orig_obs: 747254 survey1
1985 4 3 631615 0.2 #_orig_obs: 1.6165e+06 survey2
1986 4 3 287547 0.2 #_orig_obs: 1.81081e+06 survey2
1987 4 3 179401 0.2 #_orig_obs: 798204 survey2
1988 4 3 121533 0.2 #_orig_obs: 203427 survey2
1989 4 3 402699 0.2 #_orig_obs: 202875 survey2
1990 4 3 982851 0.2 #_orig_obs: 113055 survey2
1991 4 3 577865 0.2 #_orig_obs: 381334 survey2
1992 4 3 320621 0.2 #_orig_obs: 2.33967e+06 survey2
1993 4 3 438536 0.2 #_orig_obs: 990740 survey2
1994 4 3 389336 0.2 #_orig_obs: 322724 survey2
1995 4 3 225839 0.2 #_orig_obs: 429031 survey2
1996 4 3 792897 0.2 #_orig_obs: 555860 survey2
1997 4 3 897645 0.2 #_orig_obs: 278987 survey2
1998 4 3 512016 0.2 #_orig_obs: 856773 survey2
1999 4 3 317540 0.2 #_orig_obs: 1.86496e+06 survey2
2000 4 3 494257 0.2 #_orig_obs: 656768 survey2
2001 4 3 584526 0.2 #_orig_obs: 158660 survey2
2002 4 3 235609 0.2 #_orig_obs: 243983 survey2
2003 4 3 303651 0.2 #_orig_obs: 219397 survey2
2004 4 3 702986 0.2 #_orig_obs: 38808.9 survey2
2005 4 3 286853 0.2 #_orig_obs: 146939 survey2
2006 4 3 283900 0.2 #_orig_obs: 647377 survey2
2007 4 3 756730 0.2 #_orig_obs: 313413 survey2
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
1985  1 1  0 0 1 -1 -1 800  116 265 328 87 3 1 0
1986  1 1  0 0 1 -1 -1 800  26 302 389 67 11 4 1
1987  1 1  0 0 1 -1 -1 800  46 90 528 110 21 5 0
1988  1 1  0 0 1 -1 -1 800  75 185 278 223 34 5 0
1989  1 1  0 0 1 -1 -1 800  229 170 286 70 40 3 2
1990  1 1  0 0 1 -1 -1 800  388 255 121 30 3 2 1
1991  1 1  0 0 1 -1 -1 800  90 534 158 14 4 0 0
1992  1 1  0 0 1 -1 -1 800  33 198 539 29 1 0 0
1993  1 1  0 0 1 -1 -1 800  125 126 350 193 6 0 0
1994  1 1  0 0 1 -1 -1 800  174 366 160 65 34 1 0
1995  1 1  0 0 1 -1 -1 800  77 353 339 20 5 6 0
1996  1 1  0 0 1 -1 -1 800  309 163 289 39 0 0 0
1997  1 1  0 0 1 -1 -1 800  235 460 83 22 0 0 0
1998  1 1  0 0 1 -1 -1 800  75 415 299 6 5 0 0
1999  1 1  0 0 1 -1 -1 800  59 228 472 39 2 0 0
2000  1 1  0 0 1 -1 -1 800  212 242 277 63 6 0 0
2001  1 1  0 0 1 -1 -1 800  238 403 137 19 3 0 0
2002  1 1  0 0 1 -1 -1 800  64 464 260 10 1 1 0
2003  1 1  0 0 1 -1 -1 800  261 159 344 35 0 0 1
2004  1 1  0 0 1 -1 -1 800  354 361 69 16 0 0 0
2005  1 1  0 0 1 -1 -1 800  107 534 158 1 0 0 0
2006  1 1  0 0 1 -1 -1 800  186 230 367 17 0 0 0
2007  1 1  0 0 1 -1 -1 800  353 315 121 11 0 0 0
1990  10 2  0 0 1 -1 -1 800  734 54 2 1 9 0 0
1991  10 2  0 0 1 -1 -1 800  472 300 23 3 1 0 1
1992  10 2  0 0 1 -1 -1 800  329 251 198 19 1 1 1
1993  10 2  0 0 1 -1 -1 800  627 72 47 47 7 0 0
1994  10 2  0 0 1 -1 -1 800  621 139 19 12 8 1 0
1995  10 2  0 0 1 -1 -1 800  454 259 58 8 9 12 0
1996  10 2  0 0 1 -1 -1 800  735 46 11 8 0 0 0
1997  10 2  0 0 1 -1 -1 800  658 142 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  461 296 43 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  501 198 83 15 2 0 1
2000  10 2  0 0 1 -1 -1 800  704 69 14 9 4 0 0
2001  10 2  0 0 1 -1 -1 800  680 112 5 2 1 0 0
2002  10 2  0 0 1 -1 -1 800  431 328 34 3 2 2 0
2003  10 2  0 0 1 -1 -1 800  717 55 25 3 0 0 0
2004  10 2  0 0 1 -1 -1 800  722 78 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  502 282 16 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  689 92 19 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  715 84 1 0 0 0 0
1985  4 3  0 0 1 -1 -1 800  588 142 45 15 10 0 0
1986  4 3  0 0 1 -1 -1 800  371 298 80 31 12 8 0
1987  4 3  0 0 1 -1 -1 800  482 98 134 52 25 4 5
1988  4 3  0 0 1 -1 -1 800  503 127 47 82 29 5 7
1989  4 3  0 0 1 -1 -1 800  692 54 21 11 16 3 3
1990  4 3  0 0 1 -1 -1 800  745 46 3 3 1 2 0
1991  4 3  0 0 1 -1 -1 800  495 279 26 0 0 0 0
1992  4 3  0 0 1 -1 -1 800  359 247 174 17 2 0 1
1993  4 3  0 0 1 -1 -1 800  655 61 42 39 3 0 0
1994  4 3  0 0 1 -1 -1 800  639 121 18 6 16 0 0
1995  4 3  0 0 1 -1 -1 800  519 220 47 4 4 6 0
1996  4 3  0 0 1 -1 -1 800  733 42 19 6 0 0 0
1997  4 3  0 0 1 -1 -1 800  676 116 6 0 2 0 0
1998  4 3  0 0 1 -1 -1 800  504 248 45 2 1 0 0
1999  4 3  0 0 1 -1 -1 800  515 177 85 21 1 1 0
2000  4 3  0 0 1 -1 -1 800  681 71 30 14 3 0 1
2001  4 3  0 0 1 -1 -1 800  687 102 6 4 1 0 0
2002  4 3  0 0 1 -1 -1 800  441 309 48 2 0 0 0
2003  4 3  0 0 1 -1 -1 800  712 57 26 5 0 0 0
2004  4 3  0 0 1 -1 -1 800  709 84 4 3 0 0 0
2005  4 3  0 0 1 -1 -1 800  477 294 29 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  663 92 44 1 0 0 0
2007  4 3  0 0 1 -1 -1 800  738 58 4 0 0 0 0
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

