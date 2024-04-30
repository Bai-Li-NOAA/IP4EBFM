#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Apr 30 12:15:41 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1714493741 first rand#: -1.18519
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
-999 1 1 150779 0.05
1985 1 1 130825 0.05
1986 1 1 129615 0.05
1987 1 1 34747.3 0.05
1988 1 1 2187 0.05
1989 1 1 954.13 0.05
1990 1 1 7142.5 0.05
1991 1 1 22189.5 0.05
1992 1 1 48508.1 0.05
1993 1 1 108394 0.05
1994 1 1 26855.9 0.05
1995 1 1 8264.37 0.05
1996 1 1 24442.2 0.05
1997 1 1 62755.5 0.05
1998 1 1 199820 0.05
1999 1 1 217239 0.05
2000 1 1 187762 0.05
2001 1 1 111523 0.05
2002 1 1 12044.9 0.05
2003 1 1 62171.7 0.05
2004 1 1 116551 0.05
2005 1 1 506217 0.05
2006 1 1 2.6103e+06 0.05
2007 1 1 2.55013e+06 0.05
2008 1 1 354057 0.05
2009 1 1 404095 0.05
2010 1 1 562057 0.05
2011 1 1 859050 0.05
2012 1 1 799933 0.05
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
1990 10 2 591430 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.02498e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 6.99968e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 3.05425e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.37895e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.92422e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.54251e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.3507e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 8.11669e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 6.73969e+06 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.28515e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 2.03149e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.80482e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 1.78948e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.37176e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 6.70675e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.4112e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.48811e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 4.1639e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 2.34735e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.34806e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 4.39107e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 3.62645e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.52056e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.62916e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 647209 0.1 #_orig_obs: 854127 survey2
1988 4 3 198464 0.1 #_orig_obs: 239407 survey2
1989 4 3 186337 0.1 #_orig_obs: 185762 survey2
1990 4 3 159079 0.1 #_orig_obs: 137981 survey2
1991 4 3 800774 0.1 #_orig_obs: 393067 survey2
1992 4 3 2.09666e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 1.05688e+06 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 382225 0.1 #_orig_obs: 539130 survey2
1995 4 3 425703 0.1 #_orig_obs: 564396 survey2
1996 4 3 538100 0.1 #_orig_obs: 610556 survey2
1997 4 3 503400 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.30827e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.25409e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.30588e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 775245 0.1 #_orig_obs: 715021 survey2
2002 4 3 548468 0.1 #_orig_obs: 568480 survey2
2003 4 3 658254 0.1 #_orig_obs: 836482 survey2
2004 4 3 480904 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.48205e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 4.86019e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.31898e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.40069e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 787161 0.1 #_orig_obs: 638168 survey2
2010 4 3 449651 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.52712e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.69342e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  57 52 67 10 14 0 0
1986  1 1  0 0 1 -1 -1 200  26 52 92 13 13 2 2
1987  1 1  0 0 1 -1 -1 200  58 19 59 23 27 11 3
1988  1 1  0 0 1 -1 -1 200  69 33 40 19 22 7 10
1989  1 1  0 0 1 -1 -1 200  148 16 16 1 5 5 9
1990  1 1  0 0 1 -1 -1 200  174 13 8 5 0 0 0
1991  1 1  0 0 1 -1 -1 200  74 96 21 1 1 7 0
1992  1 1  0 0 1 -1 -1 200  34 34 128 3 0 0 1
1993  1 1  0 0 1 -1 -1 200  84 19 57 34 6 0 0
1994  1 1  0 0 1 -1 -1 200  114 38 18 4 26 0 0
1995  1 1  0 0 1 -1 -1 200  67 49 56 6 15 7 0
1996  1 1  0 0 1 -1 -1 200  177 6 14 2 0 1 0
1997  1 1  0 0 1 -1 -1 200  157 37 5 0 1 0 0
1998  1 1  0 0 1 -1 -1 200  75 73 50 2 0 0 0
1999  1 1  0 0 1 -1 -1 200  45 36 106 11 1 1 0
2000  1 1  0 0 1 -1 -1 200  70 29 61 22 18 0 0
2001  1 1  0 0 1 -1 -1 200  95 23 38 13 26 5 0
2002  1 1  0 0 1 -1 -1 200  44 65 58 8 18 5 2
2003  1 1  0 0 1 -1 -1 200  159 9 24 2 2 1 3
2004  1 1  0 0 1 -1 -1 200  172 24 3 0 1 0 0
2005  1 1  0 0 1 -1 -1 200  99 74 27 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  74 43 75 8 0 0 0
2007  1 1  0 0 1 -1 -1 200  62 64 57 17 0 0 0
2008  1 1  0 0 1 -1 -1 200  51 53 79 7 10 0 0
2009  1 1  0 0 1 -1 -1 200  169 9 17 3 2 0 0
2010  1 1  0 0 1 -1 -1 200  150 47 2 0 1 0 0
2011  1 1  0 0 1 -1 -1 200  78 67 55 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  67 44 77 12 0 0 0
1990  10 2  0 0 1 -1 -1 200  18 53 102 27 0 0 0
1991  10 2  0 0 1 -1 -1 200  1 57 136 6 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 195 5 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 4 141 55 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 26 127 37 9 0 0
1995  10 2  0 0 1 -1 -1 200  0 21 170 9 0 0 0
1996  10 2  0 0 1 -1 -1 200  5 10 160 25 0 0 0
1997  10 2  0 0 1 -1 -1 200  4 116 63 17 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 38 162 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 5 185 10 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 8 152 40 0 0 0
2001  10 2  0 0 1 -1 -1 200  0 19 138 43 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 24 156 20 0 0 0
2003  10 2  0 0 1 -1 -1 200  1 8 184 7 0 0 0
2004  10 2  0 0 1 -1 -1 200  15 78 89 18 0 0 0
2005  10 2  0 0 1 -1 -1 200  2 77 121 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 20 175 5 0 0 0
2007  10 2  0 0 1 -1 -1 200  1 27 149 23 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 9 176 15 0 0 0
2009  10 2  0 0 1 -1 -1 200  2 6 155 37 0 0 0
2010  10 2  0 0 1 -1 -1 200  8 96 77 19 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 32 167 1 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 11 174 15 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 18 155 27 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 9 172 19 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 1 154 45 0 0 0
1988  4 3  0 0 1 -1 -1 200  1 17 109 71 2 0 0
1989  4 3  0 0 1 -1 -1 200  3 7 177 13 0 0 0
1990  4 3  0 0 1 -1 -1 200  10 45 120 25 0 0 0
1991  4 3  0 0 1 -1 -1 200  1 50 144 5 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 8 185 7 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 4 143 53 0 0 0
1994  4 3  0 0 1 -1 -1 200  0 20 129 50 1 0 0
1995  4 3  0 0 1 -1 -1 200  1 10 181 8 0 0 0
1996  4 3  0 0 1 -1 -1 200  2 5 175 18 0 0 0
1997  4 3  0 0 1 -1 -1 200  8 77 95 20 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 24 172 4 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 7 171 22 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 3 145 52 0 0 0
2001  4 3  0 0 1 -1 -1 200  0 16 135 48 1 0 0
2002  4 3  0 0 1 -1 -1 200  0 15 168 17 0 0 0
2003  4 3  0 0 1 -1 -1 200  3 2 176 19 0 0 0
2004  4 3  0 0 1 -1 -1 200  18 69 80 33 0 0 0
2005  4 3  0 0 1 -1 -1 200  1 55 143 1 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 15 180 5 0 0 0
2007  4 3  0 0 1 -1 -1 200  0 12 162 26 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 17 170 13 0 0 0
2009  4 3  0 0 1 -1 -1 200  2 6 154 38 0 0 0
2010  4 3  0 0 1 -1 -1 200  5 66 101 28 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 20 177 3 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 6 179 15 0 0 0
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

