#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Sep 05 12:56:08 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1662396968 first rand#: 0.112542
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
-999 1 1 208066 0.05
1985 1 1 144189 0.05
1986 1 1 133785 0.05
1987 1 1 23760.6 0.05
1988 1 1 1893.55 0.05
1989 1 1 3010.53 0.05
1990 1 1 16608.8 0.05
1991 1 1 29523 0.05
1992 1 1 67833.4 0.05
1993 1 1 151798 0.05
1994 1 1 21366.3 0.05
1995 1 1 4887.56 0.05
1996 1 1 14489.5 0.05
1997 1 1 60519 0.05
1998 1 1 148237 0.05
1999 1 1 129030 0.05
2000 1 1 213066 0.05
2001 1 1 137150 0.05
2002 1 1 13523.4 0.05
2003 1 1 60333 0.05
2004 1 1 167280 0.05
2005 1 1 691131 0.05
2006 1 1 3.19181e+06 0.05
2007 1 1 2.04877e+06 0.05
2008 1 1 243941 0.05
2009 1 1 308692 0.05
2010 1 1 563146 0.05
2011 1 1 940182 0.05
2012 1 1 1.13013e+06 0.05
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
1990 10 2 2.84336e+06 0.1 #_orig_obs: 676462 survey1
1991 10 2 4.01314e+06 0.1 #_orig_obs: 3.59287e+06 survey1
1992 10 2 1.94997e+06 0.1 #_orig_obs: 9.0668e+06 survey1
1993 10 2 1.13309e+06 0.1 #_orig_obs: 2.41807e+06 survey1
1994 10 2 961895 0.1 #_orig_obs: 607064 survey1
1995 10 2 1.07139e+06 0.1 #_orig_obs: 980024 survey1
1996 10 2 1.99678e+06 0.1 #_orig_obs: 1.26254e+06 survey1
1997 10 2 4.02243e+06 0.1 #_orig_obs: 1.68575e+06 survey1
1998 10 2 4.61006e+06 0.1 #_orig_obs: 6.65873e+06 survey1
1999 10 2 3.87656e+06 0.1 #_orig_obs: 7.2338e+06 survey1
2000 10 2 2.89674e+06 0.1 #_orig_obs: 5.15935e+06 survey1
2001 10 2 2.83959e+06 0.1 #_orig_obs: 1.41001e+06 survey1
2002 10 2 1.93265e+06 0.1 #_orig_obs: 1.90804e+06 survey1
2003 10 2 2.52089e+06 0.1 #_orig_obs: 1.52163e+06 survey1
2004 10 2 7.37624e+06 0.1 #_orig_obs: 1.80122e+06 survey1
2005 10 2 7.54886e+06 0.1 #_orig_obs: 1.69419e+07 survey1
2006 10 2 4.85868e+06 0.1 #_orig_obs: 1.28895e+07 survey1
2007 10 2 2.77742e+06 0.1 #_orig_obs: 3.34331e+06 survey1
2008 10 2 1.75904e+06 0.1 #_orig_obs: 3.10126e+06 survey1
2009 10 2 2.28061e+06 0.1 #_orig_obs: 928010 survey1
2010 10 2 5.99933e+06 0.1 #_orig_obs: 2.09458e+06 survey1
2011 10 2 4.33466e+06 0.1 #_orig_obs: 6.81321e+06 survey1
2012 10 2 3.01654e+06 0.1 #_orig_obs: 4.23897e+06 survey1
1985 4 3 1.11058e+06 0.1 #_orig_obs: 2.10639e+06 survey2
1986 4 3 421217 0.1 #_orig_obs: 1.61878e+06 survey2
1987 4 3 439448 0.1 #_orig_obs: 572537 survey2
1988 4 3 443290 0.1 #_orig_obs: 204010 survey2
1989 4 3 352522 0.1 #_orig_obs: 253977 survey2
1990 4 3 1.26952e+06 0.1 #_orig_obs: 250505 survey2
1991 4 3 1.19095e+06 0.1 #_orig_obs: 315253 survey2
1992 4 3 622370 0.1 #_orig_obs: 2.69723e+06 survey2
1993 4 3 467187 0.1 #_orig_obs: 2.50832e+06 survey2
1994 4 3 337707 0.1 #_orig_obs: 418617 survey2
1995 4 3 386214 0.1 #_orig_obs: 310064 survey2
1996 4 3 715590 0.1 #_orig_obs: 381408 survey2
1997 4 3 1.32319e+06 0.1 #_orig_obs: 452433 survey2
1998 4 3 1.56754e+06 0.1 #_orig_obs: 1.31129e+06 survey2
1999 4 3 1.24531e+06 0.1 #_orig_obs: 3.05295e+06 survey2
2000 4 3 875191 0.1 #_orig_obs: 2.41761e+06 survey2
2001 4 3 879082 0.1 #_orig_obs: 1.10946e+06 survey2
2002 4 3 613766 0.1 #_orig_obs: 577555 survey2
2003 4 3 867911 0.1 #_orig_obs: 821136 survey2
2004 4 3 2.65015e+06 0.1 #_orig_obs: 375379 survey2
2005 4 3 2.31596e+06 0.1 #_orig_obs: 1.28932e+06 survey2
2006 4 3 1.91759e+06 0.1 #_orig_obs: 8.11322e+06 survey2
2007 4 3 1.01583e+06 0.1 #_orig_obs: 2.02325e+06 survey2
2008 4 3 435747 0.1 #_orig_obs: 1.06682e+06 survey2
2009 4 3 1.08109e+06 0.1 #_orig_obs: 624374 survey2
2010 4 3 1.98476e+06 0.1 #_orig_obs: 227348 survey2
2011 4 3 1.32787e+06 0.1 #_orig_obs: 1.14335e+06 survey2
2012 4 3 997802 0.1 #_orig_obs: 2.40226e+06 survey2
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
1985  1 1  0 0 1 -1 -1 852  415 212 158 49 9 6 3
1986  1 1  0 0 1 -1 -1 583  121 217 164 61 15 2 3
1987  1 1  0 0 1 -1 -1 762  269 104 240 103 29 12 5
1988  1 1  0 0 1 -1 -1 737  345 165 79 107 30 8 3
1989  1 1  0 0 1 -1 -1 692  211 202 159 45 50 15 10
1990  1 1  0 0 1 -1 -1 684  535 55 48 29 6 5 6
1991  1 1  0 0 1 -1 -1 777  396 319 25 27 6 1 3
1992  1 1  0 0 1 -1 -1 568  96 249 200 14 9 0 0
1993  1 1  0 0 1 -1 -1 548  131 73 211 112 14 5 2
1994  1 1  0 0 1 -1 -1 526  193 107 54 118 48 6 0
1995  1 1  0 0 1 -1 -1 500  221 109 87 24 36 22 1
1996  1 1  0 0 1 -1 -1 463  280 95 52 25 3 4 4
1997  1 1  0 0 1 -1 -1 454  316 92 30 10 3 0 3
1998  1 1  0 0 1 -1 -1 459  262 154 34 8 1 0 0
1999  1 1  0 0 1 -1 -1 428  151 169 92 13 3 0 0
2000  1 1  0 0 1 -1 -1 366  125 92 97 43 9 0 0
2001  1 1  0 0 1 -1 -1 501  225 88 92 73 21 1 1
2002  1 1  0 0 1 -1 -1 439  144 156 66 37 32 4 0
2003  1 1  0 0 1 -1 -1 402  210 58 81 33 10 7 3
2004  1 1  0 0 1 -1 -1 459  342 75 22 11 7 2 0
2005  1 1  0 0 1 -1 -1 394  194 156 33 6 5 0 0
2006  1 1  0 0 1 -1 -1 421  170 143 91 17 0 0 0
2007  1 1  0 0 1 -1 -1 532  184 154 134 52 8 0 0
2008  1 1  0 0 1 -1 -1 445  84 156 132 59 14 0 0
2009  1 1  0 0 1 -1 -1 402  249 39 59 42 13 0 0
2010  1 1  0 0 1 -1 -1 442  323 67 16 25 11 0 0
2011  1 1  0 0 1 -1 -1 434  187 195 42 5 5 0 0
2012  1 1  0 0 1 -1 -1 370  133 85 132 16 4 0 0
1990  10 2  0 0 1 -1 -1 118  97 21 0 0 0 0 0
1991  10 2  0 0 1 -1 -1 40  26 13 1 0 0 0 0
1992  10 2  0 0 1 -1 -1 122  40 55 25 2 0 0 0
1993  10 2  0 0 1 -1 -1 119  65 12 34 7 0 1 0
1994  10 2  0 0 1 -1 -1 53  29 24 0 0 0 0 0
1995  10 2  0 0 1 -1 -1 261  176 58 16 6 5 0 0
1996  10 2  0 0 1 -1 -1 192  144 33 10 5 0 0 0
1997  10 2  0 0 1 -1 -1 110  92 18 0 0 0 0 0
1998  10 2  0 0 1 -1 -1 176  122 43 11 0 0 0 0
1999  10 2  0 0 1 -1 -1 495  253 183 51 8 0 0 0
2000  10 2  0 0 1 -1 -1 464  255 111 79 19 0 0 0
2001  10 2  0 0 1 -1 -1 268  176 51 22 16 3 0 0
2002  10 2  0 0 1 -1 -1 602  273 227 65 19 15 3 0
2003  10 2  0 0 1 -1 -1 56  40 9 6 1 0 0 0
2004  10 2  0 0 1 -1 -1 294  255 39 0 0 0 0 0
2005  10 2  0 0 1 -1 -1 740  466 243 24 5 1 1 0
2006  10 2  0 0 1 -1 -1 335  185 103 44 3 0 0 0
2007  10 2  0 0 1 -1 -1 553  308 160 66 18 1 0 0
2008  10 2  0 0 1 -1 -1 344  151 120 62 11 0 0 0
2009  10 2  0 0 1 -1 -1 149  114 20 15 0 0 0 0
2010  10 2  0 0 1 -1 -1 172  148 24 0 0 0 0 0
2011  10 2  0 0 1 -1 -1 889  473 357 51 6 2 0 0
2012  10 2  0 0 1 -1 -1 464  265 123 70 6 0 0 0
1985  4 3  0 0 1 -1 -1 1000  744 181 55 13 6 1 0
1986  4 3  0 0 1 -1 -1 1000  458 383 114 29 11 5 0
1987  4 3  0 0 1 -1 -1 1000  733 114 106 30 11 4 2
1988  4 3  0 0 1 -1 -1 1000  756 172 23 33 12 3 1
1989  4 3  0 0 1 -1 -1 1000  663 223 79 15 14 5 1
1990  4 3  0 0 1 -1 -1 1000  938 38 18 6 0 0 0
1991  4 3  0 0 1 -1 -1 1000  729 251 6 10 3 0 1
1992  4 3  0 0 1 -1 -1 1000  411 425 149 10 5 0 0
1993  4 3  0 0 1 -1 -1 1000  643 127 156 74 0 0 0
1994  4 3  0 0 1 -1 -1 1000  674 200 44 52 30 0 0
1995  4 3  0 0 1 -1 -1 1000  779 144 42 11 19 5 0
1996  4 3  0 0 1 -1 -1 1000  829 129 21 16 3 2 0
1997  4 3  0 0 1 -1 -1 1000  892 88 16 4 0 0 0
1998  4 3  0 0 1 -1 -1 1000  776 195 24 5 0 0 0
1999  4 3  0 0 1 -1 -1 1000  663 241 82 12 2 0 0
2000  4 3  0 0 1 -1 -1 1000  609 230 117 37 6 1 0
2001  4 3  0 0 1 -1 -1 1000  761 136 65 33 5 0 0
2002  4 3  0 0 1 -1 -1 1000  574 312 64 29 13 8 0
2003  4 3  0 0 1 -1 -1 1000  837 82 62 11 4 2 2
2004  4 3  0 0 1 -1 -1 1000  923 63 9 3 1 1 0
2005  4 3  0 0 1 -1 -1 1000  733 240 21 1 4 0 1
2006  4 3  0 0 1 -1 -1 1000  632 265 91 11 0 1 0
2007  4 3  0 0 1 -1 -1 1000  642 235 97 26 0 0 0
2008  4 3  0 0 1 -1 -1 1000  511 327 105 47 10 0 0
2009  4 3  0 0 1 -1 -1 1000  878 59 43 16 3 1 0
2010  4 3  0 0 1 -1 -1 1000  882 118 0 0 0 0 0
2011  4 3  0 0 1 -1 -1 1000  628 331 39 2 0 0 0
2012  4 3  0 0 1 -1 -1 1000  698 178 109 15 0 0 0
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

