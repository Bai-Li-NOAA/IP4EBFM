#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Apr 24 09:06:57 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1713964017 first rand#: -0.0617366
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
-999 1 1 48815.1 0.05
1985 1 1 13915.4 0.05
1986 1 1 13245.8 0.05
1987 1 1 7014.98 0.05
1988 1 1 1784.52 0.05
1989 1 1 3465.62 0.05
1990 1 1 71578.1 0.05
1991 1 1 120207 0.05
1992 1 1 264188 0.05
1993 1 1 472618 0.05
1994 1 1 215578 0.05
1995 1 1 147652 0.05
1996 1 1 390890 0.05
1997 1 1 339070 0.05
1998 1 1 935652 0.05
1999 1 1 659069 0.05
2000 1 1 466297 0.05
2001 1 1 302464 0.05
2002 1 1 306245 0.05
2003 1 1 174746 0.05
2004 1 1 163221 0.05
2005 1 1 142494 0.05
2006 1 1 208362 0.05
2007 1 1 107383 0.05
2008 1 1 145504 0.05
2009 1 1 168740 0.05
2010 1 1 141056 0.05
2011 1 1 220611 0.05
2012 1 1 386150 0.05
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
1990 10 2 482886 0.1 #_orig_obs: 547420 survey1
1991 10 2 1.92129e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 7.47568e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.70397e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 948468 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.37508e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.22377e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 835768 0.1 #_orig_obs: 870120 survey1
1998 10 2 3.14668e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.99134e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 620020 0.1 #_orig_obs: 512338 survey1
2001 10 2 268252 0.1 #_orig_obs: 291699 survey1
2002 10 2 188362 0.1 #_orig_obs: 364967 survey1
2003 10 2 106274 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 37252.6 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 119530 0.1 #_orig_obs: 197600 survey1
2006 10 2 201533 0.1 #_orig_obs: 152760 survey1
2007 10 2 151844 0.1 #_orig_obs: 210482 survey1
2008 10 2 446766 0.1 #_orig_obs: 788883 survey1
2009 10 2 476072 0.1 #_orig_obs: 218864 survey1
2010 10 2 326157 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.7483e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 2.06124e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 477565 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 578802 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 413250 0.1 #_orig_obs: 846626 survey2
1988 4 3 207766 0.1 #_orig_obs: 194950 survey2
1989 4 3 156620 0.1 #_orig_obs: 153912 survey2
1990 4 3 117812 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 469160 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.77351e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 711040 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 259790 0.1 #_orig_obs: 365721 survey2
1995 4 3 421721 0.1 #_orig_obs: 410270 survey2
1996 4 3 316188 0.1 #_orig_obs: 386093 survey2
1997 4 3 306345 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.26415e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 728279 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 259895 0.1 #_orig_obs: 286601 survey2
2001 4 3 157300 0.1 #_orig_obs: 121367 survey2
2002 4 3 187798 0.1 #_orig_obs: 174609 survey2
2003 4 3 41860.6 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 26019.2 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 54570.5 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 90673.8 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 70314 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 152525 0.1 #_orig_obs: 129808 survey2
2009 4 3 147955 0.1 #_orig_obs: 166268 survey2
2010 4 3 112958 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 465207 0.1 #_orig_obs: 347709 survey2
2012 4 3 484066 0.1 #_orig_obs: 617787 survey2
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
 0 1 2 3 4 5 6
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
1985  1 1  0 0 1 -1 -1 200  24 83 82 11 0 0 0
1986  1 1  0 0 1 -1 -1 200  9 75 94 14 8 0 0
1987  1 1  0 0 1 -1 -1 200  12 29 119 35 5 0 0
1988  1 1  0 0 1 -1 -1 200  15 62 60 47 13 1 2
1989  1 1  0 0 1 -1 -1 200  83 34 61 10 7 5 0
1990  1 1  0 0 1 -1 -1 200  118 68 13 0 0 0 1
1991  1 1  0 0 1 -1 -1 200  13 150 37 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  6 38 152 4 0 0 0
1993  1 1  0 0 1 -1 -1 200  25 40 95 38 2 0 0
1994  1 1  0 0 1 -1 -1 200  46 94 44 9 7 0 0
1995  1 1  0 0 1 -1 -1 200  17 102 73 2 6 0 0
1996  1 1  0 0 1 -1 -1 200  99 35 58 8 0 0 0
1997  1 1  0 0 1 -1 -1 200  42 144 9 4 0 0 1
1998  1 1  0 0 1 -1 -1 200  11 104 84 1 0 0 0
1999  1 1  0 0 1 -1 -1 200  14 50 123 13 0 0 0
2000  1 1  0 0 1 -1 -1 200  60 66 62 6 6 0 0
2001  1 1  0 0 1 -1 -1 200  20 150 28 2 0 0 0
2002  1 1  0 0 1 -1 -1 200  16 82 100 2 0 0 0
2003  1 1  0 0 1 -1 -1 200  85 54 59 2 0 0 0
2004  1 1  0 0 1 -1 -1 200  62 125 13 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  35 129 36 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  85 57 57 1 0 0 0
2007  1 1  0 0 1 -1 -1 200  44 127 28 1 0 0 0
2008  1 1  0 0 1 -1 -1 200  6 105 87 2 0 0 0
2009  1 1  0 0 1 -1 -1 200  108 27 60 5 0 0 0
2010  1 1  0 0 1 -1 -1 200  70 117 8 5 0 0 0
2011  1 1  0 0 1 -1 -1 200  29 106 64 1 0 0 0
2012  1 1  0 0 1 -1 -1 200  39 75 82 4 0 0 0
1990  10 2  0 0 1 -1 -1 200  7 45 124 24 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 56 144 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 6 190 4 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 6 152 42 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 31 127 36 5 0 0
1995  10 2  0 0 1 -1 -1 200  0 17 176 7 0 0 0
1996  10 2  0 0 1 -1 -1 200  6 9 169 16 0 0 0
1997  10 2  0 0 1 -1 -1 200  8 99 80 13 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 23 177 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 18 170 12 0 0 0
2000  10 2  0 0 1 -1 -1 200  1 14 158 27 0 0 0
2001  10 2  0 0 1 -1 -1 200  7 105 73 15 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 35 165 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  4 26 163 7 0 0 0
2004  10 2  0 0 1 -1 -1 200  16 162 20 2 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 95 105 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  2 21 175 2 0 0 0
2007  10 2  0 0 1 -1 -1 200  6 83 104 7 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 34 166 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  2 6 182 10 0 0 0
2010  10 2  0 0 1 -1 -1 200  8 116 66 10 0 0 0
2011  10 2  0 0 1 -1 -1 200  1 28 171 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  2 18 172 8 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 13 155 32 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 11 163 26 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 10 150 40 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 9 116 75 0 0 0
1989  4 3  0 0 1 -1 -1 200  5 12 158 25 0 0 0
1990  4 3  0 0 1 -1 -1 200  19 61 91 29 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 47 147 6 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 5 191 4 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 4 141 55 0 0 0
1994  4 3  0 0 1 -1 -1 200  2 27 116 55 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 15 179 6 0 0 0
1996  4 3  0 0 1 -1 -1 200  8 4 166 22 0 0 0
1997  4 3  0 0 1 -1 -1 200  4 101 76 19 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 19 181 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 9 174 17 0 0 0
2000  4 3  0 0 1 -1 -1 200  6 11 158 25 0 0 0
2001  4 3  0 0 1 -1 -1 200  0 70 116 14 0 0 0
2002  4 3  0 0 1 -1 -1 200  1 19 180 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 20 178 2 0 0 0
2004  4 3  0 0 1 -1 -1 200  9 108 75 8 0 0 0
2005  4 3  0 0 1 -1 -1 200  0 54 146 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  5 19 172 4 0 0 0
2007  4 3  0 0 1 -1 -1 200  1 70 119 10 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 14 184 2 0 0 0
2009  4 3  0 0 1 -1 -1 200  4 6 179 11 0 0 0
2010  4 3  0 0 1 -1 -1 200  8 87 84 21 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 39 161 0 0 0 0
2012  4 3  0 0 1 -1 -1 200  1 13 175 11 0 0 0
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

