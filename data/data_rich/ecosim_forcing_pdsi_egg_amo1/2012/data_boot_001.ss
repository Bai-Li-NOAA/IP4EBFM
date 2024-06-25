#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Jun 20 11:28:40 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1718897320 first rand#: 0.791853
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
-999 1 1 59892.6 0.05
1985 1 1 15720.9 0.05
1986 1 1 12486.9 0.05
1987 1 1 6686.73 0.05
1988 1 1 1818.13 0.05
1989 1 1 3561.25 0.05
1990 1 1 70842.2 0.05
1991 1 1 120427 0.05
1992 1 1 257211 0.05
1993 1 1 460609 0.05
1994 1 1 223728 0.05
1995 1 1 147838 0.05
1996 1 1 400861 0.05
1997 1 1 345087 0.05
1998 1 1 877222 0.05
1999 1 1 642298 0.05
2000 1 1 460365 0.05
2001 1 1 322870 0.05
2002 1 1 310400 0.05
2003 1 1 165037 0.05
2004 1 1 150257 0.05
2005 1 1 143340 0.05
2006 1 1 192174 0.05
2007 1 1 101472 0.05
2008 1 1 159302 0.05
2009 1 1 181900 0.05
2010 1 1 131130 0.05
2011 1 1 241688 0.05
2012 1 1 365512 0.05
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
1990 10 2 418837 0.1 #_orig_obs: 547420 survey1
1991 10 2 2.1136e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 6.09848e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.30988e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 752889 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.39822e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.03327e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 919199 0.1 #_orig_obs: 870120 survey1
1998 10 2 2.80358e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.67988e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 706533 0.1 #_orig_obs: 512338 survey1
2001 10 2 301615 0.1 #_orig_obs: 291699 survey1
2002 10 2 176398 0.1 #_orig_obs: 364967 survey1
2003 10 2 117424 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 41540.2 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 121300 0.1 #_orig_obs: 197600 survey1
2006 10 2 195767 0.1 #_orig_obs: 152760 survey1
2007 10 2 178831 0.1 #_orig_obs: 210482 survey1
2008 10 2 470191 0.1 #_orig_obs: 788883 survey1
2009 10 2 435159 0.1 #_orig_obs: 218864 survey1
2010 10 2 317768 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.32086e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 1.75313e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 509675 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 600986 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 540618 0.1 #_orig_obs: 846626 survey2
1988 4 3 160303 0.1 #_orig_obs: 194950 survey2
1989 4 3 142671 0.1 #_orig_obs: 153912 survey2
1990 4 3 134101 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 534872 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.54286e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 625290 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 251611 0.1 #_orig_obs: 365721 survey2
1995 4 3 436196 0.1 #_orig_obs: 410270 survey2
1996 4 3 317762 0.1 #_orig_obs: 386093 survey2
1997 4 3 267090 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.14337e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 824246 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 278493 0.1 #_orig_obs: 286601 survey2
2001 4 3 191763 0.1 #_orig_obs: 121367 survey2
2002 4 3 171622 0.1 #_orig_obs: 174609 survey2
2003 4 3 61941 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 28772.1 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 62694.7 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 98698.3 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 87894.7 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 177958 0.1 #_orig_obs: 129808 survey2
2009 4 3 127172 0.1 #_orig_obs: 166268 survey2
2010 4 3 85789.6 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 428960 0.1 #_orig_obs: 347709 survey2
2012 4 3 575251 0.1 #_orig_obs: 617787 survey2
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
1985  1 1  0 0 1 -1 -1 200  18 87 83 12 0 0 0
1986  1 1  0 0 1 -1 -1 200  7 74 98 20 1 0 0
1987  1 1  0 0 1 -1 -1 200  15 31 120 22 12 0 0
1988  1 1  0 0 1 -1 -1 200  23 55 72 41 6 2 1
1989  1 1  0 0 1 -1 -1 200  94 33 60 9 3 1 0
1990  1 1  0 0 1 -1 -1 200  118 69 9 2 0 0 2
1991  1 1  0 0 1 -1 -1 200  17 138 45 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  5 46 142 7 0 0 0
1993  1 1  0 0 1 -1 -1 200  30 32 87 50 1 0 0
1994  1 1  0 0 1 -1 -1 200  32 110 41 6 11 0 0
1995  1 1  0 0 1 -1 -1 200  16 97 80 2 3 2 0
1996  1 1  0 0 1 -1 -1 200  99 29 68 4 0 0 0
1997  1 1  0 0 1 -1 -1 200  54 130 13 3 0 0 0
1998  1 1  0 0 1 -1 -1 200  10 98 92 0 0 0 0
1999  1 1  0 0 1 -1 -1 200  17 64 111 8 0 0 0
2000  1 1  0 0 1 -1 -1 200  81 44 61 13 1 0 0
2001  1 1  0 0 1 -1 -1 200  20 148 29 3 0 0 0
2002  1 1  0 0 1 -1 -1 200  16 79 104 1 0 0 0
2003  1 1  0 0 1 -1 -1 200  83 56 61 0 0 0 0
2004  1 1  0 0 1 -1 -1 200  78 110 12 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  20 150 30 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  84 55 60 1 0 0 0
2007  1 1  0 0 1 -1 -1 200  41 124 30 5 0 0 0
2008  1 1  0 0 1 -1 -1 200  15 94 90 1 0 0 0
2009  1 1  0 0 1 -1 -1 200  101 32 62 5 0 0 0
2010  1 1  0 0 1 -1 -1 200  62 124 10 3 1 0 0
2011  1 1  0 0 1 -1 -1 200  31 106 63 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  37 69 84 10 0 0 0
1990  10 2  0 0 1 -1 -1 200  13 53 120 14 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 54 146 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 5 193 2 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 7 143 50 0 0 0
1994  10 2  0 0 1 -1 -1 200  0 21 135 43 1 0 0
1995  10 2  0 0 1 -1 -1 200  0 25 163 12 0 0 0
1996  10 2  0 0 1 -1 -1 200  4 4 176 16 0 0 0
1997  10 2  0 0 1 -1 -1 200  3 97 89 11 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 35 165 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 11 176 13 0 0 0
2000  10 2  0 0 1 -1 -1 200  6 13 160 21 0 0 0
2001  10 2  0 0 1 -1 -1 200  2 101 91 6 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 39 161 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  9 28 159 4 0 0 0
2004  10 2  0 0 1 -1 -1 200  21 156 18 5 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 89 111 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  7 22 169 2 0 0 0
2007  10 2  0 0 1 -1 -1 200  9 96 92 3 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 21 179 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  5 7 174 14 0 0 0
2010  10 2  0 0 1 -1 -1 200  10 107 64 19 0 0 0
2011  10 2  0 0 1 -1 -1 200  1 30 169 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 15 178 7 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 19 154 27 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 12 162 26 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 1 161 38 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 9 113 78 0 0 0
1989  4 3  0 0 1 -1 -1 200  3 10 161 23 3 0 0
1990  4 3  0 0 1 -1 -1 200  16 59 96 29 0 0 0
1991  4 3  0 0 1 -1 -1 200  1 55 138 6 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 6 188 6 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 1 135 64 0 0 0
1994  4 3  0 0 1 -1 -1 200  3 24 123 50 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 14 176 10 0 0 0
1996  4 3  0 0 1 -1 -1 200  3 5 174 18 0 0 0
1997  4 3  0 0 1 -1 -1 200  6 87 90 17 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 16 184 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 11 173 16 0 0 0
2000  4 3  0 0 1 -1 -1 200  1 9 160 30 0 0 0
2001  4 3  0 0 1 -1 -1 200  0 82 111 7 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 14 186 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 26 170 4 0 0 0
2004  4 3  0 0 1 -1 -1 200  14 109 68 9 0 0 0
2005  4 3  0 0 1 -1 -1 200  5 48 147 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  4 12 181 3 0 0 0
2007  4 3  0 0 1 -1 -1 200  4 63 125 8 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 15 184 1 0 0 0
2009  4 3  0 0 1 -1 -1 200  6 10 170 14 0 0 0
2010  4 3  0 0 1 -1 -1 200  12 97 67 24 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 29 170 1 0 0 0
2012  4 3  0 0 1 -1 -1 200  1 14 172 13 0 0 0
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

