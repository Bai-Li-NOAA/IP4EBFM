#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Aug 29 11:44:46 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1661787886 first rand#: -0.0837174
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
-999 1 1 11449.6 0.05
1985 1 1 193761 0.05
1986 1 1 182784 0.05
1987 1 1 91448.8 0.05
1988 1 1 26318.5 0.05
1989 1 1 49581.9 0.05
1990 1 1 62630.2 0.05
1991 1 1 70017.2 0.05
1992 1 1 126877 0.05
1993 1 1 190738 0.05
1994 1 1 97728.5 0.05
1995 1 1 50462 0.05
1996 1 1 113204 0.05
1997 1 1 104077 0.05
1998 1 1 181738 0.05
1999 1 1 158686 0.05
2000 1 1 236310 0.05
2001 1 1 208953 0.05
2002 1 1 153783 0.05
2003 1 1 129827 0.05
2004 1 1 205772 0.05
2005 1 1 400694 0.05
2006 1 1 476916 0.05
2007 1 1 325774 0.05
2008 1 1 260581 0.05
2009 1 1 191450 0.05
2010 1 1 195172 0.05
2011 1 1 215375 0.05
2012 1 1 191846 0.05
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
1990 10 2 4.73735e+06 0.1 #_orig_obs: 544208 survey1
1991 10 2 3.76635e+06 0.1 #_orig_obs: 4.00312e+06 survey1
1992 10 2 1.56625e+06 0.1 #_orig_obs: 6.60624e+06 survey1
1993 10 2 1.5762e+06 0.1 #_orig_obs: 1.88117e+06 survey1
1994 10 2 1.8368e+06 0.1 #_orig_obs: 974412 survey1
1995 10 2 856016 0.1 #_orig_obs: 1.73125e+06 survey1
1996 10 2 3.03568e+06 0.1 #_orig_obs: 1.52447e+06 survey1
1997 10 2 5.55681e+06 0.1 #_orig_obs: 1.3782e+06 survey1
1998 10 2 4.56658e+06 0.1 #_orig_obs: 9.34632e+06 survey1
1999 10 2 2.62058e+06 0.1 #_orig_obs: 5.73748e+06 survey1
2000 10 2 2.05921e+06 0.1 #_orig_obs: 2.69784e+06 survey1
2001 10 2 2.25486e+06 0.1 #_orig_obs: 1.23382e+06 survey1
2002 10 2 865185 0.1 #_orig_obs: 1.9005e+06 survey1
2003 10 2 2.17297e+06 0.1 #_orig_obs: 1.35747e+06 survey1
2004 10 2 7.31956e+06 0.1 #_orig_obs: 1.07353e+06 survey1
2005 10 2 6.32215e+06 0.1 #_orig_obs: 7.94583e+06 survey1
2006 10 2 3.78689e+06 0.1 #_orig_obs: 7.1867e+06 survey1
2007 10 2 4.06612e+06 0.1 #_orig_obs: 3.7335e+06 survey1
2008 10 2 2.10715e+06 0.1 #_orig_obs: 5.09448e+06 survey1
2009 10 2 2.80938e+06 0.1 #_orig_obs: 2.00517e+06 survey1
2010 10 2 3.34494e+06 0.1 #_orig_obs: 2.27578e+06 survey1
2011 10 2 2.10873e+06 0.1 #_orig_obs: 7.49073e+06 survey1
2012 10 2 1.42106e+06 0.1 #_orig_obs: 4.65616e+06 survey1
1985 4 3 900511 0.1 #_orig_obs: 1.80339e+06 survey2
1986 4 3 356316 0.1 #_orig_obs: 1.56011e+06 survey2
1987 4 3 252771 0.1 #_orig_obs: 954308 survey2
1988 4 3 217589 0.1 #_orig_obs: 245537 survey2
1989 4 3 451821 0.1 #_orig_obs: 165382 survey2
1990 4 3 1.68685e+06 0.1 #_orig_obs: 140452 survey2
1991 4 3 1.21456e+06 0.1 #_orig_obs: 527308 survey2
1992 4 3 541112 0.1 #_orig_obs: 1.70108e+06 survey2
1993 4 3 793101 0.1 #_orig_obs: 1.32148e+06 survey2
1994 4 3 631567 0.1 #_orig_obs: 375877 survey2
1995 4 3 353628 0.1 #_orig_obs: 528242 survey2
1996 4 3 1.27632e+06 0.1 #_orig_obs: 581896 survey2
1997 4 3 1.81595e+06 0.1 #_orig_obs: 407766 survey2
1998 4 3 1.4737e+06 0.1 #_orig_obs: 1.35658e+06 survey2
1999 4 3 1.01825e+06 0.1 #_orig_obs: 4.33705e+06 survey2
2000 4 3 1.00603e+06 0.1 #_orig_obs: 1.61686e+06 survey2
2001 4 3 981780 0.1 #_orig_obs: 689461 survey2
2002 4 3 308438 0.1 #_orig_obs: 525909 survey2
2003 4 3 928588 0.1 #_orig_obs: 634479 survey2
2004 4 3 2.95369e+06 0.1 #_orig_obs: 201645 survey2
2005 4 3 1.87411e+06 0.1 #_orig_obs: 901519 survey2
2006 4 3 1.59678e+06 0.1 #_orig_obs: 3.70361e+06 survey2
2007 4 3 1.65557e+06 0.1 #_orig_obs: 2.11194e+06 survey2
2008 4 3 556282 0.1 #_orig_obs: 1.32172e+06 survey2
2009 4 3 1.03639e+06 0.1 #_orig_obs: 1.18608e+06 survey2
2010 4 3 1.40133e+06 0.1 #_orig_obs: 552500 survey2
2011 4 3 847088 0.1 #_orig_obs: 1.49059e+06 survey2
2012 4 3 486211 0.1 #_orig_obs: 3.04337e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  110 177 209 166 85 53 0
1986  1 1  0 0 1 -1 -1 800  51 279 323 133 11 2 1
1987  1 1  0 0 1 -1 -1 800  98 104 465 133 0 0 0
1988  1 1  0 0 1 -1 -1 800  106 182 181 321 10 0 0
1989  1 1  0 0 1 -1 -1 800  332 126 243 70 27 2 0
1990  1 1  0 0 1 -1 -1 800  530 162 76 32 0 0 0
1991  1 1  0 0 1 -1 -1 800  184 454 135 26 1 0 0
1992  1 1  0 0 1 -1 -1 800  34 191 519 52 4 0 0
1993  1 1  0 0 1 -1 -1 800  115 83 365 232 5 0 0
1994  1 1  0 0 1 -1 -1 800  212 271 174 139 4 0 0
1995  1 1  0 0 1 -1 -1 800  91 267 384 56 2 0 0
1996  1 1  0 0 1 -1 -1 800  423 85 214 76 2 0 0
1997  1 1  0 0 1 -1 -1 800  376 338 58 28 0 0 0
1998  1 1  0 0 1 -1 -1 800  163 362 270 5 0 0 0
1999  1 1  0 0 1 -1 -1 800  86 198 405 110 1 0 0
2000  1 1  0 0 1 -1 -1 800  105 151 317 216 11 0 0
2001  1 1  0 0 1 -1 -1 800  260 212 233 92 3 0 0
2002  1 1  0 0 1 -1 -1 800  91 412 269 28 0 0 0
2003  1 1  0 0 1 -1 -1 800  337 90 352 21 0 0 0
2004  1 1  0 0 1 -1 -1 800  557 203 34 6 0 0 0
2005  1 1  0 0 1 -1 -1 800  225 476 97 2 0 0 0
2006  1 1  0 0 1 -1 -1 800  187 251 349 13 0 0 0
2007  1 1  0 0 1 -1 -1 800  255 246 258 41 0 0 0
2008  1 1  0 0 1 -1 -1 800  98 387 293 21 1 0 0
2009  1 1  0 0 1 -1 -1 800  307 128 337 28 0 0 0
2010  1 1  0 0 1 -1 -1 800  325 349 98 28 0 0 0
2011  1 1  0 0 1 -1 -1 800  166 351 274 9 0 0 0
2012  1 1  0 0 1 -1 -1 800  120 268 387 25 0 0 0
1990  10 2  0 0 1 -1 -1 800  732 66 2 0 0 0 0
1991  10 2  0 0 1 -1 -1 800  540 245 15 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  285 335 172 8 0 0 0
1993  10 2  0 0 1 -1 -1 800  617 107 72 4 0 0 0
1994  10 2  0 0 1 -1 -1 800  585 186 25 4 0 0 0
1995  10 2  0 0 1 -1 -1 800  394 317 89 0 0 0 0
1996  10 2  0 0 1 -1 -1 800  750 40 10 0 0 0 0
1997  10 2  0 0 1 -1 -1 800  675 121 4 0 0 0 0
1998  10 2  0 0 1 -1 -1 800  504 254 42 0 0 0 0
1999  10 2  0 0 1 -1 -1 800  437 257 102 4 0 0 0
2000  10 2  0 0 1 -1 -1 800  547 180 67 6 0 0 0
2001  10 2  0 0 1 -1 -1 800  644 139 17 0 0 0 0
2002  10 2  0 0 1 -1 -1 800  335 441 24 0 0 0 0
2003  10 2  0 0 1 -1 -1 800  730 49 21 0 0 0 0
2004  10 2  0 0 1 -1 -1 800  735 65 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 800  531 263 6 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  579 189 32 0 0 0 0
2007  10 2  0 0 1 -1 -1 800  630 145 25 0 0 0 0
2008  10 2  0 0 1 -1 -1 800  417 357 26 0 0 0 0
2009  10 2  0 0 1 -1 -1 800  695 81 24 0 0 0 0
2010  10 2  0 0 1 -1 -1 800  628 165 7 0 0 0 0
2011  10 2  0 0 1 -1 -1 800  538 238 24 0 0 0 0
2012  10 2  0 0 1 -1 -1 800  513 245 42 0 0 0 0
1985  4 3  0 0 1 -1 -1 800  570 161 46 15 8 0 0
1986  4 3  0 0 1 -1 -1 800  345 354 88 12 1 0 0
1987  4 3  0 0 1 -1 -1 800  547 126 118 9 0 0 0
1988  4 3  0 0 1 -1 -1 800  552 194 32 22 0 0 0
1989  4 3  0 0 1 -1 -1 800  717 60 22 1 0 0 0
1990  4 3  0 0 1 -1 -1 800  747 49 2 2 0 0 0
1991  4 3  0 0 1 -1 -1 800  577 209 13 1 0 0 0
1992  4 3  0 0 1 -1 -1 800  359 292 142 7 0 0 0
1993  4 3  0 0 1 -1 -1 800  606 96 81 17 0 0 0
1994  4 3  0 0 1 -1 -1 800  615 155 22 8 0 0 0
1995  4 3  0 0 1 -1 -1 800  462 260 71 7 0 0 0
1996  4 3  0 0 1 -1 -1 800  757 26 16 1 0 0 0
1997  4 3  0 0 1 -1 -1 800  699 96 5 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  540 231 29 0 0 0 0
1999  4 3  0 0 1 -1 -1 800  493 223 78 6 0 0 0
2000  4 3  0 0 1 -1 -1 800  568 159 59 14 0 0 0
2001  4 3  0 0 1 -1 -1 800  659 108 29 4 0 0 0
2002  4 3  0 0 1 -1 -1 800  391 345 63 1 0 0 0
2003  4 3  0 0 1 -1 -1 800  743 34 23 0 0 0 0
2004  4 3  0 0 1 -1 -1 800  752 43 5 0 0 0 0
2005  4 3  0 0 1 -1 -1 800  561 229 10 0 0 0 0
2006  4 3  0 0 1 -1 -1 800  585 167 48 0 0 0 0
2007  4 3  0 0 1 -1 -1 800  638 129 33 0 0 0 0
2008  4 3  0 0 1 -1 -1 800  445 294 56 5 0 0 0
2009  4 3  0 0 1 -1 -1 800  713 49 38 0 0 0 0
2010  4 3  0 0 1 -1 -1 800  661 132 5 2 0 0 0
2011  4 3  0 0 1 -1 -1 800  554 210 36 0 0 0 0
2012  4 3  0 0 1 -1 -1 800  510 210 78 2 0 0 0
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

