#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Jun 05 14:24:32 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1717611872 first rand#: -0.410441
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
-999 1 1 150133 0.05
1985 1 1 126030 0.05
1986 1 1 127371 0.05
1987 1 1 32905.6 0.05
1988 1 1 2123.67 0.05
1989 1 1 943.876 0.05
1990 1 1 7464.08 0.05
1991 1 1 25900.1 0.05
1992 1 1 47124.8 0.05
1993 1 1 103121 0.05
1994 1 1 25441.5 0.05
1995 1 1 8699.86 0.05
1996 1 1 24824.5 0.05
1997 1 1 59579.2 0.05
1998 1 1 213250 0.05
1999 1 1 222614 0.05
2000 1 1 186309 0.05
2001 1 1 125677 0.05
2002 1 1 11894.7 0.05
2003 1 1 58828.5 0.05
2004 1 1 122275 0.05
2005 1 1 504985 0.05
2006 1 1 2.60116e+06 0.05
2007 1 1 2.21569e+06 0.05
2008 1 1 337695 0.05
2009 1 1 393727 0.05
2010 1 1 559805 0.05
2011 1 1 791751 0.05
2012 1 1 864452 0.05
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
1990 10 2 668458 0.1 #_orig_obs: 673148 survey1
1991 10 2 2.63957e+06 0.1 #_orig_obs: 3.94753e+06 survey1
1992 10 2 6.88525e+06 0.1 #_orig_obs: 7.13885e+06 survey1
1993 10 2 3.15724e+06 0.1 #_orig_obs: 1.68368e+06 survey1
1994 10 2 1.41759e+06 0.1 #_orig_obs: 1.05722e+06 survey1
1995 10 2 1.55229e+06 0.1 #_orig_obs: 1.39142e+06 survey1
1996 10 2 1.65075e+06 0.1 #_orig_obs: 1.54748e+06 survey1
1997 10 2 1.50177e+06 0.1 #_orig_obs: 1.56566e+06 survey1
1998 10 2 6.71283e+06 0.1 #_orig_obs: 1.38137e+07 survey1
1999 10 2 1.01981e+07 0.1 #_orig_obs: 7.45048e+06 survey1
2000 10 2 4.13547e+06 0.1 #_orig_obs: 3.51075e+06 survey1
2001 10 2 1.71347e+06 0.1 #_orig_obs: 1.42342e+06 survey1
2002 10 2 1.67033e+06 0.1 #_orig_obs: 1.94477e+06 survey1
2003 10 2 1.99047e+06 0.1 #_orig_obs: 1.41915e+06 survey1
2004 10 2 1.86618e+06 0.1 #_orig_obs: 1.40635e+06 survey1
2005 10 2 7.87918e+06 0.1 #_orig_obs: 1.28956e+07 survey1
2006 10 2 1.20099e+07 0.1 #_orig_obs: 1.47837e+07 survey1
2007 10 2 3.28503e+06 0.1 #_orig_obs: 2.87981e+06 survey1
2008 10 2 2.93176e+06 0.1 #_orig_obs: 4.19258e+06 survey1
2009 10 2 1.76778e+06 0.1 #_orig_obs: 1.11186e+06 survey1
2010 10 2 1.48451e+06 0.1 #_orig_obs: 1.67309e+06 survey1
2011 10 2 3.25367e+06 0.1 #_orig_obs: 6.37711e+06 survey1
2012 10 2 4.04647e+06 0.1 #_orig_obs: 3.25374e+06 survey1
1985 4 3 1.50261e+06 0.1 #_orig_obs: 2.01039e+06 survey2
1986 4 3 1.27453e+06 0.1 #_orig_obs: 1.7824e+06 survey2
1987 4 3 811389 0.1 #_orig_obs: 854127 survey2
1988 4 3 187845 0.1 #_orig_obs: 239407 survey2
1989 4 3 195751 0.1 #_orig_obs: 185762 survey2
1990 4 3 181559 0.1 #_orig_obs: 137981 survey2
1991 4 3 714683 0.1 #_orig_obs: 393067 survey2
1992 4 3 1.94627e+06 0.1 #_orig_obs: 2.27574e+06 survey2
1993 4 3 919130 0.1 #_orig_obs: 1.43898e+06 survey2
1994 4 3 392048 0.1 #_orig_obs: 539130 survey2
1995 4 3 606088 0.1 #_orig_obs: 564396 survey2
1996 4 3 556244 0.1 #_orig_obs: 610556 survey2
1997 4 3 468504 0.1 #_orig_obs: 349876 survey2
1998 4 3 2.68009e+06 0.1 #_orig_obs: 1.27557e+06 survey2
1999 4 3 3.11794e+06 0.1 #_orig_obs: 4.71309e+06 survey2
2000 4 3 1.28239e+06 0.1 #_orig_obs: 1.65384e+06 survey2
2001 4 3 606169 0.1 #_orig_obs: 715021 survey2
2002 4 3 545803 0.1 #_orig_obs: 568480 survey2
2003 4 3 655125 0.1 #_orig_obs: 836482 survey2
2004 4 3 477523 0.1 #_orig_obs: 460842 survey2
2005 4 3 2.03095e+06 0.1 #_orig_obs: 1.32352e+06 survey2
2006 4 3 5.10182e+06 0.1 #_orig_obs: 6.09369e+06 survey2
2007 4 3 2.03809e+06 0.1 #_orig_obs: 1.9963e+06 survey2
2008 4 3 1.28769e+06 0.1 #_orig_obs: 1.36912e+06 survey2
2009 4 3 657789 0.1 #_orig_obs: 638168 survey2
2010 4 3 491514 0.1 #_orig_obs: 336938 survey2
2011 4 3 1.56832e+06 0.1 #_orig_obs: 1.45749e+06 survey2
2012 4 3 1.62468e+06 0.1 #_orig_obs: 1.49294e+06 survey2
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
1985  1 1  0 0 1 -1 -1 200  59 49 65 13 14 0 0
1986  1 1  0 0 1 -1 -1 200  35 38 98 17 7 3 2
1987  1 1  0 0 1 -1 -1 200  52 17 85 23 17 4 2
1988  1 1  0 0 1 -1 -1 200  76 32 27 18 30 9 8
1989  1 1  0 0 1 -1 -1 200  153 11 16 2 9 5 4
1990  1 1  0 0 1 -1 -1 200  172 20 3 5 0 0 0
1991  1 1  0 0 1 -1 -1 200  93 85 19 2 1 0 0
1992  1 1  0 0 1 -1 -1 200  47 45 105 2 1 0 0
1993  1 1  0 0 1 -1 -1 200  89 25 60 21 5 0 0
1994  1 1  0 0 1 -1 -1 200  99 37 21 17 26 0 0
1995  1 1  0 0 1 -1 -1 200  73 55 49 4 9 10 0
1996  1 1  0 0 1 -1 -1 200  177 6 10 4 0 3 0
1997  1 1  0 0 1 -1 -1 200  145 45 5 2 3 0 0
1998  1 1  0 0 1 -1 -1 200  64 65 69 0 2 0 0
1999  1 1  0 0 1 -1 -1 200  39 31 115 13 1 0 1
2000  1 1  0 0 1 -1 -1 200  63 34 64 27 12 0 0
2001  1 1  0 0 1 -1 -1 200  97 30 31 20 19 3 0
2002  1 1  0 0 1 -1 -1 200  60 54 62 11 7 5 1
2003  1 1  0 0 1 -1 -1 200  162 6 23 3 2 1 3
2004  1 1  0 0 1 -1 -1 200  173 22 2 2 1 0 0
2005  1 1  0 0 1 -1 -1 200  78 98 24 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  83 36 75 6 0 0 0
2007  1 1  0 0 1 -1 -1 200  67 59 59 15 0 0 0
2008  1 1  0 0 1 -1 -1 200  51 44 91 8 6 0 0
2009  1 1  0 0 1 -1 -1 200  167 5 22 5 1 0 0
2010  1 1  0 0 1 -1 -1 200  130 61 5 0 4 0 0
2011  1 1  0 0 1 -1 -1 200  68 74 58 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  67 46 78 9 0 0 0
1990  10 2  0 0 1 -1 -1 200  10 66 107 17 0 0 0
1991  10 2  0 0 1 -1 -1 200  2 52 145 1 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 0 195 5 0 0 0
1993  10 2  0 0 1 -1 -1 200  0 8 155 37 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 18 128 42 11 0 0
1995  10 2  0 0 1 -1 -1 200  0 20 171 9 0 0 0
1996  10 2  0 0 1 -1 -1 200  4 8 166 22 0 0 0
1997  10 2  0 0 1 -1 -1 200  4 108 66 22 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 27 173 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 9 178 13 0 0 0
2000  10 2  0 0 1 -1 -1 200  0 10 144 46 0 0 0
2001  10 2  0 0 1 -1 -1 200  0 16 140 44 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 20 154 26 0 0 0
2003  10 2  0 0 1 -1 -1 200  3 4 181 12 0 0 0
2004  10 2  0 0 1 -1 -1 200  27 78 75 20 0 0 0
2005  10 2  0 0 1 -1 -1 200  1 68 131 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  0 11 182 7 0 0 0
2007  10 2  0 0 1 -1 -1 200  1 26 144 29 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 12 175 13 0 0 0
2009  10 2  0 0 1 -1 -1 200  3 7 149 41 0 0 0
2010  10 2  0 0 1 -1 -1 200  4 96 82 18 0 0 0
2011  10 2  0 0 1 -1 -1 200  0 33 165 2 0 0 0
2012  10 2  0 0 1 -1 -1 200  0 10 172 18 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 17 157 26 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 9 171 20 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 2 152 46 0 0 0
1988  4 3  0 0 1 -1 -1 200  1 11 105 82 1 0 0
1989  4 3  0 0 1 -1 -1 200  2 9 168 21 0 0 0
1990  4 3  0 0 1 -1 -1 200  12 47 117 24 0 0 0
1991  4 3  0 0 1 -1 -1 200  2 50 144 4 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 4 191 5 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 5 129 66 0 0 0
1994  4 3  0 0 1 -1 -1 200  1 19 125 51 4 0 0
1995  4 3  0 0 1 -1 -1 200  0 12 172 16 0 0 0
1996  4 3  0 0 1 -1 -1 200  3 3 171 23 0 0 0
1997  4 3  0 0 1 -1 -1 200  8 110 63 19 0 0 0
1998  4 3  0 0 1 -1 -1 200  0 29 171 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 8 178 14 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 3 150 47 0 0 0
2001  4 3  0 0 1 -1 -1 200  2 17 147 34 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 21 151 28 0 0 0
2003  4 3  0 0 1 -1 -1 200  3 5 171 21 0 0 0
2004  4 3  0 0 1 -1 -1 200  7 70 84 39 0 0 0
2005  4 3  0 0 1 -1 -1 200  3 48 147 2 0 0 0
2006  4 3  0 0 1 -1 -1 200  0 14 178 8 0 0 0
2007  4 3  0 0 1 -1 -1 200  2 11 159 28 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 5 182 13 0 0 0
2009  4 3  0 0 1 -1 -1 200  1 5 147 47 0 0 0
2010  4 3  0 0 1 -1 -1 200  5 72 94 29 0 0 0
2011  4 3  0 0 1 -1 -1 200  0 18 178 4 0 0 0
2012  4 3  0 0 1 -1 -1 200  0 4 178 18 0 0 0
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

